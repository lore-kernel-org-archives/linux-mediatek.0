Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A54AC4743D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0800C6128D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0800C6128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NbTU/BirMgCxcTqROE341Kyjpp4wtT3BbD7UAEV+EM=; b=Ic64xh4azHwIMe
	pHEhrawV4kcD2EcMMVyH6UkPh2vfDigP/b+IytKK688PFNzpUzwaOrN6fPzLtfyq1RW6Fn243WcxU
	gl8DZHrRyohzjs5RPapoK7GIhL3d+n1suC0fuHnv+ukiZAnjuMSOMBaD/3Rzmjsq8XcV+tOvv955D
	kfTp/sRZsiE3t2vwRipyKwR2ws/R9krKVOsqa8gKJUQl2poI0Vk4skad/x952of6lGPdVZX6/1yz7
	w8qn8w0ukkF4RAhQjgBWgUe+OhXacoQItV74W5JtX9fIqFhksduZSEnRDpUE10neB27gftsKcyMRv
	v9CgCwG23uXIQpMXAVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWxE-0073xD-Pi; Tue, 08 Jun 2021 08:19:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmX-006xiH-2g; Tue, 08 Jun 2021 08:08:18 +0000
X-UUID: e9a6ff9f2a8e4f6a9245a645f74ce600-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wkDMDc8gluX3Qou6XHBWRG4h4oRBWIyuB1a/kjGGw6I=; 
 b=oLFPQUu9TthzT/72A97/Gmr43nPxtikX9EuIM0WhQJO25Yh/LkTuEf1HqJydCGgr206ZIRXj8H0S+XupMp4psWVMFEctyY6Lyaxw8WEHA1hanL5LYehFGZwrViFO4LLWrOb8FMJEYkJAv9aw9ArHLq1GLRT8WnL5dTbvG5PInZY=;
X-UUID: e9a6ff9f2a8e4f6a9245a645f74ce600-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 752193440; Tue, 08 Jun 2021 01:08:11 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:08 +0800
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
Subject: [PATCH 13/23] usb: mtu3: rebuild role switch get/set hooks
Date: Tue, 8 Jun 2021 15:57:39 +0800
Message-ID: <1623139069-8173-14-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010817_187756_6A923153 
X-CRM114-Status: GOOD (  11.09  )
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

Use common helper ssusb_set_mode() to do role switch instead
of manual switch helper;
Remove unnecessary local variable when get role status

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index cf9e5b59a77e..318fbc618137 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -256,13 +256,9 @@ void ssusb_set_force_mode(struct ssusb_mtk *ssusb,
 static int ssusb_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct ssusb_mtk *ssusb = usb_role_switch_get_drvdata(sw);
-	bool to_host = false;
-
-	if (role == USB_ROLE_HOST)
-		to_host = true;
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
-	if (to_host ^ ssusb->is_host)
-		ssusb_mode_switch(ssusb, to_host);
+	ssusb_set_mode(otg_sx, role);
 
 	return 0;
 }
@@ -270,11 +266,8 @@ static int ssusb_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 static enum usb_role ssusb_role_sw_get(struct usb_role_switch *sw)
 {
 	struct ssusb_mtk *ssusb = usb_role_switch_get_drvdata(sw);
-	enum usb_role role;
-
-	role = ssusb->is_host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	return role;
+	return ssusb->is_host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
 }
 
 static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
