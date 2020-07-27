Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C23C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D537D2072E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uC2arGCl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tIlI/pf1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D537D2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qpIDaWh0pluba58bABqUJlmqb73wgIY5CeoRdBnUH4Q=; b=uC2arGClR/lY4/yEcy1n/xBax
	UC9jeY0cU9YMy8E3lA+w2gR/4rZhW7vseUt0Dno3TFa57auRiwRassWM8Ay+QuHVwwbXB+3nyut8D
	75fZoAk+4958QQZuOTcRBEs4m+EcEEUwCndd7fhqKox/2jyAoYrFy6i9jvz3b3nylfz42poqtUL+0
	oq9l+eHOhBHTpPEu95qRxK8f+N3GDIhFsgZns0Xm8TViIccD/hdmMA0SlyyV0NlceWxwcfnASo9nH
	kfdtziLIFHMznYQg1im6qwBvDcSlFvwC3ONyDr4WCtqDHPWHjj5HAjwlPqa16V+0Tc5+ylOnsoyL0
	brWjIhspg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxPa-00071n-F6; Mon, 27 Jul 2020 07:19:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxPQ-0006wk-Lv; Mon, 27 Jul 2020 07:18:53 +0000
X-UUID: 8f9ddceb302e442c8e64db64b0c63a3c-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vGu82nHZ1eK7p8zu/EU5mQ5CChjnL1RrS2qg9jkymsM=; 
 b=tIlI/pf1oi7pNPi2jOT0FQSnltxH8uVxAQ9QjtA43gxlLFjAajCju7+ynQYmQbjuseVeS6cefCdgOp5p3HeOyUHHtHt3ge56BKcFsg+DznYdgzrJfsMoUsrNZPxMud2SwaCOWED8gzhkaCSgjt7OcRLSHFIIUcpfmR5tECUldvs=;
X-UUID: 8f9ddceb302e442c8e64db64b0c63a3c-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1835340423; Sun, 26 Jul 2020 23:18:50 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:33 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 03/11] usb: mtu3: reinitialize CSR registers
Date: Mon, 27 Jul 2020 15:14:52 +0800
Message-ID: <1595834101-13094-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_031852_882190_51239076 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The CSR registers will be reset as default value if the
ports are disabled, so reinitialize them when the ports
are enabled again.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c | 61 +++++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 9dd0216..f3ad1cc 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -202,6 +202,36 @@ static void mtu3_intr_enable(struct mtu3 *mtu)
 	mtu3_writel(mbase, U3D_DEV_LINK_INTR_ENABLE, SSUSB_DEV_SPEED_CHG_INTR);
 }
 
+static void mtu3_set_speed(struct mtu3 *mtu);
+
+/* CSR registers will be reset to default value if port is disabled */
+static void mtu3_csr_init(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+
+	if (mtu->is_u3_ip) {
+		/* disable LGO_U1/U2 by default */
+		mtu3_clrbits(mbase, U3D_LINK_POWER_CONTROL,
+				SW_U1_REQUEST_ENABLE | SW_U2_REQUEST_ENABLE);
+		/* enable accept LGO_U1/U2 link command from host */
+		mtu3_setbits(mbase, U3D_LINK_POWER_CONTROL,
+				SW_U1_ACCEPT_ENABLE | SW_U2_ACCEPT_ENABLE);
+		/* device responses to u3_exit from host automatically */
+		mtu3_clrbits(mbase, U3D_LTSSM_CTRL, SOFT_U3_EXIT_EN);
+		/* automatically build U2 link when U3 detect fail */
+		mtu3_setbits(mbase, U3D_USB2_TEST_MODE, U2U3_AUTO_SWITCH);
+		/* auto clear SOFT_CONN when clear USB3_EN if work as HS */
+		mtu3_setbits(mbase, U3D_U3U2_SWITCH_CTRL, SOFTCON_CLR_AUTO_EN);
+	}
+
+	mtu3_set_speed(mtu);
+
+	/* delay about 0.1us from detecting reset to send chirp-K */
+	mtu3_clrbits(mbase, U3D_LINK_RESET_INFO, WTCHRP_MSK);
+	/* enable automatical HWRW from L1 */
+	mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_HRWE);
+}
+
 /* reset: u2 - data toggle, u3 - SeqN, flow control status etc */
 static void mtu3_ep_reset(struct mtu3_ep *mep)
 {
@@ -267,13 +297,7 @@ void mtu3_start(struct mtu3 *mtu)
 
 	mtu3_clrbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 
-	/*
-	 * When disable U2 port, USB2_CSR's register will be reset to
-	 * default value after re-enable it again(HS is enabled by default).
-	 * So if force mac to work as FS, disable HS function.
-	 */
-	if (mtu->max_speed == USB_SPEED_FULL)
-		mtu3_clrbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
+	mtu3_csr_init(mtu);
 
 	/* Initialize the default interrupts */
 	mtu3_intr_enable(mtu);
@@ -572,39 +596,18 @@ static void mtu3_set_speed(struct mtu3 *mtu)
 
 static void mtu3_regs_init(struct mtu3 *mtu)
 {
-
 	void __iomem *mbase = mtu->mac_base;
 
 	/* be sure interrupts are disabled before registration of ISR */
 	mtu3_intr_disable(mtu);
 	mtu3_intr_status_clear(mtu);
 
-	if (mtu->is_u3_ip) {
-		/* disable LGO_U1/U2 by default */
-		mtu3_clrbits(mbase, U3D_LINK_POWER_CONTROL,
-				SW_U1_REQUEST_ENABLE | SW_U2_REQUEST_ENABLE);
-		/* enable accept LGO_U1/U2 link command from host */
-		mtu3_setbits(mbase, U3D_LINK_POWER_CONTROL,
-				SW_U1_ACCEPT_ENABLE | SW_U2_ACCEPT_ENABLE);
-		/* device responses to u3_exit from host automatically */
-		mtu3_clrbits(mbase, U3D_LTSSM_CTRL, SOFT_U3_EXIT_EN);
-		/* automatically build U2 link when U3 detect fail */
-		mtu3_setbits(mbase, U3D_USB2_TEST_MODE, U2U3_AUTO_SWITCH);
-		/* auto clear SOFT_CONN when clear USB3_EN if work as HS */
-		mtu3_setbits(mbase, U3D_U3U2_SWITCH_CTRL, SOFTCON_CLR_AUTO_EN);
-	}
-
-	mtu3_set_speed(mtu);
+	mtu3_csr_init(mtu);
 
-	/* delay about 0.1us from detecting reset to send chirp-K */
-	mtu3_clrbits(mbase, U3D_LINK_RESET_INFO, WTCHRP_MSK);
 	/* U2/U3 detected by HW */
 	mtu3_writel(mbase, U3D_DEVICE_CONF, 0);
 	/* vbus detected by HW */
 	mtu3_clrbits(mbase, U3D_MISC_CTRL, VBUS_FRC_EN | VBUS_ON);
-	/* enable automatical HWRW from L1 */
-	mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_HRWE);
-
 	/* use new QMU format when HW version >= 0x1003 */
 	if (mtu->gen2cp)
 		mtu3_writel(mbase, U3D_QFCR, ~0x0);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
