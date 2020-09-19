Return-Path: <SRS0=9Csx=C4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A501C43463
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 19:30:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AAA21707
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 19:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DAOAk2fM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf5i6Pqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AAA21707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DIxeg9GBRorlyp2yJxtyLzBSy/HPJWZaQPxiZcaiGok=; b=DAOAk2fMzgahTvTt6dzZMkMkq
	Z4HqfQbWcgGHu2p/3I4fnHbc9ODPZZxS7vfr5KYTc+u7sZUVrXuJDBffqX/uTKANvytvj8+nk9naG
	+oE4w3Rg14x0RtZGYgmwXUH0zKuQk7fIgkb1h3Aae4ww8ebJjqJMmvGCmb+2OZ4pLZmdwhQRmLCyl
	wQ3jUQUWoaULujoWOF2CQYqc5gSi2QrEf8PtqzulUoZeQdaAOJfMQpdiI+sN7+4EevhLJy3nu2J8p
	JXG5M/HDwQ20b5YFqW+VALC/cWGDzCnUQ1J32hLe2WN7S2lQta/NbhnP6sD+rFXEYOVNWr+hoqR9q
	KWcvsSFpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJiYR-0003hL-6H; Sat, 19 Sep 2020 19:29:51 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJiYN-0003gg-9E; Sat, 19 Sep 2020 19:29:48 +0000
Received: by mail-wr1-x442.google.com with SMTP id a17so8830510wrn.6;
 Sat, 19 Sep 2020 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bE1UCN2SxEtk5wLlW6eDkNj/1eK18tXtibVyotZ7CQ=;
 b=Qf5i6PqwPm10hX6K72w6i3Ahe+JswP51uGU2ZDhEeloC8zDHKKHbTwO6Oa5pTuCoMO
 lOPJGpLpgSFa59xdGiw42TqlQdRFGFaYuYbmloe5jp/f4rfBe+bIqnpOEpuwoWpRlurZ
 HWa5NXPcJ5w1Cyd+tGdMpZ1rT+SIjERTam/2P1MkRvXBPXPxhIwhDqGZdZhxmkduQCsV
 KMoSYloh1ZHbmWyO+3qbiVZiQbsIenoWoQ5zy67rXJyWijVkDZyeBUx5O6WZLQZ8usV9
 l/miRQdSM5uvCUx0AwDI5t6k2A6R4w531OvHKxQ8aSwVewKcKoAb93DIO/66PQyQLHjR
 15CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bE1UCN2SxEtk5wLlW6eDkNj/1eK18tXtibVyotZ7CQ=;
 b=Qzh7J0qGFEi9vXyChpYe5AUsFOlWZ2WdPhaUb0LUcAykxoG0jQmuIcCw1xMENRDf7q
 IHR690j1M34Y/hEt0gAPcCb/zhhOxmNScIYgfuvRao3r/BgoKZOLNNvSqSlzQKWccKKR
 M2/b5n/kcj9Xyvhh7Gc7voKpi+NPdHeip1V/0BIIE++FYFc00MSf+w5GCA7KIcgoZA+o
 k3v+R+h8k/MhzirWTLeTIrFZA1+p531W+OGQH6b31SnAoSboxnqlHOvjDM89y03OqlwH
 qGZ8FG2zd3QXeuJopFilSxRe5yBgfXY0GE47NGjseo7AkVefxaJPFILO7lx9JsleoJSM
 BsMA==
X-Gm-Message-State: AOAM531P8Ftsa5to/zrM2C2C7wqigDJRqQLz4FI05c8xF/MWVTIsup8x
 V861AwwUn6MLFTF8roPvmEA=
X-Google-Smtp-Source: ABdhPJxJ9woUCR9Om7Bguc63A/yyUADe7XauqnL2X/Pm4GtRnBNgoucoc9eAGjR2SMG2I8/nYhoOeQ==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr43825459wrr.111.1600543784422; 
 Sat, 19 Sep 2020 12:29:44 -0700 (PDT)
Received: from localhost.localdomain (92.40.169.140.threembb.co.uk.
 [92.40.169.140])
 by smtp.gmail.com with ESMTPSA id h2sm12642069wrp.69.2020.09.19.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 12:29:43 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH v2] net: dsa: mt7530: Add some return-value checks
Date: Sat, 19 Sep 2020 20:28:10 +0100
Message-Id: <20200919192809.29120-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1600327978.11746.22.camel@mtksdccf07>
References: <1600327978.11746.22.camel@mtksdccf07>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_152947_336900_EEFD40B0 
X-CRM114-Status: GOOD (  19.65  )
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
v2:
	- fix typo in commit message
	- split variable declarations onto multiple lines (Gustavo)
	- add additional checks for mt753*_setup (Landen)

 drivers/net/dsa/mt7530.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 61388945d316..cb3efa7de7a8 100644
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
@@ -1631,9 +1635,11 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
 
-		if (dsa_is_cpu_port(ds, i))
-			mt753x_cpu_port_enable(ds, i);
-		else
+		if (dsa_is_cpu_port(ds, i)) {
+			ret = mt753x_cpu_port_enable(ds, i);
+			if (ret)
+				return ret;
+		} else
 			mt7530_port_disable(ds, i);
 
 		/* Enable consistent egress tag */
@@ -1785,9 +1791,11 @@ mt7531_setup(struct dsa_switch *ds)
 
 		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
 
-		if (dsa_is_cpu_port(ds, i))
-			mt753x_cpu_port_enable(ds, i);
-		else
+		if (dsa_is_cpu_port(ds, i)) {
+			ret = mt753x_cpu_port_enable(ds, i);
+			if (ret)
+				return ret;
+		} else
 			mt7530_port_disable(ds, i);
 
 		/* Enable consistent egress tag */
@@ -2276,6 +2284,7 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 	struct mt7530_priv *priv = ds->priv;
 	phy_interface_t interface;
 	int speed;
+	int ret;
 
 	switch (port) {
 	case 5:
@@ -2293,6 +2302,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 
 		priv->p6_interface = interface;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -2300,7 +2311,9 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
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
