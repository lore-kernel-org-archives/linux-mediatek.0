Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F282C47082
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 09:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A4A6139A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 09:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A4A6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OxM5E1pc44z4Qkrva770Enz/N2VZfuYGUM4fU+UW6sA=; b=P8LRiL+3DH0jp4
	ciutBqg1BND/qpNG88KHOHfVDl2hx+N1WMgkX7NG3zYhs6ViRZpXlurfuXPogjgtVL12AIcCaxO/U
	4p3fv7VTgKKPTV1lv+CvIhCT8gEyqpPwNsQhS2UBFhBbWM2cYpVDh9rV1kpqqxgv8hNMnQmPxxRgs
	W/UTJ4m/BVp8ZLXxIffhGvneKVmL70+Bgbn+Lk3tvf5nkG0USjK58wMXi5tJMO5qY4QNl73mLNbst
	D+0gYOL2IQTB21ZKnsnotvjT/9qpuDhlZ7Ooi48IQvJ481R/L7eeNbTUjfa8UgglG7xPdtckLHp7B
	WdDMu1OE304qW9IbqCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llpOW-00Cgfc-Ue; Wed, 26 May 2021 09:00:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpH8-00CdSS-Si; Wed, 26 May 2021 08:52:28 +0000
X-UUID: ab4dc964926444c7b9e5b49aa0e9a4d3-20210526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qR1g+pBBKQP/vtauMIGeAhhdtlWOijqDuKA54wZ11Tw=; 
 b=QzIS5rLH5I/BBGk6cQSnN7/Tcqnqp1elC21aAwc4qvb87SuwNvsd8TeF97pZWPylwAnig9ILMTBrs3i6LzsfITNw2uRlfSa++4dFWsh57CH15RyCCDHene26QhKq/vsKYabp9AF/8KfGrQIPtzoQ2KThhLJVz5yJJkgKAedyF4E=;
X-UUID: ab4dc964926444c7b9e5b49aa0e9a4d3-20210526
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1778828472; Wed, 26 May 2021 01:52:23 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 01:52:21 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 16:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 May 2021 16:52:19 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v5,PATCH 0/3] mt8183 dpi supports dual edge
Date: Wed, 26 May 2021 16:52:16 +0800
Message-ID: <20210526085219.7582-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_015226_974181_F8C26980 
X-CRM114-Status: UNSURE (   7.39  )
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

v5:
Remove ddr_edge_sel and use output_fmts to determine
which edge to be set.

v4:
Use output_fmts to determine whether it is dual edge.
Rebase to v5.13-rc1

v3:
Modify clock rate for dual edge setting.
Add more bridge function.

v2:
Modify unused code

v1:
DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Rex-BC Chen (3):
  [v5] drm/mediatek: dpi dual edge sample mode support
  [v5] drm/mediatek: config driver data to support dual edge sample
  [v5] drm/mediatek: dpi: add bus format negotiation

 drivers/gpu/drm/mediatek/mtk_dpi.c | 130 +++++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 6 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
