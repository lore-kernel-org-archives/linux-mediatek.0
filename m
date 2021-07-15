Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35F8C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A574061358
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A574061358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sprhf1pQH2oThGu3hqZpXbTtFi+IZHepEF6pgcpCzc=; b=2LSIRP3zSv/N/g
	UUOoyUeKBRe7ycGnR9KVum91v9qKGHL9gIkyGvcBw/oLOaXZlYL+wRSyGPmRg47KQWQFc/FVrHe7O
	SeFjSfj37eiSbn8bp4qLMECyKyCsibOxYsIhK1fD2HLWiQhDnHyg9LdlZXTm00+sd6Fgs2qwo32Fc
	8ZJIiunUcdhYeMvS9VTNjFZVh+jnPNZOl8mjqJsQJPguK5D84Jzpy2BE/+Nk5+Epg5yAWsimKOmE/
	pkUv9O8PEFwbBCbGfzy2yfqUBzVeoQCztrU4oNCyCTtaZBwUoQq1SLlPpdzKAy1ENLomtFRQfosg9
	2YvDav69bt5wQvoqK5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xXR-0007WJ-2z; Thu, 15 Jul 2021 09:20:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xVi-0006kR-CV; Thu, 15 Jul 2021 09:18:30 +0000
X-UUID: 87255ec4b6634a42b9c24c016811130d-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XaRZXbBg+gQFkMV/Za49Hy0q+8y9ZTgU5Luo2wntA1Y=; 
 b=DzSZ7f6H2dZbWh12jM3hU68QMKIb7ISudu/H9eo2YR6v7L0Gxc9Vlp0VXr0/4u57MggqPpQD86dHwWeEb7+dpzDRedwKeZWfHOw9AkWVphK6UF3NjFqeQ8N+Y3CZB3C975dXVchSx1om4n8BzqQ4x44syb+dU8LAuO95NiEgEhE=;
X-UUID: 87255ec4b6634a42b9c24c016811130d-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 618144019; Thu, 15 Jul 2021 02:18:21 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 02:08:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 17:08:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 17:08:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 09/13] usb: mtu3: add new helpers for host suspend/resume
Date: Thu, 15 Jul 2021 17:07:54 +0800
Message-ID: <1626340078-29111-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_021826_487057_726DB045 
X-CRM114-Status: GOOD (  17.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extract two helpers for host suspend and resume, will make it easy
to support dual-role mode suspend/resume later.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/usb/mtu3/mtu3_dr.h   |  8 ++--
 drivers/usb/mtu3/mtu3_host.c | 92 ++++++++++++++++++++++++++++++++----
 drivers/usb/mtu3/mtu3_plat.c |  4 +-
 3 files changed, 88 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
index 760fe7d69c6b..70dbf4706138 100644
--- a/drivers/usb/mtu3/mtu3_dr.h
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -16,8 +16,8 @@ int ssusb_host_init(struct ssusb_mtk *ssusb, struct device_node *parent_dn);
 void ssusb_host_exit(struct ssusb_mtk *ssusb);
 int ssusb_wakeup_of_property_parse(struct ssusb_mtk *ssusb,
 				struct device_node *dn);
-int ssusb_host_enable(struct ssusb_mtk *ssusb);
-int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend);
+int ssusb_host_resume(struct ssusb_mtk *ssusb, bool p0_skipped);
+int ssusb_host_suspend(struct ssusb_mtk *ssusb);
 void ssusb_wakeup_set(struct ssusb_mtk *ssusb, bool enable);
 
 #else
@@ -38,12 +38,12 @@ static inline int ssusb_wakeup_of_property_parse(
 	return 0;
 }
 
-static inline int ssusb_host_enable(struct ssusb_mtk *ssusb)
+static inline int ssusb_host_resume(struct ssusb_mtk *ssusb, bool p0_skipped)
 {
 	return 0;
 }
 
-static inline int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
+static inline int ssusb_host_suspend(struct ssusb_mtk *ssusb)
 {
 	return 0;
 }
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 6185bac5fecf..a0a6a181b752 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -126,7 +126,7 @@ static void host_ports_num_get(struct ssusb_mtk *ssusb)
 }
 
 /* only configure ports will be used later */
-int ssusb_host_enable(struct ssusb_mtk *ssusb)
+static int ssusb_host_enable(struct ssusb_mtk *ssusb)
 {
 	void __iomem *ibase = ssusb->ippc_base;
 	int num_u3p = ssusb->u3_ports;
@@ -171,13 +171,12 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
 	return ssusb_check_clocks(ssusb, check_clk);
 }
 
-int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
+static int ssusb_host_disable(struct ssusb_mtk *ssusb)
 {
 	void __iomem *ibase = ssusb->ippc_base;
 	int num_u3p = ssusb->u3_ports;
 	int num_u2p = ssusb->u2_ports;
 	u32 value;
-	int ret;
 	int i;
 
 	/* power down and disable u3 ports except skipped ones */
@@ -186,8 +185,7 @@ int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
 			continue;
 
 		value = mtu3_readl(ibase, SSUSB_U3_CTRL(i));
-		value |= SSUSB_U3_PORT_PDN;
-		value |= suspend ? 0 : SSUSB_U3_PORT_DIS;
+		value |= SSUSB_U3_PORT_PDN | SSUSB_U3_PORT_DIS;
 		mtu3_writel(ibase, SSUSB_U3_CTRL(i), value);
 	}
 
@@ -197,16 +195,90 @@ int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
 			continue;
 
 		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
-		value |= SSUSB_U2_PORT_PDN;
-		value |= suspend ? 0 : SSUSB_U2_PORT_DIS;
+		value |= SSUSB_U2_PORT_PDN | SSUSB_U2_PORT_DIS;
 		mtu3_writel(ibase, SSUSB_U2_CTRL(i), value);
 	}
 
 	/* power down host ip */
 	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
 
-	if (!suspend)
-		return 0;
+	return 0;
+}
+
+int ssusb_host_resume(struct ssusb_mtk *ssusb, bool p0_skipped)
+{
+	void __iomem *ibase = ssusb->ippc_base;
+	int u3p_skip_msk = ssusb->u3p_dis_msk;
+	int u2p_skip_msk = ssusb->u2p_dis_msk;
+	int num_u3p = ssusb->u3_ports;
+	int num_u2p = ssusb->u2_ports;
+	u32 value;
+	int i;
+
+	if (p0_skipped) {
+		u2p_skip_msk |= 0x1;
+		if (ssusb->otg_switch.is_u3_drd)
+			u3p_skip_msk |= 0x1;
+	}
+
+	/* power on host ip */
+	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
+
+	/* power on u3 ports except skipped ones */
+	for (i = 0; i < num_u3p; i++) {
+		if ((0x1 << i) & u3p_skip_msk)
+			continue;
+
+		value = mtu3_readl(ibase, SSUSB_U3_CTRL(i));
+		value &= ~SSUSB_U3_PORT_PDN;
+		mtu3_writel(ibase, SSUSB_U3_CTRL(i), value);
+	}
+
+	/* power on all u2 ports except skipped ones */
+	for (i = 0; i < num_u2p; i++) {
+		if ((0x1 << i) & u2p_skip_msk)
+			continue;
+
+		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
+		value &= ~SSUSB_U2_PORT_PDN;
+		mtu3_writel(ibase, SSUSB_U2_CTRL(i), value);
+	}
+
+	return 0;
+}
+
+/* here not skip port0 due to PDN can be set repeatedly */
+int ssusb_host_suspend(struct ssusb_mtk *ssusb)
+{
+	void __iomem *ibase = ssusb->ippc_base;
+	int num_u3p = ssusb->u3_ports;
+	int num_u2p = ssusb->u2_ports;
+	u32 value;
+	int ret;
+	int i;
+
+	/* power down u3 ports except skipped ones */
+	for (i = 0; i < num_u3p; i++) {
+		if ((0x1 << i) & ssusb->u3p_dis_msk)
+			continue;
+
+		value = mtu3_readl(ibase, SSUSB_U3_CTRL(i));
+		value |= SSUSB_U3_PORT_PDN;
+		mtu3_writel(ibase, SSUSB_U3_CTRL(i), value);
+	}
+
+	/* power down u2 ports except skipped ones */
+	for (i = 0; i < num_u2p; i++) {
+		if ((0x1 << i) & ssusb->u2p_dis_msk)
+			continue;
+
+		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
+		value |= SSUSB_U2_PORT_PDN;
+		mtu3_writel(ibase, SSUSB_U2_CTRL(i), value);
+	}
+
+	/* power down host ip */
+	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
 
 	/* wait for host ip to sleep */
 	ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1, value,
@@ -237,7 +309,7 @@ static void ssusb_host_cleanup(struct ssusb_mtk *ssusb)
 	if (ssusb->is_host)
 		ssusb_set_vbus(&ssusb->otg_switch, 0);
 
-	ssusb_host_disable(ssusb, false);
+	ssusb_host_disable(ssusb);
 }
 
 /*
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 5162b9988dde..a906b24723e6 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -411,7 +411,7 @@ static int __maybe_unused mtu3_suspend(struct device *dev)
 	if (!ssusb->is_host)
 		return 0;
 
-	ssusb_host_disable(ssusb, true);
+	ssusb_host_suspend(ssusb);
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
 	ssusb_wakeup_set(ssusb, true);
@@ -438,7 +438,7 @@ static int __maybe_unused mtu3_resume(struct device *dev)
 	if (ret)
 		goto phy_err;
 
-	ssusb_host_enable(ssusb);
+	ssusb_host_resume(ssusb, false);
 
 	return 0;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
