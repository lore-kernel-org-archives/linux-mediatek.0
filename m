Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A78C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 03:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDSHu4EC3LjeIWDOodb4adR4dTX3VyD/UG4Wb1/8h+8=; b=0ti35Ao+iUZXBn+HtjZwLrhwyS
	elVoZTQDdcxcNHeLfm0ZJLrXVW378RmpvX/BE6M2NZz5kyBeggOLNjlU1XnbfG2XqA/DlWuFWaMNk
	obChsX/kFM2zat2zkHf5o3b1GpgCPY3RF8lJ5sn9HfFyO2mKklnhJxmWr5o23xlPLhDav7+0HHUTB
	Kzfi6tvhg1XM5wV9nb+z+iXYgf8CjpDRDItLbP8r+jpSGWZZyXHIT9Gv99s2pcK5A5EA/STzYpxKD
	Wa68KMKVil9GPZN4HRxJ3u9W1hxIAUpgFWXe1UeEJJIqLeAtkDtMwAoTydkIfyWITr0mi1qlIH89e
	9Fz4cJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGAuf-0071Sn-T2; Tue, 26 Jul 2022 03:07:13 +0000
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGAuL-0071Jo-9P; Tue, 26 Jul 2022 03:06:55 +0000
Received: from amadeus-VLT-WX0.lan (unknown [113.118.189.34])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 77CCD80008D;
	Tue, 26 Jul 2022 11:06:50 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 2/3] soc: mediatek: update power domain data of MT7623A
Date: Tue, 26 Jul 2022 11:06:20 +0800
Message-Id: <20220726030621.7555-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726030621.7555-1-amadeus@jmu.edu.cn>
References: <20220726030621.7555-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGhkZVhpPHxpITh1MHRoZSFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKSFVKSkNVSkNCVUhPWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6MDo5LD06ME4SCU84Ny06
	KCEKFBxVSlVKTU5DQ0tPQ0pKSkpCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSkNVSkNCVUhPWVdZCAFZQUhOTEg3Bg++
X-HM-Tid: 0a823878b404b03akuuu77ccd80008d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_200653_484893_6A4E3767 
X-CRM114-Status: UNSURE (   9.55  )
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

When running OpenWrt on MT7623A, I receive a kernel
warning as follows (Device dts using mt7623.dtsi):

mtk-scpsys 10006000.scpsys: Failed to power on domain mfg
WARNING: CPU: 0 PID: 1 at drivers/soc/mediatek/mtk-scpsys.c:457 0xc04a4130

When I switch the device dts to using mt7623a.dtsi,
the system fails to boot:

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 0-...0: (0 ticks this GP) idle=146/1/0x40000000 softirq=53/53 fqs=1051
 (detected by 1, t=2102 jiffies, g=-1111, q=18)
Sending NMI from CPU 1 to CPUs 0:

Solved the problem by duplicating the power domain of
the MT7623 (except MFG) to MT7623A, the system works
fine without kernel warnings/errors.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/soc/mediatek/mtk-scpsys.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ca75b14931ec..8b5713db1ca3 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -910,6 +910,41 @@ static const struct scp_domain_data scp_domain_data_mt7623a[] = {
 		.clk_id = {CLK_NONE},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
+	[MT7623A_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_MM},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT7623A_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.clk_id = {CLK_MM},
+		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_MM_M0,
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT7623A_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.clk_id = {CLK_MM},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT7623A_POWER_DOMAIN_BDP] = {
+		.name = "bdp",
+		.sta_mask = PWR_STATUS_BDP,
+		.ctl_offs = SPM_BDP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.clk_id = {CLK_NONE},
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
 };
 
 /*
-- 
2.25.1


