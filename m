Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE29C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3C8206E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urQXmo/V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="JZb+fcM3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3C8206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b21qtY2bUrd1EDbhxIi5g8iPVHD/TjgH6u7P+yDcFNg=; b=urQXmo/VfcTvAow4t4sqOHj3V
	ZdBsag4Wp4EOMBQY0YjBNsVkOZMjGeiJm/6eqsn35uHmcZIj3ov4DGrwAf4oAdCr/42BsryIjAm4H
	6QHBYKFc/qb3EhZ5Kdxaqm/lFuX77Sv5Mh+MvKyAgSi7Y5Kkq4hjrtQBEk0QgD+PsxNF0sR/DAo4Z
	rwaYqw0G+Dl6fHKUcNgaPGjiGRMJx8iC3plY5msEXYxVwJ0kuZIPnL7olyE9Is9BMvbPC3mK1EHyJ
	lLGnpQBqkWjcLGlKeQo+e7zq/7HG7W0kddS1wTDqH8RL/xmqKiLMm1+qB49Cb67S+NMGPq+FtDAZk
	ycIY8VEhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpoiV-00073q-L5; Mon, 29 Jun 2020 08:00:39 +0000
Received: from mout.web.de ([212.227.15.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoiT-00073L-TE; Mon, 29 Jun 2020 08:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593417625;
 bh=eFPVYKXOnSENohbuyonbWRq1F0OLlPtxo04hm41i4Jw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=JZb+fcM349FGglNpwA68Vsgvrd21euDUX04cRJqnnNVY8TFC0hPjRfe1amBkabrk1
 jCdaTUsRBrBrtNFBC7urnsiUvOPnGa4IxYVW+qq1Sl5aIr5RfnOaJPSTOBJg7x18hm
 Y41Rv/zgRg11xIZG1PxcD591iUXjkqUGXz+DnNlA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.123.16]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LecN4-1j2jaR3AmE-00qRv5; Mon, 29
 Jun 2020 10:00:25 +0200
Subject: Re: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
Date: Mon, 29 Jun 2020 10:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:PizCbKGpJNTn7kZfWjisoo9mPDAoIPDPVWcuVGepIZSqN05lkgT
 Jo9ebRyje6ZSgX/opQn11xFpj9UUyG0ffXxbkiFiO4htPDOISmUkxRHsR/eloV4jq9+OqKd
 yN8ZmBwQMbdCf1xmBqYwpYe7p50esyW8f8KIEXM4VCevn6lM9v5BweWYI7L70ccGLYVMcQl
 X6zhk1uLo88yIGF1bG5Nw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4KDDJoMRLpQ=:4uBxN/iTcip+9kzuLHi1WY
 +7zQSH9CNCiEXE9wlBGteqRaiqJ7DFfFAYcGN2oAzVJz7CxmCN2CeNH2vaJlMRcEz02dA3V+C
 6aClGZqbBzNe08mHB1b0XeooqfCvROjDdtlmvIq1Ig7jsYLdFk9sylQGGcbVZq6Ooy5iXA8wY
 6TGmeel/3sql15zkCvmKRagyH1ltXhMDeHfoTKRYdo9N3nxfpqpsL+QURODkltwfgPf8FmyrR
 6fsNzPgLTTXoscvCZWuTRrCnICa7ShrwnjTLj+y6VeRWmygyeHwqwyEY2DPVJOwarxh6ncKr3
 A+WoalxMsdavt6K8d0Mfs4Ta4wVlNKz2EmBhASBLOV7ewRNztmNwwJCtFWxQTDrHKJtiixfB1
 No8/wB1d2OMaaGOcxcWkHgEf21Nw4fwIBGx16hk19YYQMkgJSHkdEBsvdNCU3a3cBPwcNFnp4
 4iCm9GiWsBdQIjaGkb8tzVR2Z2AIxvXeiJWO3y34ORbA+Rl120KQxyX/V8iY3iriGJfUkJvO+
 wmGSXhRbHEsWQaqE3DOWbQQCh5828aiiLjt1fpUhr+UoOys9EMcyFaTguyRhAic+IwtHgYi01
 7NCbS2PPXQvnIc6Bhxkp+s2HPujYRus0xDplM0h5cJsaX8Twx9JSCshraxyDyeke4Mp5/i58t
 voLlTD9O8U9B+c5PmCR4tAHq8dXm8mKoFlRZUKu0wWrrdTXQQfhmW85gBUA+/O4+ZctG6M9E0
 Jqursprqp58t1WMCh13wzVAqI/dEGD4bXBy0Ft+G8Y4VMtXrPZIA9vU7eI1wWbTcYVMEQtYrq
 inbm4G2bRVzqcW7McNSwhUyPizpf8OZ3K83dMRjcgzYcIV/A9NU6M2aRI64BlvKw23Go/Kbas
 0LY1NUov5olSBu6ryMR8gPVJrl86gIejwOjwAGm+f2+CNRgWxllw6atKE1Jg6jcPX0LAOer68
 8GCnlrc6g70IhGZxBRlX33ujYzaGMQiCkcpA1nsyglx9sUDG0iyjinrD3TsCxR8eOF/OO4/Gj
 FO75VgkIfEfpPz3ygSYGkX+eH2ZEXFfelXJ7WsYm6cf2TxPCHXFAyLj5npjZwIuxcCp2M0j4M
 1PwGbrWQD/eZCcjZc5NoOZLOufDwwRN3FrW69DQPs0fcWnHZjnd1mPTkxeBZs9EaXslVgWuRg
 wpO4x5M0xwd7lvXaaUt7U6SqZUi85BIHMgJwsp/2cPzHKN6uZomDCl3EGnpwNAj/pMOjPudPD
 5QMsn9Y8cz4N0tcuG
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBTb21lIHBvaW50ZXJzIGFyZSBkZXJlZmVyZW5jZWQgYmVmb3JlIHN1Y2Nlc3NmdWwgY2hlY2tz
LgoKSSBzdWdnZXN0IHRvIHJlY29uc2lkZXIgYW5kIGltcHJvdmUgdGhlIGNoYW5nZSBkZXNjcmlw
dGlvbi4KCiogV291bGQgYSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UgYmUgcG9zc2libGUgb25s
eSB3aXRoIHRoZSB2YXJpYWJsZXMg4oCcbWVw4oCdCiAgYW5kIOKAnG1yZXHigJ0gaW4gdGhlIGlt
cGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiDigJxtdHUzX2dhZGdldF9kZXF1ZXVl4oCdPwoK
KiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFkanVzdCBhbnkgbW9yZSB2YXJpYWJsZSBpbml0
aWFsaXNhdGlvbnM/CgoqIFdpbGwgaXQgYmVjb21lIGhlbHBmdWwgdG8gYWRkIHRoZSB0YWcg4oCc
Rml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
