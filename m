Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A163FC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:54:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50DCC61004
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50DCC61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZGFLySsxqya8+f2ZdOSg4kwTiyOx0TAh7yZvIL/hCg=; b=ZP8KM+odkT16iYRnsAbECTRkZA
	9MTQx7cVaDzYS+GNNQWCuASOVkrDd4A73ZXSAQFl2NWURC3gXZBECQ8wnGNiyRaLnFdTYWPdDJbEf
	gRXhqzQWxMzgiRIPjFuPa9qEN2x+Ew6UR0twEyoukpx3Mc/cyNIqIwrqQIQZ/et8B8mIzYm0RZPc9
	zg8/0ZDUiMsj3vbNLz8x/0LB4JsDaYcrin3Vs9a9+sMmc3Fk06qkOqshEGW8RlgEWcfCouSni9GCG
	7WMnk0DjMGy2Y9Q5TFRLxT4Mo3fD3PgvrYaJ7SKTlvlusVoxObkhsO/ZCt76odjyC3yuYsjgKflnB
	iwiwya9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSps-000IKf-Th; Tue, 11 May 2021 13:54:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSgg-000F4V-Bl; Tue, 11 May 2021 13:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=2LABu6neJNdCvySvkWs0wH0KjuOBbN3h1M6Tl9gSZzc=; b=MXaLPKekNyCZcasxwEYPvotTK/
 y9AnKOEoZM3eT5iC8R8KQ0zhUz+IdM7aOcrEqXPSAxxVtHum+PHTRoVIZvQXowMn9FX4lrRgUHmay
 vZjQxfcFHjOjFeKjTYp31nXMcKQo3dncYN5hXm0i50zW2+1mAEncAEHitKlIz+0yw6JCQmx0FOZ0/
 hoooRHLSLyO9kVOXbLswaEYojeezhM3eXTeetRyT/n6I9Uml/2j6YJybctjiQZt6j+aFmy9vi/Rvr
 uKcniAjpkJ8/r0QlYkmYGwaLbsce0uq7hQeqNPnjW/9gWmpdiGCA2VMZuf5Tm1iIOwLQRWOlJ/o7y
 4Ssdm2TQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSgd-009dQV-FW; Tue, 11 May 2021 13:44:36 +0000
Received: from dggeml708-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FffDw1ddhzWh8H;
 Tue, 11 May 2021 21:40:16 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml708-chm.china.huawei.com (10.3.17.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 21:44:30 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 21:44:29 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Baruch Siach
 <baruch@tkos.co.il>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 0/1] drm/mediatek: Remove redundant error printing
Date: Tue, 11 May 2021 21:43:36 +0800
Message-ID: <20210511134338.6167-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_064435_704626_3F1345F4 
X-CRM114-Status: UNSURE (   6.92  )
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

v1 --> v2:
1. Combine the modifications of several drm/mediatek files into one patch.
2. According to Baruch Siach's review comment, simplify the following code snippets:
   -		ret = PTR_ERR(cec->regs);
   -		return ret;
   +		return PTR_ERR(cec->regs);

Zhen Lei (1):
  drm/mediatek: Remove redundant error printing

 drivers/gpu/drm/mediatek/mtk_cec.c        | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 4 +---
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 1 -
 6 files changed, 7 insertions(+), 20 deletions(-)

-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
