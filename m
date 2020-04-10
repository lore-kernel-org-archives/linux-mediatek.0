Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD125C352B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 03:52:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA5021775
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 03:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jiYddw/+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvFyVLLr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA5021775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzeB2DZfoJcu3fMv3ut5tvXZ6KCP/ZVX9aL2mxKEkiE=; b=jiYddw/+x3KCTa
	wflcL9Ys0zcstBo/wMwbKR3kL5bV/jSfj9Cn9CF0Jd09/WcBpZSKnH1w3XQIVQoaV0qmfqeVmU5B9
	RlCRrRi0vUsm8tdfvwDM1r263jZ2KmV1ycu+7mLt8UfNwHaJaSBsSGWbTLlv7soz5jNaQ0LLutZgg
	UuTt1pl/unDKCTSq1vdRINmzKI9dJHgNwFjgo+Zw0c/TLZE8vkDU6pqR99Ipx7LeSgLIhQnOeS55s
	NL0zwjqsrMzL+vBQN6cp/w1yfvLO0GaNVcyl3EODE4bry1ikespJgmbiaVJoJKg6wqE6D1agYvNdI
	8B1RN+yny78IInY8m37g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMkig-00028F-Uz; Fri, 10 Apr 2020 03:52:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMkez-0004Ja-K9; Fri, 10 Apr 2020 03:49:01 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1080221473;
 Fri, 10 Apr 2020 03:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586490533;
 bh=BTli6aEC2oh+s7XOlwZLRxiWjvJO69p9yn9ye5/6N5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AvFyVLLrVrk778FdPu5XOqbkAVHB+HQmGz6ghB63IgJx0GPTQTnprIZM6IrrNzX9w
 IBFHdB4ENdJkoQ8joUISZ0xS0mBIW9QN7NXyspaFQeDkXHAgO/Ls9zZHN0knEGKw1T
 qxRPlGGBMKpI+RPJcanEZ8duuRLRoZohiuJgS1vY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 44/56] media: i2c: ov5695: Fix power on and off
 sequences
Date: Thu,  9 Apr 2020 23:47:48 -0400
Message-Id: <20200410034800.8381-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200410034800.8381-1-sashal@kernel.org>
References: <20200410034800.8381-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_204853_772359_EEB236B0 
X-CRM114-Status: GOOD (  18.26  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

[ Upstream commit f1a64f56663e9d03e509439016dcbddd0166b2da ]

From the measured hardware signal, OV5695 reset pin goes high for a
short period of time during boot-up. From the sensor specification, the
reset pin is active low and the DT binding defines the pin as active
low, which means that the values set by the driver are inverted and thus
the value requested in probe ends up high.

Fix it by changing probe to request the reset GPIO initialized to high,
which makes the initial state of the physical signal low.

In addition, DOVDD rising must occur before DVDD rising from spec., but
regulator_bulk_enable() API enables all the regulators asynchronously.
Use an explicit loops of regulator_enable() instead.

For power off sequence, it is required that DVDD falls first. Given the
bulk API does not give any guarantee about the order of regulators,
change the driver to use regulator_disable() instead.

The sensor also requires a delay between reset high and first I2C
transaction, which was assumed to be 8192 XVCLK cycles, but 1ms is
recommended by the vendor. Fix this as well.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ov5695.c | 49 ++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index d6cd15bb699ac..cc678d9d2e0da 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -971,16 +971,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* Calculate the delay in us by clock rate and clock cycles */
-static inline u32 ov5695_cal_delay(u32 cycles)
-{
-	return DIV_ROUND_UP(cycles, OV5695_XVCLK_FREQ / 1000 / 1000);
-}
-
 static int __ov5695_power_on(struct ov5695 *ov5695)
 {
-	int ret;
-	u32 delay_us;
+	int i, ret;
 	struct device *dev = &ov5695->client->dev;
 
 	ret = clk_prepare_enable(ov5695->xvclk);
@@ -991,21 +984,28 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
 
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
 
-	ret = regulator_bulk_enable(OV5695_NUM_SUPPLIES, ov5695->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators\n");
-		goto disable_clk;
+	/*
+	 * The hardware requires the regulators to be powered on in order,
+	 * so enable them one by one.
+	 */
+	for (i = 0; i < OV5695_NUM_SUPPLIES; i++) {
+		ret = regulator_enable(ov5695->supplies[i].consumer);
+		if (ret) {
+			dev_err(dev, "Failed to enable %s: %d\n",
+				ov5695->supplies[i].supply, ret);
+			goto disable_reg_clk;
+		}
 	}
 
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 0);
 
-	/* 8192 cycles prior to first SCCB transaction */
-	delay_us = ov5695_cal_delay(8192);
-	usleep_range(delay_us, delay_us * 2);
+	usleep_range(1000, 1200);
 
 	return 0;
 
-disable_clk:
+disable_reg_clk:
+	for (--i; i >= 0; i--)
+		regulator_disable(ov5695->supplies[i].consumer);
 	clk_disable_unprepare(ov5695->xvclk);
 
 	return ret;
@@ -1013,9 +1013,22 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
 
 static void __ov5695_power_off(struct ov5695 *ov5695)
 {
+	struct device *dev = &ov5695->client->dev;
+	int i, ret;
+
 	clk_disable_unprepare(ov5695->xvclk);
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
-	regulator_bulk_disable(OV5695_NUM_SUPPLIES, ov5695->supplies);
+
+	/*
+	 * The hardware requires the regulators to be powered off in order,
+	 * so disable them one by one.
+	 */
+	for (i = OV5695_NUM_SUPPLIES - 1; i >= 0; i--) {
+		ret = regulator_disable(ov5695->supplies[i].consumer);
+		if (ret)
+			dev_err(dev, "Failed to disable %s: %d\n",
+				ov5695->supplies[i].supply, ret);
+	}
 }
 
 static int __maybe_unused ov5695_runtime_resume(struct device *dev)
@@ -1285,7 +1298,7 @@ static int ov5695_probe(struct i2c_client *client,
 	if (clk_get_rate(ov5695->xvclk) != OV5695_XVCLK_FREQ)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
-	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov5695->reset_gpio)) {
 		dev_err(dev, "Failed to get reset-gpios\n");
 		return -EINVAL;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
