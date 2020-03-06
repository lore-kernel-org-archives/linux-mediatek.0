Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87616C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 12:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B382072A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 12:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvrZpcun";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICLXexLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B382072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jrUSBA1P6nWAveBA4uuXvJBszJjI4wUKZot82h2YpX4=; b=dvrZpcuncH4GSJ
	USadx/RZzynU0KfBWRsb4dpS7O/OISeLSEW2aY2sgCWx67keoHoXTQfhKL+uc2VPlwJ3IvAGzppHX
	QNaqFDCa42P7Lhz5nzOdgu/Qb/m1u1gFfgOchaFVxkdm2aANnD/7E9iY37+1ByINraLaDAypUThJv
	eC0eKCE7HBvAy5OQGlz2Ty0gNFTGW4Mg/DfB8UfbvWDYNtbkjvuZ8OlOcHpBrVs5N16wDMlhg93Zz
	t0dD2bVvATc24ei3N2+dikAHLReLCTXse1wR7Q5UIldM5X7s9//IS1WU0sx2NKT/5G3hK1o52F9ys
	JeayTOtfJ07kavwFMPYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jACCi-0003Fs-ME; Fri, 06 Mar 2020 12:35:48 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jACCg-0003Es-Ac
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 12:35:47 +0000
Received: by mail-pj1-x1043.google.com with SMTP id nm6so1016577pjb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2020 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDi7kWShM1qR0MQriKkvolmESeDxzEsZg+w/X7RK+JQ=;
 b=ICLXexLaaOhLKCmqNJGiL5wmXDx9cFGIW1hrgKV1Hr6drBUA5UlIX1ZbSHfJAhQlD3
 HmVIyyEADVjv1R8vXOoPuliRiq32/e43iuqrLi3nXxrRufFBMb1Bm7g84FX6NgrNbEul
 hiICwmVAyrKMCe5kgWb1D/p83BOcFldIrSiGVC7OqSWVhAuE9SjIxR9zUDSpFJJoJPEL
 cS9ade/nuzzeetNSryQ11BywP62qcL4zWER52DroeOyl69oZGUs9s90Q0gkPFDUNCxFt
 DFCld9aETMp5IkouJZoZf+kWDqNWBanJHAU1OoONR/wr8j+YZViwUdDI2cZBYlxS1hDO
 GHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDi7kWShM1qR0MQriKkvolmESeDxzEsZg+w/X7RK+JQ=;
 b=kPBRM3+MkFZ2KLp/fsvlbvxw9CegNZvpYUk2y2kgy0kiGL+3+DiklqMh0nADhNESx8
 70+HpGqH2CXWM1Qm4y839bCkeKBeqco0sM8HiKntXIRFVPX6JzKcuxDrhvoj14Sz/Xd8
 BO54Y47B9DJ8SgqKOmFM9IIuDNT/iXnNTsSSj6EHooU64wja0t85eBh6myf+ZKTCaaTL
 O98A+uE84wH9BlBiGWDJIrBS0gqRbwJFXNuAzhSSyd1nMNhhktIkeGdu+BqVgAEp48oQ
 5g+R8iV+ASaoeXmspne78umenTcAJZcsdTQHRjT6Q/P6DPO0igsGsbUALSjeyCO+CmcS
 rYuQ==
X-Gm-Message-State: ANhLgQ0CEFVr7V7MKvSo7Ul5JmQdPazxHI03AeMPt0UHQC2+p7VvJyuG
 lViX9mku1UzUvVfW7sjClU7+7dOJln4=
X-Google-Smtp-Source: ADFU+vsLmXZjrz4QTceQofT6k89yw6HwBUIel4Ogm67SyWCY40MgzM9evlSpWkH91pnIfP9TMq298A==
X-Received: by 2002:a17:90a:2230:: with SMTP id
 c45mr3466360pje.190.1583498145390; 
 Fri, 06 Mar 2020 04:35:45 -0800 (PST)
Received: from P65xSA.lan ([128.199.164.101])
 by smtp.gmail.com with ESMTPSA id x18sm24364294pfo.148.2020.03.06.04.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 04:35:44 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH] net: dsa: mt7530: add support for port mirroring
Date: Fri,  6 Mar 2020 20:35:35 +0800
Message-Id: <20200306123535.7540-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_043546_367025_89ACE004 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: opensource@vdorst.com, linux-mediatek@lists.infradead.org,
 davem@davemloft.net, frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for configuring port mirroring through the cls_matchall
classifier. We do a full ingress and/or egress capture towards a
capture port.
MT7530 supports one monitor port and multiple mirrored ports.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 60 ++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/mt7530.h |  7 +++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 022466c..0778585 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1222,6 +1222,64 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int mt7530_port_mirror_add(struct dsa_switch *ds, int port,
+				  struct dsa_mall_mirror_tc_entry *mirror,
+				  bool ingress)
+{
+	struct mt7530_priv *priv = ds->priv;
+	u32 val;
+
+	/* Check for existent entry */
+	if ((ingress ? priv->mirror_rx : priv->mirror_tx) & BIT(port))
+		return -EEXIST;
+
+	val = mt7530_read(priv, MT7530_MFC);
+
+	/* MT7530 only supports one monitor port */
+	if (val & MIRROR_EN && MIRROR_PORT(val) != mirror->to_local_port)
+		return -EEXIST;
+
+	val |= MIRROR_EN;
+	val &= ~MIRROR_MASK;
+	val |= mirror->to_local_port;
+	mt7530_write(priv, MT7530_MFC, val);
+
+	val = mt7530_read(priv, MT7530_PCR_P(port));
+	if (ingress) {
+		val |= PORT_RX_MIR;
+		priv->mirror_rx |= BIT(port);
+	} else {
+		val |= PORT_TX_MIR;
+		priv->mirror_tx |= BIT(port);
+	}
+	mt7530_write(priv, MT7530_PCR_P(port), val);
+
+	return 0;
+}
+
+static void mt7530_port_mirror_del(struct dsa_switch *ds, int port,
+				   struct dsa_mall_mirror_tc_entry *mirror)
+{
+	struct mt7530_priv *priv = ds->priv;
+	u32 val;
+
+	val = mt7530_read(priv, MT7530_PCR_P(port));
+	if (mirror->ingress) {
+		val &= ~PORT_RX_MIR;
+		priv->mirror_rx &= ~BIT(port);
+	} else {
+		val &= ~PORT_TX_MIR;
+		priv->mirror_tx &= ~BIT(port);
+	}
+	mt7530_write(priv, MT7530_PCR_P(port), val);
+
+	if (!priv->mirror_rx && !priv->mirror_tx) {
+		val = mt7530_read(priv, MT7530_MFC);
+		val &= ~MIRROR_EN;
+		mt7530_write(priv, MT7530_MFC, val);
+	}
+}
+
 static enum dsa_tag_protocol
 mtk_get_tag_protocol(struct dsa_switch *ds, int port,
 		     enum dsa_tag_protocol mp)
@@ -1611,6 +1669,8 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_vlan_prepare	= mt7530_port_vlan_prepare,
 	.port_vlan_add		= mt7530_port_vlan_add,
 	.port_vlan_del		= mt7530_port_vlan_del,
+	.port_mirror_add	= mt7530_port_mirror_add,
+	.port_mirror_del	= mt7530_port_mirror_del,
 	.phylink_validate	= mt7530_phylink_validate,
 	.phylink_mac_link_state = mt7530_phylink_mac_link_state,
 	.phylink_mac_config	= mt7530_phylink_mac_config,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index ccb9da8..5e6c778 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -36,6 +36,9 @@ enum {
 #define  CPU_EN				BIT(7)
 #define  CPU_PORT(x)			((x) << 4)
 #define  CPU_MASK			(0xf << 4)
+#define  MIRROR_EN			BIT(3)
+#define  MIRROR_PORT(x)			((x & 0x7))
+#define  MIRROR_MASK			0x7
 
 /* Registers for address table access */
 #define MT7530_ATA1			0x74
@@ -141,6 +144,8 @@ enum mt7530_stp_state {
 
 /* Register for port control */
 #define MT7530_PCR_P(x)			(0x2004 + ((x) * 0x100))
+#define  PORT_TX_MIR			BIT(9)
+#define  PORT_RX_MIR			BIT(8)
 #define  PORT_VLAN(x)			((x) & 0x3)
 
 enum mt7530_port_mode {
@@ -460,6 +465,8 @@ struct mt7530_priv {
 	phy_interface_t		p6_interface;
 	phy_interface_t		p5_interface;
 	unsigned int		p5_intf_sel;
+	u8			mirror_rx;
+	u8			mirror_tx;
 
 	struct mt7530_port	ports[MT7530_NUM_PORTS];
 	/* protect among processes for registers access*/
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
