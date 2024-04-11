Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59323CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJh5ISBv2BavRKyCdJX21r/NRE4P+pzAEuiwHc3SEz4=; b=zCGFdrBuudTpUNYez0USpiXq8I
	RJrE/k79tXKrdeXkwrjGjhfRNZiRPJk0H+bQTty001ziUy/SUiOC85bpRET/hS5LsOkoa+7mMQv3f
	LTMmr5NfL+Nl4ZDIJqRRyY/xBcDjcHP4pRKMFN/aVHn84emgF0Y2P2uZHrZZFQetbgLlaWnIKjsjN
	R3wYN5tdYUg4QnuRQFdkK4C85vDpkuvXZ8S4CL08YvI5WP+BNiWBqACIQ3s4wwMgM7dVMMjC7czRH
	a7MKZqEMY1vzJ4H7I4kS/At3iZ4UWxNv6F9Rx6CTuMaA+yvrUqutVnu0+EmsuL5IZ/k183ZLapSFn
	5HzvkNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruprG-0000000B6C7-28SH;
	Thu, 11 Apr 2024 08:32:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupqo-0000000B5lq-2T9t;
	Thu, 11 Apr 2024 08:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712824325;
	bh=pkymiWIPWxat5Rr2zyDqx/dSmImzanbRzBc2AuBwPV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWl6KJ2MaCPG2TpRWPsqMCPlaKKShFlrxo4JYx5AsHPwuitSP3TaKHqheV8CBG2n8
	 oG5L0ARRG551EVUNEcTvGHCr8ktGLwojLReg0KceFzgfs0KHn6v+LYtTgg/Pkt8kCx
	 3sEfFzTaqnYC+FI1RcK1/gTceXl5WEPd6lJa+qNbIBYcNNIdHlF9pvWLkYr8364W3T
	 2Oh6DfncModQDTz7eSGwZ/RY16x44WbS/jUSCSjeuUMDjrOhnl06Y0ld14hbiFvybY
	 xRqmmvJ5GL5rAhe2zCtpdgfz1ZMIu1UPudk3xQc8R4GrafUThTIn9dsoVBpIvPJNBR
	 177BHAR/cYmMw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 132DF3782139;
	Thu, 11 Apr 2024 08:32:04 +0000 (UTC)
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
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 8/8] dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09 regulators
Date: Thu, 11 Apr 2024 10:31:49 +0200
Message-ID: <20240411083149.78537-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411083149.78537-1-angelogioacchino.delregno@collabora.com>
References: <20240411083149.78537-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_013207_537026_443C4F11 
X-CRM114-Status: UNSURE (   7.67  )
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
index df2e2d388e70..118abfad0250 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -49,6 +49,8 @@ properties:
   reg:
     maxItems: 1
 
+  dvfsrc-vcore-supply: true
+  va09-supply: true
   vcc-supply: true
 
 required:
-- 
2.44.0


