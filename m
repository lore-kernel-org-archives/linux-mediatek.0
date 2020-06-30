Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F758C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 10:47:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE2A2065F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 10:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1N3JT0r0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="qfVS7SLN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE2A2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GH4sVHqYlxVuLcJlVhAmPpMfbL3DEFXPPBdn6gI/T9w=; b=1N3JT0r0wGcrcSbVaLrdcSsrk
	JeZDW+2fB9ylXiimjxDwxtKwO6uxxVkKmVOhTnQBfsZzKTegQMWNPdfjKNuNLqSaJtqMxeGDnNqUA
	LxKvN9rNAUeIV6pyIHqSxm6zvY2EbJWIJhRHVZTBxfNZ2QUg6SnQ0f2if0dPD8Gc5GlOiuiEKIexj
	J45yilUEJGUfMFvSUb83WiYLO7POd5wqhjVdqsX3+dlzTXBpCo+ck+l4vqDyy0ZwZhxTCJkAXg0yx
	RbOdyN42lnZfR+Wq4rlin7h2yqODthLtpMne7QeS2cWEvVY2gyYRRc5d9SwWnN98yVrrLwz7fkyv9
	Jp2AVvmYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqDnL-0000rM-Ed; Tue, 30 Jun 2020 10:47:19 +0000
Received: from mout.web.de ([212.227.15.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqDnJ-0000q6-DC; Tue, 30 Jun 2020 10:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593514025;
 bh=bW0dU0D65jfP7kb5Hr9vfPa9nw3+9XUubQ8AWpz+DnA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=qfVS7SLNwC/ErM638VtVhsKOnvmBPGWa7AYhZSgbZJFhDVU6RUB0YWvh6GyJUoCTA
 596cUESPNCzZtRZN4qoV3dvBiVEwrfAtrXlatg0UoSbvB9K5V/xWrJU/343NpugHz5
 K0gKGknLYficofLUde2ulJVoydeZadhEQsuIH8aA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.105.212]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrfou-1j55GX2eo8-00neTl; Tue, 30
 Jun 2020 12:47:05 +0200
Subject: Re: [PATCH v2] usb: mtu3: Fix NULL pointer dereferences
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <83ce087e-9da9-a8e1-8872-8520ccfc4108@web.de>
Date: Tue, 30 Jun 2020 12:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:/rGr2Nx4vkPR57gCHYowrZOB8KWU+aTDjhBY6NYTxgX3lg6M6rf
 k3omu3Jszm19XWe4Tj558zLVMPfOZs4MaKn9V10eBpFM3ODC1tvKRDUmgjmwpEB+lQxmGFw
 iGqAWmKnOZMPjEY41s1HYcCT3T3Z4ooNAWAejF1zBxttVd2ktlDhDUjUDIBTTVFcFW/iDkH
 vioNBP6OcmbMtyLLKZh7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CQjErKL30T8=:jAQgQ5tHJAD+GSPqjruEma
 u99s4AhkkCL3I0MYUx/fDZ4kuOkzoSpZ1/zAAviTGLxAUhsXn2vkRjoRINNFcflBc4L8p2euH
 oExPWU3PoMTiPtV4xNM8IFS9vLVY4oZqMBHlKQcGuStf/9UHZRUJ33qvqcQPaVZel2EXwtol6
 bC6E6Iw79UYjJsugaR40i95NSYOkfg8fR0SapLZwi2StQoSkKDeysoqI9VhGl0uCqg2rd9Ppf
 qK+bHOprwHu8zpiJrP2Hn9qdPF1J7fHyY7Fe4YplxA3iAbkttg+eJjHetMz+KrM6SoOs+m93K
 a53/FqxziQtS85GvSq1apC9GAK9HAmD4ZKVd+OQI5X32qKUdJnxie1avd38dKIWciTvtiaFDn
 LB9owCbiGsbbbnFgpFjOvxbVBlQl6UIRa2Dc/L0KVOKakG4wXgFoBiczU1s+0VsV5xF2ecolU
 93/XolrTRQlskm4DuC8Yo+xbNwNo2pFthrEMqSGvYN9b73xXxSvFpHW0cB4DxndyXrT5oXNsH
 e7M4kwHufd8ufUqKdjEvbn87klUt32CnaR1YCBfVDrVnUZTiFU4EbR/eQA6NSuC70/eOo0ah1
 SEIp81tPgiErpazD/so0ZeNUoEJYPZ5sCzG7+MgDmbdGJBolyvNlB+lkzSPdrsWffcey/oFoC
 9lP+JHZSqo4gwx4/EcRDZMS5tlqgzk0Twr+WgPzmQyUUUbDYlqTcrGZy0SBTEM6eVDAICsrs7
 8dY1pJKI6S8CFT8ku6z9tbcj4EYUIx6KVnkWzEcPWWPt2bDYE6/ZvwVM0c3/1jct0NWuSPRPI
 MA0jD47C2yKcviFPXjBpgD4SnMtt7ErUCXeJEWCXMnFKDhIT0wjnKkXWRo9oTfhARQzuRon7z
 bDi7G4zXrSoJ0DvKsNZWq95BT5VT5Fsqwfrj2kUZloTbJNHH1p4nQFgNFjUAQ3PWysA5+HAQ1
 UXOuGTNWP00B9gzmt7f1reBAdLXxDIiKG6wrHzUUvHdKWz0O/ytj76Su7GchG3vJ+Ku1BTKL/
 UsaEUYcBljVo9ikGkMjKTdEmMaXy9dOr91zJQrKOuMm+JHgyE5js7Zr4oJp0r+5HXp96/V5xN
 uvc6buOwhodzdsAILUDgWPASFJ3X6aNBSvbuxGoaxJblk04indRtEHmLwLK1V5mclaGISJ1ft
 IFHlkoZzS8mDcebl6XGNTbGNt6TTyO5S7GtCAjK5IGR/CIJi+cQ4sCXUQR8B2OljbtEyzHiQJ
 g0V69yEXyyThKkEmR
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
LgoKSSBwcm9wb3NlIHRvIHJlY29uc2lkZXIgYW5kIGltcHJvdmUgYWxzbyB0aGlzIGNoYW5nZSBk
ZXNjcmlwdGlvbi4KCiogV291bGQgYSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UgYmUgcG9zc2li
bGUgb25seSB3aXRoIHRoZSB2YXJpYWJsZXMg4oCcbWVw4oCdCiAgYW5kIOKAnG1yZXHigJ0gaW4g
dGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiDigJxtdHUzX2dhZGdldF9kZXF1ZXVl
4oCdPwogIChDYW4gaXQgbWFrZSBzZW5zZSB0byBzcGxpdCB0aGUgcGF0Y2ggYWNjb3JkaW5nIHRv
IHRoaXMgZGV0YWlsPykKCiogSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBjb252ZXJ0IGFueSBt
b3JlIHZhcmlhYmxlIGluaXRpYWxpc2F0aW9ucwogIHRvIGxhdGVyIGFzc2lnbm1lbnRzPwoKKiBX
aWxsIGl0IGJlY29tZSBoZWxwZnVsIHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHRoZSBj
b21taXQgbWVzc2FnZT8KCgrigKYKPiAtLS0KPiB2Mjogbm90aGluZyBjaGFuZ2VkLCBidXQgYWJh
bmRvbiBhbm90aGVyIHBhdGNoCgpBcmUgdGhlcmUgY2hhbmNlcyB0byB0YWtlIGFueSBwcmV2aW91
cyBwYXRjaCByZXZpZXcgY29tbWVudHMgYmV0dGVyIGludG8gYWNjb3VudAooYmVzaWRlcyB0aGUg
c2hvd24gcmVkdWN0aW9uIG9mIHVwZGF0ZSBzdGVwcyk/CgoKPiAtLS0KPiAgZHJpdmVycy91c2Iv
bXR1My9tdHUzX2dhZGdldC5jIHwgMjUgKysrKysrKysrKysrKysrKysrLS0tLS0tLQoKSSBzdWdn
ZXN0IHRvIHJlcGxhY2UgdGhlIHRyaXBsZSBkYXNoZXMgYmVmb3JlIHRoaXMgZGlmZnN0YXQgYnkg
YSBibGFuayBsaW5lLgoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
