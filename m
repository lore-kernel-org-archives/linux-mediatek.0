Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A250C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M25XzE8/ZHNsBMDYVfMQXrs94X4sNByO0fz3/W69lrA=; b=zSUaOvFDMhSFql
	bA0of+ZXzdFq1eLEvRpf03z8TSBKpfOxHtBA997k/E1iHPTE6uHsaMThTq31C+OIuKoxFFmhI2X8j
	jt13A57hqyZJdtPBOuVmMqZHaOTFPMhZdq8XZwRU0/qS9hqpkJX2meHWONRU1J5tKbFEl3h8rvdEi
	HaZlHtOGC50fYnLK8LBa7eNNvR7SuknnbpaDQzv67bpLmSl3atHthusg+zq4Ji3J5HVr7HlyoLAhW
	euWlvaq5hIQhGAeATAIQrfOU0g5eV+cpkLwJUebW9a48ro8+p2V9w7YC6/j0asAWuQaoKQFDFFGI8
	1ums5P35yQVNZXDkAdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSg5-00Fy65-0L;
	Mon, 01 May 2023 12:30:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSRy-00FsT0-07;
	Mon, 01 May 2023 12:16:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-953343581a4so368590166b.3;
        Mon, 01 May 2023 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682943372; x=1685535372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M25XzE8/ZHNsBMDYVfMQXrs94X4sNByO0fz3/W69lrA=;
        b=iOzKUZ7Nk+UvH+5TVKKXYuT6nxP1tYkIMyn1H2y9d15zAT8io4bRqX25a9Vr0GxbIX
         kCr1GB2vx7a14fJeKTwPa+kIEW17/0S4sznvPfVgirkVqsDd0xBlS6z9ne50ntiC9DsX
         qMc6zUpkMEBJEoBx3hBtnhijuHOoG0GFPNwP/k9QNGYBuy69Sryj0FAM3daBA2x8VEQr
         Pv5lPxC8g6n+m237dfnWezPJIijk9DTx5+LdkDmwncFSHBoPpQ8khcYFBwHoypFyK5Ff
         /KwhbD3nMk8+o7QwnlKqZQUBTATXDXHpYE/pHoMjahdA6sTjGsw2Bg4RnysHQidA3+x9
         meOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943372; x=1685535372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M25XzE8/ZHNsBMDYVfMQXrs94X4sNByO0fz3/W69lrA=;
        b=L+jGJ9dRWj6s3VrcNGyqJhmBQEsfl/cnNsCzfEMTWnjDW43Y/9/qSkuZkTdhWWl6Au
         YKsZqMv1f6F4Fhmam7nFkXkiuLyuJjSsnbL8VMZTYIm17K+97rXdUf9qKGF5WTlUvE9E
         p/44CV8xJT2utHALMJRASc/clv2QjpN6hDiL3yYVgabLL6iFSDyhAielo1lBIjcpRv5D
         HwwTtIaQ4kiDgMQ+J+bHGPIS2iIU8QlkMeuFE0J8EdoegfbFtqDXLM4OqVqzAH4clNcE
         Kb3Ey7PI7jCW16OhuLOrv7r7s0QaA8YTaIUZSZA1pw/7NNbkW923Vk01LCJs+VrvJeN+
         VqkQ==
X-Gm-Message-State: AC+VfDxJhb91DwklMdh9FS0TN7H1dMebxkC+1T0EYY0uUm8XENugXzT2
	0/4Fd4cl2RsoQPs8x+lKjHw=
X-Google-Smtp-Source: ACHHUZ5DLOoZ9nPkikE6gez/BeGuWd2aAZywoCHBXuSN1Kd9NHZ7sQU13fLgEVRP3FCzMgntyztbSQ==
X-Received: by 2002:a17:907:846:b0:959:b745:d16f with SMTP id ww6-20020a170907084600b00959b745d16fmr12149356ejb.51.1682943371982;
        Mon, 01 May 2023 05:16:11 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id t20-20020a1709060c5400b0094ebc041e20sm14597000ejf.46.2023.05.01.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:16:11 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net 2/2] net: dsa: mt7530: fix network connectivity with multiple CPU ports
Date: Mon,  1 May 2023 15:15:38 +0300
Message-Id: <20230501121538.57968-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121538.57968-1-arinc.unal@arinc9.com>
References: <20230501121538.57968-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_051614_076122_89CEA68A 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On mt753x_cpu_port_enable() there's code that enables flooding for the CPU
port only. Since mt753x_cpu_port_enable() runs twice when both CPU ports
are enabled, port 6 becomes the only port to forward the frames to. But
port 5 is the active port, so no frames received from the user ports will
be forwarded to port 5 which breaks network connectivity.

Every bit of the BC_FFP, UNM_FFP, and UNU_FFP bits represents a port. Fix
this issue by setting the bit that corresponds to the CPU port without
overwriting the other bits.

Clear the bits beforehand only for the MT7531 switch. According to the
documents MT7621 Giga Switch Programming Guide v0.3 and MT7531 Reference
Manual for Development Board v1.0, after reset, the BC_FFP, UNM_FFP, and
UNU_FFP bits are set to 1 for MT7531, 0 for MT7530.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7d9f9563dbda..9bc54e1348cb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1002,9 +1002,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Disable flooding by default */
-	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
-		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
+	/* Enable flooding on the CPU port */
+	mt7530_set(priv, MT7530_MFC, BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
+		   UNU_FFP(BIT(port)));
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
@@ -2367,6 +2367,10 @@ mt7531_setup_common(struct dsa_switch *ds)
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
+	/* Disable flooding on all ports */
+	mt7530_clear(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK |
+		     UNU_FFP_MASK);
+
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
 		/* Disable forwarding by default on all ports */
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
-- 
2.39.2


