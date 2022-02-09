Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E8CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SQ0Vmx/Hz9chqvX16blzsJ/hEP9Z3FWnva3mkC6o3+U=; b=IK5TwnOrKZVMl7
	/Vd9bVGzg9sOAcqcPkOIcPbAHSSRyJzT/wmHppn2exAsvEBRuXA7+SnBigaNx+9H1tvmNsVPfl9mn
	8n7CSbnWcht1U1Oj8e3xXPSqgdj4fZz5DRNzvyXCtnQZDbeaCY6dU1F7oF0y0krmKDbk65V3tI+a5
	sooawskAbIje/7iOJwDQK5z/UqL9mAZMLaQjmjbFZcz8VjWAT5ba0yyEi2n1og6r6EjTVLBunDVie
	2TEtWDgB5tZU9N3+QpOXIanRh+84f0c34UoDInyBY/iBE7S4VirDa1D2XyA4zlpVSChyNRcVFdgLt
	KU/CZLWyNSGPxNQxV3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHo9B-000OhL-Uf; Wed, 09 Feb 2022 14:40:41 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHo8X-000OVG-TB; Wed, 09 Feb 2022 14:40:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id x15so2182092pfr.5;
 Wed, 09 Feb 2022 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aO4fss2Kmx8HXgCQ0bzR08QPyCBZELu4B0EYTyczINo=;
 b=aU3YQVKJbd9ljuFhYwuOMQbok4ZtDOreJ3/sOBsE90UxWU5YUc0CpZ1WSGJJJufXV/
 p7lpfI89HdfTCYcIBHc6uGz21TBljfzRi53l652TC1wr6EyMN3g1MF3FgOW+yGG8EsHg
 Mf7Wd8nGYsg6puc19z+YLJBXfd7O/UipITmWcKHW0lddc3oTeLHvj7dlt1SvP2TlrlTt
 m6CbZAQVDgDarm57zOxVILgV4zECCSVwiZo4yFHD8OGT2gI15VbTqN9Qs551pUj68S1f
 RXPhqzeiPUHBRL0O1kp3DrCKDE7JDxRqGhSchIKn41vaNrLc9aGWKY4brJX68QNPNhbc
 hW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aO4fss2Kmx8HXgCQ0bzR08QPyCBZELu4B0EYTyczINo=;
 b=ALLSs+Ixdr44zmqk9LsYKARc7+wk9bT8DBcdGJSGVtuqSyfhyghzQSCtnapv9S026d
 kmnLx6aQZRieKSWKMENtKxQ6QE97trM5CX+/HIQDlgf7XUMHoki0jA4eJe3V5uVFlNVi
 1dKlFV5BM3CoU1SaBfvoWICV5vcWpqOf4VC0mA5lr3H9xOZYZF5l6MPaY07CQXsdEfdE
 lQA2Kgu1bBCLvkKeHmmt25B+2RsVtw6WA3BkNOh5RrMwDOJmFw89QxPwSdIIO8WcLPaY
 hDqElR61pol+jkeRYooNBqOoFpwtPnrK3Uce811wuKcyP6ZIZ8A7GYd0wycnJWeI/Kwr
 9yaA==
X-Gm-Message-State: AOAM531hEN8xkkrjo24QH4HF8N0whbqogD9OTwEc9VOAefoA9Wp8PjcT
 Bj8atV0QzBFuoDSPhIHHeAc=
X-Google-Smtp-Source: ABdhPJxrjvgHhaZfZsKO5GvaCN6MHn5ZXO3ESedIlFsIiE8VU0hgKpTCaWJs6TA5Td/4tfHRJNRyAA==
X-Received: by 2002:a63:74e:: with SMTP id 75mr2136067pgh.452.1644417600017;
 Wed, 09 Feb 2022 06:40:00 -0800 (PST)
Received: from localhost.localdomain ([114.91.20.102])
 by smtp.gmail.com with ESMTPSA id o8sm20511586pfu.52.2022.02.09.06.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:39:59 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH net] net: phy: mediatek: remove PHY mode check on MT7531
Date: Wed,  9 Feb 2022 22:39:47 +0800
Message-Id: <20220209143948.445823-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_064002_004246_7F62AA90 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The function mt7531_phy_mode_supported in the DSA driver set supported
mode to PHY_INTERFACE_MODE_GMII instead of PHY_INTERFACE_MODE_INTERNAL
for the internal PHY, so this check breaks the PHY initialization:

mt7530 mdio-bus:00 wan (uninitialized): failed to connect to PHY: -EINVAL

Remove the check to make it work again.

Reported-by: Hauke Mehrtens <hauke@hauke-m.de>
Fixes: e40d2cca0189 ("net: phy: add MediaTek Gigabit Ethernet PHY driver")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/phy/mediatek-ge.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek-ge.c
index b7a5ae20edd5..68ee434f9dea 100644
--- a/drivers/net/phy/mediatek-ge.c
+++ b/drivers/net/phy/mediatek-ge.c
@@ -55,9 +55,6 @@ static int mt7530_phy_config_init(struct phy_device *phydev)
 
 static int mt7531_phy_config_init(struct phy_device *phydev)
 {
-	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
-		return -EINVAL;
-
 	mtk_gephy_config_init(phydev);
 
 	/* PHY link down power saving enable */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
