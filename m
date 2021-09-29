Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9762C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 05:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCB560E73
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 05:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BCB560E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9/oQS9BdifMfl3v4GJjcaY7avkL/WX+90ATkuQrFis=; b=i2+3UDKNYUVBVh
	ItsPDyABmSmT57EL31TEC79Ywd4f+mSVeIvgfbQR/l2wGnd4XZLRDSYtcsyMACmvS3d/3PY0ZoC5Y
	c2jU0cpUgxyYS/p0zIPgqt0I2CkhQWrRER6VMRroGhCX9SWWqjpBPXfAHZCkejNxqDqD9bnc8QE1A
	b5HzYyTRm8P7FhTxffoXM/ZzGblJQzF+Cw0HtBCkKr+UQ7Ei4C2V49gn2+BFeMyiVzYXpXUzrBT9X
	0LmTD3PxBC0JyjDXrc18QITme5w0dV2ew1R8+uJUrxThYWUqLEUIeEUPuyIgZI3lXHNUnjQxbwI3d
	iFjdAAiGPzAlUTd9YCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVRzT-00A5Lq-06; Wed, 29 Sep 2021 05:18:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVRzN-00A5Kt-CT; Wed, 29 Sep 2021 05:18:44 +0000
X-UUID: 8c709b0f843a4dd0a6b220a0f879ac88-20210928
X-UUID: 8c709b0f843a4dd0a6b220a0f879ac88-20210928
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 415469079; Tue, 28 Sep 2021 22:18:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 22:18:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 13:18:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Sep 2021 13:18:35 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: <matthias.bgg@gmail.com>, <hayeswang@realtek.com>
CC: <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>
Subject: [PATCH] r8152: stop submitting rx for -EPROTO
Date: Wed, 29 Sep 2021 13:18:12 +0800
Message-ID: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_221841_450650_7FFE865D 
X-CRM114-Status: GOOD (  10.69  )
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

When unplugging RTL8152 Fast Ethernet Adapter which is plugged
into an USB HUB, the driver would get -EPROTO for bulk transfer.
There is a high probability to get the soft/hard lockup
information if the driver continues to submit Rx before the HUB
completes the detection of all hub ports and issue the
disconnect event.

[  644.786219] net_ratelimit: 113887 callbacks suppressed
[  644.786239] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786335] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786369] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786431] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786493] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786555] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786617] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786678] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786740] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  644.786802] r8152 1-1.2.4:1.0 eth0: Rx status -71
[  645.041159] mtk-scp 10500000.scp: scp_ipi_send: IPI timeout!
[  645.041211] cros-ec-rpmsg 10500000.scp.cros-ec-rpmsg.13.-1: rpmsg send failed
[  649.183350] watchdog: BUG: soft lockup - CPU#0 stuck for 12s! [migration/0:14]

Signed-off-by: Jason-ch Chen <jason-ch.chen@mediatek.com>
---
 drivers/net/usb/r8152.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 60ba9b734055..250718f0dcb7 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -1771,6 +1771,7 @@ static void read_bulk_callback(struct urb *urb)
 		netif_device_detach(tp->netdev);
 		return;
 	case -ENOENT:
+	case -EPROTO:
 		return;	/* the urb is in unlink state */
 	case -ETIME:
 		if (net_ratelimit())
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
