Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8324CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzPenat1FOCl2hnfTAUxLd5zNbr45+g6axZ1OWFtlt8=; b=uG7S8SOgZZxaA3
	lH1GQ8V4YiuSu1GA4glBrdR/n3wYbBSO9bD/aSpoXEq0ce7KYpeXPNT2iRMfaNOMkcCscrqFE5zEt
	EDTrvK76vqjhrwnCeD/2eZ9Q1HokcaLFTvwgi2/6KqAvn5bb+pKgy4k1HFanlJ33o/VG4AUkwXMXE
	AJ1c4oSwBLYryFcXdtO/tbM+3S/dpa5um9zg5PXOhSnccbA4ze0fiMpLn9lD2Q4N3KiQzJw+QE88N
	XUm6OFuQwNTVXm5fvYwxT1P35cIrNmkmJefRYi74GnSS/RrNZ+yyxdwy3VCcsiE8TImk4LkQZmuuP
	4PJAx/cCoannWzSXN6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxqhM-005jwn-5v; Thu, 16 Dec 2021 13:21:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqKe-005a4E-IC; Thu, 16 Dec 2021 12:58:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 297CB1F46298
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639659477; bh=95YUTGCKclJCUo/J155djD8op/COnXfCbxovpAt5hxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdbzPwtKhwCYjZKlDiDthkB+6tSWZji+3jf8o/GV58yYnsMn0Nzcbsf5Tk97wP+rY
 XbJIQIihjHjgh4kYyJWk07ROWclHlKF4yuVSDDjCXOO98NlmXHrHdXOa+tSsBZDSqX
 Fm5U9ChqNNukayNV0imYaUgxXeA5hC9DtZWToZoJruBNe27EflMuIRwqpYjixHXNCC
 afCw+0QpvfCVgTXv2j+k1/vjKlrYF4gXWZYhQzGeKGUqPzG6rImHVkFmscwIxJ7b83
 /GTe28P3IANYbITM/3BJc80JZ4U170jMW1HMvRV9i33/laKTzi6c0ULRB2mPso5rG6
 6zqE+NUnF8q+w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org, matthias.bgg@gmail.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/5] mmc: mtk-sd: Assign src_clk parent to src_clk_cg for
 legacy DTs
Date: Thu, 16 Dec 2021 13:57:48 +0100
Message-Id: <20211216125748.179602-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
References: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_045800_801180_D3DB3C4E 
X-CRM114-Status: GOOD (  14.81  )
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

In commit 3c1a88443698 ("mmc: mediatek: add support of source_cg clock")
an independent cg was introduced to avoid a hardware hang issue during
clock mode switches (subsequent commits will set that clock as optional).

When this clock is not present in device-tree, any operation is being
done on src_clk's parent (calling clk_get_parent()): to simplify this
and avoid checking for src_clk_cg presence everytime, just assign the
parent clock to src_clk_cg and remove the now useless checks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 59d7decc3051..65037e1d7723 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -901,14 +901,8 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
 		}
 	}
 	sdr_clr_bits(host->base + MSDC_CFG, MSDC_CFG_CKPDN);
-	/*
-	 * As src_clk/HCLK use the same bit to gate/ungate,
-	 * So if want to only gate src_clk, need gate its parent(mux).
-	 */
-	if (host->src_clk_cg)
-		clk_disable_unprepare(host->src_clk_cg);
-	else
-		clk_disable_unprepare(clk_get_parent(host->src_clk));
+
+	clk_disable_unprepare(host->src_clk_cg);
 	if (host->dev_comp->clk_div_bits == 8)
 		sdr_set_field(host->base + MSDC_CFG,
 			      MSDC_CFG_CKMOD | MSDC_CFG_CKDIV,
@@ -917,11 +911,8 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
 		sdr_set_field(host->base + MSDC_CFG,
 			      MSDC_CFG_CKMOD_EXTRA | MSDC_CFG_CKDIV_EXTRA,
 			      (mode << 12) | div);
-	if (host->src_clk_cg)
-		clk_prepare_enable(host->src_clk_cg);
-	else
-		clk_prepare_enable(clk_get_parent(host->src_clk));
 
+	clk_prepare_enable(host->src_clk_cg);
 	readl_poll_timeout(host->base + MSDC_CFG, val, (val & MSDC_CFG_CKSTB), 0, 0);
 	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_CKPDN);
 	mmc->actual_clock = sclk;
@@ -2530,6 +2521,19 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
 	if (IS_ERR(host->src_clk_cg))
 		return PTR_ERR(host->src_clk_cg);
 
+	/*
+	 * Fallback for legacy device-trees: src_clk and HCLK use the same
+	 * bit to control gating but they are parented to a different mux,
+	 * hence if our intention is to gate only the source, required
+	 * during a clk mode switch to avoid hw hangs, we need to gate
+	 * its parent (specified as a different clock only on new DTs).
+	 */
+	if (!host->src_clk_cg) {
+		host->src_clk_cg = clk_get_parent(host->src_clk);
+		if (IS_ERR(host->src_clk_cg))
+			return PTR_ERR(host->src_clk_cg);
+	}
+
 	host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
 	if (IS_ERR(host->sys_clk_cg))
 		host->sys_clk_cg = NULL;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
