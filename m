Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66C1C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:26:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA4261261
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CA4261261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g86tQ8Xun7PnCFKyBRRCf2vCzp2pS4OAjuV//xa3NHY=; b=fyoO8s+LJdp/jC4O4Rwif7jLX
	0bFsEnTjV92Fh7xKZ6aQ4RC05lEPFjPA8gML9Ucib9KrR4j6xFAxMmsQ1Oif12eQ1AHU4XGXTDC3E
	xuOOYN+O70Rwrz2gCXOFNwQ6Pi3PWFS8rj7U8YSf8hEpTO9ucfUMdC0Wm29VOfkislqDJGuA39p2N
	525xo+9vJQ6BARvC8nR2aKrlWdekP/OObAxzS0Cz2PIDrgka31tfyOdvbXVqJbmdrw7ihRCwp9nTm
	CO891/0EkusdxJDpZf30/griQtEu/wuCeY13hSTaL5lnj06xQWqmxcy4WNvyz4zU/pN4QgHoKe7SF
	tfQw+e7UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la67f-002gbP-2y; Sat, 24 Apr 2021 00:26:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la67L-002gVQ-Cq; Sat, 24 Apr 2021 00:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=PfiX0/guB4RepXUvDeuMP/4czgwMb9DGoEvOWejhpcE=; b=ihYszS+QOTR86psTwKj8ApK3BE
 K8sUjeixNsN3SKbe6kjOwMoAnB50LFrtQdtpiyc4w1sSmpaBoCepmkHDP6DAEaPqk4l23d+COa5MJ
 oVUzxeubwP7mQ6ukQigUHOr1Pw+QPdxl1lf0Z/RdP5v2OKFvPRNrvvkpzZjkVMs838sDd+eZmwCPe
 AeKZljCsKWdhXHLs+Q7ARU1G+ueYvT0H2NWbf8Ed+RP0W11NHyGpepRBapDbEr7SZj6AWQSo7G4Ig
 fcApSlH3sulE26+kSeRs+Byh4+U1sspvcgQ08GbnrCRsq7r8c9rHOoVoyJq+qOmiGgJtbwGDHkTPL
 YOdIbDJQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la67I-00Emzx-TI; Sat, 24 Apr 2021 00:25:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E16361463;
 Sat, 24 Apr 2021 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619223948;
 bh=hhjXoFOS7MULhaH2eAbg6aq5dkXrvOaI7xjS7HFqXe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GK0G8zXN66tUHlussUN5Vjc/K9oqAXRK0abA6s2QxZ3tq7fsDvvuIjbGa3BUDZ99N
 zitv2zz9omc0KoAjqrKMIsTu3lNQ/Ac5+39OZb6THfNzGyzgeVDL8ffkbFiyhIt/TK
 uTbPFThojEWgWHZhFvH0eIpWdYHX3xWGBDUPg86ryNd3EdzH7v6nZmANtvSW5+Kw2t
 3ZgeECGqb+I6TYT0WPYu1de7+OCaUEyBGi4vmvKtlvSY9i9kZt7Wp3M0olYVslN4UN
 8//viqJDSSgxHHdmz33CLjDjOH8tID7a4Lz3o7qOQ9P8MR2otzLTyKllx4cJ65069B
 z1gINSiwDiHNA==
Received: by mail-ed1-f42.google.com with SMTP id h8so19121572edb.2;
 Fri, 23 Apr 2021 17:25:48 -0700 (PDT)
X-Gm-Message-State: AOAM531PdnuGefT160O5BF9NBYFhewBi1UABN892b6ogfMrDksvDNuPN
 CmbodD+E9zA/bdk2rifhXMxS/uQLEm0S4yHw6w==
X-Google-Smtp-Source: ABdhPJxBTXib/RTXK9IEyyqRWQN2gM044cLDarwNUaBYySdbYao+uXwAkbPJ8CvcyZEI+UG1zkDReajVBv2wkbv96lQ=
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr7578022eds.166.1619223947148; 
 Fri, 23 Apr 2021 17:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-6-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-6-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 08:25:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PyKK4+gqiU4aP48fB-y34EdW7RULBxOfU2KU+V1toXw@mail.gmail.com>
Message-ID: <CAAOTY_9PyKK4+gqiU4aP48fB-y34EdW7RULBxOfU2KU+V1toXw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] gpu/drm: mediatek: hdmi: add MT8167 configuration
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_172548_990808_18D4B6E2 
X-CRM114-Status: GOOD (  13.72  )
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

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBUaGUgTVQ4MTY3
IFNvQyBoYXZlIGEgaGFyZCBsaW1pdCBvbiB0aGUgbWF4aW1hbCBzdXBwb3J0ZWQgSERNSSBUTURT
IGNsb2NrLAo+IGFuZCBpcyBub3QgdmFsaWRhdGVkIGFuZCBzdXBwb3J0ZWQgZm9yIEhETUkgbW9k
ZXMgb3V0IG9mIEhETUkgQ0VBIG1vZGVzLAo+IHNvIGFkZCBhIGNvbmZpZ3VyYXRpb24gZW50cnkg
bGlua2VkIHRvIHRoZSBNVDgxNjcgY29tcGF0aWJsZS4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4g
UGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IGluZGV4IGJjNTBk
OTdmMjU1My4uYzE2NTFhODM3MDBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKPiBAQCAtMTc4NywxMCArMTc4NywxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1p
X2NvbmYgbXRrX2hkbWlfY29uZl9tdDI3MDEgPSB7Cj4gICAgICAgICAudHpfZGlzYWJsZWQgPSB0
cnVlLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZiBtdGtfaGRt
aV9jb25mX210ODE2NyA9IHsKPiArICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwKPiAr
ICAgICAgIC5jZWFfbW9kZXNfb25seSA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX2hkbWlfb2ZfaWRzW10gPSB7Cj4gICAgICAgICB7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1oZG1pIiwKPiAgICAgICAgICAgLmRhdGEg
PSAmbXRrX2hkbWlfY29uZl9tdDI3MDEsCj4gICAgICAgICB9LAo+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctaGRtaSIsCj4gKyAgICAgICAgIC5kYXRhID0gJm10a19o
ZG1pX2NvbmZfbXQ4MTY3LAo+ICsgICAgICAgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTczLWhkbWkiLAo+ICAgICAgICAgfSwKPiAgICAgICAgIHt9Cj4gLS0KPiAy
LjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
