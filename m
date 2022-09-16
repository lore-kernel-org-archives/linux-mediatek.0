Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C03C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atRFPkJtyOgIL0hqJol3HFRwSRndCHBoYev2lACcgoM=; b=0Hvci10dxWq0VONakv98p/CPWI
	fnynE4hqphB+DQOQiWkpOAzoT3LBSHO8G5smX+3T94tyeP65YH+20JoyllgMhdlfZWmr4He1XqEPk
	/JyUGoMq4pNcC+bbuK+AZGojWKXBdlXrZdx5lzAY79Xj0hupjY/hrJwwRs5tq1e4mAL2SKz8jerRT
	gVmmAsGzyV3iy6X6bvWU+Rrh9iqUDoj0vBCC+bVHPSRF6WMFUuksK4dMdFMFbvn77+Q9zdPcw+NZw
	5Ss71VMPUnbjIRPtILR0shjpFmpdhIRgbl9GZkYBK6L1uMjjP8GoO5+4GWaWtdSQIK8Mwpb3EOv4/
	ZXEbfTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6OH-00Agw6-Fv; Fri, 16 Sep 2022 08:08:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ6O4-00Agkt-PN; Fri, 16 Sep 2022 08:07:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D9F66601FC1;
	Fri, 16 Sep 2022 09:07:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663315667;
	bh=HFcAB00gt8eqAsTyYnphTAU0Ql6q+1sXsjawCNEH/cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQcI5hG/nEoQDQevj8Y1rHXNHaD4uZGtExTXcKqpZ1khpvRMdAKrJzTzFruIcUk54
	 2Umh/sxQsePr+ir29y3hsVazhmlYWSmBK8rYZby0hKEXB/If1t/N6PU2f+z7zIioM8
	 6BrPKnxVTNA4vj5pzcHHv62beDkhqZLYuJpVB6Fot7KRHXQ2BLR0xJhsTQgrYWOtV7
	 von0kL+S3tpHBIjr8AN7OSaQitbUdHNngdF3tY+1BTHa/iJ0CuvOEJTBJKSnaSsull
	 /PjfnKxx+ZW/l+nrty9/dSppOIr9ghTbzTAbWJFy/+2U//RhEYdyVM7FJ4mFTz2l2u
	 GFi+a3fuRXeeQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] dt-bindings: arm: mediatek: mmsys: Reference to mediatek,gce-mailbox.yaml
Date: Fri, 16 Sep 2022 10:07:42 +0200
Message-Id: <20220916080742.26851-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916080742.26851-1-angelogioacchino.delregno@collabora.com>
References: <20220916080742.26851-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_010748_972117_F107A904 
X-CRM114-Status: UNSURE (   9.85  )
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

The GCE mailbox documentation was converted to DT schema: replace
mtk-gce.txt references to mediatek,gce-mailbox.yaml

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..85e6f4f621fc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -52,7 +52,8 @@ properties:
     description:
       Using mailbox to communicate with GCE, it should have this
       property and list of phandle, mailbox specifiers. See
-      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
+      Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+      for details.
     $ref: /schemas/types.yaml#/definitions/phandle-array
 
   mediatek,gce-client-reg:
-- 
2.37.2


