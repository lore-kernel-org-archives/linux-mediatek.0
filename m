Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD9DC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 06:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U6QOa4p5DGjIW7VT0FAxsBUw54TL3D22ZXc+mN72UUw=; b=1ZYOP4PRCNUGRht1Fdw2A23194
	l3IR2esCBCJuDDlq3a4+Kj7UKmkfBARmH1nG+/TEFzpgCyeTDQtvYsO8O4W5AWpK35RDGnMJxYhqT
	FgWy7+3r/tUPzqgDw0rcGamBit1VXXpzUZReQMe89YEL/ZsQYjNcQE0pa8HIBOFgLz2dUMvA0M3De
	/NU9oNVOLUoP4XzYp+jwB2NVGrGZeP9+ckatessnrJSRpmSBlLoUokjXIrDdW0sddkbGwVWPBWwuT
	6wag4MFUF5O98YoI4oHnBHLLDRAGITdAZRothO5rQgn5yT7BjE8VT7oqEqHKzAmxjHB+vE/7HkDJ1
	Z03QCtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtKb-00000009CKj-2QT1;
	Wed, 03 Jul 2024 06:19:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtKO-00000009CIC-2cYs
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 06:18:55 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A16F33F671
	for <linux-mediatek@lists.infradead.org>; Wed,  3 Jul 2024 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1719987528;
	bh=U6QOa4p5DGjIW7VT0FAxsBUw54TL3D22ZXc+mN72UUw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DCiz2QrryBqhpqOrWh7z7BD0yAbYE5dpTEewgAefp3+LAYX6nBkT29sh5jFKe20s0
	 XsQTMezvtA3Sasx430tUZOBynuWydwxsks78YTNilncKmRsd29ARwo9c5uXyvkRmsy
	 Sor0o8mM4y8zd0Q3z5D0dt9ozcHwgnnzZLWNoblUKooAulTnN2r46tg9a6Xj7WEa8i
	 jr3XM57PtRAtF2QAz1/rY0rriPxaQ3MyZFcBo1cXZdcYKYwyAst7XvQPflKV4RchND
	 3DxabVYYeYTDedqBye1srDRWOfXuHEsnMpXy5yTzpLPEuBPEKvzWpyjd8+BEFDVIZE
	 rISup4QBbKI1A==
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-707fd74da03so5280379b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jul 2024 23:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987526; x=1720592326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6QOa4p5DGjIW7VT0FAxsBUw54TL3D22ZXc+mN72UUw=;
        b=mTuf3uFs3knbWuivbk78FLruHncY2VMmwI8h3P8uz3n0idLe9RGz02ASQLCOjnRFcj
         VX2hh7ftsCmFH9prN+pNE/HMJ3LVUBVe2Xr8vuBrtUNMNY5S82RG96SnL/otXoObFE1y
         eaaOibu1SPSLbmIlHKEHfZh9vFoVaJD1HTLdFoQSNd0n+iaXe+uYRHLZO04CIAhcqYzM
         NrK0S0cbqZ5sirLXiZywtKDLrSIGCIldarPEhQ4xFRE/Z6OJXNAmsEBBeKtXzc7pAgJx
         hepZt1T/arJa9+tSJLpifuHuPg+WJ8ze5wMPddPR1jQP4L8yVq6OlYn2aGN4VWeyDfUS
         a8gw==
X-Forwarded-Encrypted: i=1; AJvYcCUVJEDnlKZj9eUFge9heQVn+kVzzJNYq0mpcHKSIlP0LTz6dKf2p+U28oTkHpcDLW0di3KfNDsrYOY/wYZKJb1YSV9OByNFXGZhYymt6dJX+Dz4
X-Gm-Message-State: AOJu0YxhGOVUSXxkybnYK2w/om9Y0mVykiTSlHAa4ad+9+Sd7QesXc1B
	xV33sFYE3J5K7VWaV2TlVAkUKzgGWSQnHgar9At8fywTVKkjG3XwTBs41DGdy3/H+BIA5HfEScm
	Tv+fjw3ZreJcrEa8RsanbNm9rUxw8rBrK3NwMA6WlMU2ON/ci1LARD7m7+OtR4YiFLDh1Nm0wsX
	rdZaz4VyfssA==
X-Received: by 2002:a05:6a00:179e:b0:706:8e4:56a1 with SMTP id d2e1a72fcca58-70aaad608b0mr14664491b3a.18.1719987526085;
        Tue, 02 Jul 2024 23:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQC6QeXQUsDBKRVwGsKjexDIZNaCLw402fvTZemCMLNU+hjyxfH1ynCl3eSRp1HOz8hh3wqQ==
X-Received: by 2002:a05:6a00:179e:b0:706:8e4:56a1 with SMTP id d2e1a72fcca58-70aaad608b0mr14664465b3a.18.1719987525589;
        Tue, 02 Jul 2024 23:18:45 -0700 (PDT)
Received: from solution.. (125-228-254-191.hinet-ip.hinet.net. [125.228.254.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205ebbcsm9581936b3a.40.2024.07.02.23.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 23:18:45 -0700 (PDT)
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
Subject: [RESEND PATCH net] net: ethernet: mtk-star-emac: set mac_managed_pm when probing
Date: Wed,  3 Jul 2024 14:18:40 +0800
Message-ID: <20240703061840.3137496-1-jianhui.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_231853_011954_AC4875AE 
X-CRM114-Status: GOOD (  11.45  )
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
resending to add the mailing list recipient

 drivers/net/ethernet/mediatek/mtk_star_emac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 31aebeb2e285..79f8a8b72c27 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1525,6 +1525,7 @@ static int mtk_star_probe(struct platform_device *pdev)
 	struct device_node *of_node;
 	struct mtk_star_priv *priv;
 	struct net_device *ndev;
+	struct phy_device *phydev;
 	struct device *dev;
 	void __iomem *base;
 	int ret, i;
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


