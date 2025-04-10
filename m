Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C2DC3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axLOXVmnrt5e6ujgCV+4/WW/JoQqDkbI0ei5W2Ow3O0=; b=dOZbr78htqtCaLl5ko42GbBf63
	xoz23NwcCbuLlCmp8IEwWrVDMQjjZzXv/ipW/hKGC2ZxJPToDDBOFMUBcoYk7RVynBFr8p+LoxRi5
	CawSMvTa0dh9T1A1tl451UCL8g9ypL9adL3kk2xg6cZWvRqZH+Ir+K3qWXeMjXLAGcVss+jbPaiEr
	zotvu8HXc3pc66e2OgNkJt7RyuSRT/W4cmgxGJF7Fs89mffK+oRQfUnTYwcXkQ475AIyicUT5E4YB
	GqknpdlwU1I0U+3/rnY49l4G6R7Gp2KK4OoqkVU9LLee8ncuUzj0pxotLAHPaHh9CYuPsqpganXeO
	13ggDO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vrF-0000000BPCn-3Il8;
	Thu, 10 Apr 2025 17:38:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uno-0000000BClt-0H5F;
	Thu, 10 Apr 2025 16:30:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so628345f8f.0;
        Thu, 10 Apr 2025 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302654; x=1744907454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axLOXVmnrt5e6ujgCV+4/WW/JoQqDkbI0ei5W2Ow3O0=;
        b=biiQyxNgH5wAiOCkbh8doNgXcBgQR9yyhmvBdDQcGgVtQWxgM3WDRkD7scOxoROc/c
         bXJsejy46/aB5K8Wn+GUTPK+9spnRNVTnh5GhtMHIHYdQyQuey1LFLRWzVztHCBmdYMd
         BbGBgcxIPfghmnGnz429c3aPX477OclFOrkS7Sk0b3IFS1PXvNNe0xhSWpVYHvqhpnWl
         4OTe7ghRlmYZN30TOQOcUdy1PYGE71dbMF5iWncX749RMdTpNDLzpbsqgAr74/cNxnZ6
         K7OUZB7vjEeaaTwQ/mmX0E5roWw0C4xCqkty6SpAcnyWmNZaswg62diE1Yao2d4T+ip7
         ZZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302654; x=1744907454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axLOXVmnrt5e6ujgCV+4/WW/JoQqDkbI0ei5W2Ow3O0=;
        b=o9N7x8b+ezxxws8Y4K/kidyvEhHSVaQHwfFrSeVFYhhKGBrr/ahPiy4TgJJXmzNhSq
         +g0MeCsIC7I9lGWO7m2wfeh+OC99hyznxGRXcRB53y6nS74+dDBhyDuGJzx+3mEDgO98
         vbIKfmAmG66JkacPJu8JTDhxU7HxztoBcTtiTj2Q3kB7DBp6fnFTfEpcJGFOKoALQx+y
         /GnfSYau3XRxuUIanMxM7k4T9HtA8zJ4HK/ZcgwWuPJyIxXVtC6hjSBfDlgpfQBh2TiU
         E3e3m5pEs+EXY4N9+KOR8T21dWUqnQLGaWq1JkFBwhpw0oCgzrPxCTHRMSm+ktel6tfU
         QSug==
X-Forwarded-Encrypted: i=1; AJvYcCV6j80udUyZeVewRRm6j55EU/uTaJKacKQF6br78WhVd4t3txOkBQd0FVqokdc7is3qb1vfb98N1nkpEJ5Zu9s=@lists.infradead.org, AJvYcCXyXNopRq+UEU3m8LI7xqP/6RRmmQ+WYBZOH94VN3ws25BWqkxHmjOcrWGx7QGUe+XeSOFK/8gKzayp8D/oJxyt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ZPbau4v/9AP5i34040+SFqZfqQzKcN0qmxAo2+8VPw6fnwwC
	NHck59T7QTi9jNUeh/EI8hBWMTEeQU9nNXb6Z1AkIG8PrfRNfAkRFxR5Jw==
X-Gm-Gg: ASbGncu2UVxV8MxFl4Ek76lA9Vh86tw4H1BcSAzV8b+wbNb50IMN1VzeO9ofO4Ic0NJ
	QSyAJNcsimwVEhF7AERZa2rL7ySnJUUHjiD5pnGAkx/7cZCZY7yDdd3cgPOalQ71pfLMFs+c/9M
	ClneA/LJnMVDa+NyqRGT0ZWS4PHLR+9zC4mX1FNbZVnU+Lg1ZJ/fIIAB9yIa4Wiu/fn7E+3tB/v
	REbJshpaDvxM+/iTDLyccfJ4RoAf5crn8g/tspt3IfnuuOAtC4OHbtJPCSH/bnzMiZWXI7u8E/r
	lL+H9Un78DhFRm3Q18eYTQ1nqFWvWVLMdfOM9emC7GI5vAyuytfMsAhyDOrJxZOL9FTMTmXUBa5
	ma9AxHgOddg==
X-Google-Smtp-Source: AGHT+IFYEtIPIXHN1PmKXXRRja4VIhg3Bfr0bEotT+71cwpTGX7+kspOZn+JoXE19bC9P/Ywz3zMQw==
X-Received: by 2002:adf:9c84:0:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-39d8fdaba5amr2282339f8f.56.1744302654265;
        Thu, 10 Apr 2025 09:30:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 1/6] net: dsa: mt7530: generalize read port stats logic
Date: Thu, 10 Apr 2025 18:30:09 +0200
Message-ID: <20250410163022.3695-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093056_143695_97734CA0 
X-CRM114-Status: GOOD (  13.41  )
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

In preparation for migration to use of standard MIB API, generalize the
read port stats logic to a dedicated function.

This will permit to manually provide the offset and size of the MIB
counter to directly access specific counter.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d70399bce5b9..85a040853194 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -789,24 +789,34 @@ mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 		ethtool_puts(&data, mt7530_mib[i].name);
 }
 
+static void
+mt7530_read_port_stats(struct mt7530_priv *priv, int port,
+		       u32 offset, u8 size, uint64_t *data)
+{
+	u32 val, reg = MT7530_PORT_MIB_COUNTER(port) + offset;
+
+	val = mt7530_read(priv, reg);
+	*data = val;
+
+	if (size == 2) {
+		val = mt7530_read(priv, reg + 4);
+		*data |= (u64)val << 32;
+	}
+}
+
 static void
 mt7530_get_ethtool_stats(struct dsa_switch *ds, int port,
 			 uint64_t *data)
 {
 	struct mt7530_priv *priv = ds->priv;
 	const struct mt7530_mib_desc *mib;
-	u32 reg, i;
-	u64 hi;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(mt7530_mib); i++) {
 		mib = &mt7530_mib[i];
-		reg = MT7530_PORT_MIB_COUNTER(port) + mib->offset;
 
-		data[i] = mt7530_read(priv, reg);
-		if (mib->size == 2) {
-			hi = mt7530_read(priv, reg + 4);
-			data[i] |= hi << 32;
-		}
+		mt7530_read_port_stats(priv, port, mib->offset, mib->size,
+				       data + i);
 	}
 }
 
-- 
2.48.1


