Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAB6CD1299
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feOr02qXAQSfNpWxNEUet/Dbpqdv1uzVCQLWEeJJgck=; b=JM45eORYCwh2AOx6nRIKWEvb2G
	Ne3bIqxgw8woqRnkHDo+5+o+3fZ0ECzRL0e3h1/7ibQWfmn5C9t9nY498YSto1CKSNqtHFRaCgQ0R
	OkUPcbMZzjjZacLZu2KTSeaIb6abr06opl0jFcks62gtxHGs5LN4/wznuqfWDSZoiGwEjdKPZqLQb
	SZQxTQHyn/9ioSxtwqjtkoOO7Jv+Y+gf3Jrz8esDDwvpYm496qLxwdUj6exBRqyePO+1WvRmxxOhV
	CBEBc2pKvZEOA7ziE7ph9uruprDl4gHXDBCDM0DSFBJkJLDk5TEzliMXsDsSvOTKa7HJw/2+A/Qom
	b9RkYrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rusqh-0000000BmYn-1772;
	Thu, 11 Apr 2024 11:44:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruspx-0000000Bm0o-3dqD;
	Thu, 11 Apr 2024 11:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712835793;
	bh=XK+I2rHX8gkIddpwg379tC6deWLfihQGpL9it+LQ4dA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQwnAfHF0KS/oa6i2PPDzESXcAwD9eRMsGZUYtWIPXIg1KsDOslk2o2zgchV5v+2H
	 j+ULGrUDmHGFcoCq8FCTgeC6pBwVo1At2zXU2g6nkt4k8930bRQ1KKlaW45TKZWdmQ
	 ddZEztSEpPtmJAtPKnSNmJmvt+2e9wsgsAkPemBdJKQ0A0jWwsw0ic60ukWub9D6O9
	 JYfHzWfUcrCKBQiuCYZ/kX+UPDnmFrs1vzC2GnKppMg2pCxPupGV402oFVtMoR79MS
	 pyPscqiwAwif/AwglRt2DLwV0GiNShuq+5DW/RScwf+ggtrPZvHk436hqIHc4ctSAB
	 oL/M5dDgDsp7g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 909373782133;
	Thu, 11 Apr 2024 11:43:12 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	chu.stanley@gmail.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/8] dt-bindings: ufs: mediatek,ufs: Document MT8195 compatible
Date: Thu, 11 Apr 2024 13:42:58 +0200
Message-ID: <20240411114300.169055-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_044327_710552_934E0540 
X-CRM114-Status: UNSURE (   7.37  )
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

Add the new mediatek,mt8195-ufshci string.
This SoC's UFSHCI controller is compatible with MT8183.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index adcd13023866..e2c276da3f2c 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-ufshci
+              - mediatek,mt8195-ufshci
           - const: mediatek,mt8183-ufshci
 
   clocks:
-- 
2.44.0


