Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9840E8FDC8
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okFBs9uHYPZKYvF8fG1v2s+YpL5T6ANrIiS3LJYScZU=; b=LH3KkFPckt3uf/qujgK5BKIGHl
	IfFCXdkByoDrzg4PZdrO/hTmZaRYDlVsBrIEsQ6bVbF2gujJNGmAun1NekcmCaHBM9Xcx1ecLpE1t
	z+nnZI5qX8ydSRit4LzHsAGUZ6HOffBOMY/m/vW2+Y5wsy91Z9WM21FDF6JjBd9ckIIcH2HJeTXLr
	TmN4KY2gpbc6MrQvjcdebYFrjudXbwoKeJEQCLoqkGbaLZkuzOpTK6fJzGGUegpAOxOEbJGiFp+S/
	rjPKVl5duvA2mcaeDhw7JYRba4cuKi0WEyRTFWkLXPxgepGdk0u1lGlZVWIorn+kGoH9kq2ClXnFs
	pF7SMVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLv3-001xoD-1k;
	Thu, 05 Oct 2023 10:49:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLuv-001xi1-0Z;
	Thu, 05 Oct 2023 10:49:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C1B0660731E;
	Thu,  5 Oct 2023 11:49:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696502955;
	bh=pa8pKITzfzlfDMGcUark3OZKCpHGd4WoAakJB9sAdzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qx2lQFIjxuULN86K3QtKjTJ2XoqaqR3+5/cXYj+Gnb2yTs/WaFb9YcK+nKFLok2QJ
	 auj0FigSKVrUwTDrjBSsw9JBggXvdj2/U5m93EmhmqaL1w+t2ov8yzG1S3AXFYdEqL
	 qXjPpLiM7sageXKQFnlOUQ0UV6V62fwgdn52yvG+qxqt9NC9GMdUer9QA9JCIlmra8
	 j2JAxfPPwDec7tFMRktP+3EmmOF+oF2/+I164jdbZWWYjPphKPzfOA+F7SLAeVGHCk
	 1B7Fg+zEnL4+8jqNDwJdczkdypTK1KOoHGwOvAPYkVGcSmOsUsVWMTirmaHSHcUibE
	 tEe7PmTiAQd1g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mchehab@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	linqiheng@huawei.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 1/2] media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
Date: Thu,  5 Oct 2023 12:49:04 +0200
Message-ID: <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_034917_388187_AC708681 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MDP3 RDMA needs to communicate with the SCP remote processor: allow
specifying a phandle to a SCP core.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v2: I've dropped Conor and Chen-Yu's Reviewed-by tags because I have changed
    the description (so, the patch actually changed a bit).

 .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 7032c7e15039..59dcea797b71 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -45,6 +45,14 @@ properties:
       include/dt-bindings/gce/<chip>-gce.h of each chips.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the System Control Processor (SCP) used for initializing
+      and stopping the MDP3, for sending frame data locations to the MDP3's
+      VPU and to install Inter-Processor Interrupt handlers to control
+      processing states.
+
   power-domains:
     maxItems: 1
 
-- 
2.42.0


