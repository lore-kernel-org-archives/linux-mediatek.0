Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE358CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KsEiEium+txLsHXiZFdbg3dEv4mfWi/Tm+mBuIYSCY=; b=DC0rXPj8nWiz7VEXUyyTtfcBG4
	2brI6SsbhynvdE9lLLGUZzmzTwmd9aSMzvgOxzlonmknHLPigQ8qsV+KopgXUf/uAGxhCoo8DGGGL
	bYJH5ZI8H/I3ADx/E31+bZjlcw2LIf7ZfG1zXHtdBFtfKoYFet0oJ8nS9xquXm2JXxeAyoio22zsM
	US7spx0bIPq6HnVqlwzFULj/a1j8wZLiMUEzkcBHf9CSGpGFVYmWBCxN0dStAsYAjc1GO9UMSFzy2
	jILHITNjQlAZ7dRfImHPHVBgE0zzcv9YWFqDx8p+G4WqvptbBzPTTQqzg7u1VxzXShTMGdHYORfzl
	6m5/Tvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rusr0-0000000BmnA-1f21;
	Thu, 11 Apr 2024 11:44:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruspx-0000000Bm10-3cEQ;
	Thu, 11 Apr 2024 11:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712835796;
	bh=sY1R1NA7jkwBIAVzv78scvrc0A647hsvQsRji2DzXiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTU/yLSRChU1zIhnZbUUml0WZdVLgoejrrSVR3AU0ddhtd/S9/YcYop24AImmyCBT
	 CYe6xH1a9bfKr75uwRS2wj8QZElrX3vRCrbnjTpXXPiQ8fzR+2nwcwcxJ5SzjlA6LE
	 oMyV6N9SxCJWRvOq/mqkpjvM1I/oSFcH8ZRiQcaFoJBdPTzoem42DWzsLQagXWZZvt
	 YSZwAYfkDiEZSrffIsCTn6SKVDGzeQleQUxyPTraenVcVyOpS6N37k7NywzrIQDChC
	 GQBnPlTK9HZ949+QHTPTfIpljhcyOm5LLDhJ3TVuP66LeJW5Rv3l6cjQx58ykdlh8H
	 vttgvk/q3N9Ig==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5525E3782134;
	Thu, 11 Apr 2024 11:43:15 +0000 (UTC)
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
Subject: [PATCH v2 8/8] dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09 regulators
Date: Thu, 11 Apr 2024 13:43:00 +0200
Message-ID: <20240411114300.169055-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_044327_850755_4678C57E 
X-CRM114-Status: UNSURE (   7.52  )
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

Document the optional dvfsrc-vcore and va09 regulators used for,
respectively, crypt boost and internal MPHY power management in
when powering on/off the (external) MediaTek UFS PHY.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 21b038db100c..2ee8bb7d5aac 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -50,6 +50,8 @@ properties:
   reg:
     maxItems: 1
 
+  dvfsrc-vcore-supply: true
+  va09-supply: true
   vcc-supply: true
 
 required:
-- 
2.44.0


