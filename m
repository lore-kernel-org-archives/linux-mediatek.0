Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D526CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E6823130
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WF88Ro4Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WxB6ZU6v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2E6823130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8mVxslYdemvLxoolme+4gPNYxzdOT6DWewTmv6u9YFg=; b=WF88Ro4Z4j+/6cvVXzvuKmhNY7
	x7BnNMfSnVKlbryA46c/Bq1vqGnjucDr7BXsKtRI3hdl6aKE7UtIVz7XJpW490Xyof4pj2m80bR4D
	CwsDBnTAfJhRztKJY157erYc6e0nVOz4iJL5448Y0jS3QKJ2p5YlLzo8m03MBRM3n86hcaIXNR5Ud
	qogegnCyY65cxZy2+y2A2SY07tixiwM6Oqk2b8MY9FVoxlPPOlaP59L7ZXh5p/YmollyDU3y5p66/
	UmAGU7sdoTA/sQ6kTTGAUpI9Hngsl0+ihdiOKoEmTshNdRm5JcFDnmjNJGCKvZVfTIqoy3JExCCgB
	tnDYIYxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpmqu-0002HU-9j; Mon, 29 Jun 2020 06:01:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpmqp-0002Fk-70; Mon, 29 Jun 2020 06:01:08 +0000
X-UUID: 5b2a8672d23a475a8f7c7c579a6dc4b2-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=msGA+2u8uHVwXXiE3HOD5D+SjVVR2bJSSM1c84fftMw=; 
 b=WxB6ZU6vt3DZTmJkMgPAp4HBZLm5h5Av+FXLsGyuuF+ScJjZlVtg4vSANoFsNWL8/R/YyArMb4wAbvuGbzsGOwdVGcGeJmov8+BzyXA8jnJeU4ykzyyJNEbrLH8C5r1jAA+DSwxsu2aychxnj+Z9E3vPC0ZEmx6cfzwdyO7lbWU=;
X-UUID: 5b2a8672d23a475a8f7c7c579a6dc4b2-20200628
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1351207783; Sun, 28 Jun 2020 22:00:56 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Jun 2020 23:00:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 14:00:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 14:00:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <felipe.balbi@linux.intel.com>
Subject: [PATCH 1/2] usb: mtu3: disable USB2 LPM
Date: Mon, 29 Jun 2020 14:00:33 +0800
Message-ID: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFD1A7DBAFF4288C381CE86E58A93727F79FC91BCA8B9D438024E7EB374106BB2000:8
X-MTK: N
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A SuperSpeed device shall include the USB 2.0 extension descriptor
and shall support LPM when operating in USB 2.0 HS mode(see usb3.2
spec9.6.2.1). But we always don't support it, so disable it by
default, otherwise device will enter LPM suspend mode when
connected to Win10 system.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 9dd0216..50d6a40 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -604,6 +604,8 @@ static void mtu3_regs_init(struct mtu3 *mtu)
 	mtu3_clrbits(mbase, U3D_MISC_CTRL, VBUS_FRC_EN | VBUS_ON);
 	/* enable automatical HWRW from L1 */
 	mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_HRWE);
+	/* always reject LPM request */
+	mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_MODE(1));
 
 	/* use new QMU format when HW version >= 0x1003 */
 	if (mtu->gen2cp)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
