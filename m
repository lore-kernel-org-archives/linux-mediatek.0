Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092D7C43616
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:46:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B073061360
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B073061360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbSbZAxRCIyJQ6DV7TiGB01D8oJ5NgMCYb0+86WLUMI=; b=R3m13NShJEbbtCymPW7UQWZBjj
	iWcw6YroMu318RANjc7efkeqTKMn+sMqPnPL4pMdYsI3EFnOBFHaXzOhIN/mUGY74g4RV6e0a3drI
	rGSz9N9Mi0cqljMQE0tg0sASDsrraz5bd7NGAgr5BU/rE+16ESux9lBpvR6tNc8CcBPAIpZRnTHcF
	uM/394wp2PngXx3a/yWs815s9QAodWEQPFQXFL6lcvggMWdF8B5wacMSc4NgSjGOCLk99bjUfvgPh
	C2jUJsRaMnexF/YoCKZqEmgHn6ugGTSbSbGIs8rYRZaprKqZYS5suvA8hQXfcb7YbZt5nPtrlIbxt
	C6/+2WtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVvxI-006jWT-5d; Mon, 12 Apr 2021 12:46:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvxD-006jUl-5f; Mon, 12 Apr 2021 12:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=krLdNAKK6py5HK2pzzIm95Qw0XVQWn1PeL95gzVfEeU=; b=Ax2XJdvAhK1VuqRhPaJxdkq5rp
 PxwgqBprPrlbvnkbyMS5tvKOd48YDCQRKbWxD9GQcH3b6hoV0RDhSKMXA8SfDZEPpUPuqR7IF4hzz
 foJPkkk/Jqon4VtEQTOR9UhXpDGOy42JbBOUCeNoKY+uyY+vxk2LISdSHAEUC0n0YfQcBDpsiB2Dp
 AhM9145doVUwSjBHv0Kfewzyn9p5IgeAAATqv0i6Ms6aXf9TbwgpSDO9O8OqPl6xuVF8NE6VhHfmv
 eg3d6Jrj+CLQjS4v+JCPU6nYoSOWXN32pDwn053pP2dY1N0sBRpyT3Curb6sZHNpH6B4rMO3cpQ8d
 /yH7WdiQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvx9-006ENm-Pz; Mon, 12 Apr 2021 12:46:09 +0000
X-UUID: 8b1d5ee948e64f42a18ad7668e011970-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=krLdNAKK6py5HK2pzzIm95Qw0XVQWn1PeL95gzVfEeU=; 
 b=Rc9DiZtdH4V8cYL5uFBq2kfIQ+yCy3ukyRnZzNoJxVncxSAOSaMvaSlpxQrD81nh9Jrf5IFZEkLXbuDX3C9WUsr93YpaHfqQVC4AMrZnmprVKr5FZ4jPtPGJjWyTpRz1hThrb8+GrL7nDy360F9gyGDvWOXFhoQLtgz0ZALxBww=;
X-UUID: 8b1d5ee948e64f42a18ad7668e011970-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1475667168; Mon, 12 Apr 2021 05:46:02 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 05:46:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 20:45:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 20:45:58 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3,0/6] Support H264 4K on MT8192
Date: Mon, 12 Apr 2021 20:45:49 +0800
Message-ID: <20210412124555.26897-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_054607_867132_D0734B0C 
X-CRM114-Status: UNSURE (   9.93  )
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

Add MT8192 H264 venc driver and support H264 4K encoding on MT8192.

Change notes:
v3: 1) This patch dependents on "Separating encoder device node"[1]
       which has already been in linux-next.
    2) redefine venc max supported resolution.
[1] https://lore.kernel.org/linux-mediatek/20210325122625.15100-1-irui.wang@mediatek.com

Alexandre Courbot (1):
  media: mtk-vcodec: venc: remove redundant code

Irui Wang (5):
  dt-bindings: media: mtk-vcodec: Add dma-ranges property
  media: mtk-vcodec: Support 4GB~8GB range iova space for venc
  dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
  media: mtk-vcodec: Add MT8192 H264 venc driver
  media: mtk-vcodec: Support MT8192 H264 4K encoding

 .../bindings/media/mediatek-vcodec.txt        |  3 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 89 +++++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 17 ++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 +
 5 files changed, 78 insertions(+), 36 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
