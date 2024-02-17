Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BFCC54766
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 19:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEGqx9swrd2Efs0TPhy/y31ToK5jrlVR+4ffHyJyKoM=; b=hkskGnT3ztxktP48s9WsowF0PM
	wfIGSGEujFth3BEcpD5+jcPvEIW6jXM7gjl9jtwAeEAyjtM2o4nkP5gIh9oPU57EvKP6ZSC3J3Rmv
	U/m678sbpHNSni1sn2FwAtl6xOrp57hmqW5BrZobtEx/UnjhkQ7uy0ADfnN3S7T/yqn0bwtqHNvlm
	d23hrtQx6XmJJYw/D4R7ZpxlMI9BNmCvUPUyP53fmnp4plx2G84CKVYHsdL5nirkZntDXTHuRK6tk
	qV12VG7YcfzwVCAizi+URYt+AVKPhoAr/HPUIIIzutPxvd/2BgvkWlnLUGEVWBCTLvexV6Vi9HqP4
	AKkC5GTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQZP-00000006Fuf-389b;
	Sat, 17 Feb 2024 19:41:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQZ7-00000006FhW-3Box;
	Sat, 17 Feb 2024 19:41:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3392b045e0aso1942578f8f.2;
        Sat, 17 Feb 2024 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708198896; x=1708803696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEGqx9swrd2Efs0TPhy/y31ToK5jrlVR+4ffHyJyKoM=;
        b=Hx6URy23OurdBAeECiG0oROiF0EQu1dJDPsKhcK6zgAr+4q7TBdlp1xDVj4SNDuj8f
         ZHMKtjA2h9fZp11T8y4XZGOft2Z4DxnFqNXSzYuq3S21GqujLtLYrkIExq/QC2sdTcO3
         8bA+CclNfNUypCvxZ5xt6swrLoZAE1L2MnBlrQRB55fzDO89YqvHJiyzWr2PI6fDNN7x
         OGURGlKLYmob3OieRmiFb6gJGp6Lcf1MT+qEBlXHfNz1HKKjaB9jR2Wp291a+ClnAu95
         fYfwtNAk7UUHB+EEivyrDEUk3Y1AKNQ/Cvqk7f4oWIFGP3gL6XOxnOdNodJEpWjlUdUA
         j/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708198896; x=1708803696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEGqx9swrd2Efs0TPhy/y31ToK5jrlVR+4ffHyJyKoM=;
        b=PETC5uVS6jDZvZfQOuLXkWZ8pppp7vO0Yii9loUWie0bBz97N05HG0JdHtbx8LQ3kQ
         06CdqbnhOFQSaRaSqqMVpQ1qxedx1ZNULCFPITJLqQkrfzSrdeLmf9TSyOm3YIiw2dHA
         GEzfb+fR6N33RuzOLLv6gkBz4d+UVh9hbL8IvdEgx/D7rn2dyli0XdTgHAt4lySQ8mNE
         VhY+64Jt+Cbcw9/p6o9TGPDJH8C1QtbO+Aki+AhOhCI4GMLRcJA6OuSmtvWfIrL1P1Xa
         /RRqtYgSAko6XOwpTZuh0+GJatgB0eF+ey2h08+8/wN48WJBkmWMrJmofe+cRaiscEyL
         dLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs921guERXblSAo5EDLwY4y8XTgIaHa6znav9w2Ezqz8PFyyB4Tkjh90OJzZgW6yhP8HlbYdYUkehze2nSCi4LpKxucuUGSuVSc8JiafjyvG2t6iXu7xP/5ew+4btwYrmN9I679uXXN1VCk9crmCwmg58owYwr6KDdMsx/26FHIQtmjJh23AflKi9izO5/G0t7PgJvU6zCl+a+mG7OnbpbObmyOx0pkIk82PU+2+Yb21mN5lR6EM1sPouDak9L1A==
X-Gm-Message-State: AOJu0YxOdSp3KK4dgIJq4iHkKZeDGwwtcbDaFDXMHW3+CyymVu0icG9I
	WwaqF+hxTAv1DfT9qJwpKLtKgQXjkBHkBRpBxSp/FNzywZ8y37Ma
X-Google-Smtp-Source: AGHT+IHTBfuLFBgxYDXyAEdhLvoS/uyVjXtTiqArx5lwkdOqMzfSKqV8T9BR5k1vk63E8j+lc/Nsdg==
X-Received: by 2002:a05:6000:105:b0:33d:39bb:a350 with SMTP id o5-20020a056000010500b0033d39bba350mr736402wrx.59.1708198896316;
        Sat, 17 Feb 2024 11:41:36 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b10-20020a5d40ca000000b0033ceca3a3dbsm5661169wrq.2.2024.02.17.11.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 11:41:35 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Peter Geis <pgwipeout@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robimarko@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 3/3] net: phy: bcm7xxx: use common OPs for PHYs where possible
Date: Sat, 17 Feb 2024 20:41:14 +0100
Message-ID: <20240217194116.8565-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217194116.8565-1-ansuelsmth@gmail.com>
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_114137_985550_E2BCD786 
X-CRM114-Status: GOOD (  11.93  )
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

Group common OPs for PHY, make them static and reference these
statically link OPs table instead of duplicating them for each PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/bcm7xxx.c | 80 +++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/drivers/net/phy/bcm7xxx.c b/drivers/net/phy/bcm7xxx.c
index c820a94b30a4..adfe364846dd 100644
--- a/drivers/net/phy/bcm7xxx.c
+++ b/drivers/net/phy/bcm7xxx.c
@@ -840,6 +840,17 @@ static int bcm7xxx_28nm_probe(struct phy_device *phydev)
 	return ret;
 }
 
+static const struct phy_driver_ops bcm7xxx_28nm_gpy_ops = {
+	.config_init	= bcm7xxx_28nm_config_init,
+	.resume		= bcm7xxx_28nm_resume,
+	.get_tunable	= bcm7xxx_28nm_get_tunable,
+	.set_tunable	= bcm7xxx_28nm_set_tunable,
+	.get_sset_count	= bcm_phy_get_sset_count,
+	.get_strings	= bcm_phy_get_strings,
+	.get_stats	= bcm7xxx_28nm_get_phy_stats,
+	.probe		= bcm7xxx_28nm_probe,
+};
+
 #define BCM7XXX_28NM_GPHY(_oui, _name)					\
 {									\
 	.phy_id		= (_oui),					\
@@ -847,18 +858,20 @@ static int bcm7xxx_28nm_probe(struct phy_device *phydev)
 	.name		= _name,					\
 	/* PHY_GBIT_FEATURES */						\
 	.flags		= PHY_IS_INTERNAL,				\
-	.ops		= &(const struct phy_driver_ops){		\
-	.config_init	= bcm7xxx_28nm_config_init,			\
-	.resume		= bcm7xxx_28nm_resume,				\
-	.get_tunable	= bcm7xxx_28nm_get_tunable,			\
-	.set_tunable	= bcm7xxx_28nm_set_tunable,			\
-	.get_sset_count	= bcm_phy_get_sset_count,			\
-	.get_strings	= bcm_phy_get_strings,				\
-	.get_stats	= bcm7xxx_28nm_get_phy_stats,			\
-	.probe		= bcm7xxx_28nm_probe,				\
-	},								\
+	.ops		= &bcm7xxx_28nm_gpy_ops,			\
 }
 
+static const struct phy_driver_ops bcm7xxx_28nm_ephy_ops = {
+	.config_init	= bcm7xxx_28nm_ephy_config_init,
+	.resume		= bcm7xxx_28nm_ephy_resume,
+	.get_sset_count	= bcm_phy_get_sset_count,
+	.get_strings	= bcm_phy_get_strings,
+	.get_stats	= bcm7xxx_28nm_get_phy_stats,
+	.probe		= bcm7xxx_28nm_probe,
+	.read_mmd	= bcm7xxx_28nm_ephy_read_mmd,
+	.write_mmd	= bcm7xxx_28nm_ephy_write_mmd,
+};
+
 #define BCM7XXX_28NM_EPHY(_oui, _name)					\
 {									\
 	.phy_id		= (_oui),					\
@@ -866,18 +879,16 @@ static int bcm7xxx_28nm_probe(struct phy_device *phydev)
 	.name		= _name,					\
 	/* PHY_BASIC_FEATURES */					\
 	.flags		= PHY_IS_INTERNAL,				\
-	.ops		= &(const struct phy_driver_ops){		\
-	.config_init	= bcm7xxx_28nm_ephy_config_init,		\
-	.resume		= bcm7xxx_28nm_ephy_resume,			\
-	.get_sset_count	= bcm_phy_get_sset_count,			\
-	.get_strings	= bcm_phy_get_strings,				\
-	.get_stats	= bcm7xxx_28nm_get_phy_stats,			\
-	.probe		= bcm7xxx_28nm_probe,				\
-	.read_mmd	= bcm7xxx_28nm_ephy_read_mmd,			\
-	.write_mmd	= bcm7xxx_28nm_ephy_write_mmd,			\
-	},								\
+	.ops		= &bcm7xxx_28nm_ephy_ops,			\
 }
 
+static const struct phy_driver_ops bcm7xxx_40nm_ephy_ops = {
+	.soft_reset	= genphy_soft_reset,
+	.config_init    = bcm7xxx_config_init,
+	.suspend        = bcm7xxx_suspend,
+	.resume         = bcm7xxx_config_init,
+};
+
 #define BCM7XXX_40NM_EPHY(_oui, _name)					\
 {									\
 	.phy_id         = (_oui),					\
@@ -885,14 +896,20 @@ static int bcm7xxx_28nm_probe(struct phy_device *phydev)
 	.name           = _name,					\
 	/* PHY_BASIC_FEATURES */					\
 	.flags          = PHY_IS_INTERNAL,				\
-	.ops		= &(const struct phy_driver_ops){		\
-	.soft_reset	= genphy_soft_reset,				\
-	.config_init    = bcm7xxx_config_init,				\
-	.suspend        = bcm7xxx_suspend,				\
-	.resume         = bcm7xxx_config_init,				\
-	},								\
+	.ops		= &bcm7xxx_40nm_ephy_ops,			\
 }
 
+static const struct phy_driver_ops bcm7xxx_16nm_ephy_ops = {
+	.get_sset_count	= bcm_phy_get_sset_count,
+	.get_strings	= bcm_phy_get_strings,
+	.get_stats	= bcm7xxx_28nm_get_phy_stats,
+	.probe		= bcm7xxx_28nm_probe,
+	.config_init	= bcm7xxx_16nm_ephy_config_init,
+	.config_aneg	= genphy_config_aneg,
+	.read_status	= genphy_read_status,
+	.resume		= bcm7xxx_16nm_ephy_resume,
+};
+
 #define BCM7XXX_16NM_EPHY(_oui, _name)					\
 {									\
 	.phy_id		= (_oui),					\
@@ -900,16 +917,7 @@ static int bcm7xxx_28nm_probe(struct phy_device *phydev)
 	.name		= _name,					\
 	/* PHY_BASIC_FEATURES */					\
 	.flags		= PHY_IS_INTERNAL,				\
-	.ops		= &(const struct phy_driver_ops){		\
-	.get_sset_count	= bcm_phy_get_sset_count,			\
-	.get_strings	= bcm_phy_get_strings,				\
-	.get_stats	= bcm7xxx_28nm_get_phy_stats,			\
-	.probe		= bcm7xxx_28nm_probe,				\
-	.config_init	= bcm7xxx_16nm_ephy_config_init,		\
-	.config_aneg	= genphy_config_aneg,				\
-	.read_status	= genphy_read_status,				\
-	.resume		= bcm7xxx_16nm_ephy_resume,			\
-	},								\
+	.ops		= &bcm7xxx_16nm_ephy_ops,			\
 }
 
 static struct phy_driver bcm7xxx_driver[] = {
-- 
2.43.0


