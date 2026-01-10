Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB57D277C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jan 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TdUcyY8z7TPRWWsioWKt1JEXDLaS36j5QztcwMQNV2M=; b=op49daN5BH2oLBElu8I9kNDUZV
	+HngEIsffBxEjnrS6ul04ZtAhllWpwptK52mplsT7ZQ2ni1AJdmipU5HjYo/7v56nWXPWKls41Lso
	4PwZ8quQTCLjcYBusDwmZ092ZZLesqou5qBDtiXxwWXMhVfopv0HIuwatfdmS4BXVwaEx7QUeUX6Z
	dZAbeWiqXGPN4R6wnfVOv/t4J/aTHXDLU8nWuz/uw0jSV/B0QVBdoyc2xsHS9Xpq500Yh4au2tjc7
	5n1l7O2Paf7pgc2KkjIJOLPKK9wiSuRODFHQ8gnRMJqSSlMu6QMtw8G3CpCx0UjA3Ku9W7JDbdRGA
	szi4MQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vecM6-00000003YsL-3pqg;
	Sat, 10 Jan 2026 17:02:26 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vecM3-00000003Yrf-3YEA
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Jan 2026 17:02:25 +0000
Received: (wp-smtpd smtp.wp.pl 22655 invoked from network); 10 Jan 2026 18:02:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1768064534; bh=TdUcyY8z7TPRWWsioWKt1JEXDLaS36j5QztcwMQNV2M=;
          h=From:To:Cc:Subject;
          b=nAo7JSX9uR9NVIck2I17s/oeIrJ2SQgduFI4206Zh5ZZjrrOtaVRqqfBX0hbwRObF
           p+5tKiz0Fp8YiuZrNZT47TE3pwrmAP3cH3AQpXZeCSz6FRjk4iiXIqvII8TPmZhAAh
           lzYYVnFUH6M83yRmS+vBRJ5YTwE+CrZOwF1uoRUj+OIpUEcCPz2HC6Vlu6hf0QIJRB
           lImeCbO/Zx4nO9R7vzn2b5vb/kDf29lYjRepwfZlKH6oOFNP4qnyHiodsU4X59T98O
           34jcil+Q9/ckqYgADKEHkXgurACyojPkABZjCo47pNGo7HYfJuI3cjn8ZIkjp0GZM9
           n/EiRoHL9nbqQ==
Received: from 83.5.241.112.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.241.112])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <lorenzo@kernel.org>; 10 Jan 2026 18:02:14 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] net: airoha: implement get_link_ksettings
Date: Sat, 10 Jan 2026 18:02:05 +0100
Message-ID: <20260110170212.570793-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: b0882427119f6bf4c95d9fe123544b4e
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [sWPE]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_090224_349250_688A254E 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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

Implement the .get_link_ksettings to get the rate, duplex, and
auto-negotiation status.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 315d97036ac1..00cae2833f09 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2803,6 +2803,7 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
-- 
2.47.3


