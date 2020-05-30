Return-Path: <SRS0=uE9q=7M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296D0C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 08:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00282070E
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 08:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ng0KPaTs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uvAnnSAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C00282070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tU/g3+H1O4j9ZsOcUGmyRVgRoOyFOiXn+MYUtSzFtQ=; b=Ng0KPaTsBs3ZvW
	qOL4uzV1EphKP0Z5O0paRXvAZdUndvLwSiYugJJ6aRLQ68nekhjUIk/MZZcJu3+QOlFDqFtfC+s/L
	/Gc+jmMFxA8fowc03IM0FAPY5CTpHOqz3TTUWzxsrnRlqJwY7J51k4BHGso6JoWFWz2prYtQY7gq4
	txmDjXwdw2RgAEdGTDmdMYfLZUqyDZnX6CTXNdaPWmP2ruQICaMuyWGFlDGq8DJ7mdcfdHoxtMRgD
	1YM5MBhFZANJs0wtF8601kN5x9ommSZ2tdAWap6tW1zhUTcPH8s0aBD8roSXvPtEPwc30lJ3pDSAr
	fb1HIVCfkQaOmI+MzWRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jewlV-0004jD-8O; Sat, 30 May 2020 08:22:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jewlH-0004Y0-Ig; Sat, 30 May 2020 08:22:37 +0000
X-UUID: a7f037f372d94dc494e8d823f8b5abc4-20200530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=A7Ij86f1Labbs4iNJzkgqVTmCUzg7B1wyI2Cz/ZNwIM=; 
 b=uvAnnSAE5cdgiz8mYQgX/1yHJvg4Mun3w4M8CqidFpKH8i0dDWGx+hjLHZum0Um9BgIGwHH60ECt8yQKBvmS4GoSuUiJKKWyFzbl5ucqmyzotWHnpcUEFbVz1fkX0fUA9I7FxI3ImT5bc8+QJp7HMzlLI1AExH7Nc/AwwkRtlT4=;
X-UUID: a7f037f372d94dc494e8d823f8b5abc4-20200530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1655635172; Sat, 30 May 2020 00:22:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 01:14:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 16:14:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 30 May 2020 16:14:33 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 14/17] memory: mtk-smi: Use device_is_bound to check if
 smi-common is ready
Date: Sat, 30 May 2020 16:10:15 +0800
Message-ID: <1590826218-23653-15-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_012235_621225_C57BFFC8 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 eizan@chromium.org, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, acourbot@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

smi-larb driver should run after smi-common, Use device_is_bound to confirm
whether smicommon driver is ready.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 19c3949..0f8cd50 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -296,8 +296,14 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	smi_pdev = of_find_device_by_node(smi_node);
 	of_node_put(smi_node);
 	if (smi_pdev) {
-		if (!platform_get_drvdata(smi_pdev))
+		bool smicommon_is_bound;
+
+		device_lock(&smi_pdev->dev);
+		smicommon_is_bound = device_is_bound(&smi_pdev->dev);
+		device_unlock(&smi_pdev->dev);
+		if (!smicommon_is_bound)
 			return -EPROBE_DEFER;
+
 		larb->smi_common_dev = &smi_pdev->dev;
 		link = device_link_add(dev, larb->smi_common_dev,
 				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
