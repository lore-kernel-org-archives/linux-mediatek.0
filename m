Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FC6C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 07:00:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938702063A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 07:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 938702063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biqY0l/kAxqy13VDi4TYeqdqv57ZRSaZCug8s9Q9D9M=; b=a0KPn33tNshvzPkZ6WUOiXP/RR
	Hq2gTnUOR56LGBYug6Yp8QmwfxL/zbLlMfIEte/DCT0UcB9lZBQe81Ih9diwO8jwO44bLJygnIUwM
	jsudequS7T9X+8ZW5AhL2bdC83iKMKXMwHI8tQigf81Fh+P45RFo+6f4rQYPX++3pUVVifrHKPG3k
	zTg4eCnbahy9XxPL2vUfE6ipK343fH6Sb7yEs/0ueAtN4zQ4b6h1LTLIb3L/3LtM/kn2B39fiqChM
	lpsPSqZtUJgNGVoJs1FA6FY6X4J6WoWeUw/nE8WpV2xSJYBbeYOMs/NfBHRkOgbPjl5z/HG8QS+fh
	NW+zXX8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmWzJ-0003E6-Up; Tue, 08 Dec 2020 07:00:42 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmWzH-0003Db-Ia
 for linux-mediatek@lists.infradead.org; Tue, 08 Dec 2020 07:00:40 +0000
Received: by mail-pf1-x442.google.com with SMTP id s21so13001389pfu.13
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Dec 2020 23:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfWeqWh61B0oRT0px5jYa6HR5aemQ0N4hQFEILa6eSc=;
 b=sTNj3vmB0ESAzGBue/fZBJ2VjpLAKFV/yTV93WLNRsKS/rxLfvRS6OYoBI4/IJs2b0
 44MA2Ajg1lxvI3JcsQmENW7BJei0HPXbsrHtDn+pG66J8nIjnVzgDOxCvQRU8QG56U3i
 09cwZLMKCGb5ps4ZBEu3FRRSQPB7PkakLkRSJ3ZAlsYxU/1739uWPXWxTtyM2X0auLel
 PLx18tCavjWtQf98KSTOV4YImc+r4ZthAPTMC3oOnhIY8GL1O6j1rODX9cSm/qa/Bqsr
 9CB3mjz7oIJ6u9MHBHb1IsXBU+lgGtwlpmaUJdxZLZ5ZDu31HaW35BU7R3iRAS+hhoD8
 Qk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfWeqWh61B0oRT0px5jYa6HR5aemQ0N4hQFEILa6eSc=;
 b=J/HRJZAnGIQedR7rKcd0Z62Kh+7DNRmKi2kuZ+9QidB+A6Krw+daBDIgjusIoo0Tq2
 LdCl/7E4vk98x5sHevdan58PbXIsYvcF5XGs456ftbGCvpeI0hkdYYgqslKjKLbZ3YwQ
 mwVJZyCCjaINpjVg7/vd246UT0UFjc4h6+iodu0wjv/fgpfXcjc7xE9S0HI311f+NmhQ
 HkXDZgh4DQAtoO2FuIF4W1Myxu0SWdvKHVboAlyfP8cpZ0k6WtUc6enqKvah6xCh7+/H
 SfZgZJXQU/4eXX5v00U8u1C7tV5RubDxMNk/V4Kq7TKFktZliH5/YKBsg9V4FBQRZorX
 gXVw==
X-Gm-Message-State: AOAM532J9HU0QpTkjb/NzqERhnk5wjFFIfdX2jX/4hoZpKY5KloMf39w
 j/6Kq3VRWvMYQEBkHOEuWyk=
X-Google-Smtp-Source: ABdhPJy23mkSUGG/pkx2q3rwy0qiTqQt1Pdz0w109V8bYUYR6mvqLkwen7oyQejVBZumcBi3g4haQg==
X-Received: by 2002:a62:aa06:0:b029:19d:f4d3:335e with SMTP id
 e6-20020a62aa060000b029019df4d3335emr9957570pff.60.1607410835733; 
 Mon, 07 Dec 2020 23:00:35 -0800 (PST)
Received: from container-ubuntu.lan ([218.89.163.171])
 by smtp.gmail.com with ESMTPSA id a22sm13402414pfa.215.2020.12.07.23.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:00:34 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next] net: dsa: mt7530: support setting ageing time
Date: Tue,  8 Dec 2020 15:00:28 +0800
Message-Id: <20201208070028.3177-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_020039_653433_33FCF31C 
X-CRM114-Status: GOOD (  15.13  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>
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
