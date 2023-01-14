Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D9C3DA78
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jan 2023 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LpAPEx2uwXMZcdizbx6d+dHqlSQ/o3INQ46HLhtyNwA=; b=M3ZU6F9y5HIeNojmr0/AQD+DRF
	ovHsAy4Yd/bCIugX5Pm6JpCE26Vx7EoJe52w8XWIOUSBdDBi5PYhuABnYClqQlMmANDfiFpaApGMC
	F6CrDVHTVDqIsTbAS7cn3858ze+cXfM1XtfkRdT4RJI9okOlda+kAQHZplLAp4DNjUWRCj02DHESM
	aejU9SqiAS61Vr4aeQNEV3xL92hYpr3d+LYYtL7fp9HTsW4SQZuwEcfkOl2vmyZTsPrgO7tFtwEKA
	hney3AuiWV+jZ0kcpcYziJlpWAPBcBaH4JinvAp6zf5N0xZH1YKzYYhs6ii6ypvJG7h54ILNddn0/
	IE7zqkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGifK-0067qK-Ma; Sat, 14 Jan 2023 15:41:54 +0000
Received: from msg-4.mailo.com ([213.182.54.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGifG-0067nm-O5; Sat, 14 Jan 2023 15:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1673710887; bh=CSbwjpVP0TI8uoR+G2gX1VxXrvkg+JX5kZeE9DaLjlM=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=LRotYzEEcWl3PUnmzk5MucPEwXn17uNTyg+SB9MlgyvsRE3GEj5G9IRdjmZujra7x
	 TbtmiQLrOQ/iEFV3UdceIa9PIeKf5SqUQSM7qbjNVz2aPd2V2pWy1chpxW7Pv4Sen1
	 fSRUzHe5LLsanHJ/sYFAQr8iqlQTPlrKRduHLtXw=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sat, 14 Jan 2023 16:41:27 +0100 (CET)
X-EA-Auth: kx0hu53F1vxsnkhWrm67IQdYuYSD3t5Tz/rdKLzii8sKxaPs1Rqg5heKbrkjIR4CdFckkbd9PpvMh2Od+C1SphO8kWje3Y1o
Date: Sat, 14 Jan 2023 21:11:22 +0530
From: Deepak R Varma <drv@mailo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>
Subject: [PATCH] drm/mediatek: dp: Remove extra semicolon
Message-ID: <Y8LNIt97qxLk8e70@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_074150_958084_53F6F309 
X-CRM114-Status: UNSURE (   8.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove unnecessary semicolon at the end of switch block closing brace.
Issue identified using semicolon Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9d085c05c49c..9da58ac5a8b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1693,7 +1693,7 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 				break;
 			default:
 				return -EINVAL;
-			};
+			}
 			continue;
 		}
 
-- 
2.34.1




