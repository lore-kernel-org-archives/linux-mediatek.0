Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE80C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 22:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F3A208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 22:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2CqR195";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vcdsExYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F3A208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wyhGi08T+d3SeCmEIc7Qibu9fqnmnBOWrvEKFZ+JLxQ=; b=I2CqR195e7AutsfyMRyKH7m8U
	AaCWFaCHa01efgmPVfeE+euklhLeutoR6aa9wdMhs7SNkIYPoYQBN4/qJqeRsS0e0fhsFQjWL5Gvu
	/XLdrKYfOw8qh6MfWjNsjOTvcXQD+yEq59SOdCHEBkDGFj1oTUYLPHcToFHQmHRlXO1jNsYyRFnGN
	FZUhtro8oZ8d4Q8I73lJnUXSesVaHG1slAHhUyj8DhYo1CfbKx5ogiRBV8k7mIZIgTkqEfGKIUzk3
	2OBNvSOctx1/AerFSZwVI644Ie0PCLjol9pkPyuTYy/uuYf/UllbepgWa2vK0foiimqykGlfeyhFE
	cwamtBbXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHwfQ-0000Gg-09; Mon, 14 Sep 2020 22:09:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHwfK-0000AH-GK; Mon, 14 Sep 2020 22:09:39 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D890521BE5;
 Mon, 14 Sep 2020 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600121377;
 bh=Nz7gGQ+J/ilhJdHLM4BsmqhATykFw0LEpRBTDA8GVOk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vcdsExYa08FePhjPFL/B5tV+UlxmRi0Dt3qUnKHypkDv/qhVr8oRIH0/ZDlgoanh+
 29ZTRj2HAFMritc/hyC2IL6dnmTKAdsl6rnasfKf2sCXvjnHAp8zgRsSkPRX/IGO8Q
 dMjY3XH6toV6vEqTpZUk3JOYmtS00w/dbnKAhXVo=
Received: by mail-ej1-f45.google.com with SMTP id q13so2108992ejo.9;
 Mon, 14 Sep 2020 15:09:36 -0700 (PDT)
X-Gm-Message-State: AOAM533qYB67M+SPcWiYYHynKel9zb+pxPIvLMTnCY92Da6f5Pz7aSX0
 //wcTqtxrqgbyBiT/ATP9Oi+xu/Y93qlYHG+Ng==
X-Google-Smtp-Source: ABdhPJzJGzLWfXMkzj/uZwj/GppT/VN4DVF+j5uKOZfH5SCyReE4lyC/KudDVVDW7AFmoqKRghaV4EK54CnHc9xzmBw=
X-Received: by 2002:a17:906:7102:: with SMTP id
 x2mr16660250ejj.260.1600121375444; 
 Mon, 14 Sep 2020 15:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200904110002.88966-1-linux@fw-web.de>
 <20200904110002.88966-2-linux@fw-web.de>
In-Reply-To: <20200904110002.88966-2-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 06:09:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__TNsteFiTxdXfnKns4jkz62NNG7joUtsu0XVV8MwhhRQ@mail.gmail.com>
Message-ID: <CAAOTY__TNsteFiTxdXfnKns4jkz62NNG7joUtsu0XVV8MwhhRQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <linux@fw-web.de>, Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_180938_710358_60C8D3FA 
X-CRM114-Status: GOOD (  23.60  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 chunhui dai <chunhui.dai@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDnmnIg05pelIOmAseS6lCDkuIvljYg3OjAx5a+r6YGT77yaCj4KPiBGcm9tOiBjaHVuaHVpIGRh
aSA8Y2h1bmh1aS5kYWlAbWVkaWF0ZWsuY29tPgo+Cj4gV2l0aG91dCB0aGF0IHBhdGNoIGlmIHlv
dSB1c2Ugc3BlY2lmaWMgcmVzb2x1dGlvbnMgbGlrZSAxMjgweDEwMjQsCj4gSSBjYW4gc2VlIGRp
c3RvcnRpb24gaW4gdGhlIG91dHB1dC4gSXQgc2VlbXMgYXMgaWYgdGhlCj4gZnJlcXVlbmN5IGZv
ciB1cGRhdGluZyB0aGUgcGl4ZWwgb2YgdGhlIGltYWdlIGlzIG91dCBvZiBzeW5jLgo+Cj4gRm9y
IGluaXRpYWxpemF0aW9uIHRtZHMgbmVlZHMgdG8gYmUgYWN0aXZlLCBidXQgY2FuIGJlIGRpc2Fi
bGVkIGFmdGVyIGluaXQKPiB0byBmaXggYmx1cnJ5IGRpc3BsYXkKCkFzIGRpc2N1c3NlZCB3aXRo
IEppdGFvIG9mZmxpbmUsIGhlIGFncmVlIHRoaXMgcGF0Y2gsIHNvIEkgYXBwbGllZAp0aGlzIHBh
dGNoIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQv
bG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25l
ZC1vZmYtYnk6IGNodW5odWkgZGFpIDxjaHVuaHVpLmRhaUBtZWRpYXRlay5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4gVGVz
dGVkLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAtLS0K
PiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jIHwgMSArCj4gIGRy
aXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jICAgICAgICB8IDMgKysrCj4gIGRyaXZl
cnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5oICAgICAgICB8IDEgKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L21lZGlh
dGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGst
aGRtaS1tdDI3MDEuYwo+IGluZGV4IGE2Y2IxZGVhM2QwYy4uYjc0YzY1YTE3NjJjIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYwo+ICsrKyBi
L2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYwo+IEBAIC0yMzgsNiAr
MjM4LDcgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfcGh5X2Rpc2FibGVfdG1kcyhzdHJ1Y3QgbXRr
X2hkbWlfcGh5ICpoZG1pX3BoeSkKPgo+ICBzdHJ1Y3QgbXRrX2hkbWlfcGh5X2NvbmYgbXRrX2hk
bWlfcGh5XzI3MDFfY29uZiA9IHsKPiAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9HQVRF
LAo+ICsgICAgICAgLnBsbF9kZWZhdWx0X29mZiA9IHRydWUsCj4gICAgICAgICAuaGRtaV9waHlf
Y2xrX29wcyA9ICZtdGtfaGRtaV9waHlfcGxsX29wcywKPiAgICAgICAgIC5oZG1pX3BoeV9lbmFi
bGVfdG1kcyA9IG10a19oZG1pX3BoeV9lbmFibGVfdG1kcywKPiAgICAgICAgIC5oZG1pX3BoeV9k
aXNhYmxlX3RtZHMgPSBtdGtfaGRtaV9waHlfZGlzYWJsZV90bWRzLAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVr
L3BoeS1tdGstaGRtaS5jCj4gaW5kZXggOGZjODNmMDFhNzIwLi40N2MwMjlkNGIyNzAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmMKPiArKysgYi9kcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYwo+IEBAIC0xODQsNiArMTg0LDkgQEAgc3Rh
dGljIGludCBtdGtfaGRtaV9waHlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocGh5X3Byb3ZpZGVyKTsKPiAgICAgICAg
IH0KPgo+ICsgICAgICAgaWYgKGhkbWlfcGh5LT5jb25mLT5wbGxfZGVmYXVsdF9vZmYpCj4gKyAg
ICAgICAgICAgICAgIGhkbWlfcGh5LT5jb25mLT5oZG1pX3BoeV9kaXNhYmxlX3RtZHMoaGRtaV9w
aHkpOwo+ICsKPiAgICAgICAgIHJldHVybiBvZl9jbGtfYWRkX3Byb3ZpZGVyKGRldi0+b2Zfbm9k
ZSwgb2ZfY2xrX3NyY19zaW1wbGVfZ2V0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaGRtaV9waHktPnBsbCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvbWVk
aWF0ZWsvcGh5LW10ay1oZG1pLmggYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWku
aAo+IGluZGV4IGIxM2UxZDVmOGU3OC4uZGNmOWJiMTM2OTliIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5oCj4gKysrIGIvZHJpdmVycy9waHkvbWVkaWF0
ZWsvcGh5LW10ay1oZG1pLmgKPiBAQCAtMjEsNiArMjEsNyBAQCBzdHJ1Y3QgbXRrX2hkbWlfcGh5
Owo+Cj4gIHN0cnVjdCBtdGtfaGRtaV9waHlfY29uZiB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOwo+ICsgICAgICAgYm9vbCBwbGxfZGVmYXVsdF9vZmY7Cj4gICAgICAgICBjb25zdCBz
dHJ1Y3QgY2xrX29wcyAqaGRtaV9waHlfY2xrX29wczsKPiAgICAgICAgIHZvaWQgKCpoZG1pX3Bo
eV9lbmFibGVfdG1kcykoc3RydWN0IG10a19oZG1pX3BoeSAqaGRtaV9waHkpOwo+ICAgICAgICAg
dm9pZCAoKmhkbWlfcGh5X2Rpc2FibGVfdG1kcykoc3RydWN0IG10a19oZG1pX3BoeSAqaGRtaV9w
aHkpOwo+IC0tCj4gMi4yNS4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
