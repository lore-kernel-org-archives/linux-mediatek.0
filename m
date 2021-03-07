Return-Path: <SRS0=Dmy6=IF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4D9C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 00:30:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754D0650AD
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 00:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754D0650AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wqHimgcgrt9JbrFnSdQqaeauGmb+KNloymttURZL1uI=; b=dzh6FlTiu3AaZ7k1p+3ix5GvF
	fInF4qSkWLVWIlXTxPhUNVzUnIk2272QVMXPBRSl3LWQwPU2ZWMhaGQ1uY3q73zi1DztyDVt9czOi
	uPyx5VAaa1gaTS/O1C95N/83vD1Tpxh8W84Mg5RwD8I1l4ITrF6ZN/Ome4w4ZKSjfkwYi/hH6omit
	gJ3ggzC5sitb2O7WOsoVVcQll0Fue1vKZJFNELnc0u1RLNYaRozYkVBPAYmBnv/yOA/rf/gqyFaJV
	HJ+psGr1Jl+IApOEum4YlfJMGcI1Dl/n8y/bPcv73U1cKgNUPOoorbcCOxgkZKkbyITf1rQF3QYZs
	Ol9QIS5Zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIhJe-006LsJ-FR; Sun, 07 Mar 2021 00:30:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIhJS-006Ljb-VQ; Sun, 07 Mar 2021 00:30:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A26F650AD;
 Sun,  7 Mar 2021 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615077025;
 bh=uJwXubSaOLTt7He4mvFNkPoPWLDyc08NNbEFTffP5l0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j4MbRNNUmEswJ2GkrZPTMQ6/C/vz7TUhGrgd2hQkHC16WNbiHBqF4EieYFrMdwQK6
 R3BK+U2hz0I9Bux1sOMv/s0TdCl6tpozUKhjwwzcRHGZYs/vJ1IHB9a7C4fVvMab2+
 yQNHSvkbhsn91uRi4LStWTdXjnR4E1NSH8RdRXlo5Ey7kFY8eBfJr+CGiVvGuPkiPy
 5eksEqvOcmuBSZGPc1ZkBLqGdAxuNhNG8EX1U+l/aRW0BZ8S27FRYxbLZeqrLU9wIY
 6+sKjBha8ADITStjwB0GyfZ0yOp9vpaGKzJmGvS0IHfIr7k+01DeRK0E/7uk6IHaYv
 JeI5ItiHK8p3A==
Received: by mail-ej1-f53.google.com with SMTP id p8so12356375ejb.10;
 Sat, 06 Mar 2021 16:30:25 -0800 (PST)
X-Gm-Message-State: AOAM531uUMsMjWhudy3FCYSOiUzaB8o5dKmxePKAOLNjSSHTtHikn3ZP
 wSGrFUeeF3ejadiT29VR2wSyYTk3zjfLPb6Q+g==
X-Google-Smtp-Source: ABdhPJzkevcLiDsincX3P/xDWHQn213RalKdvB/BL2ujct31lwjYiYLZ5AyLmSo+zrQMgDe32l0l5PXBMIfb1+LDPRE=
X-Received: by 2002:a17:906:400b:: with SMTP id
 v11mr8684303ejj.194.1615077023864; 
 Sat, 06 Mar 2021 16:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210201033603.12616-1-jitao.shi@mediatek.com>
 <20210201033603.12616-3-jitao.shi@mediatek.com>
In-Reply-To: <20210201033603.12616-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 7 Mar 2021 08:30:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8cvuEx49SseiCDcVTdZbT6JMFKUH7t6tvaGoHy7T4dEg@mail.gmail.com>
Message-ID: <CAAOTY_8cvuEx49SseiCDcVTdZbT6JMFKUH7t6tvaGoHy7T4dEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: dsi: fine tune the line time cause
 by EOTp
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yingjoe.chen@mediatek.com, 
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_003027_265984_A0CBCB34 
X-CRM114-Status: GOOD (  15.98  )
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIgx5pelIOmAseS4gCDkuIrljYgxMTozNuWvq+mBk++8mgo+Cj4gRW5hYmxpbmcgRW9UcCB3
aWxsIG1ha2UgdGhlIGxpbmUgdGltZSBsYXJnZXIsIHNvIHRoZSBoZnAgYW5kCj4gaGJwIHNob3Vs
ZCBiZSByZWR1Y2VkIHRvIGtlZXAgbGluZSB0aW1lLgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0t
bmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkg
PGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCAyYmM0NmYyMzUwZjEuLjhjNzBlYzM5
YmZlMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC00ODEsNiArNDgx
LDcgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJvICsg
dGltaW5nLT5kYV9oc19leGl0ICsgMzsKPgo+ICAgICAgICAgZGVsdGEgPSBkc2ktPm1vZGVfZmxh
Z3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUID8gMTggOiAxMjsKPiArICAgICAgIGRlbHRh
ICs9IGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCA/IDIgOiAwOwo+
Cj4gICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9IHZtLT5oZnJvbnRfcG9yY2gg
KiBkc2lfdG1wX2J1Zl9icHA7Cj4gICAgICAgICBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZSA9
IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlICsgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsK
PiAtLQo+IDIuMTIuNQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
