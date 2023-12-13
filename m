Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AA3C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUEI66bnpmgRGe+ndzu4jCs0T8GnPY71V4azBiLmo0Q=; b=nglwJ0sYVlB4bpOgmQgI+UG/F8
	9paTQIEzf1dFvFtxBDwwONsnM11VI0ZSZpauLUMHvpyN/7MbdpLjAi8fKgbbiSqZw4GNzJdouRWog
	M/+Qv66dKe9bmR5TD2X3D3q5zkuopIgfx+Pm9t+DJQzFYXLWvLbO7WGnQK5EnBAgLPGkreHb+TaTK
	BLQqzZP+N6JmOT1Ket5H7diIjSCVcjuiGt5266SyuhqbWXXP4bjSigd2cKTdf8IfiqfLapSqZjR37
	YHPcvktSRfy2uxaBmwNq1zRrM645CFdye8fg+zInZpqcIRV3Li7fmnBHOsvxrpmM6dsAnfx9sDBnd
	KfpECgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOEF-00EZUb-0J;
	Wed, 13 Dec 2023 12:20:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOE6-00EZQV-3C;
	Wed, 13 Dec 2023 12:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470029;
	bh=tE9lejZ6+1W68lWo5ayV1iSQspAij2+WbiKQT0W05Fw=;
	h=From:To:Cc:Subject:Date:From;
	b=NZZ2v/cscYsHaD0R/dEw+WSkCXywzErHcJdJc98BKZsC9AyjQUiIXCXH+kT9EtKf2
	 JLqQdztraaZ4UBcyFSrNdTYlPEG+WdWqSKN7p0QFBLaxW+IuQqHJgAv6Xhj/TdvghA
	 S8Ypvalbaty6H0dWCJX/HKGcFFVb/ScVyA/qb0Dn4UQ2QswXXFIkbJ4KD6eHINqlpG
	 WiCeTtEv4aJWClR6YOrd45YvULufuWuWld3ZGvRxtRUfFrc+jXo6+rmV3x6XreTe3o
	 Dt17CwN3/e551wu7IZppG5pjNIfFNrQXmh8WCSp6gV1rIw0VWTV2FZjzJF1Oyk86jU
	 IX6BV4a2UAl9w==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 315F73781478;
	Wed, 13 Dec 2023 12:20:28 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com
Subject: [PATCH 1/4] dt-bindings: media: mtk-vcodec-encoder: add dma-ranges
Date: Wed, 13 Dec 2023 14:20:14 +0200
Message-Id: <20231213122017.102100-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_042035_216079_1F863076 
X-CRM114-Status: UNSURE (   8.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As IOMMUs are supported, dma-ranges is not mentioned but
additionalProperties=false, thus we have an error when adding dma-ranges.
Add dma-ranges as a possible property because this may be present.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index a2051b31fa29..403530de5624 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -38,6 +38,8 @@ properties:
     minItems: 1
     maxItems: 5
 
+  dma-ranges: true
+
   assigned-clocks: true
 
   assigned-clock-parents: true
-- 
2.34.1


