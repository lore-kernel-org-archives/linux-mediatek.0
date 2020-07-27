Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EB8C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8346C20738
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FWyPUn9P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V7YgE5Ne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8346C20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tU/sCqxA7EG+O8eFXkMmfyXQVI1wyJB4QuhEpetaAt0=; b=FWyPUn9PHVM5FqqLeIXAzuBZc
	V4ryUwn7xfHZSZXmXyLwDzaJeAouplmEQJ9Rflxmvr+Sin446qScCuuYfmIeUIbEsSU0Fkqi3hKgD
	Gz8PAd1qkwYYsODylyKOvT25lHmBYzjUlrhf8N2BvgvMH78KPKjzeTL6yBfYSTOgMtnGFli31chDB
	rT+w0t6RMN0mQ6HpKz+YQ/bM73nwd+StGiZoDZkGp44PI5jzIJOhliDgaLty+nWLk3qteIaEWCXav
	oeReITp35fqa16zv02PuAswEonNWrtTA+b7+zfc3K5Fo/oEV76G6c35qe2+luhH3VHZjd/W6gX2AA
	Vh/QCh4RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxX9-0001Jn-VQ; Mon, 27 Jul 2020 07:26:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxX0-0001F3-Fc; Mon, 27 Jul 2020 07:26:45 +0000
X-UUID: 6ee2e966a14245c8971aa2c81d40cb7b-20200726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x6c9apllsraX6rv/6S+rjbkHnvqPnQsJAwjR+kPcEbE=; 
 b=V7YgE5NepMNABOjRneQAGmqaJSLYTMzm9BCgDDnyMqx9bR2AD/ji6+nD1PaHqdgIz81g6YamgS897siqayAtWJ6j3sA3D7iKRrYchh0d9E5IXBDWXcBQ+gg9/ZH4bLt0OPOHzndTJE1NG8Ksupou6c9tQyqPYgisckqau+6sLuM=;
X-UUID: 6ee2e966a14245c8971aa2c81d40cb7b-20200726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1529744953; Sun, 26 Jul 2020 23:26:45 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 00:16:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 04/11] usb: mtu3: clear interrupts status when disable
 interrupts
Date: Mon, 27 Jul 2020 15:14:53 +0800
Message-ID: <1595834101-13094-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A8C7A88285639417D4FD77E1C46961D26AEA72226E43EB7A31F8065F0DED3D7E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_032642_700920_13751C62 
X-CRM114-Status: UNSURE (   9.76  )
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When disable interrupts, will also want to clear their status,
ensure it by calling mtu3_intr_status_clear() in
mtu3_intr_disable().

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index f3ad1cc..ece5b3e 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -147,17 +147,6 @@ static void mtu3_device_reset(struct mtu3 *mtu)
 	mtu3_clrbits(ibase, U3D_SSUSB_DEV_RST_CTRL, SSUSB_DEV_SW_RST);
 }
 
-/* disable all interrupts */
-static void mtu3_intr_disable(struct mtu3 *mtu)
-{
-	void __iomem *mbase = mtu->mac_base;
-
-	/* Disable level 1 interrupts */
-	mtu3_writel(mbase, U3D_LV1IECR, ~0x0);
-	/* Disable endpoint interrupts */
-	mtu3_writel(mbase, U3D_EPIECR, ~0x0);
-}
-
 static void mtu3_intr_status_clear(struct mtu3 *mtu)
 {
 	void __iomem *mbase = mtu->mac_base;
@@ -170,6 +159,18 @@ static void mtu3_intr_status_clear(struct mtu3 *mtu)
 	mtu3_writel(mbase, U3D_LTSSM_INTR, ~0x0);
 	/* Clear speed change interrupt status */
 	mtu3_writel(mbase, U3D_DEV_LINK_INTR, ~0x0);
+	/* Clear QMU interrupt status */
+	mtu3_writel(mbase, U3D_QISAR0, ~0x0);
+}
+
+/* disable all interrupts */
+static void mtu3_intr_disable(struct mtu3 *mtu)
+{
+	/* Disable level 1 interrupts */
+	mtu3_writel(mtu->mac_base, U3D_LV1IECR, ~0x0);
+	/* Disable endpoint interrupts */
+	mtu3_writel(mtu->mac_base, U3D_EPIECR, ~0x0);
+	mtu3_intr_status_clear(mtu);
 }
 
 /* enable system global interrupt */
@@ -312,7 +313,6 @@ void mtu3_stop(struct mtu3 *mtu)
 	dev_dbg(mtu->dev, "%s\n", __func__);
 
 	mtu3_intr_disable(mtu);
-	mtu3_intr_status_clear(mtu);
 
 	if (mtu->softconnect)
 		mtu3_dev_on_off(mtu, 0);
@@ -600,7 +600,6 @@ static void mtu3_regs_init(struct mtu3 *mtu)
 
 	/* be sure interrupts are disabled before registration of ISR */
 	mtu3_intr_disable(mtu);
-	mtu3_intr_status_clear(mtu);
 
 	mtu3_csr_init(mtu);
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
