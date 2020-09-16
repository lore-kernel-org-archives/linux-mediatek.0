Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB528C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 19:52:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FF49208E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 19:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3XARk0R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rj1jdJwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FF49208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzMO9mg0890Lxh4mpU7seq8J13MGRwRXYxnC0VtXDI0=; b=d3XARk0RBh3sxYzFfMcUo0mqA7
	p6cAtPuWQuSpyf1g4Tnbl6hCcn4H/TtXFpvYaWTUb2gOX6KSGZXl5tIh2VTH/7PGeE7LNbCUaF+gL
	xeV06WCm42liTDU7o9C/7P/fCHN86GYoRDIGvHhgdVmQgXj87iykvOHBtGURNXWVR3AeD4qtKwI8w
	jZCmujga+gx5qU634HB2f7ZPJ5USm6BZHDVrqXEZKpufoadmse/5S2zGuBSUkl7u5stlwCzwMzzQY
	z47Hllxk61nchN6wKb3VFq5p6bE4aw7cu3L6xGQSh5KBAKzX1gvnfk12Bdppwpe7NRY/5R5y+vVDc
	K9KE+wRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIdTP-0003hv-M9; Wed, 16 Sep 2020 19:52:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIdTL-0003h8-BR; Wed, 16 Sep 2020 19:52:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id x23so3879964wmi.3;
 Wed, 16 Sep 2020 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIgP1IMD11EmFdVElztj04n1KpP4IeEEjiU3R2832Rg=;
 b=rj1jdJwVzMdpe+tET8OP9eBonAt5oW5u0kil8bVAGkwKZkWhj/ygksEx2cvBaHUHo/
 CXNh1WI84B3yy2cPSJF9kEFsPBAA3uyQOUM7rqKl3FIGPSEbdvo0WtWoqbWf9Elz7h24
 8JWEriQdFTGziiZyMsQlcJhOBOYrcBqIkHxwE9KTo6O61nbH1JjpNvfP84Ol1ESua5+1
 E9mluf9Vm8jWlEaT6F9v9byad76rFrG+OtvnxePDkWhjAkpSfjogonxabXHyc9PqI/aY
 BpbR/xGmtuZ6YleCwY7UilvhAgZY1CTwZByS0u7PjmLINKHO/UI/Oyy2RiubZvue0ji1
 NYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIgP1IMD11EmFdVElztj04n1KpP4IeEEjiU3R2832Rg=;
 b=n4bKW9ZqNgA0RmBnNW7R/DbkaXouECdK5lm9mlrvAnyVUxH+xEz9BSB0U/2hL1Q2e1
 2pAloOp/sX2Va5NyQ64dpI/sHRJmYlMlTnjsQqErQAtfTna8azRyAHwm3m+9VqaaqRgB
 AEpeZk2B7hUcxlVT7wmfJxirWu3GUi5AotARq1AtnitBmjfpqtsAC9Tn5DBVShQ9N60M
 RTKdH12T54J1dw88Ui+nB6JHnhG5pevGbddfdAw38kIHTFn6g/bmT5yu7giV0iqwhwkA
 kKHqVNIPZjTjEg5cvOc0X5N1l403YaKnDLCqB98xHmhnUn+6txwD0b48mo1wiwJ7ACRO
 Ya6A==
X-Gm-Message-State: AOAM533LxXXTvLlsyZA9aem7eoVMgxyt8JT6qbWRE/cMsx/sxJfmY8T6
 imlQiGqt2mB+mo1fudBQpng=
X-Google-Smtp-Source: ABdhPJwprPQA3V/Ml0Wj9p+zL+JldStv1T4Rk+gCoW48cV+AInlv2N5BcogiOEb/p3kDieiOtFI3rQ==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr5997086wml.147.1600285926318; 
 Wed, 16 Sep 2020 12:52:06 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id g131sm7077036wmf.25.2020.09.16.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 12:52:05 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH] net: dsa: mt7530: Add some return-value checks
Date: Wed, 16 Sep 2020 20:50:17 +0100
Message-Id: <20200916195017.34057-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_155207_423453_80EDD35E 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, Alex Dewar <alex.dewar90@gmail.com>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mt7531_cpu_port_config(), if the variable port is neither 5 nor 5,
then variable interface will be used uninitialised. Change the function
to return -EINVAL in this case.

As the return value of mt7531_cpu_port_config() is never checked
(even though it returns an int) add a check in the correct place so that
the error can be passed up the call stack. Now that we correctly handle
errors thrown in this function, also check the return value of
mt7531_mac_config() in case an error occurs here.

Addresses-Coverity: 1496993 ("Uninitialized variables")
Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---

If it is not expected that these functions will throw errors (i.e.
because the parameters passed will always be correct), we could dispense
with the use of EINVAL errors and just use BUG*() macros instead. Let me
know if you'd rather I fix things up in that way.

Best,
Alex

 drivers/net/dsa/mt7530.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 61388945d316..157d0a01faae 100644
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
@@ -2275,7 +2279,7 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 	phy_interface_t interface;
-	int speed;
+	int ret, speed;
 
 	switch (port) {
 	case 5:
@@ -2293,6 +2297,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 
 		priv->p6_interface = interface;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -2300,7 +2306,9 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
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
