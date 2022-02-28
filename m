Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A9C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eKOqaA92vQnsueCX3Pn43IZiwPXanZ0r6nCi0wUVxSo=; b=vyH5GZnF/CZQk6
	eb8nFR4LIXl6kiiYh5tRha0YZVTxn84iLb/77M2XeDfRxhHZfGV3FBIQswZ40FH19b0nhahwhAbE6
	J0OuB20b8WLcppBi1pGZVsK0AkYnGPnKO2Pmue5J8LR38kqgcKEizlHtbPTMn7YEH2eZUtDxf4wEx
	3wo8AfBOx5T60jrY5HUpqqA71RplnRhm1iFXrllIwd/Z+3Q8HCtILKPXR2Jp8xE+DLdJli9lJIja4
	gWtfJ+RV806prKDSj8DwZY7oWvC7l/yWSRf9pSKoE3tiGHBSsaSZjcd42J5rDTUXZVUVG0QJTsOGb
	joyq4kF6lAnh0dmW16CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOkoL-00DiI9-Hy; Mon, 28 Feb 2022 18:31:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOko9-00DiFq-4s; Mon, 28 Feb 2022 18:31:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id u1so16826620wrg.11;
 Mon, 28 Feb 2022 10:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80IauG/d1J+24O+js6o66KmrN0KsXMCLre6trIg99LQ=;
 b=iMrbNpsj+1cEzLoigb874QD2f9x0Svo32wxz2+LBSGHl8vwNV4yGlBiP1HGdQV3PoX
 NPIKH4eQeFuWAL9MxTvrJKJneoatmzeWN1WDnolpHqwf0/yhsSaxaAp74JvBOgBXcoQ7
 1IndfORgIfOq46dOCBD19cAY2y5JKz4/iN1u2qCa4ViyvDy6APu1HmZ8aqbx2YRuAywQ
 L1nQvDE9IqctLNIv8YIqQtWJIgIVA5EY8dP3em70i96qa3GOtsS96UCC7WZStxyRv6au
 wBV2IgmC+M7ED202x7xe7+iyYG6zcEAeyP1uROqu5yC3yssHk793OaI2207EGEpuZuW3
 ehJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80IauG/d1J+24O+js6o66KmrN0KsXMCLre6trIg99LQ=;
 b=3mzitX9fJvozKD4ZDTAXbTfNq/WXa06oiHA+atYZaDVmg3ZJ6vRAJ3XNYbziDWuBth
 jYYHjd3NNXRPWup+cr05qg6jYUVwDmnGFNgUECyecvNRreumCBRSK+lahQsOUwfs60VT
 kwQffjLuQTw7NtQETVygb1OyM/hrwhQLJV3Rqpyd9WY7RA5dFM911IYMsiP3j6pygVGf
 PK5t/PnZaey6fDZyLfirZiihkkGihJ5J8CYLZShGcoK0YO+sRWhJherBAtbvUda8IXpb
 fL7/7BMFzTwRkuwcvWDtrdib7ZUY6PKqBo1quXxe8ni1Hhp41eMZbInpQkfAg4uDqTA3
 dzpw==
X-Gm-Message-State: AOAM530JNUSfvPloYLZscZzDK+5MK9wir1bHnOSzuK9yNbaTY2ev2ISS
 4d8vo0hlWt1avvZyiRbPMY8=
X-Google-Smtp-Source: ABdhPJyPAH/7Ee3C7zgL5tsV5rMzbtFf4QKcHZbN52HkzSCV9cCbcgECaNTt8rOXdUCTC9tDW5e9KA==
X-Received: by 2002:a5d:59a6:0:b0:1f0:150:4bad with SMTP id
 p6-20020a5d59a6000000b001f001504badmr445442wrr.581.1646073099334; 
 Mon, 28 Feb 2022 10:31:39 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm12670725wra.65.2022.02.28.10.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:31:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Cc: narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, maxime@cerno.tech, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/bridge: parade-ps8640: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:31:31 +0100
Message-Id: <20220228183131.23494-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_103141_210160_039E9800 
X-CRM114-Status: GOOD (  10.36  )
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

VGhlIGZ1bmN0aW9uICJkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UiIGhhcyBiZWVuIGRlcHJl
Y2F0ZWQgaW4KZmF2b3Igb2YgImRldm1fZHJtX29mX2dldF9icmlkZ2UiLgoKU3dpdGNoIHRvIHRo
ZSBuZXcgZnVuY3Rpb24gYW5kIHJlZHVjZSBib2lsZXJwbGF0ZS4KClNpZ25lZC1vZmYtYnk6IEpv
c8OpIEV4cMOzc2l0byA8am9zZS5leHBvc2l0bzg5QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2NDAuYyB8IDkgKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjQwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Bh
cmFkZS1wczg2NDAuYwppbmRleCA4MTg3MDRiZjVlODYuLjFjMmM0ZGQ1MGNlMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjQwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjQwLmMKQEAgLTU2Niw3ICs1NjYsNiBAQCBzdGF0aWMg
aW50IHBzODY0MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZjbGllbnQtPmRldjsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5v
Zl9ub2RlOwogCXN0cnVjdCBwczg2NDAgKnBzX2JyaWRnZTsKLQlzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbDsKIAlpbnQgcmV0OwogCXUzMiBpOwogCkBAIC02NTEsMTMgKzY1MCw3IEBAIHN0YXRpYyBp
bnQgcHM4NjQwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiAJZGV2bV9vZl9kcF9h
dXhfcG9wdWxhdGVfZXBfZGV2aWNlcygmcHNfYnJpZGdlLT5hdXgpOwogCiAJLyogcG9ydEAxIGlz
IHBzODY0MCBvdXRwdXQgcG9ydCAqLwotCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRn
ZShucCwgMSwgMCwgJnBhbmVsLCBOVUxMKTsKLQlpZiAocmV0IDwgMCkKLQkJcmV0dXJuIHJldDsK
LQlpZiAoIXBhbmVsKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCXBzX2JyaWRnZS0+cGFuZWxfYnJp
ZGdlID0gZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZChkZXYsIHBhbmVsKTsKKwlwc19icmlkZ2Ut
PnBhbmVsX2JyaWRnZSA9IGRldm1fZHJtX29mX2dldF9icmlkZ2UoZGV2LCBucCwgMSwgMCk7CiAJ
aWYgKElTX0VSUihwc19icmlkZ2UtPnBhbmVsX2JyaWRnZSkpCiAJCXJldHVybiBQVFJfRVJSKHBz
X2JyaWRnZS0+cGFuZWxfYnJpZGdlKTsKIAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
