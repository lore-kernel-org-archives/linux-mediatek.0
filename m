Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F313C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6850B613CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6850B613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4wRz9Oz5P6IL2B8ea0IeHMGkxeld0akq/zaWZ7daxo=; b=S7FHveUhDpkz6D
	wIEIbbwkOxrStymHOIIX+9dKqFrJcemVSzMzLWyJe4r4l7Lxfu3Z5eRaXhDlJ2OjdSSI6nkhT2pBS
	v4eIBaDQTwOJQLAMJ1fizu/vruiMCD0yIdIv0MdFHxQfmO6Pr0vlCsTK9ZtbBcE3KmTnqs+iXXjc1
	LslVDlh4ANtoJ4awi8zMpWDA4ctzEI8IwRRadltmkCDg5QIs7c0WbUkoT5u6/+BBFI3CpKVb+zdHw
	5it9KmafSIXJrodBPZ11w/a5kKdkJqQfPNY5jE1sMz/4dItOZiWVOC1cNw0fCfkl68OKFvGVBEcii
	+xFfA+TKm+H0qEw+ZRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luB4i-00Dbk1-DC; Fri, 18 Jun 2021 09:46:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luAyy-00DYoI-0k; Fri, 18 Jun 2021 09:40:14 +0000
X-UUID: 30572a8c963146f1af9c37bb0ba5cd81-20210618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Db1hYswUOQCFa0cyVKcqa3Y3YvTEk1GPHRiRlmLLau8=; 
 b=XDWE76faiUSLHoKOrDaDnh5krx3Lp0gBTC+NQugg24K67Rmm+jcXHUAK+er/rlgw+JbJzzAYe15LWeFPXBb9tytXfuUdotnTtga+8UP6unLk677iuss/sylEspoQRDIZPwuvul0+zzEDb9Ugm2BPOlhocCx3G5xgzJ7fNpL/ujI=;
X-UUID: 30572a8c963146f1af9c37bb0ba5cd81-20210618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1992839026; Fri, 18 Jun 2021 02:39:56 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:29:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/13] usb: mtu3: support option to disable usb2 ports
Date: Fri, 18 Jun 2021 17:29:13 +0800
Message-ID: <1624008558-16949-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D0738F6C56E823335DC5D90FDED16457A3AA913EF3885127647345190538F1802000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_024012_161384_9FCA653F 
X-CRM114-Status: GOOD (  17.12  )
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

Add support to disable specific usb2 host ports, it's useful when
a usb2 port is disabled on some platforms, but enabled on others
for the same SoC.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/mtu3/mtu3.h      |  4 ++++
 drivers/usb/mtu3/mtu3_host.c |  8 +++++++-
 drivers/usb/mtu3/mtu3_plat.c | 11 +++++++++--
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index bc82c7f97ad6..0ae9b33b50ea 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -228,6 +228,9 @@ struct otg_switch_mtk {
  *		host only, device only or dual-role mode
  * @u2_ports: number of usb2.0 host ports
  * @u3_ports: number of usb3.0 host ports
+ * @u2p_dis_msk: mask of disabling usb2 ports, e.g. bit0==1 to
+ *		disable u2port0, bit1==1 to disable u2port1,... etc,
+ *		but when use dual-role mode, can't disable u2port0
  * @u3p_dis_msk: mask of disabling usb3 ports, for example, bit0==1 to
  *		disable u3port0, bit1==1 to disable u3port1,... etc
  * @dbgfs_root: only used when supports manual dual-role switch via debugfs
@@ -252,6 +255,7 @@ struct ssusb_mtk {
 	bool is_host;
 	int u2_ports;
 	int u3_ports;
+	int u2p_dis_msk;
 	int u3p_dis_msk;
 	struct dentry *dbgfs_root;
 	/* usb wakeup for host mode */
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 93a1a4c11e1e..6185bac5fecf 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -155,6 +155,9 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
 
 	/* power on and enable all u2 ports */
 	for (i = 0; i < num_u2p; i++) {
+		if ((0x1 << i) & ssusb->u2p_dis_msk)
+			continue;
+
 		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
 		value &= ~(SSUSB_U2_PORT_PDN | SSUSB_U2_PORT_DIS);
 		value |= SSUSB_U2_PORT_HOST_SEL;
@@ -188,8 +191,11 @@ int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
 		mtu3_writel(ibase, SSUSB_U3_CTRL(i), value);
 	}
 
-	/* power down and disable all u2 ports */
+	/* power down and disable u2 ports except skipped ones */
 	for (i = 0; i < num_u2p; i++) {
+		if ((0x1 << i) & ssusb->u2p_dis_msk)
+			continue;
+
 		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
 		value |= SSUSB_U2_PORT_PDN;
 		value |= suspend ? 0 : SSUSB_U2_PORT_DIS;
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index c0615f6e5cce..5162b9988dde 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -225,6 +225,8 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &ssusb->u3p_dis_msk);
+	of_property_read_u32(node, "mediatek,u2p-dis-msk",
+			     &ssusb->u2p_dis_msk);
 
 	otg_sx->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(otg_sx->vbus)) {
@@ -241,6 +243,9 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		of_property_read_bool(node, "enable-manual-drd");
 	otg_sx->role_sw_used = of_property_read_bool(node, "usb-role-switch");
 
+	/* can't disable port0 when use dual-role mode */
+	ssusb->u2p_dis_msk &= ~0x1;
+
 	if (otg_sx->role_sw_used || otg_sx->manual_drd_enabled)
 		goto out;
 
@@ -253,9 +258,11 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	}
 
 out:
-	dev_info(dev, "dr_mode: %d, is_u3_dr: %d, u3p_dis_msk: %x, drd: %s\n",
-		ssusb->dr_mode, otg_sx->is_u3_drd, ssusb->u3p_dis_msk,
+	dev_info(dev, "dr_mode: %d, is_u3_dr: %d, drd: %s\n",
+		 ssusb->dr_mode, otg_sx->is_u3_drd,
 		otg_sx->manual_drd_enabled ? "manual" : "auto");
+	dev_info(dev, "u2p_dis_msk: %x, u3p_dis_msk: %x\n",
+		 ssusb->u2p_dis_msk, ssusb->u3p_dis_msk);
 
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
