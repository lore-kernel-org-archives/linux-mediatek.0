Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF1DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vg36SG4NoA8BjycLH2tzgXkCVTibUY92iSiPJ+8Vt2M=; b=FEdnr/w1MDJhlc
	jLotXUXBybx9XsNpDTBwtiauO8crqUMumpUGhfTBm1BjHWiVvNuC0Z9UqeMrbW+oBtFtrtD/1eNNO
	YK1RjmskkOr003qVSesC+EnZvdRiXeE48ckvZ7/naGQb4YQH1afiBY+9y1dwVYLP1+hCq2ofo6c6x
	ggElRLP4pGRgChkAXL7M8ytLv8LDE+IFzFBlKr9qr+bRLKyBoP1FbyBZlGw8XHg2TjRkFXtfuUQ7f
	gmAYRKEZV279I6gHpc660mAtdkhUVlI3aYE5SrRknxL8PNgXxDu0r0j8xlk9F18gj0hhsWX7ueSYP
	LQt7Iw1kfY2pe377rVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms4Qs-005fyF-05; Tue, 30 Nov 2021 14:48:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms4QY-005fp6-5T; Tue, 30 Nov 2021 14:48:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB73DB81A1D;
 Tue, 30 Nov 2021 14:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C48BC53FCD;
 Tue, 30 Nov 2021 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283692;
 bh=7Z19BL2g0lP+roN8+RTxjyJLe80jPcP105NpvnikaqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u38U7bC7YlJEDT55u7Zjj39Lo+2cpFAjMGhYB7/v37PoOKL98lP0q99WNzJHWzAFM
 kk7gZsfbSquYRhmsW68Kz2Au9xTVqbrv60YWS1cuqQge/vO1fmi8PsBD5QiQvEcSxn
 jmALjNvm4iRqBkXfSPktSsbfHWqSZW039ojuQZNz/gU31KH6O2b5WCOcX9NaObjAXj
 r38HGf0sgcx0qI0fTv6C1ML/mupSsEznm88ySbPo708hWcFdmlRILpP9lofm44ZZhH
 zrzsLjRrrIvpOxNxtYh4tEq95SdufcDyvY2ANQKAmWYVYQlShRkjhYoCkaxfR4LEl5
 JedQsWLNBBNSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ye Guojin <ye.guojin@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 Peter Wang <peter.wang@mediatek.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Sasha Levin <sashal@kernel.org>, stanley.chu@mediatek.com,
 jejb@linux.ibm.com, matthias.bgg@gmail.com, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 20/68] scsi: ufs: ufs-mediatek: Add put_device()
 after of_find_device_by_node()
Date: Tue, 30 Nov 2021 09:46:16 -0500
Message-Id: <20211130144707.944580-20-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_064814_384675_BB25AB55 
X-CRM114-Status: GOOD (  10.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ye Guojin <ye.guojin@zte.com.cn>

[ Upstream commit cc03facb1c4248997592fc683518c00cc257db1a ]

This was found by coccicheck:

./drivers/scsi/ufs/ufs-mediatek.c, 211, 1-7, ERROR missing put_device;
call of_find_device_by_node on line 1185, but without a corresponding
object release within this function.

Link: https://lore.kernel.org/r/20211110105133.150171-1-ye.guojin@zte.com.cn
Reported-by: Zeal Robot <zealci@zte.com.cn>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 80b3545dd17d6..ecc503171db6b 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -1102,6 +1102,7 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 	}
 	link = device_link_add(dev, &reset_pdev->dev,
 		DL_FLAG_AUTOPROBE_CONSUMER);
+	put_device(&reset_pdev->dev);
 	if (!link) {
 		dev_notice(dev, "add reset device_link fail\n");
 		goto skip_reset;
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
