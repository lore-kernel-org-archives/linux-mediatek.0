Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEB9C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:40:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61682220B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vpJMeGbh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoW9J1Rk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D61682220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vFn6xksSTLnJk/rJJ9Dsu6DFEhzOYZncuvwousVkWM=; b=vpJMeGbhVgSPwUsN4doveQqefX
	VVdDQ4z3r5WD49Vs1qxIkEEEEfnWYHOPAFX4BnN1NT7zPDcChQvE2IH4tbrJq5nW6R1Aq6Ty1kpoY
	2237rzjMsR+A0hii2lb0z7trhNpeNhcoL9f3DjxeWOaJ4H680D24nlf5d65Ux/O9blX3l5KHWckXs
	JA4SVwfHUHkHtgHo9hZbkRlsNZM2JJsuwseywvr3IQnW7M1CjvrTWxzUutve3nbF+i2jJDxUpN6VA
	DFiyfK4VATWydm3Fg1TJV95E2SajGc3c0/6E0Rcp3C+NrEQxmev2+4HbODruwrl1aqjHkboKwlxcb
	wKliQWzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfdcc-0003rT-L0; Thu, 19 Nov 2020 06:40:46 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfdca-0003qw-AX
 for linux-mediatek@lists.infradead.org; Thu, 19 Nov 2020 06:40:45 +0000
Received: by mail-lj1-x243.google.com with SMTP id 142so5041389ljj.10
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2020 22:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKNU+afGBf1Qm/b+Fa4Q689rAWX8n69x914nbxzJNjc=;
 b=DoW9J1RkyOD/RmBNO1zQh4WPG6KeG9pzrb8wZiU9WQSMCfr+Gx0DMOFSrUhA8QH/r4
 V9IqbOuFw7OheBNw04Pgjs6sbbCpFircqjcmPPEwIEL/p7mdcTkma+8L0r3xRUDlH0ox
 ROrKfIVFtAQ/PbNQaXK+kVa+T2JFYs0fdoBH5dDLNjOqn9xq4vD1VPMHFiAl4ywhJ0pO
 jtDmGMF8+cnAJRxk43MyisRg9IN6+sZZTa7IIuJkXttke9dj0VWnyeG7SPkpRRUTmfRl
 x0S7VuaZN0NIwvq3a1WEO0rUXQPlWTTELNln7jOuOiDsdz7lC1CocGMJDlkiW7wVU7Wt
 9H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKNU+afGBf1Qm/b+Fa4Q689rAWX8n69x914nbxzJNjc=;
 b=JUBmTUj1xNuzORg8FFsDulSqunyJF1c6rzfBcE6xwduK5hHIZmy466nH7eKxcsw1AA
 GjBTWiMBpmzRaUwsE52DdzfGfFYbU7xROavRVd5YIuHLhscmYZPIxt6Ktplsx4ys+jt1
 ufnY/DbKzPq+0IY8gpC0vSOqJtQ2q7rJrJ9VUFzl1tRcPqEYIVnKcRVKZrSZYqwb1Tyd
 7GBnmJUIo7RQAKx2/V/y0ygfoVOnahLXzLP4ZPf+GJJ1esxrrzQNGH/7o49e0Nsp+LJH
 wFWwJJ8ccF59xMpJzM9xp2Xo22pXLy/jzJfK6gb5yAxoVdmYKLvqvWm49mHNVuFzb4sW
 ePdw==
X-Gm-Message-State: AOAM5338dEIP8rdKfm5p7WLVjbKFOZ/m1Ddn9rszIk+0az7xI5ZTHG4a
 FTg4qs2ao/B2VSBzpIu3YPw=
X-Google-Smtp-Source: ABdhPJwhSojzWRjlVilHCyFx/LxcyoC/Tv57A5XPX/JfLwI5nTR/ffmkpFtZMO4Z45N5WbQqmlhzKw==
X-Received: by 2002:a2e:a0ca:: with SMTP id f10mr5215847ljm.204.1605768042004; 
 Wed, 18 Nov 2020 22:40:42 -0800 (PST)
Received: from container-ubuntu.lan ([240e:398:25da:d530::d2c])
 by smtp.gmail.com with ESMTPSA id w11sm3672107lji.135.2020.11.18.22.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 22:40:41 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Subject: [RFC PATCH net-next] net: dsa: mt7530: support setting ageing time
Date: Thu, 19 Nov 2020 14:40:20 +0800
Message-Id: <20201119064020.19522-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_014044_434307_B2668E2F 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Greg Ungerer <gerg@kernel.org>, Chuanhong Guo <gch981213@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7530 has a global address age control register, so use it to set
ageing time.

The applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 41 ++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/mt7530.h | 13 +++++++++++++
 2 files changed, 54 insertions(+)

RFC:
1. What is the expected behaviour if the timer is too big or too small?
   - return -ERANGE or -EINVAL;
     or
   - if it is too big, apply the maximum value; if it is too small,
     disable learning;

2. Is there a better algorithm to find the closest pair?

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6408402a44f5..99bf8fed6536 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -870,6 +870,46 @@ mt7530_get_sset_count(struct dsa_switch *ds, int port, int sset)
 	return ARRAY_SIZE(mt7530_mib);
 }
 
+static int
+mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
+{
+	struct mt7530_priv *priv = ds->priv;
+	unsigned int secs = msecs / 1000;
+	unsigned int tmp_age_count;
+	unsigned int error = -1;
+	unsigned int age_count;
+	unsigned int age_unit;
+
+	/* Applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds */
+	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
+		return -ERANGE;
+
+	/* iterate through all possible age_count to find the closest pair */
+	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
+		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
+
+		if (tmp_age_unit <= AGE_UNIT_MAX) {
+			unsigned int tmp_error = secs -
+				(tmp_age_count + 1) * (tmp_age_unit + 1);
+
+			/* found a closer pair */
+			if (error > tmp_error) {
+				error = tmp_error;
+				age_count = tmp_age_count;
+				age_unit = tmp_age_unit;
+			}
+
+			/* found the exact match, so break the loop */
+			if (!error)
+				break;
+		}
+	}
+
+	mt7530_write(priv, MT7530_AAC, AGE_CNT(age_count) | AGE_UNIT(age_unit));
+
+	return 0;
+}
+
 static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
@@ -2564,6 +2604,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.phy_write		= mt753x_phy_write,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
+	.set_ageing_time	= mt7530_set_ageing_time,
 	.port_enable		= mt7530_port_enable,
 	.port_disable		= mt7530_port_disable,
 	.port_change_mtu	= mt7530_port_change_mtu,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index ee3523a7537e..32d8969b3ace 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -161,6 +161,19 @@ enum mt7530_vlan_egress_attr {
 	MT7530_VLAN_EGRESS_STACK = 3,
 };
 
+/* Register for address age control */
+#define MT7530_AAC			0xa0
+/* Disable ageing */
+#define  AGE_DIS			BIT(20)
+/* Age count */
+#define  AGE_CNT_MASK			GENMASK(19, 12)
+#define  AGE_CNT_MAX			0xff
+#define  AGE_CNT(x)			(AGE_CNT_MASK & ((x) << 12))
+/* Age unit */
+#define  AGE_UNIT_MASK			GENMASK(11, 0)
+#define  AGE_UNIT_MAX			0xfff
+#define  AGE_UNIT(x)			(AGE_UNIT_MASK & (x))
+
 /* Register for port STP state control */
 #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
 #define  FID_PST(x)			((x) & 0x3)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
