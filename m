Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B334AC43459
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:41:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5729F2086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbFobnFj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgMPqrgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5729F2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6q143d6IelYmQQ0mYllrS/VSjt7iI0HiddD63ci3r0=; b=CbFobnFjuq30Hkiy8NQ4cDAVOP
	oTKKGkIKzmL8jDT9nntoX6WFTrEmpf/U4toaZcq2jj4MRgdoD7cnsTolw+SLYj+PuN56s4T8OlNlP
	YulIEIJiKJKIGlhcYShzJ8w7HqAcoZ05iioq7c2NTn0PLY6LDRk0eRzQZ08bNW4IgOZ0Ln+tDQyss
	ZOV0SQNqhTIP9GByKBFXWKouFTsq8QZq+IcVHGix0IKvYcKqxG0RGrVLEMbITjorpMjuNVYtaGefc
	ceMBGMAOFQIGJkubpQ9wH6FlOe9HHLYJokRPb/PDyO6Rc8A9RMGSumOgNsoGvOZH+TOMovZXiXsAd
	1cMDCf0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVrJ-0006PI-UR; Thu, 23 Jul 2020 07:41:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVoj-00050C-C4; Thu, 23 Jul 2020 07:39:02 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04EEB208E4;
 Thu, 23 Jul 2020 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489940;
 bh=ggEflJqSV8AjFjySy+bubvW5KGNlQOK8sPbHABZ405A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AgMPqrgQ1dDhLHgcTaIdkVaPaAXoQyEpJ5DOnUAxDs6SJeymBlwu7UcANi+1OjH7L
 dh+88+SxOyMFMasgXSg/0MLerxOjCmbkqdiLZx9QACtdMqhNkiRAHgi62jmh4kZwPM
 bbNJ0bsh9B3RjfvLa3TJK9n2j1bKGTXb/sYmghJg=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 12/23] memory: emif: Fix whitespace coding style violations
Date: Thu, 23 Jul 2020 09:37:33 +0200
Message-Id: <20200723073744.13400-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033901_603367_4F5777A7 
X-CRM114-Status: GOOD (  14.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Make the code and printed messages slightly more readable.  Fixes
checkpatch warnings:

    WARNING: quoted string split across lines
    ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/emif.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 97bad1588bba..1241a87081f8 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -284,8 +284,7 @@ static void set_lpmode(struct emif_data *emif, u8 lpmode)
 	if ((emif->plat_data->ip_rev == EMIF_4D) &&
 	    (lpmode == EMIF_LP_MODE_PWR_DN)) {
 		WARN_ONCE(1,
-			  "REG_LP_MODE = LP_MODE_PWR_DN(4) is prohibited by"
-			  "erratum i743 switch to LP_MODE_SELF_REFRESH(2)\n");
+			  "REG_LP_MODE = LP_MODE_PWR_DN(4) is prohibited by erratum i743 switch to LP_MODE_SELF_REFRESH(2)\n");
 		/* rollback LP_MODE to Self-refresh mode */
 		lpmode = EMIF_LP_MODE_SELF_REFRESH;
 	}
@@ -714,7 +713,7 @@ static u32 get_ext_phy_ctrl_2_intelliphy_4d5(void)
 	u32 fifo_we_slave_ratio;
 
 	fifo_we_slave_ratio =  DIV_ROUND_CLOSEST(
-		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256 , t_ck);
+		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256, t_ck);
 
 	return fifo_we_slave_ratio | fifo_we_slave_ratio << 11 |
 		fifo_we_slave_ratio << 22;
@@ -725,7 +724,7 @@ static u32 get_ext_phy_ctrl_3_intelliphy_4d5(void)
 	u32 fifo_we_slave_ratio;
 
 	fifo_we_slave_ratio =  DIV_ROUND_CLOSEST(
-		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256 , t_ck);
+		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256, t_ck);
 
 	return fifo_we_slave_ratio >> 10 | fifo_we_slave_ratio << 1 |
 		fifo_we_slave_ratio << 12 | fifo_we_slave_ratio << 23;
@@ -736,7 +735,7 @@ static u32 get_ext_phy_ctrl_4_intelliphy_4d5(void)
 	u32 fifo_we_slave_ratio;
 
 	fifo_we_slave_ratio =  DIV_ROUND_CLOSEST(
-		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256 , t_ck);
+		EMIF_INTELLI_PHY_DQS_GATE_OPENING_DELAY_PS * 256, t_ck);
 
 	return fifo_we_slave_ratio >> 9 | fifo_we_slave_ratio << 2 |
 		fifo_we_slave_ratio << 13;
@@ -975,8 +974,7 @@ static irqreturn_t handle_temp_alert(void __iomem *base, struct emif_data *emif)
 				EMIF_CUSTOM_CONFIG_EXTENDED_TEMP_PART)) {
 		if (emif->temperature_level >= SDRAM_TEMP_HIGH_DERATE_REFRESH) {
 			dev_err(emif->dev,
-				"%s:NOT Extended temperature capable memory."
-				"Converting MR4=0x%02x as shutdown event\n",
+				"%s:NOT Extended temperature capable memory. Converting MR4=0x%02x as shutdown event\n",
 				__func__, emif->temperature_level);
 			/*
 			 * Temperature far too high - do kernel_power_off()
@@ -1318,9 +1316,9 @@ static void __init_or_module of_get_ddr_info(struct device_node *np_emif,
 	if (of_find_property(np_emif, "cal-resistor-per-cs", &len))
 		dev_info->cal_resistors_per_cs = true;
 
-	if (of_device_is_compatible(np_ddr , "jedec,lpddr2-s4"))
+	if (of_device_is_compatible(np_ddr, "jedec,lpddr2-s4"))
 		dev_info->type = DDR_TYPE_LPDDR2_S4;
-	else if (of_device_is_compatible(np_ddr , "jedec,lpddr2-s2"))
+	else if (of_device_is_compatible(np_ddr, "jedec,lpddr2-s2"))
 		dev_info->type = DDR_TYPE_LPDDR2_S2;
 
 	of_property_read_u32(np_ddr, "density", &density);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
