Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F2FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2BC2072A
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K//2OsTR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uMdRaMlk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2BC2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kqc5Zo2jTj/QxALSDh+inPht0eJiB29nw1I1Z1kscew=; b=K//2OsTRzpk14SwWAEWG7t6iF
	n6j4jYriysmP76yfHurk5jiExr1R5EayvFLbwp2KEQrR9d2toeqMrjoB7WqM5iZMNr93Gnrut17Zd
	l16xuOQHsiOzbgO2vPg7LLpv1HerRM0shIrhAI+v4tyS96g4aqR4rqtXySR4t19tSdDCR6dcPNYBh
	VzVJWtjG27ywoQs9KTo+DiBpoPmqoIANPTGp4nJWsWy/ocNP93BFvFGjhqww1prYR/sr0XFME0O/H
	KCfJz/TnY6fCKGlCraVlQwXEI5WAGbYhVsHnJelKc6qckvFZNn0hy0YuCtrij0OdgnD4o7U7S8PtJ
	NxQdp2Thg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1R0Z-0005nz-Q1; Fri, 31 Jul 2020 09:07:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1R0Y-0005mZ-0p; Fri, 31 Jul 2020 09:07:19 +0000
X-UUID: 08ada40da62e44ee9df92f58641fdc00-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NjNs/L/PQBspTHCRKxQtG3j74BSnJbhVaOVg+dzczjA=; 
 b=uMdRaMlke+fLMUQG2Wr6NqndkWOmlv4NqnzDlpudBAr9LW6gXf/TPIBoytXigENMfaiPgQcdpRKs9C9SCIVXtSwTkbJHVGlXzzTpy3gSsZsPwfz6PzCp26WECpmDQEnABpDZnoYTzAhW7bd8jvM4nWKhGqClsBpG7nfecmB/47w=;
X-UUID: 08ada40da62e44ee9df92f58641fdc00-20200731
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1263654523; Fri, 31 Jul 2020 01:06:59 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 01:58:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 16:58:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 31 Jul 2020 16:58:04 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] usb: mtu3: fix panic in mtu3_gadget_disconnect()
Date: Fri, 31 Jul 2020 16:57:58 +0800
Message-ID: <1596185878-24360-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596177366-12029-1-git-send-email-macpaul.lin@mediatek.com>
References: <1596177366-12029-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_050718_327831_6481B95E 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: stable@vger.kernel.org, Macpaul Lin <macpaul.lin@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch fixes a possible issue when mtu3_gadget_stop()
already assigned NULL to mtu->gadget_driver during mtu_gadget_disconnect().

[<ffffff9008161974>] notifier_call_chain+0xa4/0x128
[<ffffff9008161fd4>] __atomic_notifier_call_chain+0x84/0x138
[<ffffff9008162ec0>] notify_die+0xb0/0x120
[<ffffff900809e340>] die+0x1f8/0x5d0
[<ffffff90080d03b4>] __do_kernel_fault+0x19c/0x280
[<ffffff90080d04dc>] do_bad_area+0x44/0x140
[<ffffff90080d0f9c>] do_translation_fault+0x4c/0x90
[<ffffff9008080a78>] do_mem_abort+0xb8/0x258
[<ffffff90080849d0>] el1_da+0x24/0x3c
[<ffffff9009bde01c>] mtu3_gadget_disconnect+0xac/0x128
[<ffffff9009bd576c>] mtu3_irq+0x34c/0xc18
[<ffffff90082ac03c>] __handle_irq_event_percpu+0x2ac/0xcd0
[<ffffff90082acae0>] handle_irq_event_percpu+0x80/0x138
[<ffffff90082acc44>] handle_irq_event+0xac/0x148
[<ffffff90082b71cc>] handle_fasteoi_irq+0x234/0x568
[<ffffff90082a8708>] generic_handle_irq+0x48/0x68
[<ffffff90082a96ac>] __handle_domain_irq+0x264/0x1740
[<ffffff90080819f4>] gic_handle_irq+0x14c/0x250
[<ffffff9008084cec>] el1_irq+0xec/0x194
[<ffffff90085b985c>] dma_pool_alloc+0x6e4/0xae0
[<ffffff9008d7f890>] cmdq_mbox_pool_alloc_impl+0xb0/0x238
[<ffffff9008d80904>] cmdq_pkt_alloc_buf+0x2dc/0x7c0
[<ffffff9008d80f60>] cmdq_pkt_add_cmd_buffer+0x178/0x270
[<ffffff9008d82320>] cmdq_pkt_perf_begin+0x108/0x148
[<ffffff9008d824d8>] cmdq_pkt_create+0x178/0x1f0
[<ffffff9008f96230>] mtk_crtc_config_default_path+0x328/0x7a0
[<ffffff90090246cc>] mtk_drm_idlemgr_kick+0xa6c/0x1460
[<ffffff9008f9bbb4>] mtk_drm_crtc_atomic_begin+0x1a4/0x1a68
[<ffffff9008e8df9c>] drm_atomic_helper_commit_planes+0x154/0x878
[<ffffff9008f2fb70>] mtk_atomic_complete.isra.16+0xe80/0x19c8
[<ffffff9008f30910>] mtk_atomic_commit+0x258/0x898
[<ffffff9008ef142c>] drm_atomic_commit+0xcc/0x108
[<ffffff9008ef7cf0>] drm_mode_atomic_ioctl+0x1c20/0x2580
[<ffffff9008ebc768>] drm_ioctl_kernel+0x118/0x1b0
[<ffffff9008ebcde8>] drm_ioctl+0x5c0/0x920
[<ffffff900863b030>] do_vfs_ioctl+0x188/0x1820
[<ffffff900863c754>] SyS_ioctl+0x8c/0xa0

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: stable@vger.kernel.org
---
Changes for v2:
  - Check mtu_gadget_driver out of spin_lock might still not work.
    We use a temporary pointer to keep the callback function.

 drivers/usb/mtu3/mtu3_gadget.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 68ea4395f871..40cb6626f496 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -840,10 +840,17 @@ void mtu3_gadget_suspend(struct mtu3 *mtu)
 /* called when VBUS drops below session threshold, and in other cases */
 void mtu3_gadget_disconnect(struct mtu3 *mtu)
 {
+	struct usb_gadget_driver *driver;
+
 	dev_dbg(mtu->dev, "gadget DISCONNECT\n");
 	if (mtu->gadget_driver && mtu->gadget_driver->disconnect) {
+		driver = mtu->gadget_driver;
 		spin_unlock(&mtu->lock);
-		mtu->gadget_driver->disconnect(&mtu->g);
+		/*
+		 * avoid kernel panic because mtu3_gadget_stop() assigned NULL
+		 * to mtu->gadget_driver.
+		 */
+		driver->disconnect(&mtu->g);
 		spin_lock(&mtu->lock);
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
