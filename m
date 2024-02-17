Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE24C48BF6
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 19:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZEviv2teb4NzkCVrP/1Qc+rjhnubLMND2DwU0Wh17A=; b=WerkzbnllifYxy+w32KY2YVrI5
	WhNnGhYCdHieI65ePda235ZyC8ub3CiaMlStc3QDmXo35n/jfg4ZBVR2TW03jadNY8ZDUNto67iab
	ub4mVddgLHdsuM0fIx5wPd1zYEDTPLma1Okjkf4zl0GXFp2MlG3Z57xcfivVIRUtqDC+05YGo6SCe
	hbEEzmT7gz6U894mC/IgvP63P4V4ZtKketT4jpQd0G7KZALtp2FwhIvE0+ceLUJTSrq2cdTH6Wrte
	qscKKLrpqbGjbO5Cpz6yfCnbMVq9WiUR3HxMkIY1PbYDght4wp4WTWYa8HAkTwRKRaxapMAlAECKL
	o0n6FnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQZC-00000006Fkp-4B6v;
	Sat, 17 Feb 2024 19:41:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQZ6-00000006Fgg-0MrC;
	Sat, 17 Feb 2024 19:41:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33d2b354c72so471060f8f.1;
        Sat, 17 Feb 2024 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708198894; x=1708803694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZEviv2teb4NzkCVrP/1Qc+rjhnubLMND2DwU0Wh17A=;
        b=IODMg2+owoqHiox7xabwAnwFUfzzsXoOUj5fVMcGdxbVKscEAkbGbAA274pUAqJYeT
         rDllOuZ1QE2+UyeZR+Pw3SFJNXpNtvGAnxrAu3AWtrNWtP8LzZ6OOSG+NpsBhKJGdE6E
         ZM3VfqofpaIfoaR3IT2x0jGGG7rcICgk3jUmscir63SORZW/ErnS3CKBfpIi8qL5h61s
         QhX0D1U0pLA6fi91+Lgr0PV643QAmMVRj+tLvFkpHzTmxq7k1fDZzphWorPRID35St24
         8zZCOf5StQ+adchMN9KYigoWx/ZtybYAv0U5LdTGJK+nYroUx6Ae08kyT61iIWfY2pUf
         bJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708198894; x=1708803694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZEviv2teb4NzkCVrP/1Qc+rjhnubLMND2DwU0Wh17A=;
        b=LdXRQ3RYrPxvJI/WmiGzDwPYlUXOGXOk11KOIYvLohat82hPsrbNp7ITKg0H5ghDUq
         h0mJx5BJBZuDwahItGhEmqXhA2qjv6RPtGmHdd564Iqwpn1ztIs3dqcZyiOduQeonN28
         9pvUmiienc6EDsos/KfY3RWQWCe5XzZ0ab/OZEUhW1AYkvBsCsT3WOnzmE2+bhwRoPmA
         97y8iAIm930aewV36D3+zCzkk+2nRcR6gAVwCEoIxuLpZutRYGYOv5tTMJ3x8KQ0FFov
         v+TrX50wDpVIiroARArtSj0uHiM1olk0vbasY5jpkw5U/AIRJjf57FhMeNs8qCmIWmZM
         KZVg==
X-Forwarded-Encrypted: i=1; AJvYcCWVNGiftTM6cDpWlTPWGOWMRJCgu8SPU/m1cTQXsaYH6NTgiH/qW1kwqQaGtTYW5lQqUYyL6tqKwKgRQvm+HLUUzZSTxXCNaqNe8ZLoTSnEXQRuDGS2NlmXMF/r6XqQYdAYI31sbg8SOK9vVZ5EksBlBkt5HyG/suECFeKewIR19qZW1ZRSnymbpUD2O2VXWkNmxcKw7gHUzEDPL7sWz2Cj6qBE6WGc2q21JaXAddmetdnjotpIpSD2a//HqGKXjQ==
X-Gm-Message-State: AOJu0YxoJvsAXnwyvmkF6Vvrwl9N/Ujf9e/uomltDY4Ne4rRgtNGZS+3
	Gexr8G4O5PpcHUErz5wyrKmwVUooyfjW89ol+9WeTjPUFazp/d1f
X-Google-Smtp-Source: AGHT+IH5z0lQxM8SWKlZjhmYQZswVu+KcjSTCP84/EW6jYLGcTWFQHxT2+612mD4BXGNG14DlFINyw==
X-Received: by 2002:a05:6000:24a:b0:33d:3b44:aaa6 with SMTP id m10-20020a056000024a00b0033d3b44aaa6mr339545wrz.58.1708198893894;
        Sat, 17 Feb 2024 11:41:33 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b10-20020a5d40ca000000b0033ceca3a3dbsm5661169wrq.2.2024.02.17.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 11:41:33 -0800 (PST)
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
Subject: [net-next RFC PATCH 2/3] net: phy: aquantia: use common OPs for PHYs where possible
Date: Sat, 17 Feb 2024 20:41:13 +0100
Message-ID: <20240217194116.8565-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217194116.8565-1-ansuelsmth@gmail.com>
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_114136_173286_75AE417C 
X-CRM114-Status: GOOD (  13.44  )
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
 drivers/net/phy/aquantia/aquantia_main.c | 207 ++++++++---------------
 1 file changed, 69 insertions(+), 138 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index 2166370ccc82..5720ceda303f 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -768,53 +768,14 @@ static int aqr111_config_init(struct phy_device *phydev)
 	return aqr107_config_init(phydev);
 }
 
-static struct phy_driver aqr_driver[] = {
-{
-	PHY_ID_MATCH_MODEL(PHY_ID_AQ1202),
-	.name		= "Aquantia AQ1202",
-	.ops		= &(const struct phy_driver_ops){
-	.config_aneg    = aqr_config_aneg,
-	.config_intr	= aqr_config_intr,
-	.handle_interrupt = aqr_handle_interrupt,
-	.read_status	= aqr_read_status,
-	},
-},
-{
-	PHY_ID_MATCH_MODEL(PHY_ID_AQ2104),
-	.name		= "Aquantia AQ2104",
-	.ops		= &(const struct phy_driver_ops){
-	.config_aneg    = aqr_config_aneg,
-	.config_intr	= aqr_config_intr,
-	.handle_interrupt = aqr_handle_interrupt,
-	.read_status	= aqr_read_status,
-	},
-},
-{
-	PHY_ID_MATCH_MODEL(PHY_ID_AQR105),
-	.name		= "Aquantia AQR105",
-	.ops		= &(const struct phy_driver_ops){
-	.config_aneg    = aqr_config_aneg,
-	.config_intr	= aqr_config_intr,
-	.handle_interrupt = aqr_handle_interrupt,
-	.read_status	= aqr_read_status,
-	.suspend	= aqr107_suspend,
-	.resume		= aqr107_resume,
-	},
-},
-{
-	PHY_ID_MATCH_MODEL(PHY_ID_AQR106),
-	.name		= "Aquantia AQR106",
-	.ops		= &(const struct phy_driver_ops){
+static const struct phy_driver_ops aqr106_ops = {
 	.config_aneg    = aqr_config_aneg,
 	.config_intr	= aqr_config_intr,
 	.handle_interrupt = aqr_handle_interrupt,
 	.read_status	= aqr_read_status,
-	},
-},
-{
-	PHY_ID_MATCH_MODEL(PHY_ID_AQR107),
-	.name		= "Aquantia AQR107",
-	.ops		= &(const struct phy_driver_ops){
+};
+
+static const struct phy_driver_ops aqr107_ops = {
 	.probe		= aqr107_probe,
 	.get_rate_matching = aqr107_get_rate_matching,
 	.config_init	= aqr107_config_init,
@@ -830,15 +791,12 @@ static struct phy_driver aqr_driver[] = {
 	.get_strings	= aqr107_get_strings,
 	.get_stats	= aqr107_get_stats,
 	.link_change_notify = aqr107_link_change_notify,
-	},
-},
-{
-	PHY_ID_MATCH_MODEL(PHY_ID_AQCS109),
-	.name		= "Aquantia AQCS109",
-	.ops		= &(const struct phy_driver_ops){
+};
+
+static const struct phy_driver_ops aqr111_ops = {
 	.probe		= aqr107_probe,
 	.get_rate_matching = aqr107_get_rate_matching,
-	.config_init	= aqcs109_config_init,
+	.config_init	= aqr111_config_init,
 	.config_aneg    = aqr_config_aneg,
 	.config_intr	= aqr_config_intr,
 	.handle_interrupt = aqr_handle_interrupt,
@@ -851,36 +809,66 @@ static struct phy_driver aqr_driver[] = {
 	.get_strings	= aqr107_get_strings,
 	.get_stats	= aqr107_get_stats,
 	.link_change_notify = aqr107_link_change_notify,
-	},
+};
+
+static const struct phy_driver_ops aqr113_ops = {
+	.probe          = aqr107_probe,
+	.get_rate_matching = aqr107_get_rate_matching,
+	.config_init    = aqr113c_config_init,
+	.config_aneg    = aqr_config_aneg,
+	.config_intr    = aqr_config_intr,
+	.handle_interrupt       = aqr_handle_interrupt,
+	.read_status    = aqr107_read_status,
+	.get_tunable    = aqr107_get_tunable,
+	.set_tunable    = aqr107_set_tunable,
+	.suspend        = aqr107_suspend,
+	.resume         = aqr107_resume,
+	.get_sset_count = aqr107_get_sset_count,
+	.get_strings    = aqr107_get_strings,
+	.get_stats      = aqr107_get_stats,
+	.link_change_notify = aqr107_link_change_notify,
+};
+
+static struct phy_driver aqr_driver[] = {
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQ1202),
+	.name		= "Aquantia AQ1202",
+	.ops		= &aqr106_ops,
 },
 {
-	PHY_ID_MATCH_MODEL(PHY_ID_AQR111),
-	.name		= "Aquantia AQR111",
+	PHY_ID_MATCH_MODEL(PHY_ID_AQ2104),
+	.name		= "Aquantia AQ2104",
+	.ops		= &aqr106_ops,
+},
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQR105),
+	.name		= "Aquantia AQR105",
 	.ops		= &(const struct phy_driver_ops){
-	.probe		= aqr107_probe,
-	.get_rate_matching = aqr107_get_rate_matching,
-	.config_init	= aqr111_config_init,
 	.config_aneg    = aqr_config_aneg,
 	.config_intr	= aqr_config_intr,
 	.handle_interrupt = aqr_handle_interrupt,
-	.read_status	= aqr107_read_status,
-	.get_tunable    = aqr107_get_tunable,
-	.set_tunable    = aqr107_set_tunable,
+	.read_status	= aqr_read_status,
 	.suspend	= aqr107_suspend,
 	.resume		= aqr107_resume,
-	.get_sset_count	= aqr107_get_sset_count,
-	.get_strings	= aqr107_get_strings,
-	.get_stats	= aqr107_get_stats,
-	.link_change_notify = aqr107_link_change_notify,
 	},
 },
 {
-	PHY_ID_MATCH_MODEL(PHY_ID_AQR111B0),
-	.name		= "Aquantia AQR111B0",
+	PHY_ID_MATCH_MODEL(PHY_ID_AQR106),
+	.name		= "Aquantia AQR106",
+	.ops		= &aqr106_ops,
+},
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQR107),
+	.name		= "Aquantia AQR107",
+	.ops		= &aqr107_ops,
+},
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQCS109),
+	.name		= "Aquantia AQCS109",
 	.ops		= &(const struct phy_driver_ops){
 	.probe		= aqr107_probe,
 	.get_rate_matching = aqr107_get_rate_matching,
-	.config_init	= aqr111_config_init,
+	.config_init	= aqcs109_config_init,
 	.config_aneg    = aqr_config_aneg,
 	.config_intr	= aqr_config_intr,
 	.handle_interrupt = aqr_handle_interrupt,
@@ -895,97 +883,40 @@ static struct phy_driver aqr_driver[] = {
 	.link_change_notify = aqr107_link_change_notify,
 	},
 },
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQR111),
+	.name		= "Aquantia AQR111",
+	.ops		= &aqr111_ops,
+},
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQR111B0),
+	.name		= "Aquantia AQR111B0",
+	.ops		= &aqr111_ops,
+},
 {
 	PHY_ID_MATCH_MODEL(PHY_ID_AQR405),
 	.name		= "Aquantia AQR405",
-	.ops		= &(const struct phy_driver_ops){
-	.config_aneg    = aqr_config_aneg,
-	.config_intr	= aqr_config_intr,
-	.handle_interrupt = aqr_handle_interrupt,
-	.read_status	= aqr_read_status,
-	},
+	.ops		= &aqr106_ops,
 },
 {
 	PHY_ID_MATCH_MODEL(PHY_ID_AQR112),
 	.name		= "Aquantia AQR112",
-	.ops		= &(const struct phy_driver_ops){
-	.probe		= aqr107_probe,
-	.config_aneg    = aqr_config_aneg,
-	.config_intr	= aqr_config_intr,
-	.handle_interrupt = aqr_handle_interrupt,
-	.get_tunable    = aqr107_get_tunable,
-	.set_tunable    = aqr107_set_tunable,
-	.suspend	= aqr107_suspend,
-	.resume		= aqr107_resume,
-	.read_status	= aqr107_read_status,
-	.get_rate_matching = aqr107_get_rate_matching,
-	.get_sset_count = aqr107_get_sset_count,
-	.get_strings	= aqr107_get_strings,
-	.get_stats	= aqr107_get_stats,
-	.link_change_notify = aqr107_link_change_notify,
-	},
+	.ops		= &aqr107_ops,
 },
 {
 	PHY_ID_MATCH_MODEL(PHY_ID_AQR412),
 	.name		= "Aquantia AQR412",
-	.ops		= &(const struct phy_driver_ops){
-	.probe		= aqr107_probe,
-	.config_aneg    = aqr_config_aneg,
-	.config_intr	= aqr_config_intr,
-	.handle_interrupt = aqr_handle_interrupt,
-	.get_tunable    = aqr107_get_tunable,
-	.set_tunable    = aqr107_set_tunable,
-	.suspend	= aqr107_suspend,
-	.resume		= aqr107_resume,
-	.read_status	= aqr107_read_status,
-	.get_rate_matching = aqr107_get_rate_matching,
-	.get_sset_count = aqr107_get_sset_count,
-	.get_strings	= aqr107_get_strings,
-	.get_stats	= aqr107_get_stats,
-	.link_change_notify = aqr107_link_change_notify,
-	},
+	.ops		= &aqr107_ops,
 },
 {
 	PHY_ID_MATCH_MODEL(PHY_ID_AQR113),
 	.name		= "Aquantia AQR113",
-	.ops		= &(const struct phy_driver_ops){
-	.probe          = aqr107_probe,
-	.get_rate_matching = aqr107_get_rate_matching,
-	.config_init    = aqr113c_config_init,
-	.config_aneg    = aqr_config_aneg,
-	.config_intr    = aqr_config_intr,
-	.handle_interrupt       = aqr_handle_interrupt,
-	.read_status    = aqr107_read_status,
-	.get_tunable    = aqr107_get_tunable,
-	.set_tunable    = aqr107_set_tunable,
-	.suspend        = aqr107_suspend,
-	.resume         = aqr107_resume,
-	.get_sset_count = aqr107_get_sset_count,
-	.get_strings    = aqr107_get_strings,
-	.get_stats      = aqr107_get_stats,
-	.link_change_notify = aqr107_link_change_notify,
-	},
+	.ops		= &aqr113_ops,
 },
 {
 	PHY_ID_MATCH_MODEL(PHY_ID_AQR113C),
 	.name           = "Aquantia AQR113C",
-	.ops		= &(const struct phy_driver_ops){
-	.probe          = aqr107_probe,
-	.get_rate_matching = aqr107_get_rate_matching,
-	.config_init    = aqr113c_config_init,
-	.config_aneg    = aqr_config_aneg,
-	.config_intr    = aqr_config_intr,
-	.handle_interrupt       = aqr_handle_interrupt,
-	.read_status    = aqr107_read_status,
-	.get_tunable    = aqr107_get_tunable,
-	.set_tunable    = aqr107_set_tunable,
-	.suspend        = aqr107_suspend,
-	.resume         = aqr107_resume,
-	.get_sset_count = aqr107_get_sset_count,
-	.get_strings    = aqr107_get_strings,
-	.get_stats      = aqr107_get_stats,
-	.link_change_notify = aqr107_link_change_notify,
-	},
+	.ops		= &aqr113_ops,
 },
 };
 
-- 
2.43.0


