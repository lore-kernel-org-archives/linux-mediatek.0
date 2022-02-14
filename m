Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBZm6UWZz6j+iA1iRA+OOvcs2Nuje1lWtQVvMFF+bH0=; b=Az+Pota7YFp5pW
	teh1y6Frn1a3+nytAnmHhqJ5iXxcqTYBIEKA30pNbxd020aj8IN+zB98nJQ7WiTrqghmlwBQqR4Xj
	ScFW2CqGLZSSD37pp8ZgRq6ZOpH7Z1UnKbEmINhocNSy73UIE2I3mSRd64AK8QriHpsEBq+Uzu9Vd
	XgK6R4Phg7ZR/puDpBAlZhxUpHDYasLutnnfa9dT7saWcqyoI8U1ZnPGO2qNuOdqlnqlxCn8HSFXH
	vizhMHLOdLJsMymC3YqGkHNho6B3TK7S2rWZ5KYf6DHE0VPg5aNcZSTIPivRKr1drpAeUMwYJoMs3
	nFggaWCTgMCB8dXZbrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUcG-00DM9B-N8; Mon, 14 Feb 2022 06:13:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUax-00DLQN-U2; Mon, 14 Feb 2022 06:12:25 +0000
X-UUID: f550aa210f9a47bb969fa856ea28570c-20220213
X-UUID: f550aa210f9a47bb969fa856ea28570c-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1199787540; Sun, 13 Feb 2022 23:12:09 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:11:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 14:11:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:11:03 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
CC: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <iommu@lists.linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-kernel@vger.kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Stephen
 Boyd" <sboyd@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, <srv_heupstream@mediatek.com>, Rob Clark
 <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Sandy
 Huang" <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C2=A8=C2=B9bner?=
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>
Subject: [PATCH 13/23] drm/rockchip: Make use of the helper
 component_compare_dev
Date: Mon, 14 Feb 2022 14:08:09 +0800
Message-ID: <20220214060819.7334-14-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_221220_028328_DE3A203D 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

VXNlIHRoZSBjb21tb24gY29tcGFyZSBoZWxwZXIgZnJvbSBjb21wb25lbnQuCgpDYzogU2FuZHkg
SHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KQ2M6ICJIZWlrbyBTdMKowrlibmVyIiA8aGVpa29A
c250ZWNoLmRlPgpDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQt
b2ZmLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jIHwgNyArLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKaW5kZXggYmVjMjA3ZGU0NTQ0Li4zYzJmMmQ2ZWNjMzYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYwpAQCAtMjkw
LDExICsyOTAsNiBAQCBpbnQgcm9ja2NoaXBfZHJtX2VuZHBvaW50X2lzX3N1YmRyaXZlcihzdHJ1
Y3QgZGV2aWNlX25vZGUgKmVwKQogCXJldHVybiBmYWxzZTsKIH0KIAotc3RhdGljIGludCBjb21w
YXJlX2RldihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCi17Ci0JcmV0dXJuIGRldiA9
PSAoc3RydWN0IGRldmljZSAqKWRhdGE7Ci19Ci0KIHN0YXRpYyB2b2lkIHJvY2tjaGlwX2RybV9t
YXRjaF9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBkZXZpY2VfbGluayAq
bGluazsKQEAgLTMyMSw3ICszMTYsNyBAQCBzdGF0aWMgc3RydWN0IGNvbXBvbmVudF9tYXRjaCAq
cm9ja2NoaXBfZHJtX21hdGNoX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQkJYnJlYWs7CiAK
IAkJCWRldmljZV9saW5rX2FkZChkZXYsIGQsIERMX0ZMQUdfU1RBVEVMRVNTKTsKLQkJCWNvbXBv
bmVudF9tYXRjaF9hZGQoZGV2LCAmbWF0Y2gsIGNvbXBhcmVfZGV2LCBkKTsKKwkJCWNvbXBvbmVu
dF9tYXRjaF9hZGQoZGV2LCAmbWF0Y2gsIGNvbXBvbmVudF9jb21wYXJlX2RldiwgZCk7CiAJCX0g
d2hpbGUgKHRydWUpOwogCX0KIAotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
