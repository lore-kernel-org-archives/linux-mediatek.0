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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FE0C49EA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12721613ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12721613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+ugDmkmsE6C45zut34wAGF5lDuTLF2ksJx46VOydQc=; b=1HQQVuAI0SiRdO
	BB64wHvX/aq0Xx2mOgl4V/jqpOGfejyV8lceaHaTekjU7WkWcv9xGgr/TPJ56po6w8WzUJLcmbs/9
	BbZHzk79VUnGtl6cGfqYD8ApnUmcryPSR3tZoG6RQdhI1FKQFRfpBOmwZH5SIriosi7p7S+PcKkwx
	kM+0OhEE0pfr8q58NyxD50NCW7NaGhkSMgZR2TDZrVCE1le94+Awtt2Ah2DktZfMb7hNmchwqpizZ
	JErzKxcWL4IZz9vJ322wXnlGxkHhFGC7/VKRy8qmYgbqf8JWdtAUtzyHpUVdMFxeHc3N05fE13p/9
	KkDSEl+10JGEztQXEixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luAsr-00DV6b-0I; Fri, 18 Jun 2021 09:33:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luAr9-00DTzt-CF; Fri, 18 Jun 2021 09:32:09 +0000
X-UUID: a22dc234952a46dfb52cd811ad81dd4d-20210618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=v23ec9fN0PGY0EMAHWQjY2L2AL37J+Pwoe11b6epHYQ=; 
 b=jMh1yZjOw+42gpe8VCZ+ZMXENGjME6pExu+tFUgA8hWD/sGcsGaw7uLKMp5L7xmGFYg89zRXzU6wqD9iWtniFPCKU3brMlLo71iSAIxbvdNm76/CwFLpmu+HevJrtQipEsrQ06Lw9p9aOuAF5nmF3aHYrkbKaFLxbHHn3L0vC+0=;
X-UUID: a22dc234952a46dfb52cd811ad81dd4d-20210618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 342890599; Fri, 18 Jun 2021 02:32:04 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:30:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/13] usb: mtu3: add helper to power on/down device
Date: Fri, 18 Jun 2021 17:29:16 +0800
Message-ID: <1624008558-16949-12-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 972B8BE8ECA8DE72942E0558BB0F703C69AF39A3F1661AC3B5451BE01C2F0A332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_023207_464234_395D3C3B 
X-CRM114-Status: GOOD (  11.98  )
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

Add helper to power on/down device ports and ip, it will be
used when support device suspend/resume

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/mtu3/mtu3_core.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 6d23acb4fffc..648e970d77ba 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -141,6 +141,28 @@ static void mtu3_device_disable(struct mtu3 *mtu)
 	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
 
+static void mtu3_dev_power_on(struct mtu3 *mtu)
+{
+	void __iomem *ibase = mtu->ippc_base;
+
+	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+	if (mtu->is_u3_ip)
+		mtu3_clrbits(ibase, SSUSB_U3_CTRL(0), SSUSB_U3_PORT_PDN);
+
+	mtu3_clrbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_PDN);
+}
+
+static void mtu3_dev_power_down(struct mtu3 *mtu)
+{
+	void __iomem *ibase = mtu->ippc_base;
+
+	if (mtu->is_u3_ip)
+		mtu3_setbits(ibase, SSUSB_U3_CTRL(0), SSUSB_U3_PORT_PDN);
+
+	mtu3_setbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_PDN);
+	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+}
+
 /* reset U3D's device module. */
 static void mtu3_device_reset(struct mtu3 *mtu)
 {
@@ -333,12 +355,7 @@ void mtu3_start(struct mtu3 *mtu)
 	dev_dbg(mtu->dev, "%s devctl 0x%x\n", __func__,
 		mtu3_readl(mbase, U3D_DEVICE_CONTROL));
 
-	mtu3_clrbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
-	if (mtu->is_u3_ip)
-		mtu3_clrbits(mtu->ippc_base, SSUSB_U3_CTRL(0), SSUSB_U3_PORT_PDN);
-
-	mtu3_clrbits(mtu->ippc_base, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_PDN);
-
+	mtu3_dev_power_on(mtu);
 	mtu3_csr_init(mtu);
 	mtu3_set_speed(mtu, mtu->speed);
 
@@ -360,12 +377,7 @@ void mtu3_stop(struct mtu3 *mtu)
 		mtu3_dev_on_off(mtu, 0);
 
 	mtu->is_active = 0;
-
-	if (mtu->is_u3_ip)
-		mtu3_setbits(mtu->ippc_base, SSUSB_U3_CTRL(0), SSUSB_U3_PORT_PDN);
-
-	mtu3_setbits(mtu->ippc_base, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_PDN);
-	mtu3_setbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+	mtu3_dev_power_down(mtu);
 }
 
 /* for non-ep0 */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
