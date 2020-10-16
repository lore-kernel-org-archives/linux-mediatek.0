Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90568C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C42212CC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFgkZDgp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="S4GwSQZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C42212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FB/Jo5QjXRIsiz4PID/2smC4BSZjci4Ist8tyOBpFm8=; b=lFgkZDgphoKyGc06qh4PSdcMH
	IbjA0XjgLka4VPwgH064oEscClP2OeC10uA2/0zr9EqnHnLFWH/ErGGPKQThN7LgQPRdEyPb/+rb8
	3kb5xjm2PPCqvYmFb/pVpx9kOkYUGgakctSKlMwJ24nrcPC8a6kzizXRnWe9BhXps9iBqICxZredm
	ua1zuqT8K3SDjsRgcF7lUJLoZVE3kOVXUGToSiZIgDPCv99A/i254YnRTSOQOkGfv8YTCDQ44vuzB
	tJP89PmQy98C979Klxq49cwVWMXByKu0qy8jqZZlAPTXfbDKPb5zob1SYDt75ik4NrKbeeSKG+wvj
	R4M2TuCmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWX1-0002iw-Lj; Fri, 16 Oct 2020 20:40:55 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWWt-0002gp-4V; Fri, 16 Oct 2020 20:40:48 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id 6AA0A5FA21;
 Fri, 16 Oct 2020 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1602880843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nq64YXij9tzn9ukxd1xli05D6EoZxP+TcI13tNDVaEk=;
 b=S4GwSQZHgZGnhYpsYIzMW4OWVfWIXiRYfXE3/EJ7LvcWBT9QJdacMxLESXBtbTyZ2UFbSC
 12BFYNZT2/v5bBlHIxIlkJ33lByNC2L4rF9LMPY6f6ZdgQOrM/NRq1UDrd0SnOKKIDtS8l
 jJjqIUwNFwBnq5OV+2Msr0pTcT/OKOk=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de
 [80.208.213.194])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CDF5836023B;
 Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6 channels
Date: Fri, 16 Oct 2020 22:40:19 +0200
Message-Id: <20201016204019.2606-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016204019.2606-1-linux@fw-web.de>
References: <20201016204019.2606-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164047_313461_004817BB 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7622 is reported by mediatek to have only 6 pwm channels
so drop pindefines for 7th channel

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index ce4a8a0cc19c..260ffadd24e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -439,12 +439,6 @@ static int mt7622_pwm_ch6_2_pins[] = { 81, };
 static int mt7622_pwm_ch6_2_funcs[] = { 4, };
 static int mt7622_pwm_ch6_3_pins[] = { 100, };
 static int mt7622_pwm_ch6_3_funcs[] = { 0, };
-static int mt7622_pwm_ch7_0_pins[] = { 70, };
-static int mt7622_pwm_ch7_0_funcs[] = { 3, };
-static int mt7622_pwm_ch7_1_pins[] = { 82, };
-static int mt7622_pwm_ch7_1_funcs[] = { 4, };
-static int mt7622_pwm_ch7_2_pins[] = { 101, };
-static int mt7622_pwm_ch7_2_funcs[] = { 0, };
 
 /* SD */
 static int mt7622_sd_0_pins[] = { 16, 17, 18, 19, 20, 21, };
@@ -611,9 +605,6 @@ static const struct group_desc mt7622_groups[] = {
 	PINCTRL_PIN_GROUP("pwm_ch6_1", mt7622_pwm_ch6_1),
 	PINCTRL_PIN_GROUP("pwm_ch6_2", mt7622_pwm_ch6_2),
 	PINCTRL_PIN_GROUP("pwm_ch6_3", mt7622_pwm_ch6_3),
-	PINCTRL_PIN_GROUP("pwm_ch7_0", mt7622_pwm_ch7_0),
-	PINCTRL_PIN_GROUP("pwm_ch7_1", mt7622_pwm_ch7_1),
-	PINCTRL_PIN_GROUP("pwm_ch7_2", mt7622_pwm_ch7_2),
 	PINCTRL_PIN_GROUP("sd_0", mt7622_sd_0),
 	PINCTRL_PIN_GROUP("sd_1", mt7622_sd_1),
 	PINCTRL_PIN_GROUP("snfi", mt7622_snfi),
@@ -700,9 +691,7 @@ static const char *mt7622_pwm_groups[] = { "pwm_ch1_0", "pwm_ch1_1",
 					   "pwm_ch4_3", "pwm_ch5_0",
 					   "pwm_ch5_1", "pwm_ch5_2",
 					   "pwm_ch6_0", "pwm_ch6_1",
-					   "pwm_ch6_2", "pwm_ch6_3",
-					   "pwm_ch7_0", "pwm_ch7_1",
-					   "pwm_ch7_2", };
+					   "pwm_ch6_2", "pwm_ch6_3", };
 static const char *mt7622_sd_groups[] = { "sd_0", "sd_1", };
 static const char *mt7622_spic_groups[] = { "spic0_0", "spic0_1", "spic1_0",
 					    "spic1_1", "spic2_0",
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
