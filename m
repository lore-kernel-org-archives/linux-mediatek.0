Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68460C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:23:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E643C61182
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E643C61182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1MdJ7HsE6AOLe64kJpVIQUUVJF6s2D0f0xZzerbWkTA=; b=arsr072/SRgPnGPOhnVtmr8b4
	8+linSSsJ/ZW+OSlUVA1eM2NXBWDWlB7qpmKoEf4nV2mjCp/kQaWN2fJm1Ix0JCMNwvdSL3k5rEIt
	BNpk+yiPwBJc99eSLUaiU9TO0eTZb7ctddCgzy3nw7vBgixUjb9bOjR12yqBsVFPFjyh7qLmLcizZ
	dYzUBk7XWe09tk+i96//Q/YUJbeox91ox0vgpGEwk36SP1BRZdv46INFYKMmMspfwUJY+UjUHbbA+
	GeqHbcLw4bBvrmx5jxENer/sGK9jsMxFADYgj5sra3GRFbxLGWfzubpF0IujsxM3TzeORUS4gAn9M
	UrxJRGibw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9qA-002WsG-NB; Sat, 10 Apr 2021 09:23:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9pW-002Wm5-9S; Sat, 10 Apr 2021 09:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=2mzuXzXzIsWTtsMoa7RS3JYMjgZSXxlUxCDK1ZZaApo=; b=wgW+dkOogC78IPNRXcMiDHEuDj
 P1mcGi9+Ts3ZHV1a5+3ESwGnrsQ+HUDrkI+Hl9NBXqGzPEj+baVWUUmQojnmQN20e8Bd0xPmRuDLW
 arWXqJLk7N8jfqsP8i6RnBUJHOfalFjhyW6da09fiJtT44T/2xkK2+9mcmG4P+48646dMkp6/h7gy
 pZeRv+TgddtBaqCfgZXyc4qBLI9tHH6tx9Z3KT8BDctLBY6FmmYPSWCPgkTTMh/T9Dnjb9pvw3PYL
 5Wmz19O9JqyvMMTO2+4CISYX/GRUyY0v1lHHsUqb6ljRpT1rzdPffiuZrIMKlP92JjhaQO5q+xhUo
 gCp6+TwQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9pT-0050hL-NV; Sat, 10 Apr 2021 09:23:01 +0000
X-UUID: 95b236db1957424bbd2d83e589c69248-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2mzuXzXzIsWTtsMoa7RS3JYMjgZSXxlUxCDK1ZZaApo=; 
 b=uIPMEZMwWZ7AHot7z5J5jdjdnO7u4MMQ5OYuv3zJdhKANst174qQ9rGdCg1OxOU/uSfZJEUFoxLjH9Ny/2eGGDelI9d3p1XC+fN0HLrmjhcF0k3ykvRBieGn44BrHvhGcYRA5k6ps91bZ7iWKVhTTv0vLJ/sOaPXAcdl/lvkVTg=;
X-UUID: 95b236db1957424bbd2d83e589c69248-20210410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 188676566; Sat, 10 Apr 2021 02:22:53 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:13:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:13:50 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:13:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Subject: [PATCH v5 12/16] media: mtk-vcodec: Use pm_runtime_resume_and_get for
 PM get_sync
Date: Sat, 10 Apr 2021 17:11:24 +0800
Message-ID: <20210410091128.31823-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_022259_795373_2A754232 
X-CRM114-Status: GOOD (  11.60  )
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

pm_runtime_get_sync will increment pm usage counter even it failed.
This patch use pm_runtime_resume_and_get instead of
pm_runtime_get_sync to keep usage counter balanced.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index ddee7046ce42..32e1858e9f1d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -92,9 +92,10 @@ void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(pm->dev);
+	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
-		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+
 }
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
