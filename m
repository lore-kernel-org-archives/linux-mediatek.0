Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF07C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmRjRa2oDkXUeWxPTzRhDOzTZE3SAeKxIwHwq/ISwAk=; b=OAS/g29VS6hlHY
	YFoqbhWBbKiyCGEuPP2Mp1iFAiF7Llx0Lab6SfUoNeDRAX9smZbc3iWt2KBnVPwfSPPqQsi0a62Ji
	xZC4GWhYL3wtpC1ith9AJZKCWtpbZZ86gx8Y5ja5H3Uy+Jh8eWCo0FQKXrtIkCaRSxijDchyi+dcX
	0ctBjQYf6jYfNatsd5KtTwd7NhYij/yIiMXKcNz0soRH2/tT8I3qX/yCWqM1kACkmwCb3R78hZgie
	MFHFfzKWZrCeOecdtoKKjm3ZVdIpeqQHZScOfK76RFNcGB8UC0LwiAKJ3xM+1Vb86KMeEjgRpEuPB
	INrZrtzrC9w1qsnPObkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE6G-000WVT-0m;
	Tue, 25 Apr 2023 08:32:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4W-000V7J-1o;
	Tue, 25 Apr 2023 08:30:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so7921431a12.1;
        Tue, 25 Apr 2023 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411444; x=1685003444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmRjRa2oDkXUeWxPTzRhDOzTZE3SAeKxIwHwq/ISwAk=;
        b=DBYxGKSXdk4uA3rc4AG/6W1nPQOSSBfTQSUfvz3u+0nTc15ULzU2XtwR2YOP4zUuXB
         g9dS++jTvpO5p67Q07d0kgv7SzDm4IQ4hvGENfLo2H57sHdBeJsYsRMpW8Mw0XC8cQbW
         Stq/x6ac0sNU5tVHuVB6nC6sNIa6nERDXaWash7fmo39MQ0esUQ2bWE6Ky9VdbZkA2VJ
         cE7MUTi1Z7h1Hlbec1VbTRhrLvlok+BPOlWzrWK5h2vsszUL8svRvokAA/SJg2PEBGVg
         LtcBcBHQDcjl3qvGhE/6S0JncoFhs0mB86gcenQU2RizgrqSp8pa2toydLoG3528gEW2
         +fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411444; x=1685003444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmRjRa2oDkXUeWxPTzRhDOzTZE3SAeKxIwHwq/ISwAk=;
        b=PKOuTw/yZSATY3YHkE9xB9UJvNSQT2+rG620F/3T19THjq3EocMYj+pdenMQRUW2pE
         g5qTy0zueMkkWiABU5kl9ke7t/vai1A1EEO43BAJc4z1KvdlmJnHbu9SolnJCvM5Ivcy
         p64m8LkNxNtEWPZij6HCNlBIiOyQqUtGdFe9c0kkWIPkJpqurNcsCckSzftIICkM0+bl
         13x0TzW4VW4vugxzrIice0HGJXKgdenqmj772oKj4Ny/9Pth38YIgfTGH1FfX+mal0nt
         C18hDxftSDcge7rW3HmKkimA70U6Q9pPMmEdIB5wOE6sfFGAvCtMhSvehAFzKZyFcAd+
         yYow==
X-Gm-Message-State: AAQBX9d+m1G3BZS0IP93Hf9Oj148rweYVIKW7WgJJXxMTBO9AcycTZ1B
	xDjlwHPP58sZ/Iv3upEEmxg=
X-Google-Smtp-Source: AKy350aei+cFhuN1YP1tESRQQPsUNEL7nvZXcA6lySvdCWF8AKgLyZiUAp0rVgWehPNt7heQKfpNbA==
X-Received: by 2002:a17:906:6009:b0:94d:69e0:6098 with SMTP id o9-20020a170906600900b0094d69e06098mr13994747ejj.45.1682411444450;
        Tue, 25 Apr 2023 01:30:44 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:44 -0700 (PDT)
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
Subject: [PATCH net-next 21/24] net: dsa: mt7530: force link-down on MACs before reset on MT7530
Date: Tue, 25 Apr 2023 11:29:30 +0300
Message-Id: <20230425082933.84654-22-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013048_636064_26319994 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Force link-down on all MACs before internal reset. Let's follow suit commit
728c2af6ad8c ("net: mt7531: ensure all MACs are powered down before
reset").

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 651c5803706b..0bd38323e2b6 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2203,6 +2203,10 @@ mt7530_setup(struct dsa_switch *ds)
 		return -EINVAL;
 	}
 
+	/* Force link-down on all MACs before internal reset */
+	for (i = 0; i < MT7530_NUM_PORTS; i++)
+		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
+
 	/* Reset the switch through internal reset */
 	mt7530_write(priv, MT7530_SYS_CTRL,
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
-- 
2.37.2


