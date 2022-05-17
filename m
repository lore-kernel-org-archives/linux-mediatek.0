Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6453C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voq+m9LmKk8UMjO5ZKqxoXoV0ZWCzAqDn/juaL4zqOU=; b=UjY6MHKzL65GvR
	AWjXwrapknPFVxDxk08BaIomrpBuXCFAdXqWiPIJLSFGXhTR7/QQoLQaaTIv++aVjqThVWeTVfMFO
	6LhoiRLEKz2rmV5cNGnhsmyqDwUuKq50cwS9k/4gDpTpjQUqXiahdFJLk4WJZtUG5IMCNBkLg9uam
	D1vF9NRj5RfeCYCJUfADIIxPTIHDtylrpBi6/xGkusHfjOchdR6tQXD2i6mWEJg1ZjbdsRo2rDWmQ
	nqux9q4XfzUvkQp1Ewe2Lxwqxe/amHh2oxKuerL7TU2vNRmL9496ZhyO/tlfyj8cJrgpuR3E0kv+y
	K8mkVxG7HlcKf1+WNLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxPI-00Dybz-Bg; Tue, 17 May 2022 13:38:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8a-00DryK-OT; Tue, 17 May 2022 13:21:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BEE6B1F433FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793679;
 bh=wExmkwG26MlgAOyGVtuHJ9fB7p/HupGT2oLsUu37GPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aZBoDF7S6WLjXzn71iCMIL/V+Lycg10Qf7ZK8Ug7yKiDvZZ5tyETWVCdqn6xklQJ+
 CXOSXUk3mZsGhMY/unAz9RgNyzAo7PIM3EB699GyOr0TaimNnoA48fYU8x0SZbt+6B
 gx2mLb0fQbQJ+mw4kkyzJXv8r5DNPar9Folgy/+CyM4SQe4rRQdpgNSja0B96wxFqh
 Gry+R2j5QUj5dMUIbszjkpPGKH037OQv8IGSdhWH/HvRcTBikY0/vPlmY5GeaQHmCb
 NOwxzv7phBvnhQJhpX64+n6enj3E1Gnzq9uTZyi0BJg8kb05E2Rw2r/tq5ItHHRkXo
 veS3kWTfmVYDg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 8/8] dt-bindings: iommu: mediatek: Require mediatek,
 pericfg for mt8195-infra
Date: Tue, 17 May 2022 15:21:07 +0200
Message-Id: <20220517132107.195932-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062120_984158_5B11FF55 
X-CRM114-Status: UNSURE (   7.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8195 SoC has IOMMU related registers in the pericfg_ao iospace:
require a phandle to that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Note for Rob: as of now, there's no iommu node in upstream mt8195 devicetrees yet.

 .../devicetree/bindings/iommu/mediatek,iommu.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 17d78b17027a..2441c2e8e55d 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -187,6 +187,16 @@ allOf:
       required:
         - mediatek,infracfg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-iommu-infra
+
+    then:
+      required:
+        - mediatek,pericfg
+
   - if: # The IOMMUs don't have larbs.
       not:
         properties:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
