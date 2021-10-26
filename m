Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3069EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DA4610A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7DA4610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlvFlmyYbAxfzBTyxUv1O1irQCaJ72mSLfDpU7Knmcs=; b=xiXjD7QDnR7zO7
	PVDHypCoR4I9nyolSDaNRW8oEdq59rH3XdEgpFPc3v4CUS+XJ+HngjDkVjsAIVoKTB3tKV2AW38Dt
	Cw2Fr2hnEQNHQce1P0tI21capaH9Mq7CTJ7i1sSvPpI5uqO6uHUMADbx+hrYKI3vWwYEyW8kWNHb0
	ywdn1ix8ftbNW4xlXgoB7OyR0SCLFFYwdNIoQqbBE3cCzUfToPNwCeX002ECLsvsxzW3gh4FqXnnJ
	vEhGmar7ksHQFcV/bnJKuk5BQp93jig1bp1RIi3NJ+zQiP7cbaz4SepuHp7YhiVgn/HJMOG5GBXIM
	7EKRY/geMVUmRtsCMc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOqv-002HNQ-8M; Tue, 26 Oct 2021 15:59:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOqi-002HL5-BL; Tue, 26 Oct 2021 15:58:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6F6F60EFE;
 Tue, 26 Oct 2021 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635263931;
 bh=OB+yWz25S7H3KGVqOadlPy4oTErCjsdJuZ0ZVaPAy8k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=US3NnEMYFu1vz16HF+h0dZfutidEoX/LmTS74LPdqO8xqRxQiiH0RV+UGHhKWfBae
 4QujY4Rc1MCTgmKaEqDc1ZT6DvL/zwlZlM3PNtDX/TEvEGKKH2Bs2Pxgjafmk5TRFM
 iPs9fkQX6Aa9+0DaCtrrNSs9sg31yNy44SSGYhdXXPP4Esmz7nRnjjZigZXVTlR22f
 j/q4Yd+cgQuN0Eb50EqQmKSDC8wRhZx/9TFTTOdHy5k2JHbRrW66VBXp0O3MfKGIG5
 LtVTR1AeNOTITte9sg/MxCHCj+wWTC/4zkaL1I2RDX3qy7E9MGMiCpac7cTYUq7Wvk
 mV0P9YrjCXMLQ==
Received: by mail-ed1-f52.google.com with SMTP id w15so15260944edc.9;
 Tue, 26 Oct 2021 08:58:51 -0700 (PDT)
X-Gm-Message-State: AOAM531Dcyvxhr/qa64neNFlXVQ+228AcC2dhemMB3Xs1Z0YLCRu+py+
 iO47l4Ge0+CDhPRvfjXvrnW7v30rHA7axUeiow==
X-Google-Smtp-Source: ABdhPJybqDR3/pnAJXzhteBsi4mz3UfvtHoiBaXiMxgZ9m+2o1xf0216M+QZACOhTRWtaq3EIkWNHjKybj9XSRrnxzE=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr22780481edu.357.1635263708464; 
 Tue, 26 Oct 2021 08:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 26 Oct 2021 23:54:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY__8jL__0H=puB+WmMAO9MBiFpzh=6Aw8VLSJ6xNsSakuA@mail.gmail.com>
Message-ID: <CAAOTY__8jL__0H=puB+WmMAO9MBiFpzh=6Aw8VLSJ6xNsSakuA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/mediatek: Detect CMDQ execution timeout
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_085852_444228_4A9FD4AC 
X-CRM114-Status: GOOD (  20.48  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEw5pyIMjbml6Ug6YCx5LqMIOS4i+WNiDE6Mjnlr6vpgZPvvJoKPgo+IEZyb206IENo
dW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+Cj4gQ01EUSBpcyB1c2VkIHRv
IHVwZGF0ZSBkaXNwbGF5IHJlZ2lzdGVyIGluIHZibGFuayBwZXJpb2QsIHNvCj4gaXQgc2hvdWxk
IGJlIGV4ZWN1dGUgaW4gbmV4dCAyIHZibGFuay4gT25lIHZibGFuayBpbnRlcnJ1cHQKPiBiZWZv
cmUgc2VuZCBtZXNzYWdlIChvY2Nhc2lvbmFsbHkpIGFuZCBvbmUgdmJsYW5rIGludGVycnVwdAo+
IGFmdGVyIGNtZHEgZG9uZS4gSWYgaXQgZmFpbCB0byBleGVjdXRlIGluIG5leHQgMyB2Ymxhbmss
Cj4gdGllbW91dCBoYXBwZW4uCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMgfCAyMCArKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCBlMjNlMzIyNGFjNjcuLmRhZDFmODVlZTMxNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtNTQsNiArNTQs
NyBAQCBzdHJ1Y3QgbXRrX2RybV9jcnRjIHsKPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRL
X0NNRFEpCj4gICAgICAgICBzdHJ1Y3QgY21kcV9jbGllbnQgICAgICAgICAgICAgIGNtZHFfY2xp
ZW50Owo+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbWRxX2V2ZW50
Owo+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbWRxX3ZibGFua19j
bnQ7Cj4gICNlbmRpZgo+Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICAgICAgICAgICAgICAgICAg
ICptbXN5c19kZXY7Cj4gQEAgLTIyNyw3ICsyMjgsMTAgQEAgc3RydWN0IG10a19kZHBfY29tcCAq
bXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICBzdGF0
aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1Y3QgbWJveF9jbGllbnQgKmNsLCB2b2lkICptc3NnKQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgY21kcV9jYl9kYXRhICpkYXRhID0gbXNzZzsKPiArICAgICAg
IHN0cnVjdCBjbWRxX2NsaWVudCAqY21kcV9jbCA9IGNvbnRhaW5lcl9vZihjbCwgc3RydWN0IGNt
ZHFfY2xpZW50LCBjbGllbnQpOwo+ICsgICAgICAgc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2Ny
dGMgPSBjb250YWluZXJfb2YoY21kcV9jbCwgc3RydWN0IG10a19kcm1fY3J0YywgY21kcV9jbGll
bnQpOwo+Cj4gKyAgICAgICBtdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID0gMDsKPiAgICAgICAg
IGNtZHFfcGt0X2Rlc3Ryb3koZGF0YS0+cGt0KTsKPiAgfQo+ICAjZW5kaWYKPiBAQCAtNDgzLDYg
KzQ4NywxNSBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfdXBkYXRlX2NvbmZpZyhzdHJ1Y3Qg
bXRrX2RybV9jcnRjICptdGtfY3J0YywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY21kcV9oYW5kbGUtPnBhX2Jhc2UsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNtZHFfaGFuZGxlLT5jbWRfYnVmX3NpemUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9UT19ERVZJQ0UpOwo+ICsg
ICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBDTURRIGNvbW1hbmQgc2hvdWxk
IGV4ZWN1dGUgaW4gbmV4dCAzIHZibGFuay4KPiArICAgICAgICAgICAgICAgICogT25lIHZibGFu
ayBpbnRlcnJ1cHQgYmVmb3JlIHNlbmQgbWVzc2FnZSAob2NjYXNpb25hbGx5KQo+ICsgICAgICAg
ICAgICAgICAgKiBhbmQgb25lIHZibGFuayBpbnRlcnJ1cHQgYWZ0ZXIgY21kcSBkb25lLAo+ICsg
ICAgICAgICAgICAgICAgKiBzbyBpdCdzIHRpbWVvdXQgYWZ0ZXIgMyB2YmxhbmsgaW50ZXJydXB0
Lgo+ICsgICAgICAgICAgICAgICAgKiBJZiBpdCBmYWlsIHRvIGV4ZWN1dGUgaW4gbmV4dCAzIHZi
bGFuaywgdGltZW91dCBoYXBwZW4uCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAg
ICAgICBtdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID0gMzsKPiArCj4gICAgICAgICAgICAgICAg
IG1ib3hfc2VuZF9tZXNzYWdlKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLCBjbWRxX2hhbmRs
ZSk7Cj4gICAgICAgICAgICAgICAgIG1ib3hfY2xpZW50X3R4ZG9uZShtdGtfY3J0Yy0+Y21kcV9j
bGllbnQuY2hhbiwgMCk7Cj4gICAgICAgICB9Cj4gQEAgLTQ5OSwxMSArNTEyLDE0IEBAIHN0YXRp
YyB2b2lkIG10a19jcnRjX2RkcF9pcnEodm9pZCAqZGF0YSkKPgo+ICAjaWYgSVNfUkVBQ0hBQkxF
KENPTkZJR19NVEtfQ01EUSkKPiAgICAgICAgIGlmICghcHJpdi0+ZGF0YS0+c2hhZG93X3JlZ2lz
dGVyICYmICFtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikKPiArICAgICAgICAgICAgICAgbXRr
X2NydGNfZGRwX2NvbmZpZyhjcnRjLCBOVUxMKTsKPiArICAgICAgIGVsc2UgaWYgKG10a19jcnRj
LT5jbWRxX3ZibGFua19jbnQgPiAwICYmIC0tbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9PSAw
KQo+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoIm10a19jcnRjICVkIENNRFEgZXhlY3V0ZSBj
b21tYW5kIHRpbWVvdXQhXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2NydGNf
aW5kZXgoJm10a19jcnRjLT5iYXNlKSk7Cj4gICNlbHNlCj4gICAgICAgICBpZiAoIXByaXYtPmRh
dGEtPnNoYWRvd19yZWdpc3RlcikKPiAtI2VuZGlmCj4gICAgICAgICAgICAgICAgIG10a19jcnRj
X2RkcF9jb25maWcoY3J0YywgTlVMTCk7Cj4gLQo+ICsjZW5kaWYKPiAgICAgICAgIG10a19kcm1f
ZmluaXNoX3BhZ2VfZmxpcChtdGtfY3J0Yyk7Cj4gIH0KPgo+IC0tCj4gMi4xOC4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
