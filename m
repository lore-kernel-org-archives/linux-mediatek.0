Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1F0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 21:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtILNPsLFA7uFPcwT6XRfKIRB080Y9Ts/nBxVvZZ9+g=; b=y6lfQiIPZ+jZBo
	19XvkT1FVDouSgEKrkoT0gvTRuby8oI/rxn9nXvPgPYgyon/uV71Tho3QkVFkGbgOPvsgD/tLQYZQ
	e+7EQlppaWPwWz4fbSigz7P3UAypv8B9/Jhs/V0hiyRIDw/OENv4ivoVp+MsqJCtFIcNC9VJKCBEb
	jtfoMt76hQkaBgBRU40syu9qaukC9Fty2HimusdbNTId9dMraMZsZ0w2pBx0ivzgbrpQEkfp4zP8D
	wdFMm40riqroK2vEHYX5Maknkv/SCMJRvjy/Du7lIOg2GCfltM2wvixu6Q5A4YsqmfCofo6PczcqX
	v7Df3OxiX8Hvm0wZXyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngv9C-006Myd-1v; Tue, 19 Apr 2022 21:12:30 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngv91-006Mvk-19
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 21:12:20 +0000
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso169908537b3.9
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 14:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GTIriJZRdzlai9p0KTJ6eZhqwTfpS2AfPb8HEFikq1U=;
 b=MSAHMd8HItA386Snoi0cQdBzaMZmt++Msg+jgKOsbUchFNAsko5EYv20IHnrcbWEkZ
 KVsW4nnJlySyFWu+c7zRQ6FDydCv4n+NHdMd0iIXi1nLTmPWk59Ufmj6FKd49b9shCrv
 os7UmwWr97et0rhtcRdZ7VNm7OiyCX7c1CKB+KkoUQefoi9vcgpmrRzBxIiaURtix5A/
 GAE/meQ985XLTSOkhjsF9V62jvw3Uy5Jq4LQ5grJ+QFWro6uk3ZrmRIB95VuaYV5q/qH
 cbaeg+aTIwt/YRf+ZkHeGoJsNQsbg25kp3CApeZACsmKPYYIN/9NBtYi4DABU6ZLnQkM
 fHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GTIriJZRdzlai9p0KTJ6eZhqwTfpS2AfPb8HEFikq1U=;
 b=4TdyETvJEdQkErf9RsZJjvLkVRXK5JbtaxMQARSSFLKlkkw+L9tqoXK083pCMQBurt
 PJZpGsPn+hSFlEPB+pVr2+mLtGznO2TT1eFo7soM8G/GSFeOS1gShZNWQIrd5DyZx475
 13dynrgXKK8gmqvgdzW/fbjvLvTNHb2qTB5gVxK8nBw/srecT49CmsS1IuRAtHGxywkK
 uUkmKR+GwIcXT5fKi2GjNwT+CCrRFUUGZ3/iyxy6cXPKvO9XykcI2BH1ZceXhj4KGw8I
 iDG001V4dJPUGOGEYInnth8xEIeDe1GJ24Ym+EiakyvJbE4dSC1TbPDzwJ5aFS8xr/jb
 yRCw==
X-Gm-Message-State: AOAM532ho40J5oocxduCZ/0NIGanMm4NTgauSE7GdW/3mf2JXhWmiFvt
 ooWo44VbRedlbpmrOX4E3FS8Dg6CFN5n8UgPCVeFVQ==
X-Google-Smtp-Source: ABdhPJwG5RC4bZTkqfFKCXotubzDXv70N9eLVBujE4q4g85LijmPwhkXxfK7oHa4RIuKIBZemwIyMBCXsDtNUmOBs38=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr19126960ywh.140.1650402734784; Tue, 19
 Apr 2022 14:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-2-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-2-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Apr 2022 23:12:03 +0200
Message-ID: <CACRpkdZj7CWNaqXx2+zUnGUgo=L+vqdrigbqqxMETBAnM9nYwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt8192: Add wrapping node
 for pin configurations
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_141219_097054_1728BA10 
X-CRM114-Status: GOOD (  13.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMTUsIDIwMjIgYXQgMTA6MjAgUE0gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8K
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gT24gbXQ4MTkyLCB0aGUgcGluY3Ry
bCBub2RlIGhhcyBwaW5jdHJsIGdyb3VwcyB0byBncm91cCBwaW4KPiBjb25maWd1cmF0aW9ucy4g
RWFjaCBwaW5jdHJsIGdyb3VwIGNvbnRhaW5zIG9uZSBvciBtb3JlIHBpbm11eCBzdWJub2Rlcwo+
IHRvIGxpc3QgbmVlZGVkIHBpbnMgYW5kIHRoZWlyIGNvbmZpZ3VyYXRpb25zLiBCeSBzdXBwb3J0
aW5nIG11bHRpcGxlCj4gc3Vibm9kZXMsIHdlIGNhbiBjb25maWd1cmUgZGlmZmVyZW50IHBpbiBj
aGFyYWN0ZXJpc3RpY3MKPiAoZHJpdmluZy9wdWxsLXVwL3B1bGwtZG93bi9ldGMuKSBpbiBhIHBp
bmN0cmwgZ3JvdXAuCj4KPiBVcGRhdGUgdGhlIG10ODE5MiBwaW5jdHJsIGR0LWJpbmRpbmcgdG8g
YWRkIHRoZSBtaXNzaW5nIHBpbmN0cmwgZ3JvdXAKPiBub2RlIHRoYXQgd3JhcHMgdGhlIHBpbm11
eCBzdWJub2RlcyBhbmQgdXBkYXRlIHRoZSBleGFtcGxlIGF0IHRoZSBlbmQuCj4gV2hpbGUgYXQg
aXQsIGFsc28gcmVtb3ZlIHRoZSBleGFtcGxlIGVtYmVkZGVkIGluIHRoZSBkZXNjcmlwdGlvbiBz
aW5jZQo+IGl0IGlzIHJlZHVuZGFudCB0byB0aGUgYWxyZWFkeSBzdXBwbGllZCBleGFtcGxlIGF0
IHRoZSBlbmQuCj4KPiBUaGlzIHNhbWUgY2hhbmdlIHdhcyBkb25lIGZvciBtdDgxOTUgaW4gY29t
bWl0IDc5ZGNkNGU4NDBjYyAoImR0LWJpbmRpbmdzOgo+IHBpbmN0cmw6IG10ODE5NTogYWRkIHdy
YXBwaW5nIG5vZGUgb2YgcGluIGNvbmZpZ3VyYXRpb25zIikuCj4KPiBTaWduZWQtb2ZmLWJ5OiBO
w61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpUaGlzIHBh
dGNoIDEvNCBhcHBsaWVkIHRvIHRoZSBwaW5jdHJsIHRyZWUuCgpZb3VycywKTGludXMgV2FsbGVp
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
