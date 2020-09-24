Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B43C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 14:07:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFAC212CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 14:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2BKBSyE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke7h7xkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCFAC212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sj9Ac+TWz3X09ZavLwUgjoYLxgIwuzNyb1NSZA8G+HY=; b=i2BKBSyEHDRC5GosTLo8EU/YP
	8wHgxD1Jc8Dqmp8CSAbs7VSAljyHdmJgBZzT0cwdoTDBxxjtm2qLtkphroEKExpMMY4MUznlL8pLs
	CR3HxukHxJ9126wF7BEFqRQ87TFTo/33tKHKGtbkrg5fOar6lAtzmcAu0yZTZ51u8X5zJLYMfHbHO
	94bx+jvn+yR//RPmlsHKbmgZdoKFNYYbdxW8FRo6n8ug1+zu2vJYB/K7mC1lTrdbHvo6Ce2M1TFGV
	YNV2Erx6Qvckk/C+opynWCFU0BwqlcEmitAlnRgCd+DYB7JzoHhHH50fSjasn31FoNWFhDa/H0sca
	G5poSAkpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLRts-0002qT-7F; Thu, 24 Sep 2020 14:07:08 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRtn-0002ps-0S; Thu, 24 Sep 2020 14:07:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id z4so3992864wrr.4;
 Thu, 24 Sep 2020 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwiE/qAzUiZ6lU+Jo3RIVIuBWkBT0u68h0OW67hqGOw=;
 b=ke7h7xkZBjNa24ASDTNPMQnBcxFqrydn1XzvZ7PQXFu14U5B0Zh+iyze6O5QMBQ1Kj
 kbcytqhlXZg66t5bFbVVC5fLAZLsm13fOwisu/lz4oj1wsYAUocq3P+0TDHSLrNc3O81
 wcvfQfMkjCoyJH2E+jcRR4kP0WOJ1jcpdt0BKj+OG7ciN0TVb7oiGFeN5SF5T5K7GBw/
 hVtY5yspmMGnG5vmJYlWYdIi5JNwgpX/atB4UIjtgCXls7YMRCvUSjFnl0bIjX5YJ8W7
 45J1cVUaa8jVQMxgmsh5yP6XCJKsDgGvsU8ceJhI2jzvr+XW1eLDSZdGsIsuiS/Aezpc
 5w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwiE/qAzUiZ6lU+Jo3RIVIuBWkBT0u68h0OW67hqGOw=;
 b=r2a2hvECVj4HoVPx/vfSPC9GUcHz5whE0aau9ETWswEcgxhaD4tsXuG7kYgAQVpsbM
 8FUtI552ZpS2Ct+D/j+jgDPOBEIWklNhYna3kD0KtXv1JUvyDUV54872BsdsIrGL1lQb
 z5xpJF9578QX6fYFsW1TYCmuan0qt+xtkz20rlkYzijzDhNyDd028H2ejT6YAZ9IZ0E+
 qAiNzYAteFPnCur1Txsyasi1gHogPK69p1Id9a0tOGgIMRtEN5uSlwLEQqc85i6JGlOl
 4najEFtaYHvQ7n7MZw4CTJ+vUKJ/3V6i3X6tdt/globqQ+3CjP8oCO8b3jZ2EibQz3qI
 68rQ==
X-Gm-Message-State: AOAM531L8PpH0KO2aHX9a5oBpQSF4D1UtXveC37tbHKVQuKlOfJFQdsg
 FUpJTTSpeDUU9PjT/m0GH/I=
X-Google-Smtp-Source: ABdhPJyQeaYSH0dtZQLkXzcaBkKZaxSqciD3iu7nfzOFVZf/o4sk8J8/sx1MP+QlS+c/W0EgbBs6ww==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr5265503wrq.365.1600956421923; 
 Thu, 24 Sep 2020 07:07:01 -0700 (PDT)
Received: from localhost.localdomain ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id k84sm3711217wmf.6.2020.09.24.07.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 07:07:00 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: Landen Chao <landen.chao@mediatek.com>
Subject: [PATCH v3] net: dsa: mt7530: Add some return-value checks
Date: Thu, 24 Sep 2020 15:05:35 +0100
Message-Id: <20200924140535.5940-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1600953934.19244.2.camel@mtksdccf07>
References: <1600953934.19244.2.camel@mtksdccf07>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_100703_105249_3AB42EA7 
X-CRM114-Status: GOOD (  19.99  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Alex Dewar <alex.dewar90@gmail.com>, linux-mediatek@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mt7531_cpu_port_config(), if the variable port is neither 5 nor 6,
then variable interface will be used uninitialised. Change the function
to return -EINVAL in this case.

As the return value of mt7531_cpu_port_config() is never checked
(even though it returns an int) add a check in the correct place so that
the error can be passed up the call stack. Now that we correctly handle
errors thrown in this function, also check the return value of
mt7531_mac_config() in case an error occurs here. Also add misisng
checks to mt7530_setup() and mt7531_setup(), which are another level
further up the call stack.

Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Addresses-Coverity: 1496993 ("Uninitialized variables")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---

Hi Landen,

Here you go!

v3:
	- fix checkpatch warning about braces (Landen)
v2:
	- fix typo in commit message
	- split variable declarations onto multiple lines (Gustavo)
	- add additional checks for mt753*_setup (Landen)

 drivers/net/dsa/mt7530.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 61388945d316..23b2386318b2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -945,10 +945,14 @@ static int
 mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
 	/* Setup max capability of CPU port at first */
-	if (priv->info->cpu_port_config)
-		priv->info->cpu_port_config(ds, port);
+	if (priv->info->cpu_port_config) {
+		ret = priv->info->cpu_port_config(ds, port);
+		if (ret)
+			return ret;
+	}
 
 	/* Enable Mediatek header mode on the cpu port */
 	mt7530_write(priv, MT7530_PVC_P(port),
@@ -1631,10 +1635,13 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
-		if (dsa_is_cpu_port(ds, i))
-			mt753x_cpu_port_enable(ds, i);
-		else
+		if (dsa_is_cpu_port(ds, i)) {
+			ret = mt753x_cpu_port_enable(ds, i);
+			if (ret)
+				return ret;
+		} else {
 			mt7530_port_disable(ds, i);
+		}
 
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
@@ -1785,10 +1792,13 @@ mt7531_setup(struct dsa_switch *ds)
 
 		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
 
-		if (dsa_is_cpu_port(ds, i))
-			mt753x_cpu_port_enable(ds, i);
-		else
+		if (dsa_is_cpu_port(ds, i)) {
+			ret = mt753x_cpu_port_enable(ds, i);
+			if (ret)
+				return ret;
+		} else {
 			mt7530_port_disable(ds, i);
+		}
 
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
@@ -2276,6 +2286,7 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 	struct mt7530_priv *priv = ds->priv;
 	phy_interface_t interface;
 	int speed;
+	int ret;
 
 	switch (port) {
 	case 5:
@@ -2293,6 +2304,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 
 		priv->p6_interface = interface;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -2300,7 +2313,9 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 	else
 		speed = SPEED_1000;
 
-	mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
+	ret = mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
+	if (ret)
+		return ret;
 	mt7530_write(priv, MT7530_PMCR_P(port),
 		     PMCR_CPU_PORT_SETTING(priv->id));
 	mt753x_phylink_mac_link_up(ds, port, MLO_AN_FIXED, interface, NULL,
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
