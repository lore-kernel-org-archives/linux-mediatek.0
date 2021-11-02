Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C99CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 23:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1BC61152
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 23:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF1BC61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXZ9I1x80sCO+81c8SA6nArHTsKN323FiTNHkhwTwgM=; b=fgt7UqF5xpnOtZ
	sILajdjtWVyGkpsY0gRtR8kMMQfhKubelkYTyTS+I6+pDE4biqoQr/odeMOv4jyqJhg+7zntLtgIB
	KGC8msrNKoujMlIpkOERoF/EaOZ35t/F77PfEJcy7AzlktL4CWePm+X8LVxSnw3e95FbBJ4ROwLXe
	xvTTjl8LLq7xKho+uIkwaxfIdNB9tFWj5OYvJBrS1a9LVB23ZHQ1VXT5wJxOWwbnby67hp8WxpAKf
	DpdkZHgQBUoxL23vEIlFEZUQQqJrtVyUc6B4nN+1rE+K17S3vfLpenf6dLvBcxlx7vE9x/m9VmVZb
	ZuNWNJ7J9Y+A+GLA9xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3V8-003TEG-Bw; Tue, 02 Nov 2021 23:47:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3Uo-003T6g-RJ; Tue, 02 Nov 2021 23:47:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A17360E0C;
 Tue,  2 Nov 2021 23:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635896834;
 bh=nEopyOSaG+F7cUNl+J272O3aX05gPbA/iGiQNQSOXQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WQd/yedrhXL/w7xGknqaP+3TAHDlk9wFfkEp4ulJhz74fdYiFq66V0AW3/Pk9z4i0
 3pIa8LG8YVyYYBT2+Cu7TBo/qm4Q40ydm/xhFmCnMt7Po9XkUi1rxcyacY6iP69ljI
 xdxSQmxSWJxltt4KytlOjlQI7mdelgrKsXWTZGqH4uMH4xQuP4pqu2UesvXZ/idiRO
 OlYs5PCxvlGeYSfu7FaKJJW6xf61izqETUfZ6WMCM8Aa6OtBD58mlmykGjau6OPFQl
 8M2LlADmI4Eiqwjy2OzWsQikrheW6jqaOMQywt7wapzw45AdQ5ao+wTY7BOHIoQlRV
 ApUl2vOURr74g==
Received: by mail-ed1-f51.google.com with SMTP id z20so2916623edc.13;
 Tue, 02 Nov 2021 16:47:14 -0700 (PDT)
X-Gm-Message-State: AOAM531NmiYTN9ohFabWdG3BIB1M0vdqjFJFGR+fTO8jnPYKWZV2vmvh
 zAjkmidtFSE+9A4gusukpfba/fkieuFfLR1QdA==
X-Google-Smtp-Source: ABdhPJxBiOibpDHQ08BfqQjtssw7YcznWcjtqEDuz39aK2iQGGhleb3+Sr7g1j30TSs3MWReyiMD7sLDakaftm6tVag=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr51589752ejc.388.1635896832841; 
 Tue, 02 Nov 2021 16:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-16-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 07:47:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9-RmnC7DBWYd2OrXqvJkP43Ny0T-JqMhQE2PAde7Dbpg@mail.gmail.com>
Message-ID: <CAAOTY_9-RmnC7DBWYd2OrXqvJkP43Ny0T-JqMhQE2PAde7Dbpg@mail.gmail.com>
Subject: Re: [PATCH v7 15/20] drm/mediatek: add display merge mute/unmute
 support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_164714_968940_5B155B9B 
X-CRM114-Status: GOOD (  16.58  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDEw5pyIMjnml6Ug6YCx5LqUIOS4i+WNiDM6NTLlr6vpgZPvvJoKPgo+IEFkZCBtZXJnZSBtdXRl
L3VubXV0ZSBzZXR0aW5nIGZvciBNVDgxOTUuCj4gTVQ4MTk1IFZkb3N5czEgbWVyZ2Uxfm1lcmdl
NCBzdXBwb3J0IEhXIG11dGUgZnVuY3Rpb24uCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxu
YW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfbWVyZ2UuYyB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMKPiBpbmRleCA5MmM4MWNlMjRhNDkuLmRmZjI3
OTdhMmY2OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
bWVyZ2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5j
Cj4gQEAgLTU4LDEyICs1OCwxNSBAQAo+ICAjZGVmaW5lIEZMRF9QUkVVTFRSQV9USF9MT1cgICAg
ICAgICAgICAgICAgICAgIEdFTk1BU0soMTUsIDApCj4gICNkZWZpbmUgRkxEX1BSRVVMVFJBX1RI
X0hJR0ggICAgICAgICAgICAgICAgICAgR0VOTUFTSygzMSwgMTYpCj4KPiArI2RlZmluZSBESVNQ
X1JFR19NRVJHRV9NVVRFXzAgICAgICAgICAgMHhmMDAKPiArCj4gIHN0cnVjdCBtdGtfZGlzcF9t
ZXJnZSB7Cj4gLSAgICAgICB2b2lkIF9faW9tZW0gKnJlZ3M7Cj4gLSAgICAgICBzdHJ1Y3QgY2xr
ICpjbGs7Cj4gLSAgICAgICBzdHJ1Y3QgY2xrICphc3luY19jbGs7Cj4gLSAgICAgICBzdHJ1Y3Qg
Y21kcV9jbGllbnRfcmVnICAgICAgICAgIGNtZHFfcmVnOwo+IC0gICAgICAgYm9vbCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmaWZvX2VuOwo+ICsgICAgICAgdm9pZCBfX2lvbWVtICAgICAg
ICAgICAgKnJlZ3M7Cj4gKyAgICAgICBzdHJ1Y3QgY2xrICAgICAgICAgICAgICAqY2xrOwo+ICsg
ICAgICAgc3RydWN0IGNsayAgICAgICAgICAgICAgKmFzeW5jX2NsazsKPiArICAgICAgIHN0cnVj
dCBjbWRxX2NsaWVudF9yZWcgIGNtZHFfcmVnOwo+ICsgICAgICAgYm9vbCAgICAgICAgICAgICAg
ICAgICAgZmlmb19lbjsKPiArICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIG11dGVfc3Vw
cG9ydDsKPiAgfTsKPgo+ICB2b2lkIG10a19tZXJnZV9zdGFydChzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4gQEAgLTgyLDYgKzg1LDEwIEBAIHZvaWQgbXRrX21lcmdlX3N0YXJ0X2NtZHEoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+ICB7Cj4gICAgICAgICBzdHJ1
Y3QgbXRrX2Rpc3BfbWVyZ2UgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+ICsgICAg
ICAgaWYgKHByaXYtPm11dGVfc3VwcG9ydCkKPiArICAgICAgICAgICAgICAgbXRrX2RkcF93cml0
ZShjbWRxX3BrdCwgMHgwLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRElTUF9SRUdfTUVSR0VfTVVURV8wKTsKPiArCj4gICAgICAg
ICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCAxLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3Ms
Cj4gICAgICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX01FUkdFX0NUUkwpOwo+ICB9Cj4gQEAg
LTkwLDYgKzk3LDEwIEBAIHZvaWQgbXRrX21lcmdlX3N0b3BfY21kcShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtf
ZGlzcF9tZXJnZSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Cj4gKyAgICAgICBpZiAo
cHJpdi0+bXV0ZV9zdXBwb3J0KQo+ICsgICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFf
cGt0LCAweDEsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBESVNQX1JFR19NRVJHRV9NVVRFXzApOwo+ICsKPiAgICAgICAgIG10a19k
ZHBfd3JpdGUoY21kcV9wa3QsIDAsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiAgICAg
ICAgICAgICAgICAgICAgICAgRElTUF9SRUdfTUVSR0VfQ1RSTCk7Cj4gIH0KPiBAQCAtMjY0LDYg
KzI3NSw4IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfbWVyZ2VfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgICAgICAgIHByaXYtPmZpZm9fZW4gPSBvZl9wcm9wZXJ0eV9yZWFk
X2Jvb2woZGV2LT5vZl9ub2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibWVkaWF0ZWssbWVyZ2UtZmlmby1lbiIpOwo+Cj4gKyAgICAgICBwcml2LT5t
dXRlX3N1cHBvcnQgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LT5vZl9ub2RlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRpYXRlayxt
ZXJnZS1tdXRlIik7Cj4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsK
Pgo+ICAgICAgICAgcmV0ID0gY29tcG9uZW50X2FkZChkZXYsICZtdGtfZGlzcF9tZXJnZV9jb21w
b25lbnRfb3BzKTsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
