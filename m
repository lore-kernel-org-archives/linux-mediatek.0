Return-Path: <SRS0=dV3g=NN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A467C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 01:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F247761266
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 01:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F247761266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rclul4mBH8xjfXRaXcwK6CL165FnYZD91lWy+uA2u5o=; b=1wNmDxOIUmJcVo
	o34l1k9L88fZqwoLmUOX/+lwMbiMrOSex+53eXnH3H2YN1ePTNFeJbHdo3TC2+FL6WMKVLlHcoEqP
	twGisl3eldOeLYg/SoOQ7OJTHMcoULOCusEtDkpuDLUEsPOpZws33o7HCjA4pTTiXLrZFuGqcdwPF
	OtcGIw+Tf+9E53v87wV9PzCVFI94s7h1qeFZZY63wC5862VPvg5Kn93FidPkQ15/DzaRfRxvR53i9
	qz7jzsEHsJaNwxYyzkSTJj4ToFREpsLdh7z6V1B8y9iEekSIcTmNhUarucr5Oj8vGRIK23aYzqcY+
	TdetsnrkddfMhIV3uctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHc4a-00DNY8-BV; Sun, 22 Aug 2021 01:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHc4N-00DNWJ-3e; Sun, 22 Aug 2021 01:14:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14FDC61354;
 Sun, 22 Aug 2021 01:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629594877;
 bh=zCzuD/gSEAZz6whQU8OxleDxwzLhRBG1uIqnRGpvqP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o7jAL41cV1Q05ea7fZSRvzv0vZ5APxyLyXwqZQX5/Qab2O1tdaSDk66vm/LNZy8fo
 U0wrcOc69+Sfa1T/XIcGMMf8oR5/fPHm+Vk+TDsqcrYosh8V+5qdko8InUVg+19TwD
 zWTmsHpkn+PPv4mbUgW6RZ5P7yUSNikeFdOcZ6DKmhm3k0+s6Janm0YtbJ6PlFG3uR
 UQM+8zDahpFfnfm0AljOy2ZR4ana+oP+ZWw8HPdRCjHNHZQqFGLXKZfnSYqjRE7osf
 tzfLxf/C2/NFw/n/U1dSm6059t7bAu6T1APRfPPyg/S4WI0C35xLNLuyxptlp34MHe
 lbQJxoXBsePkQ==
Received: by mail-ej1-f41.google.com with SMTP id d11so28373156eja.8;
 Sat, 21 Aug 2021 18:14:36 -0700 (PDT)
X-Gm-Message-State: AOAM531sRlUhUIDOGS0UItqzW9yAQaOA2ph7m8hnETAKlva2tiePMw5a
 0RzuWmE/TM7XyN8iw4deLuk3C5LKucxJBMIl3g==
X-Google-Smtp-Source: ABdhPJwurie+/j4gMgYRtvN6TgPa5fnIdmGdu2j/ak4r2YT1v1vuwSfGu0NBvpD/c6uzXnaqD7U33HlKS+77I74lBsU=
X-Received: by 2002:a17:906:b18e:: with SMTP id
 w14mr28931433ejy.63.1629594875631; 
 Sat, 21 Aug 2021 18:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
In-Reply-To: <20210818091847.8060-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Aug 2021 09:14:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
Message-ID: <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
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
X-CRM114-CacheID: sfid-20210821_181439_213088_45DE78B9 
X-CRM114-Status: GOOD (  11.29  )
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
tDjmnIgxOOaXpSDpgLHkuIkg5LiL5Y2INToxOOWvq+mBk++8mgo+Cj4gQWRkIGRyaXZlciBkYXRh
IG9mIG10ODE5NSB2ZG9zeXMxIHRvIG1lZGlhdGVrLWRybSBhbmQgbW9kaWZ5IGRybSBmb3IKPiBt
dWx0aS1tbXN5cyBzdXBwb3J0LiBUaGUgdHdvIG1tc3lzICh2ZG9zeXMwIGFuZCB2ZG9zeXMxKSB3
aWxsIGJyaW5nCj4gdXAgdHdvIGRybSBkcml2ZXJzLCBvbmx5IG9uZSBkcm0gZHJpdmVyIHJlZ2lz
dGVyIGFzIHRoZSBkcm0gZGV2aWNlLgo+IEVhY2ggZHJtIGRyaXZlciBiaW5kcyBpdHMgb3duIGNv
bXBvbmVudC4gVGhlIGZpcnN0IGJpbmQgZHJtIGRyaXZlcgo+IHdpbGwgYWxsb2NhdGUgdGhlIGRy
bSBkZXZpY2UsIGFuZCB0aGUgbGFzdCBiaW5kIGRybSBkcml2ZXIgcmVnaXN0ZXJzCj4gdGhlIGRy
bSBkZXZpY2UgdG8gZHJtIGNvcmUuIEVhY2ggY3J0YyBwYXRoIGlzIGNyZWF0ZWQgd2l0aCB0aGUK
PiBjb3JyZXNwb25kaW5nIGRybSBkcml2ZXIgZGF0YS4KPgo+IFNpZ25lZC1vZmYtYnk6IE5hbmN5
LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4KPgo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2RkcF9jb21wX2Z1bmNzIGRkcF9vdmxfYWRhcHRvciA9IHsKPiArICAgICAgIC5jbGtfZW5h
YmxlID0gbXRrX2V0aGRyX2Nsa19lbmFibGUsCj4gKyAgICAgICAuY2xrX2Rpc2FibGUgPSBtdGtf
ZXRoZHJfY2xrX2Rpc2FibGUsCj4gKyAgICAgICAuY29uZmlnID0gbXRrX2V0aGRyX2NvbmZpZywK
PiArICAgICAgIC5zdGFydCA9IG10a19ldGhkcl9zdGFydCwKPiArICAgICAgIC5zdG9wID0gbXRr
X2V0aGRyX3N0b3AsCj4gKyAgICAgICAubGF5ZXJfbnIgPSBtdGtfZXRoZHJfbGF5ZXJfbnIsCj4g
KyAgICAgICAubGF5ZXJfY29uZmlnID0gbXRrX2V0aGRyX2xheWVyX2NvbmZpZywKPiArICAgICAg
IC5lbmFibGVfdmJsYW5rID0gbXRrX2V0aGRyX2VuYWJsZV92YmxhbmssCj4gKyAgICAgICAuZGlz
YWJsZV92YmxhbmsgPSBtdGtfZXRoZHJfZGlzYWJsZV92YmxhbmssCj4gK307CgpJIHRoaW5rIGV0
aGRyIGlzIGluc2lkZSB0aGUgZ3JvdXAgb2Ygb3ZsX2FkcGF0b3IuIEkgcHJldGVyIHRoaXMKZnVu
Y3Rpb24gaXMgaW1wbGVtZW50ZWQgYnkgb3ZsX2FkYXB0b3IsIGFuZCBvdmxfYWRhcHRvciBjb250
cm9sIHJkbWEsCm1lcmdlLCBldGhkci4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
