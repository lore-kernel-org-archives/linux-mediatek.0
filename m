Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E96C04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d15KKmj1rzMZSKvrUErUSxv8gH8zIFvSlOvTQNvxNgk=; b=ieTi8ECNMNxUaStxnt5zqYwckx
	c/A1vr1g0TYR149goTcQyai7Ta7j3kej63VYYO7BgETn+tYewMdWKWC8AMEDeqbDuAm0NbAI6VERx
	sMemLUa8GOlBHf5wa0rTFUNx6yRk+ZnXpc6W+wq/WYGNN0Bi2irrJJrKdFibFH83xhfrtijCXsAdG
	VA9BS8pYd7R7QW3AUAB5egOECErgLBMmINUn339Q6m42Cv6VXRtl8+LoOTmzyURlL6Q6cycWN2G+t
	+gyoa0vqERQfwfED/0ALYEjsOi6Bek1gC9dKurJFd0GxoR888t7jOwfU/+/01IeqGAAG4gNfdJ3ud
	AxF6rLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAX-00000007PGy-1q31;
	Mon, 15 Apr 2024 07:54:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAP-00000007PBE-3elz;
	Mon, 15 Apr 2024 07:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167655;
	bh=WY8EthFDmZfJZmt27wVTY3epf3S/NvCwlH2R04NWsW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=06YlTsWSw3P6sipl21AV67ZJAklMLTB1VvDKsbs4zFwaFu9kNK/aopglKAGrhMTlQ
	 6pPzsjN2z7W8PGAwfP/0BNYqYx7AfxMJAYIWlbWxnhbFxmI7slGXJzKh5pq+EtFtD4
	 ybNyWDa/8+iUwWz4kKwvXpRLQDINSuBsV8y3/rHlCu3e52BFqp2f3A1KT3PADf6YW9
	 Dc+RlzmFpEIEEPKJuyWkyDLRQI6szHjKkZPKPpN1+6iupPQ9lQLom16OTXTXSn4F+w
	 mYl/qiwedGS1CdXv/k6ekANa3L4Cu7ZXor01RrCFyxR/0dhPU/36i+9pJ/RzwEJPUT
	 haRALaePvEhEQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CEA123782043;
	Mon, 15 Apr 2024 07:54:13 +0000 (UTC)
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
Subject: [PATCH v3 2/8] scsi: ufs: ufs-mediatek: Fix property name for crypt boost voltage
Date: Mon, 15 Apr 2024 09:54:00 +0200
Message-ID: <20240415075406.47543-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005418_085543_4867ACF4 
X-CRM114-Status: GOOD (  12.91  )
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
index e4643ac49033..688d85909ad6 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -595,9 +595,9 @@ static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
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
2.44.0


