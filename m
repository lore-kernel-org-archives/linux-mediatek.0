Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA011CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYoT3W04IrhjBaHMC+q53PN/kEQ0V1Lm63ZKZoqvGHY=; b=ez4TAeW3XitMZm6kywyZJGj8MQ
	AzW7wwwE6jjG8Hp/D6laqBcAR9SInGyh1ndcGTh5qTEvmfWByuC9P8zlrKgRS5ywl07xYeUzDKJ9E
	7nvc8rsyVd1zZZc5Q78hPwP2177saHW23XlIZ8oOGob3REtg99CBWS7BAfTlhR1iNtKPyY8BgpcvU
	tysUHQCfTt6tjgRcudvgk5YqF3dQqmDspmjbrFCVaEHu50oiuq/jv2Xy3VI4Q10OAVk27YUAsOX+6
	qCHAz2L4Sx+5K+S46v6p8fiVSTAqc+CM7+uwbvxcRuJoWJcKRXECV+ubBlt6vmZ5OqGyhqyi7n7Jf
	ac7xF/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsngn-00Ctsn-2r;
	Tue, 17 Oct 2023 17:17:05 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsngk-00Ctri-1z;
	Tue, 17 Oct 2023 17:17:03 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so57395011fa.0;
        Tue, 17 Oct 2023 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697563017; x=1698167817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYoT3W04IrhjBaHMC+q53PN/kEQ0V1Lm63ZKZoqvGHY=;
        b=JJWvcjSFw/dKUfy2OOtPeKi7w550lOR465TMPzet137RTRlMWCOo41P8vdIsP/Tevy
         jDdlCTTI5tbT1qclyGu+RS9GISbo4N6kf43MvrbPk3WFyrRdpCdXzAPHMp2ufPJEfDXw
         xordLQgXtkAmJoyVPChrnW5y0OLTU3yeJF99mYoBj2gzf/AhCh7dNlU60AdFe2VXfusn
         8GKfmYgfpdI8nBJM6TsosydnDPv7Z9S6wy3kqkiItK3B5UOxuJrL/xOdPzxbJODaWknK
         NzDO6gD84r7WDkyMXUTQK0JuQHItKl9QGrAWY2l3II/pMe2EdKXNDaC4qw9pCH+0t7L8
         2npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697563017; x=1698167817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYoT3W04IrhjBaHMC+q53PN/kEQ0V1Lm63ZKZoqvGHY=;
        b=EvlkfctNFN1CpuiZvvQ8wTuZRnx4MO8jQZehvUFJyIHuogoB0jN7MQ/0IgX6qV+qJo
         jN+CyKlHgYUQXyL0aNlqvRWqDUJ7x2pcoVb9BOVpgoqvEH9uBnlTlbtEoCQlXupqm0xX
         DBrUYCL7QqhtEJMIlMK32UAenKav64EP33KqHyVYZjzsIPK6+lUvaSQQ2ujZDl0VT7V7
         m7xxahDItynfYIaKfkFRJrrGlv8WxrEjUeoZPpA4mvQlO5VMz1W3H9K1B1Tj+URCgrYJ
         iWX/mv9Q0ZVPzY6z8jLwiMcMZ7fpRDpqsB3JIqCpfRmNIOclNchmlWNGIhAjwi9fmtHr
         0OnQ==
X-Gm-Message-State: AOJu0YwPxS9Xr2fKpEyofqXwdSd+cIi3pPcMHnjttz1DjO5OJ5HU7qzu
	6p1uOMPvMhpdgEUhij74xO8=
X-Google-Smtp-Source: AGHT+IFbcy6/T16w7bhth7PlPONFUqvdynPhiYpb/v0yCKZWtTLTirhDYAVV1gtNts+zKzO4tBVnzQ==
X-Received: by 2002:a05:6512:3102:b0:507:9b70:1f0e with SMTP id n2-20020a056512310200b005079b701f0emr2460991lfb.24.1697563017147;
        Tue, 17 Oct 2023 10:16:57 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b004064cd71aa8sm2415838wmb.34.2023.10.17.10.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 10:16:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] thermal: lvts: make some read-only arrays static const
Date: Tue, 17 Oct 2023 18:16:55 +0100
Message-Id: <20231017171655.177096-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_101702_654590_9A6EEA32 
X-CRM114-Status: GOOD (  11.40  )
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

Don't populate the read-only arrays on the stack, instead make them
static const. Make lvts_write_config parameters cmds and nr_cmds
const too.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 877a0e5ac3fd..b20e69cb466f 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -308,7 +308,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 
 static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
 {
-	u32 masks[] = {
+	static const u32 masks[] = {
 		LVTS_MONINT_OFFSET_SENSOR0,
 		LVTS_MONINT_OFFSET_SENSOR1,
 		LVTS_MONINT_OFFSET_SENSOR2,
@@ -400,7 +400,7 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
 {
 	irqreturn_t iret = IRQ_NONE;
 	u32 value;
-	u32 masks[] = {
+	static const u32 masks[] = {
 		LVTS_INT_SENSOR0,
 		LVTS_INT_SENSOR1,
 		LVTS_INT_SENSOR2,
@@ -781,7 +781,7 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
  * each write in the configuration register must be separated by a
  * delay of 2 us.
  */
-static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, u32 *cmds, int nr_cmds)
+static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, const u32 *cmds, const int nr_cmds)
 {
 	int i;
 
@@ -865,7 +865,8 @@ static int lvts_ctrl_set_enable(struct lvts_ctrl *lvts_ctrl, int enable)
 
 static int lvts_ctrl_connect(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 {
-	u32 id, cmds[] = { 0xC103FFFF, 0xC502FF55 };
+	u32 id;
+	static const u32 cmds[] = { 0xC103FFFF, 0xC502FF55 };
 
 	lvts_write_config(lvts_ctrl, cmds, ARRAY_SIZE(cmds));
 
@@ -889,7 +890,7 @@ static int lvts_ctrl_initialize(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	/*
 	 * Write device mask: 0xC1030000
 	 */
-	u32 cmds[] = {
+	static const u32 cmds[] = {
 		0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
 		0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
 		0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,
-- 
2.39.2


