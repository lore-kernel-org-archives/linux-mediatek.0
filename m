Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BBAFA372E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jHe9aC1y+9UHk+XDFJvLFz8bqA/OnFcRkg7KkBp46PM=; b=bxo4LbWYdq4vjoOcIq2psgiOfk
	VE66f98pV5otA6qvMOG/nESaEWqb7SQc3CSas/iXdRsUN0FEnS0H8LLi8x3als40viD+MI/k3J1vy
	WCUqhLdkj1lrPietkwm68lHsWNzmMkgT8OjJ2YYfJb4VS9cm3I4wxU0WFm+H+tjgYYA+2+w7PRz9J
	aCkzk24J+6vd1JnGPxMOZqINkbW86df2/g9llhOMLbO1ea/hfwFIcx4lBlJhxj7xzgPF9dbiMvYwT
	HzG49lzu37quOdhuDg0Y6/+0h7wuj/+goVT5cZcefLFCqD5g5wydPCQN6BJm0gdgQk6iuSLXVQ/2S
	lpyh+2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdOV-000000088s5-0yqn;
	Fri, 02 Jan 2026 11:32:35 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdOR-000000088r6-1nrX
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 11:32:33 +0000
Received: (wp-smtpd smtp.wp.pl 4911 invoked from network); 2 Jan 2026 12:32:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767353544; bh=jHe9aC1y+9UHk+XDFJvLFz8bqA/OnFcRkg7KkBp46PM=;
          h=From:To:Cc:Subject;
          b=nScZ4ps7gWb1pX7hQcGnjkpRyryaJ+DB65fAyWxlcl/84x8FjHjqqNWZy1N1Wj7tH
           a5DjXfdWGSGlHV6GHHuPxJoMVD5LQIG5+wVHGM98Y5R74wbzu3yuhHiHUHhHskkUX+
           OsJlQKfkAV1+t7aAKrYhUGX1nvrwhu7PIgj+sqM/cILE813ZF2PlMUmtjtRgTU8Jl1
           ORKZwnuffBGE5maUz26TJlCJYhReZf/rngNCeY0yhiLvJsHp7u2H/0GgpHEN2gX2He
           XoKv6p8U989n2yiYfD4bn1aJgfms2rRluov/rgaoawMdhxKrYgFmvHIFNEfb6VoGTw
           HsHwgqhF8nKSw==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <daniel@makrotopia.org>; 2 Jan 2026 12:32:24 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: [PATCH net-next] net: phy: mediatek: enable interrupts on AN7581
Date: Fri,  2 Jan 2026 12:30:06 +0100
Message-ID: <20260102113222.3519900-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 48e403bdea1000ce78166cbd4ce3ce3e
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [IWPU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_033231_966654_E6D170E0 
X-CRM114-Status: UNSURE (   7.36  )
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

Interrupts work just like on MT7988.

Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 2c4bbc236202..9a54949644d5 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1508,6 +1508,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581),
 		.name		= "Airoha AN7581 PHY",
+		.config_intr	= genphy_no_config_intr,
+		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.probe		= an7581_phy_probe,
 		.led_blink_set	= mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
-- 
2.47.3


