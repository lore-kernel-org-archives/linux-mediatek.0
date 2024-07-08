Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A26C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HbzMAQQs0beQFPhhkJhPUz49qUwPsn+ZS8RIbID3OKs=; b=4mRheWmDkfQMW1yDp293buzI1+
	tqx9+kpvDlEIEc8bPVebeduGgjooWN266u5EXJJvugGE6MEfNAYu32VdjFi8692NG28EfbWnNPzcr
	tqPqZ9X3kQfpaaQew7d1koG0qa2qII4q3JqnRfwk2A3T/2cJ80N2YqpwavCXH/fqyg1IeawVOHZZz
	Gbun74yy9eH98ri/bI4vznEQG4RnaF/Tqe7CEnvmWOGtqDt3Q6kW8NFWmwEx73+z2qgU3E5g4Jt1V
	b0YKdNamHSozuu6K0lWpWg2H30l/SfXgNnoMOEwN1gPlWESwBX8SrEUEYhwxtTTWeU90Cr+YMaGpv
	p69ithBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiEl-00000002wBz-3w9v;
	Mon, 08 Jul 2024 06:52:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiEW-00000002w8A-0BbZ
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jul 2024 06:52:22 +0000
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7F6F53FD8B
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jul 2024 06:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1720421536;
	bh=HbzMAQQs0beQFPhhkJhPUz49qUwPsn+ZS8RIbID3OKs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GM4Y2HZW8SHC3Vm6rGPVn+HMAnkgWBk2iBeNy/xmVEfJEgrwDDIKX729NbkMzyWXy
	 ZeisYI6Q08bXwH6oANqYaExVXpMfnlHY9onZJXqsuOkcGji1DrvAuUt11bUEvdoQF4
	 YRoIJnzyYLhtaIc9dYzb5p/kTgyxgIf0JfTixGCScUUxT4t5JziicxhFENuoZuCFLa
	 8/QevvnQ6fvLyIpHsym8e1snbZg91S0ZYfanx/xHo8SSJWt7VDMDlFY2DsHCIvq68j
	 fxbL2XLt152SqyKd1tNqal8tWaCoc7oDknc4QC942+i00ZzgXlGsWWlL7gM5mbbK9r
	 fxFrE3WbiAmaw==
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7035d9b8a65so1909839a34.3
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jul 2024 23:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720421535; x=1721026335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbzMAQQs0beQFPhhkJhPUz49qUwPsn+ZS8RIbID3OKs=;
        b=EC66c4AZmY0NS1+JoLSw8LQ68oMngnqALYSNOxiowQKxXflBg/LFufeIk4zg18SbYQ
         YtA9icZto0Z9W+oRdMFecb6lszwUsiM1WcKuUpXgPmcj8Rl2SZpioZvgmiUVFj3Sc63P
         iqfvoTEISSJxwwBx4M3hw5LScBk+LglWMWRqQuz8dyGIUPRTzzBy4yfJ8DRvfUI0ekHj
         KON69iteffKiZBo/HlUSBDYUvJlSSaFaVBzE2uyE2qGae9t7UnhxMSD7s4OagbnCEAbB
         qYFlJVGa/haKUySN0LT2Lkt6+Hh87ZG2wrYrFWSGpfnfh5TZVBXyT2X88GHOx0wkDJv+
         Sutw==
X-Forwarded-Encrypted: i=1; AJvYcCXqucUhZVUYNuSn30JkcF77XQD58jB5WAKp2JG6zy8kAu5+MniVfwmFc+NWAmEBfp8/hVM/jnCgtKjCNuJa6W18TknMXct+LagmQHheh/VC6WQN
X-Gm-Message-State: AOJu0Yxc1UEdEnQwCVxmTMeSaavVz+HXt1V/W5sZ/jKYchm5Vdv4Gj8i
	X43V4fU9C6LBJAQWwPcsftencCmr3fSIk8bQAhO0H6pFbhl94UC6UAe3bfFSddBAz+I8g6M3xt4
	CNFWpgPQV5MF8eLsqEgBuErucOqBp3xM8tXBiC2VpKpd1Du1Lch1fbhd7Y4cVYPeN5A0mvDpbWD
	vg99yYgxqZL4EusUhSDKzBJ3GI+w==
X-Received: by 2002:a05:6830:4121:b0:703:5be9:7eb2 with SMTP id 46e09a7af769-7035be97fb1mr10205060a34.1.1720421535284;
        Sun, 07 Jul 2024 23:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDdcN3FhbXbJhL25LGgTT9SMrkYrFZRj+Qr84KVRq4ZsIxJ4/dnZO5KZecMBqaC8bwrBJVHA==
X-Received: by 2002:a05:6830:4121:b0:703:5be9:7eb2 with SMTP id 46e09a7af769-7035be97fb1mr10205048a34.1.1720421534961;
        Sun, 07 Jul 2024 23:52:14 -0700 (PDT)
Received: from solution.. (125-228-254-191.hinet-ip.hinet.net. [125.228.254.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b15e0cefcsm4484195b3a.166.2024.07.07.23.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 23:52:14 -0700 (PDT)
From: Jian Hui Lee <jianhui.lee@canonical.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net] net: ethernet: mtk-star-emac: set mac_managed_pm when probing
Date: Mon,  8 Jul 2024 14:52:09 +0800
Message-ID: <20240708065210.4178980-1-jianhui.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_235220_700822_87C8364B 
X-CRM114-Status: GOOD (  11.87  )
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

The below commit introduced a warning message when phy state is not in
the states: PHY_HALTED, PHY_READY, and PHY_UP.
commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")

mtk-star-emac doesn't need mdiobus suspend/resume. To fix the warning
message during resume, indicate the phy resume/suspend is managed by the
mac when probing.

Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
---
v2: apply reverse x-mas tree order declaration

v1: https://lore.kernel.org/netdev/20240703061840.3137496-1-jianhui.lee@canonical.com/

 drivers/net/ethernet/mediatek/mtk_star_emac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 31aebeb2e285..25989c79c92e 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1524,6 +1524,7 @@ static int mtk_star_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node;
 	struct mtk_star_priv *priv;
+	struct phy_device *phydev;
 	struct net_device *ndev;
 	struct device *dev;
 	void __iomem *base;
@@ -1649,6 +1650,12 @@ static int mtk_star_probe(struct platform_device *pdev)
 	netif_napi_add(ndev, &priv->rx_napi, mtk_star_rx_poll);
 	netif_napi_add_tx(ndev, &priv->tx_napi, mtk_star_tx_poll);
 
+	phydev = of_phy_find_device(priv->phy_node);
+	if (phydev) {
+		phydev->mac_managed_pm = true;
+		put_device(&phydev->mdio.dev);
+	}
+
 	return devm_register_netdev(dev, ndev);
 }
 
-- 
2.43.0


