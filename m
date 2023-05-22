Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAA4C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOz3FMLGe/kTMEltMrvKqCCw9Yz4vcJ+Yr7EPAljZ3I=; b=mr039x7zY1JWj8
	+L962znGjIVGSo7ALRy7AI1k26Aqig8zsj1D72e80zxksZjfqUZu6DConWBXxLlpKi1Ew7Iin27Zl
	RKf/7n1lcDxgCwG2gsGPIGPqlbUOFdrveInvMwU4f96ywgMz31M7L4S+NSVhCjPaBaEsL5ms7VEYw
	MWACftt9FY6fPkDOs+jZYnM5ewJnBZ4vk8SRBtryJ60xMuZUU119Is6AkTjOoY9xQwIpO8IrBbJmo
	7uTU+vPl1eYpmgfOug43xTTDEftmSZERPVUpDzHiITq903g1sYrSwbjFmHainW6ieViRCcxzQXSLD
	s9tLNz/u4Ejy/f3di6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qd-006Wf5-01;
	Mon, 22 May 2023 12:41:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qW-006Wb2-1s;
	Mon, 22 May 2023 12:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oOz3FMLGe/kTMEltMrvKqCCw9Yz4vcJ+Yr7EPAljZ3I=; b=fA1M7wlesheOm1VLx+R0LTc3eC
	BTFEdVxbVoXluPMcEkZE8Z2pyG8c2vAsRAvjlrxaGnfG4rvN1xOH2ITWNoXX6i9k902xT7owH770x
	Vnp5BsNWpy8jiYL8xBvz6hO4B9rf5DSgN0oUEhRNaVFHAaXKuYLmxaOF/NfSd5hMVmtzCBYZvY2Hm
	ysOIz43oOIotasakePLHB59zsvew/ssWXXmPZdHAqDsGWEM+NcdQuw2R+D/HXux1frzdHIvTihen1
	UQ5fvW4X5LBzPtuNDV4RKVqTUcgcsnDRDo/pZIbdOo7hEVpgRr0BhMOOGvxQPzIZqfeBmq/Hja1z/
	IhIGV/zA==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sy-0021n5-1p;
	Mon, 22 May 2023 12:16:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96aae59bbd6so1123785066b.3;
        Mon, 22 May 2023 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757803; x=1687349803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOz3FMLGe/kTMEltMrvKqCCw9Yz4vcJ+Yr7EPAljZ3I=;
        b=fuq5xMh5QeKKUpQOPlVevL5RMj4Mdz0Tk5r/V+Yu3p+xhEmUXAbcglm14LFiiF9VlS
         S8kjR8VPmtEjfEZuv2ABY/Cn1QBNbs0pmScOZRUoUkY5bL3jc9EIW97xNRwrdv2e3IZh
         C+1GKM1j59M8cTCOLX5xnIm3V01MVJ86dxgj+t0daNrMcr0MfFD6hLcdqxp0wv8waVwx
         xqGzWNFwug5vjs4zIdeqAPPIYL+Z+vj37Q+Tqtaw9kd2t314MoyTxwtbtDH1r2AHyt4s
         Gl8gpcg+p+JD1dbJgx5Oc9vpulqPvih5H/D2gy8Ld/Gxz6OnUKycO7JBzzgD8aHvIoq8
         hrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757803; x=1687349803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOz3FMLGe/kTMEltMrvKqCCw9Yz4vcJ+Yr7EPAljZ3I=;
        b=kdkru/yP8NS6562G4vSKfAnOMrZxjhQsgt7heBwE9L6DKWMxM1+dtthA7pU4ymjPxI
         0XzOJNckzBu6SEJZXxYZQiC7wWSyp6bU9esYvcerNAYSJTcDNQsl8tkAvty9TxNussIu
         HFVm6nJNlF/QEUQ2OEU6D9psRicRzA++f61w7bDESHZ5DnDic7TWHA2u+zPw+id4RWMQ
         378E++mWM1eqKusHrkA2iR2PlPh6t4KXytzgQ8wSUXDeGYxtkIrR2eI1f0prcWmjR18H
         K4MLGqHcPVGckA20ZSV3xCDqhpd7kIX5BuIFA1Az1G15c8MnCrPZ+ceo7q14XkXXJQSK
         n6Jw==
X-Gm-Message-State: AC+VfDxcKpG9XzZy+udz6D7S4X/UBxoP30D+uYQClGblftWDCEZpBx0T
	B7YO9tuG5SQoWs33Cho5y2Y=
X-Google-Smtp-Source: ACHHUZ7axMa1F5LzzMgJRwk3Tc7YfoPBpyFJ6l9vcFkJW1FELcAvedTGajpVnr2j57Ka8knzp60tYw==
X-Received: by 2002:a17:907:3604:b0:94f:6d10:ad9f with SMTP id bk4-20020a170907360400b0094f6d10ad9fmr9384418ejc.42.1684757802926;
        Mon, 22 May 2023 05:16:42 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:42 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 19/30] net: dsa: mt7530: set interrupt register only for MT7530
Date: Mon, 22 May 2023 15:15:21 +0300
Message-Id: <20230522121532.86610-20-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131644_685112_74FB17D7 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Setting this register related to interrupts is only needed for the MT7530
switch. Make an exclusive check to ensure this.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 99f5da8b27be..0c261ef87bee 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2029,7 +2029,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 	}
 
 	/* This register must be set for MT7530 to properly fire interrupts */
-	if (priv->id != ID_MT7531)
+	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
 		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
 
 	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
-- 
2.39.2


