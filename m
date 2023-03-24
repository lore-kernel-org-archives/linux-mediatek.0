Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D089CC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpFp6S3Zsyxwv0iaspLTRsr9iJyWgukoaO60C6T2spo=; b=A24juhowpCIR7dNoS3HP+7wcfs
	KrkyXOSKo4LNQkq+RWHoXqm61DDX39EGIIUwTgaDKZ58ntcC8AQ94ZLuBrizw4GoWGbtJekRh3Yzg
	0jqo31BuYseTT/VXcidpLhxORR1BGDzGKJpmK/ChXjyYy/xgcrnesQhtL64ceDpQ+cmi0XoENHvjo
	Jy16js+JvRCHEp/jc4V06uVMxlULSSDpjp5A2Du2UwyCXiqqBJSfBQH3i3giCfuIWbUQdul94nmmE
	kq97Nod8RzVoQcvrzCq3schrZl1wy7jtlbgonBhJ5edl0UCUtjpT021AbX76vq9suKHyxqUqctq0Y
	Y8Z0h2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdwY-0043jf-0F;
	Fri, 24 Mar 2023 09:42:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdw9-0043ZW-1U;
	Fri, 24 Mar 2023 09:42:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D9EA6603114;
	Fri, 24 Mar 2023 09:42:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679650933;
	bh=jE2h/ittsn0tSizCPWhMSnonPGhnh+XeahgZ0uy3c4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPFV21rwVMMf5SZqpzqd3iSEj9+NI3BmlLTaK4wWg8pCpUS52lpKpbJI7+al8BSXI
	 UDTm8uCnjhWaalb0V3XWMmmt49hwiqpMP/w4YzGetYIKrHx3K7Lx5PGM+80Uel9Ly3
	 ro4fpUqs4SpTTat0exOqR4fM2iGAj1zpmL9bdEDCITEulwwW4PY94L8xG+Byk/ZHsi
	 cq8d1kJ+rOWoMdiz0PyGk25mlf59HKB0KeHKgMHOfntDmb4+Xho85g0R47ZJ7CUM/4
	 2kSW+NKXTXbKqPQGRcrS88ppTpW332406XzKlRCZM1vybBXkn7MxfzmUy2D5pUlCGS
	 Tt+5hX8bSIl8Q==
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
Subject: [PATCH v2 3/6] soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
Date: Fri, 24 Mar 2023 10:42:02 +0100
Message-Id: <20230324094205.33266-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_024217_626390_BFA974C8 
X-CRM114-Status: GOOD (  10.38  )
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


