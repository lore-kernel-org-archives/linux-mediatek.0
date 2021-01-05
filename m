Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128C2C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 03:07:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D189122573
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 03:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D189122573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzLvy8x9dWTSZmeRK0l87IAXhEhHtCegCyGUzeSR9Ys=; b=sYa1Acfamk4dGeaSdfC+iAUCHo
	tlx0SpD5Vl43SAwpj3/VlI7YFkvr8JjG3Immmqv2spUCg2u9UvBujFxvsxCSOrxq5BWpfBHTkHJcw
	SftiiOEnwCuKpsr/2iOQ78O6cg3Cxi0q/FmMXZSSbtsXoC4QU5ZoHlbycIA7bivBfXQPF2Xvkmyfm
	N2hafF2IcFSWliVH6FSOOz3DcuUWljYFfWzr0qE80acSVbNNvE72c9z12vtlK1EqNktWWi35R/uCS
	3PHt78ez922Uz/OsONdwH/mOjPpbs5A8Dzt3SmZWSO2OcA0Vs7TGFbFzEgtu5lkQ/JosQMhk+s0CW
	7xcLN7CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwcgh-0007bP-NW; Tue, 05 Jan 2021 03:07:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwcgN-0007Pe-AP; Tue, 05 Jan 2021 03:06:56 +0000
X-UUID: 1237bda29d024be2a6202bdd171a0993-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ghEtHxeyM/Bby2wvseCztM2JHp5DF7wU+O+UAs5XDeo=; 
 b=FXp5jyyaDvhqVGHMWv/4Qp1i9870WN0LNxwY4q4d6A0y1YiOwwm1vsoqb2nDDXGNTM340RFMUteXns/pmXv7EX5Y8SFBF0R0VJU4p8ekL2JaKV8FgY07fHOvewF43gLXblvRvmcwQCtbiw5lTMesjb2gPaFqk6yGpAPw7iLg+qE=;
X-UUID: 1237bda29d024be2a6202bdd171a0993-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1913924550; Mon, 04 Jan 2021 19:06:44 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 19:06:43 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 11:06:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 11:06:38 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 00/10] soc: mediatek: mmsys: Use function call for setting the
 routing registers
Date: Tue, 5 Jan 2021 11:06:23 +0800
Message-ID: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_220651_573400_9D0AC2B1 
X-CRM114-Status: GOOD (  13.36  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The following series are intended to prepare the mtk-mmsys driver to
allow different DDP (Data Display Path) function call per SoC.

base 5.11-rc1

change since v3:
- move register operation into mmsys path select function

Yongqiang Niu (10):
  soc: mediatek: mmsys: create mmsys folder
  soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
  soc: mediatek: mmsys: move register operation into mmsys path select
    function
  soc: mediatek: mmsys: Use function call for setting the routing
    registers
  soc: mediatek: mmsys: add mt8183 function call for setting the routing
    registers
  soc: mediatek: mmsys: add component OVL_2L2
  soc: mediatek: mmsys: add component POSTMASK
  soc: mediatek: mmsys: add component RDMA4
  soc: mediatek: mmsys: Use function call for setting mmsys ovl mout
    register
  soc: mediatek: mmsys: add mt8192 mmsys support

 drivers/soc/mediatek/Makefile             |   2 +-
 drivers/soc/mediatek/mmsys/Makefile       |   5 +
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 254 ++++++++++++++++++++
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 110 +++++++++
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 149 ++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 180 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          | 373 ------------------------------
 include/linux/soc/mediatek/mtk-mmsys.h    |  25 ++
 8 files changed, 724 insertions(+), 374 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
 delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
