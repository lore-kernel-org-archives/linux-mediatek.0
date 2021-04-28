Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454C5C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 02:09:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2D3E61029
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 02:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2D3E61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5WShLG628pbkeX7Q+A3QqqiuRqiwqv4vWgJZF63Mx4Q=; b=GbSyFL2L53dT4SNeWy5waIEK5f
	hfyp35vxzQun2Z6R5gOM+Iron8/FoyFLbKzcQ5Vmbnu2Y8zx2MFmczVrz1LSGVScLPC6z2DYCyMzw
	rYmZ1bWAA8fu36qg8IgMz/TUtBtx3bhHtWJvX9waIBkC04lwGXZgq+YjBgo2lxqcptZaDEzJf/DMn
	D5B2MPLvsmjzk45QhvBEqIDg5pgU4p4f38XULXnkDtC01ZCMpFH+VJVoEXhWAEsmSyeeLsYoUw5oX
	+MTe5Dcl+0IwHsPonVI82hzF+J5NselQaK0/KVmY0OwVFO211R6qAsz1CzkeL7HedcANjS2jaSkk3
	neInGu0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbZdt-002axc-R0; Wed, 28 Apr 2021 02:09:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZdT-002avp-Jg; Wed, 28 Apr 2021 02:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IPkOMYXc7DgG9ZSGuECXB7JjH85JM56dXYeTSv43iD0=; b=ktdqVYCqJsNUj98xJLIMC5s9X6
 G9TaBgPOH3nJ7i/Eyk4DshGACyTXfAF8pcD1MslMJ7kzCEXsIBEJA9D8MNMUyT2jwiplg59O7Eaj1
 jwqXiAzAi5KRhTpWbs/njFJV5lcTVf6udEdFec7NvH8iKpghOrkNoH5BwBxQjorIy82zPs0AbDmAO
 kwGzZDgZgdAN6ChBAxn4aAWslTyk8RY+3SZllLlLtlyaQMp/PbYV4WHxJaF5pIihqBPViju6PItvI
 9Y3P53Rj+vjCr72RNSbR7C5ZNmk0t9aPU4HsXb4sDEVR15kksattczDSY2J8piFNA2SrK3638bXKO
 bULh9NrA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZdQ-00H8p8-DS; Wed, 28 Apr 2021 02:09:05 +0000
X-UUID: 01ede44390dc47e395fe6a798b8134e5-20210427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IPkOMYXc7DgG9ZSGuECXB7JjH85JM56dXYeTSv43iD0=; 
 b=ZKaF9dk+GdVDykn2jOqXEtSuePUk+XcHOplRKy3DxqwctoSe4irDj+o96Q90yZkaoGKqjLqiiNDqUoU92l+DVF1wD7gZFuwo/F4Nmrs0d78zzp8YB2zKKEY/cv7m3gWb3kUrbzc3gYqoJSEtO0zvhSu5uPLpd8J1ZbYmEnODcNo=;
X-UUID: 01ede44390dc47e395fe6a798b8134e5-20210427
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1352435227; Tue, 27 Apr 2021 19:08:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Apr 2021 19:08:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 10:08:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Apr 2021 10:08:53 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v1] MTK_MMSYS tristrate support
Date: Wed, 28 Apr 2021 10:08:50 +0800
Message-ID: <1619575731-23388-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_190904_477122_51840135 
X-CRM114-Status: UNSURE (   8.88  )
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

MTK_MMSYS tristrate support

Chun-Hung Wu (1):
  [ALPS05103552] soc: mediatek: MTK_MMSYS tristrate support

 drivers/soc/mediatek/Kconfig     | 2 +-
 drivers/soc/mediatek/mtk-mmsys.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
