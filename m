Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1412EC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 09:33:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23E923B7B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 09:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B23E923B7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l668YtPjoyeB6WPtAiXAfxYMXKVGHUnr7muXjyZBRsw=; b=my1Xs3GMdWZdvNTLZdRZMxX7Zx
	rT0sLL9F4WStTjbC2JSY9w8N5GacaxTMmfYNFjnQQKJOgmKrslyrDvL1XfWScHqEn3qCb4FoA85ma
	oHBFgJyHtdrMAbgdwyrHJVTFKJLOtONspdvTnScMYk3fPwCgA/F2QZA+e+2j1mlCL4R0miJJiUNT2
	DyrYN+xqnUtcZ6Zr2H+As6IcBksBATwSbE+WoDMOqCYVsPlnPEKMRVOdIwcjIuxOBRwLMokpWp/ZO
	c8H4PWm/bw0lPE8S0gFtJtrtWP0vLi+UQ8YkrJvO5IpLeU0NFbVxYZYOgYRkgcH0HxFUYwLcinJkQ
	N0ezagnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmvqc-0003HM-AF; Wed, 09 Dec 2020 09:33:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvqZ-0003Fk-Gt; Wed, 09 Dec 2020 09:33:21 +0000
X-UUID: 95ae98be610f48c9b25aca62099ba2aa-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2i3cVGfpTZ0SsOGJWg0X6TX40JotQ+GR7JoRfb/pa2U=; 
 b=fKZwT1HPm9FgQcJnGW6EcEfvxK0PO0G+vZwQgf2VmGzlgLAl7Vpi8nJ75UNMVjacv6VK32CZqRg5S6PtFA0dQumII3ZQkhWM8bjGo19t/53Z1M6oE0plNngdb7w9IXkO7aYTbkW0LNHiwh8gcKsWkXxwNZReDrG1PmA/eq5w1z8=;
X-UUID: 95ae98be610f48c9b25aca62099ba2aa-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1107095227; Wed, 09 Dec 2020 01:33:05 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 01:33:03 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 17:33:02 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 17:33:02 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 0/2] soc: mediatek: Prepare MMSYS for DDP routing using function call
Date: Wed, 9 Dec 2020 17:32:57 +0800
Message-ID: <1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_043319_792395_5C25FDFA 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The following series are intended to prepare the mtk-mmsys driver to
allow different DDP (Data Display Path) function call per SoC.

base change:
https://patchwork.kernel.org/project/linux-mediatek/patch/20201006193320.405529-4-enric.balletbo@collabora.com/


Yongqiang Niu (2):
  soc: mediatek: mmsys: create mmsys folder
  soc: mediatek: mmsys: Use function call for setting the routing
    registers

 drivers/soc/mediatek/Makefile             |   2 +-
 drivers/soc/mediatek/mmsys/Makefile       |   3 +
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 233 ++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 177 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          | 380 ------------------------------
 include/linux/soc/mediatek/mtk-mmsys.h    |  14 ++
 6 files changed, 428 insertions(+), 381 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
 delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
