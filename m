Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FA4C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SANjvPOceveX3/yf3V5lkdt6+QFJpAS540mS+2vMRPM=; b=COdN1XJg6VmajnDyO44lxnNI5I
	KZ5wvN4Ct2pF0D55rGF9/jTBxKRkKAq7jPHZX9HygBWXY2ESOYXxTWX35ecI8ZWWlvBrjIqGwk7/2
	mwDZhLUgsFMHxddvz8REUqdXwa3KZWor+Kg+cHAO01pq7Vii9S3hvqiw/PJkEcxL1uqwLvkUFsEZt
	7DQLiaRPD9HT+MPSYnkbHoiPu1lK/8BpxcQQ14RRc62L2xMMsJZb0+ElVH7LIZg1OTUOWe0alD5A4
	e3bHka3zOEitgxYFp466PgMf9dR+YR7wh79AbBUAgHmD7xgRw0KUpOAyCGhC2BodztsA+xjosSgAx
	fyZqVMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBNgZ-00F3ly-Kn; Tue, 12 Jul 2022 21:44:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBNgN-00F3ba-H4; Tue, 12 Jul 2022 21:44:40 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4408766015C4;
	Tue, 12 Jul 2022 22:44:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657662272;
	bh=Wik+BSgjTEwACqP1//DVq69wKrPz3LMLTI3NbGLzuqg=;
	h=From:To:Cc:Subject:Date:From;
	b=P4uqCVhD4Vkk33HXVq83SlYRoshdXd6+uKuOAFEKfb7tbcruikwjgLShkeTD1BHUo
	 Ul1nYF4ubAs7IM5CytrNG6f8GXLnMog8lbzqE5m9xiqRbGJhGsSDxBb/R3ut+U/+9J
	 dyMsm6+hfZu/2jL0cAD7aYYnDReYBUDN9yjyQzTQOtbS9wCU9o9xYRqz5Nkzwg5if+
	 wJpUjZM2k9ZC7FauIFOBhR9Q2wExNfmoE5lnp3pGoi5M6vsP4tMhG2eMiIBQwxAZ3T
	 8vzWbtglFMdvrKEX3rzzTGpTaJQdN4p6GmB/odr9vPuxu8NtNtKji/PDeZsg9D/K4P
	 6Ms0SZ7wCAF/Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	iommu@lists.linux-foundation.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] iommu/mediatek: Log with dev_err_probe when failing to parse dts
Date: Tue, 12 Jul 2022 17:44:27 -0400
Message-Id: <20220712214427.544860-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_144439_720288_DB885497 
X-CRM114-Status: GOOD (  12.94  )
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

mtk_iommu_mm_dts_parse() can fail with EPROBE_DEFER if not all larbs
have probed yet, so use dev_err_probe() to avoid logging as an error in
that case. Also drop the return value from the message since it's
already printed by dev_err_probe(), and add the missing newline at the
end.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b2ae84046249..3d23409bf108 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1214,7 +1214,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
 		ret = mtk_iommu_mm_dts_parse(dev, &match, data);
 		if (ret) {
-			dev_err(dev, "mm dts parse fail(%d).", ret);
+			dev_err_probe(dev, ret, "mm dts parse fail\n");
 			goto out_runtime_disable;
 		}
 	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
-- 
2.37.0


