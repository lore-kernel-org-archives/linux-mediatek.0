Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E37CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHCiQMe4cGGXrPlEZMWyo6Wvyd0omfQRw/rm+p7Chz4=; b=1rsLndnPkvWVsuZ/+nIlNP2BeN
	1i1hD+DNG/X0o8QNzshxTtsr1fm8bRAhw788wql7Sevvm27mmfBke2ALzgGx8m/l9JTk5eLdDi+qm
	hTye6+SZPXTr7uHD3LAYw9UGdf/PqyZGFrUDDQuNjKAQbhMLJTf3j+Nva7vkSXTbLvev++zIEWrs1
	0cM+Fc30jggY67oG3uw4yC6edYLvxgCIbLGQ4Q7S4NQEzUeNJ6ZFrBa2h+cowS7gztg3nN12isDr2
	GJnO2d0KSZZOYZp3tsYzqH4UIyyEK5gZ+3rjiriGay/73XM3u6w9uRu+vptaGEf/B+JMGaqSWWi+T
	oh3/GgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupqr-0000000B5oZ-2jec;
	Thu, 11 Apr 2024 08:32:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupqg-0000000B5hH-0Atj;
	Thu, 11 Apr 2024 08:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712824316;
	bh=6l72IQpDXHhr8j3mG8r2TihhpBbmFrvrFd/CtXYdp6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5MXL+2wSbrrcb45TYS01vVPET6xr4CrQ4soPFEXO1ZTCmFrMbhzovXk70/FYY4kq
	 4rdX3caGR8xs2wzE0NVF/Z887zvzazPNKZc6/TCFiqLyX00L3uchJ5Xtr0LXfFApBG
	 tyiSVsBDs8BVTBBHMh5aZNz0z9Bnz9a8xmxLjXULmdrMRDn2ybVN1dOTdOvhGf4/bG
	 vaqF0iTXBCHJFY/gJ43PkOqH+gOkrPeIim1TE9RGdtAVvFHNEvipBBz0JusxnsOPIP
	 PF5bvfKzRjKxaUKYmuHadut2sRV0V7TaJoArwuy0giJhAo3CLruTdW+E/nOayT3uGh
	 IteN46wSwIl5g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 719A5378212C;
	Thu, 11 Apr 2024 08:31:55 +0000 (UTC)
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
Subject: [PATCH v1 2/8] scsi: ufs: ufs-mediatek: Fix property name for crypt boost voltage
Date: Thu, 11 Apr 2024 10:31:43 +0200
Message-ID: <20240411083149.78537-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411083149.78537-1-angelogioacchino.delregno@collabora.com>
References: <20240411083149.78537-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_013158_262847_25270F8E 
X-CRM114-Status: GOOD (  12.65  )
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
index 5186ad99ad8b..90cd11d4a026 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -564,9 +564,9 @@ static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
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


