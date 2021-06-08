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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5065C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A15C06128B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A15C06128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vgiN6VlyQyV/0vf7n+RvYe/ig4L8esYRA6ZPSndWQ0=; b=U/2mA99lrUFzdG
	/x3f3/TCjLtW18cySP+AT+egaCrufViq6OdR70bsgoJe94+qtRWckX07n6fV4MeDAJMKVJoAWD8bZ
	Y35lf1139Pw1dnhz/p48akoKCQRuuTYlX5Z8IRDAe/vBTmCETw2zOLwVLPLreVWz1rBdH4LYmS7E2
	rmapxv3VVJ1QkenWfm3snFG2ITht5K2UT1yvzRX/JtX9blXDEgqMsr7WjcHJwcOYC8800TzexM/Bl
	7LB7kbeFNyA0qfICPkou50Lmt0cmphlrGCMhcZ5/OJJzrKyJMRjibEc/OqJfeKkqFu29qDs6Qrceb
	jGUSaZafMv0sp7ezGo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWxI-0073yR-DX; Tue, 08 Jun 2021 08:19:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmX-006xi4-9K; Tue, 08 Jun 2021 08:08:19 +0000
X-UUID: 8d0f31afdf414961b65660cc75fa8586-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OIAbqVypUKKdWaTrO69Oo10OPCcMBSVlPLZnTYcwKFI=; 
 b=cc2Bw1hYuVWIgPmHp6MDDnOBXpjPLdmal3DII7HgVTjhg0qhBgwOoYZBbs2xypbpXcAkSnvl8XkcMFJEl/AGL9+konQ8DoYpteUr4Yyc9dYMATJHUHfQsuuCfxapsNFxafQYEhVjTwYNdsgIVEgVL1dNurVijMkWzxSTkL6hMXQ=;
X-UUID: 8d0f31afdf414961b65660cc75fa8586-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2105077857; Tue, 08 Jun 2021 01:08:11 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 12/23] usb: mtu3: use force mode for dual role switch
Date: Tue, 8 Jun 2021 15:57:38 +0800
Message-ID: <1623139069-8173-13-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010817_414766_22180E0E 
X-CRM114-Status: GOOD (  12.44  )
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

Force IDDIG status for all three ways of dual role switch, this
is needed when use Type-C to switch mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_dr.c   | 10 +++-------
 drivers/usb/mtu3/mtu3_host.c |  6 +-----
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 486d26a366b8..cf9e5b59a77e 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -148,12 +148,14 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 	switch (desired_role) {
 	case USB_ROLE_HOST:
+		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_HOST);
 		mtu3_stop(mtu);
 		switch_port_to_host(ssusb);
 		ssusb_set_vbus(otg_sx, 1);
 		ssusb->is_host = true;
 		break;
 	case USB_ROLE_DEVICE:
+		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_DEVICE);
 		ssusb->is_host = false;
 		ssusb_set_vbus(otg_sx, 0);
 		switch_port_to_device(ssusb);
@@ -225,13 +227,7 @@ void ssusb_mode_switch(struct ssusb_mtk *ssusb, int to_host)
 {
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
-	if (to_host) {
-		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_HOST);
-		ssusb_set_mode(otg_sx, USB_ROLE_HOST);
-	} else {
-		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_DEVICE);
-		ssusb_set_mode(otg_sx, USB_ROLE_DEVICE);
-	}
+	ssusb_set_mode(otg_sx, to_host ? USB_ROLE_HOST : USB_ROLE_DEVICE);
 }
 
 void ssusb_set_force_mode(struct ssusb_mtk *ssusb,
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 0a8cd446cf1b..93a1a4c11e1e 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -213,8 +213,6 @@ int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
 
 static void ssusb_host_setup(struct ssusb_mtk *ssusb)
 {
-	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
-
 	host_ports_num_get(ssusb);
 
 	/*
@@ -222,9 +220,7 @@ static void ssusb_host_setup(struct ssusb_mtk *ssusb)
 	 * if support OTG, gadget driver will switch port0 to device mode
 	 */
 	ssusb_host_enable(ssusb);
-
-	if (otg_sx->manual_drd_enabled)
-		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_HOST);
+	ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_HOST);
 
 	/* if port0 supports dual-role, works as host mode by default */
 	ssusb_set_vbus(&ssusb->otg_switch, 1);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
