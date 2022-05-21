Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A69C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PS+e5BungOKA1Xbm/kTVjwvVe416YLL7SUDJtrDwApM=; b=n0JdM4FcVtE66E
	hThPsqVnRrVU4A5iCyifovWDSDkVWDRhwx3hkiHRqTbvJH2XUoBHn9WOjFwNi86JGklzsAHOTmWEV
	1dQzSczNIpBgdGSDH+0GnZKkVDmJGKjDg//FUAhKqyXNK0OSisRhJ226Dr66sbEPUPx8Kmd4pCAC5
	US+hKX8NGTBrX17P8YEkzrvBqPXCBAIv52Cv+X5kAUTwxACuhyLzM9ne/J9HfeyfsXto+cQoQJz7I
	dYJsWEtWGxpJc+aIudhinDsAQqLEtVLawakzzdkDcAlk9XaK3QGL4UY1cLKQtX2i9j3hJ6LkcO/u3
	ofDJ2Sv6XCw+xM9PNxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsN4H-00GHCr-DF; Sat, 21 May 2022 11:14:45 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsN1j-00GFF9-Lc; Sat, 21 May 2022 11:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IFMk+sG1UkKvvet9eVEjt93RJXFlKUDi3Jz4fWOgUhg=;
 b=PBKOlLXg1sPPVZuZm2u8rC85P2knGUduUA24hKtJrGlcBfo3iDZt85Mt
 xVtAPUidhjAQg3jrSeKusd7UflRGrzlMKveeAxM+fga8okdZFKdOQbHg+
 Cpr1z83U/f+8HMk7rJ5wrocuQI4r6uvHk2cEisQL1eY0SOaHnLv5DrV3m s=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727925"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:11:57 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: kernel-janitors@vger.kernel.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix typo in comment
Date: Sat, 21 May 2022 13:10:40 +0200
Message-Id: <20220521111145.81697-30-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_041208_049031_FEA3F1A4 
X-CRM114-Status: GOOD (  10.90  )
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

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index a29041a0b7e0..c156048cd4a5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -255,7 +255,7 @@ struct vdec_pic_info {
  * @param_change: indicate encode parameter type
  * @enc_params: encoding parameters
  * @dec_if: hooked decoder driver interface
- * @enc_if: hoooked encoder driver interface
+ * @enc_if: hooked encoder driver interface
  * @drv_handle: driver handle for specific decode/encode instance
  *
  * @picinfo: store picture info after header parsing


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
