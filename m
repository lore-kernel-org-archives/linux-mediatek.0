Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9CBE784AC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTarZETHcAW0O9gfgdeOmaYr0S0MXF7s2VIEeHUmcR4=; b=wZGvBVq7stSyHRYzO3Q/napczL
	K4MOVwaUWFyfgNkMVo9XB1pmaLYRPwcvR5zfaH3ysk5AB4XWlgu/FXsptiFMHONK+EhWstQnkgywZ
	0vtLHyQwVPDJdcCQxNLg29fMsPLj8+oSomLouFfRv4qtlHvLk/1FokXGsBv45tECLZsc6a1BNLjVY
	SXWzm+pNgXN7AoLOEHMdBqAMLJzKsIYpQ54/q7S3nbEoQifz637ysn5oQ1IrQ4qxCe6HQgiOqfTxh
	UmVL9OI7PYKG7oSn3Jj/8m0K6dcU51F8xl4GOb820Qbe637VHp1C1pe1n9mG9XNhb3YGahGRB1kum
	Knjl5rmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJbD-00Cqah-28;
	Mon, 02 Oct 2023 14:08:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJb9-00CqXc-1y;
	Mon, 02 Oct 2023 14:08:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-406619b53caso26667795e9.1;
        Mon, 02 Oct 2023 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696255712; x=1696860512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTarZETHcAW0O9gfgdeOmaYr0S0MXF7s2VIEeHUmcR4=;
        b=U58yjnaFxwNaFYkjkV72OSmy8ZlEmuuRE6S0xiq3v9PNw0A/GQf4+yMam1GWTydEsx
         McBcL2qeRcJ+RP69sl1PN8hFkcvaG9B2zYOKBZ+SUPGlWEHUPZz+iWaxvBoP+5sgdZAS
         v8fnUuMquMDcoy0wpGV09iaUdhTxtoETtvQ5MUOYK7TK6TAVP0yWw9+hm+MQjgfOTkTJ
         WoeZdE54nN3L/s0tnJh9rp8vENzWSy02YUKlt0fnxZX5M+ivZ0vlCWIbPg40NmUH8mW3
         1lMGONuLkpH7NLdMLa+n1Hy/NGszQu3XlEUQi0hn01wQf3cMCm0MMxrcnG8KXrnhJRTb
         WcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255712; x=1696860512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTarZETHcAW0O9gfgdeOmaYr0S0MXF7s2VIEeHUmcR4=;
        b=wGoYsEaT2OZHcsNUMt5WqenxLqJ2fexB94ihRni+rqvkoRB/UkDhkUTzBo13GT4MKb
         3dHuDO7Kr2O+UMKlN9ZVLD8dK33OlPHZiL3ERk914a0B4d0EeucSUgH2etJi9qo9PdWR
         +w3ujL+qC7F18CFRgZtUBVtPbPe1/5CQG5PRw5k5hsPOv9uxNBSNgKypE3EcmVLoCVfc
         pO89nJd46yhDHutYYXZ3EylNs+fnG/zidYGua3CsvDGpDuzwoSi85w3829JUVSN2aY8S
         SKXABko2ce22goSezJpE33TJWdt+zBzcRKCcvG+GAWlmPXJP9qmi/diXtN+a7qyLbC2P
         wKCg==
X-Gm-Message-State: AOJu0Yw9PLoC7Bn481Lp19LYLb8QZFuHc/0wguMJFjovdNcoA84VzPNa
	lsJRxuohjEljPBgnE6O/AGQ=
X-Google-Smtp-Source: AGHT+IHTjP7xN/k5l+ale+TeCr5ZaZiwPFG0fqsQfhW/XlK6NBRW1AXXmqSYhc7YJirO93LThQiL2A==
X-Received: by 2002:a7b:ce09:0:b0:405:3dbc:8821 with SMTP id m9-20020a7bce09000000b004053dbc8821mr9371184wmc.22.1696255711367;
        Mon, 02 Oct 2023 07:08:31 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id d29-20020adfa41d000000b003197869bcd7sm23150227wra.13.2023.10.02.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:08:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Lee <igvtee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [net PATCH] net: ethernet: mediatek: disable irq before schedule napi
Date: Mon,  2 Oct 2023 16:08:05 +0200
Message-Id: <20231002140805.568-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_070835_650848_2A1BCD51 
X-CRM114-Status: GOOD (  13.61  )
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

While searching for possible refactor of napi_schedule_prep and
__napi_schedule it was notice that the mtk eth driver disable the
interrupt for rx and tx AFTER napi is scheduled.

While this is a very hard to repro case it might happen to have
situation where the interrupt is disabled and never enabled again as the
napi completes and the interrupt is enabled before.

This is caused by the fact that a napi driven by interrupt expect a
logic with:
1. interrupt received. napi prepared -> interrupt disabled -> napi
   scheduled
2. napi triggered. ring cleared -> interrupt enabled -> wait for new
   interrupt

To prevent this case, disable the interrupt BEFORE the napi is
scheduled.

Fixes: 656e705243fd ("net-next: mediatek: add support for MT7623 ethernet")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 82b51072aad8..7669b446915a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3172,8 +3172,8 @@ static irqreturn_t mtk_handle_irq_rx(int irq, void *_eth)
 
 	eth->rx_events++;
 	if (likely(napi_schedule_prep(&eth->rx_napi))) {
-		__napi_schedule(&eth->rx_napi);
 		mtk_rx_irq_disable(eth, eth->soc->txrx.rx_irq_done_mask);
+		__napi_schedule(&eth->rx_napi);
 	}
 
 	return IRQ_HANDLED;
@@ -3185,8 +3185,8 @@ static irqreturn_t mtk_handle_irq_tx(int irq, void *_eth)
 
 	eth->tx_events++;
 	if (likely(napi_schedule_prep(&eth->tx_napi))) {
-		__napi_schedule(&eth->tx_napi);
 		mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
+		__napi_schedule(&eth->tx_napi);
 	}
 
 	return IRQ_HANDLED;
-- 
2.40.1


