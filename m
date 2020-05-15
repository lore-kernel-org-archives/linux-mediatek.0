Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B3FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 15:26:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B14A20671
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 15:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iObAu4iO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkqnyoBO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B14A20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gxb8YbnLCwy0Z59ghlqYfKArTySY7mhmFol8RehQey0=; b=iObAu4iO4ckJQt
	BlpZuVwlMZFZSe5ADhJgY5AvQc50o0IY7/YgPdVSi9cG3FUlySUYOJ4NY1by+mzTcuKoPa7dl9N1Z
	vWSaPZb8g/k60N43rofeHyEb2ercyqbW1CFV6pvG6SZSggPrYJfUEusQXLQGlcU/i85QAAqRt58W3
	FJWdjITeNp1A1zHItdkzfN1m6avddb5Pv5avzAJUqZtZ9FXc5hKPRMAuhHBQORppNdeT1ShpQRO0D
	jPnk/+mhShQUMx0Kd/3YytrKuM2lrKpaJWLBcQNWgRcuBWD8GTgGSaVSlTWsKoe9p5wdOetNJhFpl
	j4vktp2S+nBPzgqd7K/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZcED-0007u4-W7; Fri, 15 May 2020 15:26:25 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZcDs-0007fR-MR
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 15:26:06 +0000
Received: by mail-pf1-x444.google.com with SMTP id x15so1100825pfa.1
 for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2020 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vAR8O53cRTAqk7j0ALFOMufRLgekolkaCiBhxftm2No=;
 b=JkqnyoBOyht+GTFgTHMwOITCVXUi8fp8ONeE01PTX/LcJPnTVyTel9dp3SIjvT5qPL
 8yb815yhsCLfnOr0myOeORAxQg6mjA34vXc3IZa8orpR+63r5fPaADULe8PlRAuIBslU
 p6Jf26+/ZJAHwQ/tdgsatFay2Ovu2Qu0EcFl8GssWs5q1/JIglQ7rnGq+SXosCkvGm1I
 g7jNalg7ffWP5PGkZsRw7v9I7bQjy+3eRDPNBLA44nF97gHOlkdmcnUUdWahtb8PPtTE
 7WdtF/0AoQqCsOa2u6JT9aNVyhsPewZNd0/2VK5qPmi9TEJ42RYiH475P3ZWGVyhWsmm
 WpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vAR8O53cRTAqk7j0ALFOMufRLgekolkaCiBhxftm2No=;
 b=ClbNH9hOtwM3afK6Aw0MIZi1USJMoMCLdRmeoqqD1xFBMPfUMMzCHkFqXMryIBHmWn
 rQTszm8BRwdOIzFLBK/UL2IKYwI75p0E7+qrNzttSmeyIlU/EPG63L7EkaOWLW5JpGsE
 HWwdV5NB1kfOCTZHkEW8g34feAcasUgjUVGfkoJy03ql3Ele37vaYK8Z5NCzucsgK6lJ
 MKHN90onX/ZByyUgw4W7g5d4nw5yf4JozHqMOfGz0hPOmmYKLCuiD0JT0Jg470Z30Mdz
 2CPKx8DUh2lylSxxJ3tMDVLHOcVdHSzPbJEO11V2f2GegT0rZ9R4Ipmybmz0f/8j9Jov
 e7Rg==
X-Gm-Message-State: AOAM531+SjjK7wWQQnEzftqPRtSxdtCpQ4wJZcrJZdhT4f9BhxjkoqhC
 JeFOHnlOhaJyHRMZMCNk3c8=
X-Google-Smtp-Source: ABdhPJzTC/IOZyolbmlA50kiBsP2ldkyxN1ST18wwVqUchc91tDsc9o4eZMGeC9C/GWVTMTVgovMBw==
X-Received: by 2002:a63:1e22:: with SMTP id e34mr3755288pge.427.1589556363407; 
 Fri, 15 May 2020 08:26:03 -0700 (PDT)
Received: from example.com ([2402:f000:1:1501::7416:1fdd])
 by smtp.gmail.com with ESMTPSA id j7sm2270815pfh.154.2020.05.15.08.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 08:26:02 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next] net: dsa: mt7530: fix VLAN setup
Date: Fri, 15 May 2020 23:25:55 +0800
Message-Id: <20200515152555.6572-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_082604_768565_537F2A7A 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 riddlariddla@hotmail.com, Paul Fertser <fercerpav@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Stijn Segers <foss@volatilesystems.org>,
 Szabolcs Hubai <szab.hu@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allow DSA to add VLAN entries even if VLAN filtering is disabled, so
enabling it will not block the traffic of existent ports in the bridge

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a063d914c23f..d30542fc556a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1085,12 +1085,6 @@ mt7530_port_vlan_add(struct dsa_switch *ds, int port,
 	struct mt7530_priv *priv = ds->priv;
 	u16 vid;
 
-	/* The port is kept as VLAN-unaware if bridge with vlan_filtering not
-	 * being set.
-	 */
-	if (!dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
-		return;
-
 	mutex_lock(&priv->reg_mutex);
 
 	for (vid = vlan->vid_begin; vid <= vlan->vid_end; ++vid) {
@@ -1116,12 +1110,6 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 	struct mt7530_priv *priv = ds->priv;
 	u16 vid, pvid;
 
-	/* The port is kept as VLAN-unaware if bridge with vlan_filtering not
-	 * being set.
-	 */
-	if (!dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
-		return 0;
-
 	mutex_lock(&priv->reg_mutex);
 
 	pvid = priv->ports[port].pvid;
@@ -1235,6 +1223,7 @@ mt7530_setup(struct dsa_switch *ds)
 	 * as two netdev instances.
 	 */
 	dn = dsa_to_port(ds, MT7530_CPU_PORT)->master->dev.of_node->parent;
+	ds->configure_vlan_while_not_filtering = true;
 
 	if (priv->id == ID_MT7530) {
 		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
