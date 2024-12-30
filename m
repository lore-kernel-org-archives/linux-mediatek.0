Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79403E77194
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2024 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nMTMkpfTjWKamhYROWB7UmaMo/62tgYn/YX397EYD0c=; b=fbC6LZnP+44tVcGOW8KTDA2Cw4
	ZEXKk6+S5hbxakk19B1FHFl9Ard38/Klz2JIjZfi03XoqTQ+2OY7r36+vYKiLZ4QwRjl9cN4wtMnF
	AWAtCIVxPStcsjJCSH2RUy2Mb3pdq5IhRX0o1UKJGgltw8zjUKhk5xHJ2PQfm/WjtMgENeA+Gwufb
	xck1hz4mevadBhYsLdhPIm1tZbLulydSNA4drhu9J5wAGggW1hZbwOW62iycSbNuLecwIf4ef+Qop
	oLOQ9YBTwy32k33a5hXHSrXI8eY1KrOt2n5xAG+iRZ4b5fdCG9O8VIfLM2loEMq9r0pc4fJRkXPH/
	egMplElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGD0-00000005IqS-2Tik;
	Mon, 30 Dec 2024 13:53:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGCy-00000005Iq3-0Afe
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Dec 2024 13:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BE5BA40C6F;
	Mon, 30 Dec 2024 13:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41710C4CED0;
	Mon, 30 Dec 2024 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735566802;
	bh=4KJMfkJbjuD1+I7HsDy0xyDU+DlgBavMOG3qlPzrG4c=;
	h=From:To:Cc:Subject:Date:From;
	b=CNd++Nvc/S3vwoaVFLgo5xuyrmVTyTcgkAnRPtoJioBsxm36SCmt+rlQ1uLjnACbc
	 lSvcpFqHA0n6ypRSo3957U9NSnQU6QrZJhPt9CDnquNA8rJWQZi7qnvMcN+x13jZgo
	 xMerSxY2TK3GQrP/Hu+tFp1EyqkYVaLjmcB4bMiu6EngbCEYGoY0gR4BSzhfvmlxBE
	 +cDuQxc01HokM6IPL74hGk5+U3l8yTYT6XuMUm9zMSDCM9D9zI3mjh1EO0JfoD6nUN
	 H6/vUMUW0gK4C4//iWZ7BcjeUxW9wXTkSZMfhoG51g6ABgWoZT0F1A3toIiWL/iavd
	 PXON4Ifq41tMw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/mediatek: Remove unneeded semicolon
Date: Mon, 30 Dec 2024 13:53:14 +0000
Message-Id: <20241230135314.5419-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_055324_153729_252402C0 
X-CRM114-Status: UNSURE (   9.91  )
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

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412022048.kY2ZhxZ4-lkp@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..9d8286424e98 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1089,7 +1089,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		/* No devicetree graphs support: go with hardcoded paths if present */
 		dev_dbg(dev, "Using hardcoded paths for MMSYS %u\n", mtk_drm_data->mmsys_id);
 		private->data = mtk_drm_data;
-	};
+	}
 
 	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
 						      sizeof(*private->all_drm_private),
-- 
2.34.1


