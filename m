Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B96C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzoT/KmMIWGXd84HSAhqqXVj6Wxc4XH+Xw/4O9lmsTc=; b=y/eoCnAaZqOpoP
	iWCRIhmVwfS97mTpPa/E1ZEEDHqzMhDZZsAQUiqXhQB4rGn40YallsMgsVDJoD546oMRI+IIVYmg+
	i6HsoFUYlUpnMCMt14k/ESOQZ/2e/COIqMO4UaCJQWahR0cGPsjapHrRDQy5L0xxmXZLJdqIveMec
	vt0lr1WMOYNh7u0Cr7CXh6lP5Nk4HyAO44U+Wp2sEY8fXAfxTPGi5SyIKXWREjSwv+yfcE27i7e/P
	lC+GEXw/mdkjX1KFb0rTDBeFymbnoB42cAJE2AKhovncj+7Us0qBiispf8HPkPN4Lpn4jdTU/taVS
	CrR//QPw6GxNYBSXHIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprvx-00B9rl-2e;
	Fri, 21 Apr 2023 14:40:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtL-00B7lG-37;
	Fri, 21 Apr 2023 14:37:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso3065275a12.1;
        Fri, 21 Apr 2023 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087858; x=1684679858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzoT/KmMIWGXd84HSAhqqXVj6Wxc4XH+Xw/4O9lmsTc=;
        b=g2RMVEYoRmsDAMKPmJikqWI/qnDOB9DlBY+ZE8gvCNAJmL69pKinZmG5PGjxPlNaat
         FTWjOESJcCtRVa42iaqGgREtxXe/2zUwhh26Nt9+tH02uyx8hD8O190M+LojA7xrxD9y
         OD3L+gKvVz1qDjeAUNtKtbdHmXt10VXP+kq71avQ0r517UivyBICqRNbV03ElgqCMdjT
         d+1DNJdpNqtywk8N9ID7u+8gE0wt7JTY2osrVaBPH+G8uWrzChl9NB2CKIkgIi7vab4g
         ELXN93NH4I42ueYQhveL8CZc68I4fI96lU+FV5FMKNXb2u6ZOcEddkK8Qip8v4GEgB0Z
         pgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087858; x=1684679858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzoT/KmMIWGXd84HSAhqqXVj6Wxc4XH+Xw/4O9lmsTc=;
        b=Iqspl3LY0e36/jQN/YIoVKL86gTA001zV0T4CRdtzbSYy0nsT1sSf4+bzKLH2GgAsw
         SW70jsraapLMcrfmfVyKoQcklpl7ErjC9E6CMB9i7GdDo8ORDh87JxojSBTdjNNeMO8o
         oil9Dcq4dHm1AIOkFt23LA8UjKRL+yJ1d2eTvQhfjUVDuwpZdprd0SQDnxEkKvwFGcHp
         btb6zSJWIFFKfXnQMEvXeNOBfLdM/1BryHJ2TgmF4AT16I6w192tvmRr00yCASNLYAEU
         pkDHTMu1IcpkZa/qxm9UuNeZ42u5HtWWnwfRZXFBGoEAXnL17lIo8icQdN5kzMK0uVoV
         XBQQ==
X-Gm-Message-State: AAQBX9dNi06xQhlHcQpycCbHR14OE0xLvog0SnlJ2b3SrR6R3n6zsAJS
	lQNfefqJ1OZt5RDRw11yIdw=
X-Google-Smtp-Source: AKy350bvezXZMnE6qY8pddEadrjpfPhij7bGJMvQiC8tz2+VfLMVSEi3Ck1X+2zbazpQV9tGb8ihvQ==
X-Received: by 2002:a17:906:cb94:b0:94a:826c:df57 with SMTP id mf20-20020a170906cb9400b0094a826cdf57mr2385888ejb.39.1682087858639;
        Fri, 21 Apr 2023 07:37:38 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:38 -0700 (PDT)
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
Subject: [RFC PATCH net-next 20/22] net: dsa: mt7530: force link-down on MACs before reset on MT7530
Date: Fri, 21 Apr 2023 17:36:46 +0300
Message-Id: <20230421143648.87889-21-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073740_388990_EBBE69A8 
X-CRM114-Status: GOOD (  11.13  )
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

Force link-down on all MACs before internal reset. Let's follow suit commit
728c2af6ad8c ("net: mt7531: ensure all MACs are powered down before
reset").

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index ac1e3c58aaac..8ece3d0d820c 100644
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


