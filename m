Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AF3C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 15:48:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C72B2220B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 15:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C72B2220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u1pG/rFeMUem2y4Gr5kWMpHyOjF4DLYEOEZLERigJq4=; b=WK1UlkZQRuXSwfJs1asslLqIE
	h6eHNLjBNkUoEmyZWUdP2gbj7YPzvtmMUKKEs1NztgVJYRKvB/KYD/3HxIx6xFAPt3YPJxXLiLprH
	QrFDp35d5dSvT/DcopNEa/BF+HPjpjfurn6raANqC8n5qrPb1c66HBp5eSaHKI0dWSdmoZYpFRuID
	arD7VwPqe39kNA4JSzcjlYtUbrZKmfByNr4ZWK39aX9VEXD/2iPb/7UMX2moJygXB0o2ReCwaetg1
	VKUSUJV3WhCsn3BvSNoEdqiOCr8OkivrR9m3IF8/wLr/tey7JU2PEQNDSpLj5Z3DP+qibXcJ/jTrs
	XupQeZkFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks6NR-0001P9-W1; Wed, 23 Dec 2020 15:48:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks6NO-0001O6-ES; Wed, 23 Dec 2020 15:48:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 922BC2220B;
 Wed, 23 Dec 2020 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608738511;
 bh=gFOktdnZlZmvTlgAN2h803xCQHcUKcooY0lSAj9WxE4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jg6eGQ1BXWTirJh/jh5f7JZi+5mMmKWbGV+nupvVevih8T1c1pZ1m5AkfCZu+vPZ9
 OI0KLmPBhOU2csvypopsBnocUtGTcebLj878fL9EC5cZ0FGN370D6xSMeWfnP/N0d+
 XaZwLd98NUXyoZLkx3bZwRyeVhZCWCTppjGqyihs3/Y6a8AzxrIFM1QULF6ucFfe7m
 3J/roxj0GzSR87LOYwwrfR+sLeDD9pQQWUl7B7vFJ0zw3f9Lh1E2RNedRP7WZ/kJko
 acpgoUTeMxBz8vtFgGubiyVHdCE99a1ILLYP+JrI4O6XgOyIUjE7PIgp9TKDUF4+3t
 k4pwdX3a7tgXg==
Received: by mail-ed1-f49.google.com with SMTP id g24so16609962edw.9;
 Wed, 23 Dec 2020 07:48:31 -0800 (PST)
X-Gm-Message-State: AOAM530f6cE6SLr0DQrl/V8CNq7TdNjbETdSENta1Xq4ZuXjYoS3m8fk
 KJ2/G/T82lyg6lfBI96JzaHcFtr8rUCea4Rmqw==
X-Google-Smtp-Source: ABdhPJwb5w2chHm2EqxPnyCoI9LEydqAoLEm1aIKXtYZ+vl4PEgEEDKf4mkp5MzyZv81GXD9gbxVNqMMg+4+cPbvMq4=
X-Received: by 2002:a50:fc83:: with SMTP id f3mr25508730edq.219.1608738510218; 
 Wed, 23 Dec 2020 07:48:30 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
 <1608687471.18252.10.camel@mhfsdcap03>
In-Reply-To: <1608687471.18252.10.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 23:48:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=QuVvyrFiUP=8-EMNPmgTK9TZr_ZmuJ=SbHZEjNnxyw@mail.gmail.com>
Message-ID: <CAAOTY_9=QuVvyrFiUP=8-EMNPmgTK9TZr_ZmuJ=SbHZEjNnxyw@mail.gmail.com>
Subject: Re: [PATCH v2, 12/17] drm/mediatek: fix gamma size config
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_104834_636388_31EA30C2 
X-CRM114-Status: GOOD (  24.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjPml6Ug6YCx5LiJIOS4iuWNiDk6Mzflr6vpgZPvvJoKPgo+IE9u
IFR1ZSwgMjAyMC0xMi0xNSBhdCAwNzo0MCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
IEhpLCBZb25ncWlhbmc6Cj4gPgo+ID4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTPlr6vpgZPv
vJoKPiA+ID4KPiA+ID4gZml4IGdhbW1hIHNpemUgY29uZmlnCj4gPgo+ID4gSSB3b3VsZCBsaWtl
IHlvdSB0byBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24uIFRoZSBvcmlnaW5hbCBjb2RlIHdvcmtz
Cj4gPiBpbiBtdDgxNzMsIHdoeSBkbyB5b3UgbW9kaWZ5IHRoaXM/IFRoZSBkZXNjcmlwdGlvbiBt
YXkgYmUgc29tZXRoaW5nCj4gPiBsaWtlIHRoaXM6Cj4gPgo+ID4gQWNjb3JkaW5nIHRvIGRhdGEg
c2hlZXQsIHRoZSB3aWR0aCBpcyBpbiBiaXRzIFszMSwgMTZdIGFuZCBoZWlnaHQgaXMKPiA+IGlu
IGJpdHMgWzE1LCAwXS4gRXZlbiB0aG91Z2ggd3Jvbmcgc2V0dGluZyBtYXkgd29ya3MgaW4gc29t
ZSBTb0Mgc3VjaAo+ID4gYXMgbXQ4MTczLCBidXQgaXQgZG9lcyBub3Qgd29yayBpbiBtdDgxOTIu
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4KPiBpdCBzdGlsbCB3b3JrcyBpbiBt
dDgxOTIuCj4ganVzdCBtb2RpZnkgdGhpcyBmb2xsb3cgZGF0YSBzaGVldAoKVGhpcyBwYXRjaCBp
cyBub3Qgc3Ryb25nbHkgcmVsYXRlZCB0byBNVDgxOTIsIHNvIG1vdmUgdGhpcyBwYXRjaCBvdXQK
b2YgdGhpcyBzZXJpZXMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+ID4KPiA+ID4KPiA+ID4g
Rml4ZXM6IGUwYTVkMzM3MDI0NSAoZHJtL21lZGlhdGVrOiBBZGQgR0FNTUEgZW5naW5lIGJhc2lj
IGZ1bmN0aW9uKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcu
bml1QG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ID4gPiBpbmRleCAwMGQ1Njg3Li41MmI2ZmM3IDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMKPiA+ID4gQEAgLTI5Nyw3ICsyOTcsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZ2FtbWFfY29uZmln
KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCB3LAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoLCB1bnNpZ25lZCBpbnQgdnJlZnJl
c2gsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJwYywg
c3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKPiA+ID4gIHsKPiA+ID4gLSAgICAgICBtdGtfZGRw
X3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgY29tcCwgRElTUF9HQU1NQV9TSVpFKTsKPiA+
ID4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElT
UF9HQU1NQV9TSVpFKTsKPiA+ID4gICAgICAgICBtdGtfZGl0aGVyX3NldChjb21wLCBicGMsIERJ
U1BfR0FNTUFfQ0ZHLCBjbWRxX3BrdCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDEu
OC4xLjEuZGlydHkKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gPiA+IExpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
