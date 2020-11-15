Return-Path: <SRS0=Y72t=EV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34053C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 23:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9CFB22240
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 23:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nwWMi/hJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zNe+9Bds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9CFB22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fI1I+8MJA1HoGTWqO8SxUKWR9sxA2AtXiho7cGTN0Zw=; b=nwWMi/hJ/KgKYThGM7HdSKRP/
	qUpCcZ/98UEsqZn85X9pMUDC5CPMknAxAPuXmVDxIKLIFMkRouldv8Ve+mDL3+9oWd/QW7ACgd3D8
	xv1gKS0s5WaGh7PgV/YlLwvnWqF4JbjB9Zlwzdpi6ocdIT0LLR9fYGyc9Iaaj1DRm54GkOiaAqUH4
	aYmG6Mk0cIzXVMs3cAE80Yhpoy+2t33smiNLJra77Uyk2Bn0ltAVt/Muvzi38XG/8qRGFlS0CUGZl
	kf9WqwuGeCXNM34/SAOMdH0U8YDfPtcunDaWZgKYig6de0H3+bkpvXD2IFybWoKl4+N3N/fSqQfDv
	KcnKJIayw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keRWT-0001rv-Jw; Sun, 15 Nov 2020 23:33:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keRWR-0001rZ-0o
 for linux-mediatek@lists.infradead.org; Sun, 15 Nov 2020 23:33:28 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C1232244C
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605483205;
 bh=AxjPWHiAXimR3BwkGu8Fq6s+JPSbGYc4j1v6w0slZqU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zNe+9BdsyFczGaIH+LDVLTlcFnYB7CoBtFB5N5EKdyKvAHRcGPsJtMLWZr5LoZHiO
 XyFg9n3dSQyNL2Ysote/LTsaY5HNlyE0fxKlA4g62mGy72Tm38E0/Pn569V51YVAk2
 74sqrbMgK1xvZsQHUmkwHR+D4jEMyKFi7ApbqoQE=
Received: by mail-ej1-f49.google.com with SMTP id me8so21905891ejb.10
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 15:33:25 -0800 (PST)
X-Gm-Message-State: AOAM533bIX+V7tdc24cMpCgkVnkuZ7MfbdyeGx1AXD1OZmNSJqR/QMJB
 wjOqw/YoMJKPgCaVZBGVa9gNKDM/BrUg970Uow==
X-Google-Smtp-Source: ABdhPJwY5FAbz/l67tbdaapu7EKNmOwZT7Y3IG02ZWCruzVT3fqs01hVvXxojcLVUvNaQzjwOlzj809nVqGcTt86abM=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr12127130ejq.303.1605483204156; 
 Sun, 15 Nov 2020 15:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2020 07:33:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
Message-ID: <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Decouple Mediatek DRM sub driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_183327_580857_07344479 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgz
5pelIOmAseS6jCDkuIrljYg4OjM05a+r6YGT77yaCj4KPiBtdGsgY2NvcnIgaXMgY29udHJvbGxl
ZCBieSBEUk0gYW5kIE1EUCBbMV0uIEluIG9yZGVyIHRvIHNoYXJlCj4gbXRrX2Njb3JyIGRyaXZl
ciBmb3IgRFJNIGFuZCBNRFAsIGRlY291cGxlIE1lZGlhdGVrIERSTSBzdWIgZHJpdmVyCj4gd2hp
Y2ggaW5jbHVkZSBtdGtfY2NvcnIsIHNvIE1EUCBjb3VsZCB1c2UgdGhpcyBkZWNvdXBsZWQgbXRr
X2Njb3JyLgoKQXBwbGllZCB0aGUgd2hvbGUgc2VyaWVzIGludG8gbWVkaWF0ZWstZHJtLW5leHQg
WzFdLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExMTQwNzUxLwo+Cj4gQ0sgSHUgKDkpOgo+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIGNsayBpbmZv
IGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIgZHJpdmVyCj4gICAgIHByaXZhdGUgZGF0
YQo+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIHJlZ3MgaW5mbyBmcm9tIHN0cnVjdCBtdGtfZGRwX2Nv
bXAgdG8gc3ViIGRyaXZlcgo+ICAgICBwcml2YXRlIGRhdGEKPiAgIGRybS9tZWRpYXRlazogUmVt
b3ZlIGlycSBpbiBzdHJ1Y3QgbXRrX2RkcF9jb21wCj4gICBkcm0vbWVkaWF0ZWs6IFVzZSBzdHJ1
Y3QgY21kcV9jbGllbnRfcmVnIHRvIGdhdGhlciBjbWRxIHZhcmlhYmxlCj4gICBkcm0vbWVkaWF0
ZWs6IE1vdmUgY21kcV9yZWcgaW5mbyBmcm9tIHN0cnVjdCBtdGtfZGRwX2NvbXAgdG8gc3ViCj4g
ICAgIGRyaXZlciBwcml2YXRlIGRhdGEKPiAgIGRybS9tZWRpYXRlazogQ2hhbmdlIHN1YiBkcml2
ZXIgaW50ZXJmYWNlIGZyb20gbXRrX2RkcF9jb21wIHRvIGRldmljZQo+ICAgZHJtL21lZGlhdGVr
OiBSZWdpc3RlciB2YmxhbmsgY2FsbGJhY2sgZnVuY3Rpb24KPiAgIGRybS9tZWRpYXRlazogRFJN
IGRyaXZlciBkaXJlY3RseSByZWZlciB0byBzdWIgZHJpdmVyJ3MgZnVuY3Rpb24KPiAgIGRybS9t
ZWRpYXRlazogTW92ZSBtdGtfZGRwX2NvbXBfaW5pdCgpIGZyb20gc3ViIGRyaXZlciB0byBEUk0g
ZHJpdmVyCj4KPiBDaHVuLUt1YW5nIEh1ICgyKToKPiAgIGRybS9tZWRpYXRlazogR2V0IENNRFEg
Y2xpZW50IHJlZ2lzdGVyIGZvciBhbGwgZGRwIGNvbXBvbmVudAo+ICAgZHJtL21lZGlhdGVrOiBV
c2UgY29ycmVjdCBkZXZpY2UgcG9pbnRlciB0byBnZXQgQ01EUSBjbGllbnQgcmVnaXN0ZXIKPgo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyAgIHwgIDg2ICsrLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgNjkgKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwgMjE1ICsr
KysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAg
fCAxNjkgKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAg
ICAgICAgfCAgNDQgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
YyAgICAgfCAgNzUgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmggICAgIHwgICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYyB8IDM4OSArKysrKysrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgMTAwICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAgMzAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmggICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jICAgICAgICAgIHwgIDQ3ICstLQo+ICAxMiBmaWxlcyBjaGFuZ2VkLCA2NTgg
aW5zZXJ0aW9ucygrKSwgNTY5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oCj4KPiAtLQo+IDIuMTcuMQo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
