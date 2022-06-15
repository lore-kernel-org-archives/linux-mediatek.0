Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7170C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 01:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ux+oUqq7N+aqPs4fKh7jQNghV2m7i4m7H2rD3HkyHrw=; b=Yn1eOdRA349Fmz
	WN+71Y1hoIYZG6ZHvj968loKZUkXTCnAXhD0XKugsRYzyziK+Vi4xY5Hm3lD2I71VFBrZvLwOSjYi
	6kOe0myGfWUd2+lT0S+fMPicIHXhTnMzHWzyKmZYoxcWRrNHxC3x60763LCSaP0HbRIlU3V4wjQZ0
	POVBPQrZV5XDgDb0J1CIAUI0DUBg/SEQxSd4cwyk/35v2xEHD6MprcxwwSfDBeA5B5us+g/Tx9HTM
	4d6+FwFQDYrI+2DMCjneD0Jn/csuGeRoau/8McgB7dktgXX2Y1OaFTRQUlfnepZ4qtj3GbQjOibQQ
	cJNESkNrAJzw0j0dEa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOC-00ByLj-Hp; Wed, 15 Jun 2022 01:00:08 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HO1-00ByIu-79; Wed, 15 Jun 2022 00:59:58 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0VGQ60SH_1655254787;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VGQ60SH_1655254787)
          by smtp.aliyun-inc.com;
          Wed, 15 Jun 2022 08:59:47 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mchehab@kernel.org
Cc: matthias.bgg@gmail.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: mediatek: vcodec: remove unneeded semicolon
Date: Wed, 15 Jun 2022 08:59:46 +0800
Message-Id: <20220615005946.17196-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_175957_457748_61938106 
X-CRM114-Status: UNSURE (   6.94  )
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

Eliminate the following coccicheck warning:
./drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:71:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 61412d0eeb33..eb4be41b41b0 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -68,7 +68,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
 	default:
 		ret = true;
 		break;
-	};
+	}
 
 	return ret;
 }
-- 
2.20.1.7.g153144c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
