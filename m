Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C49C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:31:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FA36121D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2FA36121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0XkFWVHrtbpMTR44sGdxMzyjjjI4tOJ2Z48wxGY+ko=; b=qZmywFC+R/Z8Tg+gcKNa/RwaL0
	ZzFCcn/0CTY0V2h6dKLkMHVRFrS0UoOKQ5UZLwrt404lVOVl48bTb+al1bVKU4YLfsOCrS2vpUZ1/
	vZT3oXUqDFxnUZ1CS4NlJg1yj/dhmGWtgo/nYxLg8xDTflAYNJgzwXnmaRuCTEs+ehFZnpNODEJKO
	yAN0FTl8fqvKYwWa73oks0HFtZSSnebz10vjX0JRwtgSZQ/DqjwZDTrJR8GUbjgP0xzBXUCKLw8G9
	GaUECIeKIbP/urDGM16HoYRgOssjNyBwVU6+xSPu2YyltzE/HuBdXdtieuCyCfVu0CgfCayuhQcuC
	FhLf2Wtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVr2J-005z0D-IY; Mon, 12 Apr 2021 07:31:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVr1t-005yxA-In; Mon, 12 Apr 2021 07:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hZrNfFvHjGMdXbpb0D2m+YDZ82F832KMttaNM3FAnXY=; b=u6+ST128hDq2smY9equDXhVSsz
 sa6j7xRp27XIP23iTx5x5FOs4I9If4hwt8W8L09hLyDbvawLyA8Kfzik+RwlkbSykPEJXC88CQzWK
 jbXfnZQk7UrjO8UCHB2D3JTQyZ3dtirRENlJX3o2kBqGmueGi175dNLfdZPnCdiVWPfFzq8sdLs8v
 QYxUh/1it9OwUJO+gxG+jV2mTQ47J4fO0O0nCrD7BNZa9oX9ARLETXg3P6FQYLz3pZk9BYAwcwHBF
 8/Sy/iQgJ+LC6n0xPQ4Of84GBKzHQZN2atHTCv97sT31g8umYOyTO50JmTp9UHE+VxNbWhy4Telm4
 M1ORTaXA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVr1q-005vlY-8N; Mon, 12 Apr 2021 07:30:39 +0000
X-UUID: fb6f881d09814149b90427b4456284ac-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hZrNfFvHjGMdXbpb0D2m+YDZ82F832KMttaNM3FAnXY=; 
 b=ET6XcT0Air3yhAby/vVMhEUL+/zWgA18fnQj3ClwT1gxQ6U4+IHP5GsNCKH8XLEHmhjDvCH9cNgDOJSVLiu+XIfp312I1FyccMB16qo2eQXecDqCJg5tfut/UEYpd0aOgdrs1EDfceK60E+de9USy6XI5itbXfN9xUPLBH3e8UA=;
X-UUID: fb6f881d09814149b90427b4456284ac-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 338591603; Mon, 12 Apr 2021 00:30:35 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 00:25:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 15:25:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 15:25:33 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>
Subject: adjust rdma fifo threshold calculate formula
Date: Mon, 12 Apr 2021 15:25:31 +0800
Message-ID: <1618212332-3547-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5A311A6B438E3928F4AC65FCBD346088B2DBA3C77BBC0636824CC8CBCF53BB062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_003038_340786_ACD78A0A 
X-CRM114-Status: UNSURE (   8.16  )
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

This patch base Linux 5.12-rc2 provide one patch

Yongqiang Niu (1):
  drm/mediatek: adjust rdma fifo threshold calculate formula

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
