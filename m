Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C9FC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJixOmbyU63hr3o8Ny5bPEY6KG/MRULhsuG3NEyY2DA=; b=2fIH4BpZB+xetq
	RU28huIk9KGjUQ03Qev3o18nXJ6is0oVywTDKHuIvWe0xZxsaUQ7ETfDHAUBss8UCIplIfOvHSi8p
	3xG+6f+h6Z8awHVyvMQIePWpNqA/ldjhwOKDujvRWih/VHV/c4MjlDf/1BF/pS3fYLE+NjDoeeNeN
	3ieyRgpBawJZDhoAiXYL0C6rKNXOwNjZPdEkzQQ0lJe1M0vHMrJkLcp+FnQcVqqbSB4cgDNyvTKaO
	3C1qyX+nuz+jQNKrq/H1/di7zd8yFQD2o3MyjHvx4AnK/+RHKQ0ohAXSH3+xGV5Qz+TaCiRL5DG8+
	Ps88GE3GXBChtfytUP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprva-00B9Yl-1N;
	Fri, 21 Apr 2023 14:39:59 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtJ-00B7NP-0R;
	Fri, 21 Apr 2023 14:37:38 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso2550295a12.3;
        Fri, 21 Apr 2023 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087856; x=1684679856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJixOmbyU63hr3o8Ny5bPEY6KG/MRULhsuG3NEyY2DA=;
        b=Az8QzgGdCSu60O6ATgA/rltMAPtJHOIM/fNgqvUDwljrF188OKCwkUXZsu9TgceVlb
         XJkSkwuYk0q0LODKP0Ys/gPMEnMs9C7UjYnIRN2N2nUjxcSEfGJV5UOJaNW14e4cnTYS
         YYp2rdotxte5IvfGjycuGpQ4F0+Bt1P7PL7yLDSziXrWL+u+6Mhk9Y28soqpLcZy2kyl
         a7qeOJUJqOqXZDshLZd/zrlM0EyAayg+R+R9eZLdjHd+ki27hhuw/u3u1c3kY2DzOkpQ
         slACzNFllLRnXORAQTxHP8XqHNQ5mNJVS40wnXF5bfsNVrvW0XRlQPB711YFwXXbW8rJ
         1lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087856; x=1684679856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJixOmbyU63hr3o8Ny5bPEY6KG/MRULhsuG3NEyY2DA=;
        b=dGWn/TeNc10l85Hk64gNiN6qwng7haKqgAJmELeU/XkfbUQ8cSpF29KkM3EG4JkCxz
         Gic89FYKLEj5MLm/3k5RIUF+jTCx2koLBslxMyortXX0SzxaEDXp1KcusepnUMHDj+wp
         W2h59d8JL7jUDpTEITiCLrchQ4sCmOK7y9Mgy/JzaEilhtY4Ddq6Q00y1BOZTmW7nfbT
         U+MDRjzC82AUVGHTb5LxOWWflmXpIlZiUi1AynvaH1GBbnXYbhb9JjDWNb8qgGHWZL4Z
         /kPQp4dqyanfio5MWMD6AQ8j2XGJ7EObxDsx8Ul8WH4P4H9bnm+j8MzbdPs9n5ZL7YN0
         5JPQ==
X-Gm-Message-State: AAQBX9d9Wtky08LFlb7b3z0b6GTxgjPCGfa5vtezGo4F1uG3zC7AqpUN
	eBStF0M5wISvApyvM7vsL2s=
X-Google-Smtp-Source: AKy350Z4aXH6j521XmbeT5SJQ3g67clUrR3I/0wqCunsH6aDT41k5hSTcXbseqGcd/WUsvruZjAStw==
X-Received: by 2002:a17:906:250b:b0:94f:a309:67b9 with SMTP id i11-20020a170906250b00b0094fa30967b9mr2483806ejb.6.1682087856476;
        Fri, 21 Apr 2023 07:37:36 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:36 -0700 (PDT)
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
Subject: [RFC PATCH net-next 19/22] net: dsa: mt7530: set interrupt register only for MT7530
Date: Fri, 21 Apr 2023 17:36:45 +0300
Message-Id: <20230421143648.87889-20-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073737_248312_408F2B1F 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Setting this register related to interrupts is only needed for the MT7530
switch. Make an exclusive check to ensure this.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a66a762cb5db..ac1e3c58aaac 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2034,7 +2034,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 	}
 
 	/* This register must be set for MT7530 to properly fire interrupts */
-	if (priv->id != ID_MT7531)
+	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
 		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
 
 	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
-- 
2.37.2


