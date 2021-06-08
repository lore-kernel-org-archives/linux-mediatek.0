Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66FCC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 770DA61208
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 770DA61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psMGn9Juiqomd0iT6uP7gMmqCqDov41r6JnxelV4BzI=; b=Os9p1ufOp5bise
	e30XxpzDN/0diyecB/OxyMI5ZBVzQj45VSz9qlqUCM9tFrl3/w8MGjDpXlLi1FZ8Wovhu3UtAsxy/
	LPvzz1XGHGHK15P3Dzzr4yhLQHczZV1meIa+1Ce+y6V7tyRH9VOq/e78v98ck5QE0Z89mm4o45WeS
	cOfAHnsDHOd+HF7dr11yj8zYboQQQIhc8u04XJpIOvYUiEybY5NccMkCAEfBIjI8Bm6dFKOv295aN
	AN527DB1M0SCV88qsA234CioNdJI+rVQuhmQbCzxW0NRpWswyKrHxf5ELT8j9zDKD3WpomeaH/1Ag
	eljhMbMP58QrQhUnkI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWdd-006tyP-IM; Tue, 08 Jun 2021 07:59:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWch-006tWl-Ou; Tue, 08 Jun 2021 07:58:09 +0000
X-UUID: dd725a1b3f0d438aa705416858a72bd6-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hnx/nd/OD6UHAMozD6yOVjvhEG2eJG04fS9Nc3Rz+Po=; 
 b=sfQv0AEhHOkG0lC2O4ZmCwbdsyhsotOfRAwwKaH1CYtUwD97U7+HZ2kJf2iHEnaie6FrF3DEol1dy/JaSR0AMbKiPh5Wl6ty4bTwsZfwa4K8SWtE/zFlPlw0ab24pix83PxK6n5lOlr4932VgyKAau/pMYmMLkcs81ZZdb4N2bI=;
X-UUID: dd725a1b3f0d438aa705416858a72bd6-20210608
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 184846613; Tue, 08 Jun 2021 00:58:05 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:01 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 06/23] usb: mtu3: power down port when power down device IP
Date: Tue, 8 Jun 2021 15:57:32 +0800
Message-ID: <1623139069-8173-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_005807_830486_7A55D238 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

When power down device IP, we can also power down device port,
then power on the port again when power on device ip, it's helpful
to make device ip enter ip sleep mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index e306b93c007d..562f4357831e 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -334,6 +334,10 @@ void mtu3_start(struct mtu3 *mtu)
 		mtu3_readl(mbase, U3D_DEVICE_CONTROL));
 
 	mtu3_clrbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+	if (mtu->is_u3_ip)
+		mtu3_clrbits(mtu->ippc_base, SSUSB_U3_CTRL(0), SSUSB_U3_PORT_PDN);
+
+	mtu3_clrbits(mtu->ippc_base, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_PDN);
 
 	mtu3_csr_init(mtu);
 	mtu3_set_speed(mtu, mtu->speed);
@@ -356,6 +360,11 @@ void mtu3_stop(struct mtu3 *mtu)
 		mtu3_dev_on_off(mtu, 0);
 
 	mtu->is_active = 0;
+
+	if (mtu->is_u3_ip)
+		mtu3_setbits(mtu->ippc_base, SSUSB_U3_CTRL(0), SSUSB_U3_PORT_PDN);
+
+	mtu3_setbits(mtu->ippc_base, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_PDN);
 	mtu3_setbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
