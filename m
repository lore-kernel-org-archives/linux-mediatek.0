Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA94C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B456124C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B456124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhhpaREfqw23AO/3E3DID6Oa1tLISRPsnvj+SHkB93k=; b=kYBo09YDF+JMoR
	ODhMEw3oakBP8UudSlaX37Vg9DrOTrDiF2Dcl7BuVZTC50WpKKJJ3omIcuIL7u6TA9L12UVIpEUi2
	x4TwMr9oLKSxPqlD3jjdP5c6UlofcZwLx7KuWMkxFzgWjBCpe1yjYnb1WxMIl2uEtsFURAJ2fToUv
	s33lE2kbEadw1njsICBa3HClMNpleQaNnnY9wsXNmUwytyhmb8O7EO0tqINZrmodbxFHcNGWuwnKb
	xbhS/ExTnJ7XNS/RrkPF7tcWX3Iuam6T7Nall+YA5t9Q+GGbMg+WSgrYSSEyioapJ2Mw8GobfEwPu
	ILaMPRBqflmMAGY2Y8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWsI-0071Yv-U0; Tue, 08 Jun 2021 08:14:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmR-006xi4-3z; Tue, 08 Jun 2021 08:08:13 +0000
X-UUID: 0c7af78889144e9b8dc170854943316b-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pqp0FDMFGvm0lOMavLAL/xkCFV01dgAyusZ4JnNVhwk=; 
 b=KcpmejE19xj0nHuUA3WvJlVVoJXFupKADppeSa8MtPmdg1cnn1HL+lBqP2SbOpcM6tOjo4S0fbnC+zqUbDgUiX8ArR//leiV8bnXh1rgJJN0Q1LpHopojBfP4C8nuGkCOJh+cTsKwbajeOCWTstKbKph0Whuwt01+YcJbs4ja7o=;
X-UUID: 0c7af78889144e9b8dc170854943316b-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 952170951; Tue, 08 Jun 2021 01:08:04 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:12 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 18/23] usb: mtu3: add new helpers for host suspend/resume
Date: Tue, 8 Jun 2021 15:57:44 +0800
Message-ID: <1623139069-8173-19-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010811_241574_3BE28195 
X-CRM114-Status: GOOD (  17.04  )
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
index 93e52e6b6811..30b940ebe9b4 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -469,7 +469,7 @@ static int __maybe_unused mtu3_suspend(struct device *dev)
 	if (!ssusb->is_host)
 		return 0;
 
-	ssusb_host_disable(ssusb, true);
+	ssusb_host_suspend(ssusb);
 	ssusb_phy_power_off(ssusb);
 	ssusb_clks_disable(ssusb);
 	ssusb_wakeup_set(ssusb, true);
@@ -496,7 +496,7 @@ static int __maybe_unused mtu3_resume(struct device *dev)
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
