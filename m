Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A4DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 16:09:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A99523132
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 16:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0g1pBtqn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rk1F3FC/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A99523132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MJom0sYcNlqpyyGyQZ8AgQTY/qxH+gpLYPqNAn/3X7I=; b=0g1pBtqnncFxsqQhcVuykWaJ2
	mxu++8V0pgO5lHmRLF6B9P1pkogCx8MAh2lblZfK2zoLpcRieu3IlMoVZ3f4ENgOK2xmhHI5PlO5O
	KdOtZeZBjjQ5cNQzLvnnvZhsWCsX2Aik1hMGrKCaVJWeEfgcm7irpsBm8IkP83bJt41aC5P4ucIdk
	/QO1o8uOgIj8Ee/GJWVIYU7IZ1g3Gc7ug4z9akd2Q1Uy7ltHnblBjDzZv9opzIYsRTfPN0iwHWXAK
	ZagKJuC50uKg5rld0bwBfuFC/oWH/KSjKMLrJW6pGFcog2enmI0sSqvGerxaOFh7zr8nmziXeFM8X
	gxW3Iql1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3iSG-00055H-7L; Thu, 06 Aug 2020 16:09:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3iSC-00054I-SB; Thu, 06 Aug 2020 16:09:18 +0000
X-UUID: b0bd82c35dcd47558fcf7c1934c90d1b-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/jqy0uuQRkqAFWi+8OuqK5KNOGe914saELFHNwmA2bg=; 
 b=Rk1F3FC/v3b+/mKVWLTCaKYUjMbyUnWmYW35/sLkNiBznwoFea+KC1YOUs2BoVBq9WJ4vZD3zSpO8QFZoxwQvdLQbKlas/WPvYA4IAqMr0hb8WjrdQsfnVszlvddRcR/Plt3VA43f6biPa/7hiot2co30mWKCAJMrh8BeGXjUuY=;
X-UUID: b0bd82c35dcd47558fcf7c1934c90d1b-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frederic.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1411389097; Thu, 06 Aug 2020 08:08:46 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 08:58:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 23:58:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 23:58:29 +0800
From: <frederic.chen@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>
Subject: [PATCH V2,
 1/1] media: mc-device.c: change media_device_request_alloc to match
 media_ioctl_info
Date: Thu, 6 Aug 2020 23:58:22 +0800
Message-ID: <20200806155822.3772-2-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200806155822.3772-1-frederic.chen@mediatek.com>
References: <20200806155822.3772-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC723459E940B4C9E933EC8C0976E988E2BBAB82E5E89873F591BA7BC913F3372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_120917_511936_1F8ECFD2 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frederic Chen <frederic.chen@mediatek.com>

We modified the type of media_device_request_alloc()'s second
parameter from int* to void* so that it can match the interface
defined in struct media_ioctl_info.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/media/mc/mc-device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index da8088351135..6b66c2091bae 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -370,9 +370,10 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
 	return ret;
 }
 
-static long media_device_request_alloc(struct media_device *mdev,
-				       int *alloc_fd)
+static long media_device_request_alloc(struct media_device *mdev, void *arg)
 {
+	int *alloc_fd = arg;
+
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
 		return -ENOTTY;
@@ -407,7 +408,7 @@ static long copy_arg_to_user(void __user *uarg, void *karg, unsigned int cmd)
 #define MEDIA_IOC_ARG(__cmd, func, fl, from_user, to_user)		\
 	[_IOC_NR(MEDIA_IOC_##__cmd)] = {				\
 		.cmd = MEDIA_IOC_##__cmd,				\
-		.fn = (long (*)(struct media_device *, void *))func,	\
+		.fn = func,						\
 		.flags = fl,						\
 		.arg_from_user = from_user,				\
 		.arg_to_user = to_user,					\
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
