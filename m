Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF8FC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD3+RsWf3MsLhUMrRb4RsEzRQoOCBBF8D1SVSH55h5Q=; b=N7aFYDCGX3gae+O+EIj3Tb8v8F
	Wi6FUUHNx7RruVcd0PceOpJXDGb1fiu9Zcjv4mV0Cjzzpyoy1Yhm2hF9+qjDEnlEmPJxb+wU9csrn
	l78sOo/Fd74WXX/CikoI5pagAQPi0S/b5k8l7nHjCGb+4QiX7/tqa5iWFb6DnCP4xRJn7NfKyCvvt
	T79PjR2V9qsIBz2GfStChsFuoRb9MNJ5SdNNJcO43WULo3UNxBUeAkGM94IX+AhQflCX9fF5CsLzn
	bDFI3DNwc79yCjiewvKvSkNbvKkn69gAgfrIs10/a2UWuqb3U/g9Znn2sSqIJPnicTHMLE/X/KkM2
	iHhEPJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdu-0000000BUBC-18Hc;
	Wed, 12 Jun 2024 07:43:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdi-0000000BU1N-1CbS;
	Wed, 12 Jun 2024 07:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178204;
	bh=6lsXc7rT10Ac9XA0NZVkBiPzRFq97QkmLLktkh5oOi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=geZhYr5QvEFA+deCcJn5kv2L7dxx0xl4Q7/ztkSlnQc0OfrjoCcsFonA6YuWE6uC+
	 01wxJsriWa8BtIwB+C0XAjCAaOa5yXuS4+wCcZWtq3b9ssXcnlJkXPZL8snyl1B9i4
	 /GtFfo9kitkIiQje2NSd+PuFYuf66Jl/ybbFkdXnW5g+eHTcXnnYdJQmRzVaHYenkU
	 o+/oTnJFlgSBrTbCnA2eJyGsd2agQW2uIBP2g+51zUHi970XMA8vLG6tfV1rhY11aP
	 tcTQG6LOZFSwxebLj08iOZUpdVtBjgajo68Mmg57HPhAKDxQt9+JVlh6WUfzEAh/b5
	 U6ACclK17pNzA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A811C378216D;
	Wed, 12 Jun 2024 07:43:23 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc
Subject: [PATCH v5 2/8] scsi: ufs: ufs-mediatek: Fix property name for crypt boost voltage
Date: Wed, 12 Jun 2024 09:43:03 +0200
Message-ID: <20240612074309.50278-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004326_479574_BDCD94DB 
X-CRM114-Status: GOOD (  12.48  )
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

Rename "boost-crypt-vcore-min" to "mediatek,boost-crypt-microvolt":
this is a vendor specific property and needs the "mediatek," prefix,
moreover, this is not defining a minimum voltage per-se;

Even if technically a call to regulator_set_voltage() does indeed
internally set a VMIN for a regulator, the API also supports other
calls to set VMIN-VMAX constraints, so this "vcore-min"->"microvolt"
rename is performed in order to avoid confusion, other than adding
the "microvolt" suffix to it (as this does take microvolts!).

Fixes: 590b0d2372fe ("scsi: ufs-mediatek: Support performance mode for inline encryption engine")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 47c7d34b9be9..23271eb1a244 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -596,9 +596,9 @@ static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 		goto disable_caps;
 	}
 
-	if (of_property_read_u32(dev->of_node, "boost-crypt-vcore-min",
+	if (of_property_read_u32(dev->of_node, "mediatek,boost-crypt-microvolt",
 				 &volt)) {
-		dev_info(dev, "failed to get boost-crypt-vcore-min");
+		dev_info(dev, "failed to get mediatek,boost-crypt-microvolt");
 		goto disable_caps;
 	}
 
-- 
2.45.2


