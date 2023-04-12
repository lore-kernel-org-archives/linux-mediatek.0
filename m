Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F402BC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yupuXvL3rj3TNyP6lvzLm0KmgyUpTnWgiAzlVDKtGo=; b=Xjo+TkzL9iVXp9oUJRsVAvBShZ
	7KlMkz25lMMWsDCWROR0DmFdYXFmb5s4lK3Ssf/suVbhFyo3oYLBcZpGUhtH6G0KxqPcmIWIj9AQ7
	X93vbyx43/wzW+eou7bxpWSiZ2An9L4TF7YCeoPGvUdZD5nJ4IpaYnOObGHUHDOosqmc8duhOA6sn
	+j3f6j13MNpNiT6CbXqEFdBdJz8G3WB71fOPKVyIfbbfjqerQrEbePRT4Ic+fMs6HjpJ+/GNDnsbx
	b7b9ZLSJlxEjbyMi+QyoHig+YrWDitzLmF5vEb2oPt/HpJxhhrnCPsK6DpCJmQJLSHP4dhZhx/c9V
	T1GYqyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaHE-003HFf-09;
	Wed, 12 Apr 2023 13:12:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaGv-003H6p-1E;
	Wed, 12 Apr 2023 13:12:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 70EDC6603208;
	Wed, 12 Apr 2023 14:12:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681305144;
	bh=W84iqCod7r2TCo/WEoCtavk3ERz0ZI5/UapmrYR06xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HqY7t6+oJxfkhAVqa3XkwqMUNf0cylg2BwhkbtIHM+2MAYLX2nVP4j3BVT8Y2Qkhc
	 ezvk2vVzWaRanUlqWZ8qakLr5SooJILlELkPGVeq8Fx7p7+38Jwryz8rKjJpDaiGRm
	 isR9A9IAZd/rGR+e1gZIF0ovRfNjR5RDMmQLYxC/K8GNA0NAA+cnukEEwycU/KdD9d
	 7lvxNnHN7KuiTZzLndZjmcjGxslKweXiXJZ4VCP2vJtrIq757ExA4/kLByXheN5oAU
	 9HD3m66KmFw0ZeaKlwm6HxHcx5WvL/aHlVaPmc0e1IpuEh9wx3RqDSeLVTtRLB26hv
	 euRXWnfDzw5ow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	amergnat@baylibre.com,
	flora.fu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 3/6] soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
Date: Wed, 12 Apr 2023 15:12:13 +0200
Message-Id: <20230412131216.198313-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
References: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_061225_551766_C88378FC 
X-CRM114-Status: GOOD (  11.09  )
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

In preparation for adding new members with name abbreviations describe
the struct pwrap_slv_type with kerneldoc to enhance human readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 5c500be48f7c..a33a1b1820cb 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1218,11 +1218,17 @@ struct pwrap_slv_regops {
 	int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
 };
 
+/**
+ * struct pwrap_slv_type - PMIC device wrapper definitions
+ * @dew_regs:      Device Wrapper (DeW) register offsets
+ * @type:          PMIC Type (model)
+ * @regops:        Register R/W ops
+ * @caps:          Capability flags for the target device
+ */
 struct pwrap_slv_type {
 	const u32 *dew_regs;
 	enum pmic_type type;
 	const struct pwrap_slv_regops *regops;
-	/* Flags indicating the capability for the target slave */
 	u32 caps;
 };
 
-- 
2.40.0


