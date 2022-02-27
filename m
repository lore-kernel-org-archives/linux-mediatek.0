Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Feb 2022 03:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgx/dqJp4UHvFUkyuTl6FVXQZJ6Ntiu03eaYicooiCs=; b=vKC5cKqEOrDE5A
	/S4/TImeLfJZcCyMScfYnp1Af1lBsRGrG38DwtK8uEOdhhRUHcBoDJ4MGE0zLR9Nm+XiZ5cqDak+b
	+n/1n9IwcE8Sgp+dBlM0nYobfqgqbHErHNb/FTc+BhNpwMwN2pqbEZcwH3jFxBFEAnRs/QTJqh5ym
	Nr+1PPgzbxsLUO0QCfzRpHNEf+qroLl43xntKpx+Axxv+Io+kCNzSp7Nc/I5JX0PJSFYLS/TXmJJ4
	5EeFyHzQE/KH5+vznhbe4bS+8wlqT50z4tNV/mWliTtliuahZVePKFarKgbjeh2PQfJMsNsmIPenu
	M08BjI4kShfPxk39GMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOAN5-008oZg-AK; Sun, 27 Feb 2022 03:37:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOAMt-008oXf-5J; Sun, 27 Feb 2022 03:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4206611EA;
 Sun, 27 Feb 2022 03:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBD9C340F5;
 Sun, 27 Feb 2022 03:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645933026;
 bh=PcKncsTOVzlSqaOg7J5qb4pFWYVIbkyTx7Eltn3KWR0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WybKmEHDro4Do1Ozl/xx4voKJbqhoFCAc8+xjBbBcGKQcilCt0xu67G0PgJm8v3RB
 rGLFwxZnOy0QBnLMVXM6TCBEMct5kY2HpnHCfPqlhEaYVAqUxl/0YXhDDd5F+BiunZ
 4FLFs/MAeaOA1XjvAEhjpr+hhJw11dpuCKFAJuPHmTLAw+YiW3H1wdf9mPQ5CH00lo
 fM+9TaOj9KebXMl6INzuCdbMGQv1Qn8BhRZQ9pMhSGkVMcSKOpcNJMigTpmwA5R0UZ
 2eKujb/Vod6QEkHNV9m4cjqV/TI0wSP9oXfk41stvUqkcAWL/+lt4tpswaQHL4cG18
 1U2tRTfscpVvA==
Received: by mail-ej1-f48.google.com with SMTP id lw4so18318470ejb.12;
 Sat, 26 Feb 2022 19:37:05 -0800 (PST)
X-Gm-Message-State: AOAM532i6yAvUeLvs11mIFJU2l73lIJ9PphUzKHxyw9TAxSSRpzt8VHy
 A/AzITqscgTHqrPYCPMTQhrWIDo450IfEIPjsw==
X-Google-Smtp-Source: ABdhPJwFCc00VQOE4B7U57r4RYqycpEQSjTSjBORZsH9Zn55axO5yG7y/xWDdPTKBdIgR1yvQeRdCNTWl4N4jKNihUI=
X-Received: by 2002:a17:907:a06c:b0:6c9:408e:cec with SMTP id
 ia12-20020a170907a06c00b006c9408e0cecmr10813480ejc.510.1645933024264; Sat, 26
 Feb 2022 19:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
 <20211202064039.20797-2-jason-jh.lin@mediatek.com>
 <CAAOTY_-59wtqprA+fRc6dvQRoVLr7HiNktYgvvt9pi_=CcYrYA@mail.gmail.com>
In-Reply-To: <CAAOTY_-59wtqprA+fRc6dvQRoVLr7HiNktYgvvt9pi_=CcYrYA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 27 Feb 2022 11:36:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pPtvKSZ0HWHAQZ3o-TE3p67tTKOpNa7Rz_XYG-yDQJA@mail.gmail.com>
Message-ID: <CAAOTY_9pPtvKSZ0HWHAQZ3o-TE3p67tTKOpNa7Rz_XYG-yDQJA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/mediatek: add wait_for_event for crtc disable
 by cmdq
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_193707_307480_83DB4567 
X-CRM114-Status: GOOD (  21.75  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

IEhpLCBKYXNvbjoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwg
MjAyMeW5tDEy5pyIM+aXpSDpgLHkupQg5LiK5Y2INzoyMeWvq+mBk++8mgo+Cj4gSGksIEphc29u
Ogo+Cj4gamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDEy5pyIMuaXpSDpgLHlm5sg5LiL5Y2IMjo0MeWvq+mBk++8mgo+ID4KPiA+IG10a19kcm1fY3J0
Y19hdG9taWNfZGlzYWJsZSB3aWxsIHNlbmQgYW4gYXN5bmMgY21kIHRvIGNtZHEgZHJpdmVyLAo+
ID4gc28gaXQgbWF5IG5vdCBmaW5pc2ggd2hlbiBjbWRxX3N1c3BlbmQgaXMgY2FsbGVkIHNvbWV0
aW1lcy4KPiA+Cj4gPiBBZGQgd2FpdF9mb3JfZXZlbnQgYWZ0ZXIgc2VuZGluZyBhc3luYyBkaXNh
YmxlIHBsYW5lIGNtZCB0byBtYWtlCj4gPiBzdXJlIHRoZSBsYXN0ZXN0IGNtZCBpcyBkb25lIGJl
Zm9yZSBjbWRxX3N1c3BlbmQuCj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0WzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcKCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29u
LWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMgfCAxMiArKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9j
cnRjLmMKPiA+IGluZGV4IDYyNTI5YTk1NGI2Mi4uMGI0MDEyMzM1ZTdhIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+IEBAIC01Niw2ICs1Niw3IEBA
IHN0cnVjdCBtdGtfZHJtX2NydGMgewo+ID4gICAgICAgICBzdHJ1Y3QgY21kcV9wa3QgICAgICAg
ICAgICAgICAgIGNtZHFfaGFuZGxlOwo+ID4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNtZHFfZXZlbnQ7Cj4gPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY21kcV92YmxhbmtfY250Owo+ID4gKyAgICAgICB3YWl0X3F1ZXVlX2hlYWRfdCAg
ICAgICAgICAgICAgIGNiX2Jsb2NraW5nX3F1ZXVlOwo+ID4gICNlbmRpZgo+ID4KPiA+ICAgICAg
ICAgc3RydWN0IGRldmljZSAgICAgICAgICAgICAgICAgICAqbW1zeXNfZGV2Owo+ID4gQEAgLTMx
NCw2ICszMTUsNyBAQCBzdGF0aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1Y3QgbWJveF9jbGllbnQg
KmNsLCB2b2lkICptc3NnKQo+ID4gICAgICAgICB9Cj4gPgo+ID4gICAgICAgICBtdGtfY3J0Yy0+
Y21kcV92YmxhbmtfY250ID0gMDsKPiA+ICsgICAgICAgd2FrZV91cCgmbXRrX2NydGMtPmNiX2Js
b2NraW5nX3F1ZXVlKTsKPiA+ICB9Cj4gPiAgI2VuZGlmCj4gPgo+ID4gQEAgLTcwMCw2ICs3MDIs
MTMgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKPiA+ICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gdHJ1ZTsK
PiA+Cj4gPiAgICAgICAgIG10a19kcm1fY3J0Y191cGRhdGVfY29uZmlnKG10a19jcnRjLCBmYWxz
ZSk7Cj4gPiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gPiArICAgICAgIC8q
IFdhaXQgZm9yIHBsYW5lcyB0byBiZSBkaXNhYmxlZCBieSBjbWRxICovCj4gPiArICAgICAgIGlm
IChtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikKPiA+ICsgICAgICAgICAgICAgICB3YWl0X2V2
ZW50X3RpbWVvdXQobXRrX2NydGMtPmNiX2Jsb2NraW5nX3F1ZXVlLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID09IDAsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zZWNzX3RvX2ppZmZpZXMoNTAw
KSk7Cj4gPiArI2VuZGlmCj4gPiAgICAgICAgIC8qIFdhaXQgZm9yIHBsYW5lcyB0byBiZSBkaXNh
YmxlZCAqLwo+ID4gICAgICAgICBkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoY3J0Yyk7Cj4gPgo+
ID4gQEAgLTk4MCw2ICs5ODksOSBAQCBpbnQgbXRrX2RybV9jcnRjX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2RldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRr
X2NydGMtPmNtZHFfY2xpZW50LmNoYW4gPSBOVUxMOwo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgfQo+ID4gICAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAvKiBm
b3Igc2VuZGluZyBibG9ja2luZyBjbWQgaW4gY3J0YyBkaXNhYmxlICovCj4gPiArICAgICAgICAg
ICAgICAgaW5pdF93YWl0cXVldWVfaGVhZCgmbXRrX2NydGMtPmNiX2Jsb2NraW5nX3F1ZXVlKTsK
PiA+ICAgICAgICAgfQo+ID4gICNlbmRpZgo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+IC0tCj4g
PiAyLjE4LjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
