Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB498C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f8L1vudNKgvkP5IiC7LA/V+jiXwTiR2CGl/rNd3NChc=; b=aXMHrXwaiMBrsebKwAZu+gMcqR
	hPBxoiK39fEMZpF6K6m/RTkac2UFLMcFK1GP7C2l+FHYoNaK1FaL8lVYqD/ahw48QiNMBbT+h/pVP
	XMXpOQvvsm5SDScVJX4W5AqYo/ANee8SyQM555nB/4FXC1wiGw1dZyS86SJ8AinrFMV2tBA+D0EFs
	OmGQaPYIpez5qJ2Wfj1QkgpCbjZ6bGXSBCeB2R1ugGwEGLwE9DeqkQ8Sfyab+j8PDJEtQbEV5YFCN
	7ex3vN3gUpKhLa6fGEVies0CpZDPhiOJrFPW72XW1hevgD7jao0ZXW1Ctq9fd9s2crFzbk34Np6Wb
	p8k9qY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQXD6-006j7S-IK; Fri, 10 Feb 2023 17:29:20 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQXCv-006j5D-3g; Fri, 10 Feb 2023 17:29:10 +0000
Received: by mail-ej1-x62d.google.com with SMTP id p26so17719427ejx.13;
        Fri, 10 Feb 2023 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8L1vudNKgvkP5IiC7LA/V+jiXwTiR2CGl/rNd3NChc=;
        b=SUisEb0INdY6qQxg082OsELGjB4grFuSp4ezRrzYr+NowLPN4P7WEOExHG+IBsq4ZU
         FhBjlMjxA2gz5XFuELdL19F0qwk51WtvWQZHMyzFM4mh61py6JircSTD5AH2XjL5FXej
         ntnlBqtyMHQq5CytsbgKaMU6no1FbFBFnoLpBx0Xlr6kWEGMa2WGHljv6mY9hIa7ZzeW
         tKpWeQY6LQSjTUq2wFXidkHq1cXwQAf1ZQD5UHDVsADaesytDLQ8MqZsMnUVYJWLFaBm
         dPmtkOch2VMpQFmgJM/zDAAwAXhW8+oOjvzN+GhAsVK2l/5ek7VAvFP0hEquEhb5Ukbr
         v3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8L1vudNKgvkP5IiC7LA/V+jiXwTiR2CGl/rNd3NChc=;
        b=Pv61SODAAoBxeZSiHb+Lxixp+iK60ytJEHsstpu+CLnvJqmb1F2Dr8ExRwfGoyYlaE
         tWWheoU8zyLhYVBPWVvKM8wZCoq8JW0kX3Tk8Op57GBvg7LrEyMgHyCRk8SI0q+rZbUC
         gH7d7sqydWUd5DcGVjbbOxBLZ/PFlu7+PXJVe8UxsLA5VFjHJFyy/YByZHBB0DMRJG9r
         6v8wKoBjz6whjvoE4FpcKaSkIXtHRMoCTMhBCzhwo68keyc/Hp0Q6n8pn4e4Y/GPisbH
         X+B7nXWItPWDb9RnuuTr5rKKhIZj/FMmkCm3dC+hXJKLwV66RihRjcz/Cz1BOdEM3q4+
         yZPA==
X-Gm-Message-State: AO0yUKVUgSJcFVb/CIl8E4uChgLM8ULqTZGnWCh2ewttw5w0LO1txhGD
	kA33X+9FDCtOpUxLAbaB8kM=
X-Google-Smtp-Source: AK7set9jllG4EL32KZNRFeGz5GqklmGGkaV2tsT1Te4UbaEdKLFVlJ2sVqr/p9Z6ZST975z60DjcAQ==
X-Received: by 2002:a17:907:7295:b0:8af:2cc6:bf74 with SMTP id dt21-20020a170907729500b008af2cc6bf74mr11319203ejc.0.1676050144571;
        Fri, 10 Feb 2023 09:29:04 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id va29-20020a17090711dd00b0089c72982de6sm2629302ejb.160.2023.02.10.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:29:04 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: richard@routerhints.com
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
Cc: Richard van Schagen <richard@routerhints.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH net] net: dsa: mt7530: fix CPU flooding and do not set CPU association
Date: Fri, 10 Feb 2023 20:28:23 +0300
Message-Id: <20230210172822.12960-1-richard@routerhints.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_092909_175022_F06D68B4 
X-CRM114-Status: GOOD (  16.09  )
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

From: Richard van Schagen <richard@routerhints.com>

The original code only enables flooding on CPU port, on port 6, since
that's the last one set up. In doing so, it removes flooding on port 5,
which made so that, in order to communicate properly over port 5, a frame
had to be sent from a user port to the DSA master. Fix this.

Since CPU->port is forced via the DSA tag, connecting CPU to all user ports
of the switch breaks communication over VLAN tagged frames. Therefore,
remove the code that sets CPU assocation. This way, the CPU reverts to not
being connected to any port as soon as ".port_enable" is called.

[ arinc.unal@arinc9.com: Wrote subject and changelog ]

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Richard van Schagen <richard@routerhints.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3a15015bc409..b5ad4b4fc00c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -997,6 +997,7 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 	int ret;
+	u32 val;
 
 	/* Setup max capability of CPU port at first */
 	if (priv->info->cpu_port_config) {
@@ -1009,20 +1010,15 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Disable flooding by default */
-	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
-		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
+	/* Enable flooding on CPU */
+	val = mt7530_read(priv, MT7530_MFC);
+	val |= BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port));
+	mt7530_write(priv, MT7530_MFC, val);
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
 		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
 
-	/* CPU port gets connected to all user ports of
-	 * the switch.
-	 */
-	mt7530_write(priv, MT7530_PCR_P(port),
-		     PCR_MATRIX(dsa_user_ports(priv->ds)));
-
 	/* Set to fallback mode for independent VLAN learning */
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
 		   MT7530_PORT_FALLBACK_MODE);
@@ -2204,6 +2200,9 @@ mt7530_setup(struct dsa_switch *ds)
 
 	priv->p6_interface = PHY_INTERFACE_MODE_NA;
 
+	/* Disable flooding by default */
+	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK, 0);
+
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
-- 
2.37.2


