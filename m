Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E430C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y7VIwiwR8mYFvMXmw8WabjmcLf41P6ODn3sZ1KC//g=; b=CxooPjqoNXIJDY5K09GhsOtHSd
	tiRxZ1nYvfrJHpkz8e3+8IzMrdFnEfMl2zB4sfv5+S+azwniwNnt5cvYUH42BP+vNwS9+GR+in0Ku
	g5pBV4yrq/qnYIfXzO90W8O3V+3gIgsmT0fxRdlnUmeFVVBkqijyMqgJMiHDMNX8G6iqK3ICA29Gu
	XiVdus0ObeSx3FJNpnUBgaBWvpEZokR/JJ0J4HtsN0PdiTBi3uIWUm3l8wRiA6iK6+bbNfxWHnIde
	EVrxU67LqGv+GCO00Hsb3Av4KFWjmY5BPIY8jwIIHkDArRqiY+59EIbi+6pazjYdRDouy0OR5Kbsa
	Qt/55ILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKpJ-00ADtx-36;
	Mon, 20 Mar 2023 19:05:49 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKp6-00ADo9-2B;
	Mon, 20 Mar 2023 19:05:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id cn12so5238829edb.4;
        Mon, 20 Mar 2023 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679339133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Y7VIwiwR8mYFvMXmw8WabjmcLf41P6ODn3sZ1KC//g=;
        b=Ke9n3tf24nDhytBbM5nKug+UhgUHofhXF6YpmH8LkLRMt2uoapYyPdQCvHrRpXk6KE
         aOiUDfl7n4Y21fozpsvFbY0l1InVhsZdNNT87DjZDi+I+kGnpI1BGeVx0zAhtkIGKEY4
         YNnd9fvpL5QWUgNaxNrsO18qChp5dB10qq4jNziDFPRpS6dSEdJJGyogcn4CkkksJhvM
         fvNWZlapv6X7aYC5i9tbEuwagNxoNuvqa1mTSEE0hzngeLk1f2iOo8pKrCrtBEwSuH1b
         Q7KOlpNHlsaEV7j69eDrbvmwVm8d+ka6yqF7WbN8t7vBUa3Wv8fElUOEAygc+yXw2a/0
         B+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679339133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Y7VIwiwR8mYFvMXmw8WabjmcLf41P6ODn3sZ1KC//g=;
        b=hXb+yBGrVyEKsTHpKaztFglvqrYH3zU9jnAgLwVF/zLqXjZJJ/JsX3sjpoJr9ZGs8/
         udIQh9VWLe3T987q92gtKaBQbyuQIqtZsUV9iYEy7/btu4MHAuo8wLFM3S2SmYQNxqlT
         FWBpXa2UU81mxQ3YXjMuD9/+pdnfzp1KJ+XJ8NCNdFzTd1fIyXYDN1qrHpqVZV77ScxZ
         Y2ysbKrEgAzUrvyH4h/YtyV8hoM6CbRiU+u04TyvDZZbF3DSjddlMZz3rBMNHrkMzRQE
         eVinZ2F+3vpxwJDmhd6jWGw1+fgLC19XST/GyLYZABCcpIxMvWxt0qstcrWozgAF163I
         CSPg==
X-Gm-Message-State: AO0yUKWFtrB0zU1bogLIMGAQ4SfjRM8XLJIiykBsULgTH6o0D3+xzNQi
	GotFcTf46u4AvgJcFBYTCAo=
X-Google-Smtp-Source: AK7set/rFIX3ueZxLx34fqzCZdEqcOjqOw7rlu8tPXk89/wUsmLyw853TaLRd/DB8qbKg5Ps65b/tA==
X-Received: by 2002:a17:906:3b12:b0:88a:1ea9:a5ea with SMTP id g18-20020a1709063b1200b0088a1ea9a5eamr88426ejf.65.1679339133426;
        Mon, 20 Mar 2023 12:05:33 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id hy22-20020a1709068a7600b008e53874f8d8sm4717848ejc.180.2023.03.20.12.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 12:05:32 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 3/3] net: dsa: mt7530: move setting ssc_delta to PHY_INTERFACE_MODE_TRGMII case
Date: Mon, 20 Mar 2023 22:05:20 +0300
Message-Id: <20230320190520.124513-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320190520.124513-1-arinc.unal@arinc9.com>
References: <20230320190520.124513-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_120536_712959_8714301B 
X-CRM114-Status: GOOD (  11.33  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Move setting the ssc_delta variable to under the PHY_INTERFACE_MODE_TRGMII
case as it's only needed when trgmii is used.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8831bd409a40..02410ac439b7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -441,6 +441,10 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		break;
 	case PHY_INTERFACE_MODE_TRGMII:
 		trgint = 1;
+		if (xtal == HWTRAP_XTAL_25MHZ)
+			ssc_delta = 0x57;
+		else
+			ssc_delta = 0x87;
 		if (priv->id == ID_MT7621) {
 			/* PLL frequency: 150MHz: 1.2GBit */
 			if (xtal == HWTRAP_XTAL_40MHZ)
@@ -460,11 +464,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		return -EINVAL;
 	}
 
-	if (xtal == HWTRAP_XTAL_25MHZ)
-		ssc_delta = 0x57;
-	else
-		ssc_delta = 0x87;
-
 	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
 		   P6_INTF_MODE(trgint));
 
-- 
2.37.2


