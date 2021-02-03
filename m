Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB729C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:38:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5456C64F67
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5456C64F67
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=so5jR+AtjDqxCPpG+QteNj6tMCBfyXh14qWZVIiWu3k=; b=1PhC+ALQw425RslDXN8I+XUPgh
	edS35d9BUZrDrluAHHsi/sa/6mDMqQN+PwZN9BN6SGV0XFQdei21qydLOX/7fa6rZjL4R48RwlRXu
	IjBO0oS5UfFO6E4XEeVgCfPcHJubSeqCrOo8Sgil7VNp8TbzmuBeGgYgwksjxykfzY9lX7EAY6a7w
	ldNQdkyLb4eovVQUr4ES3/qGOnWK5Z6y3pKaBM8sJ20ofohZ/MX1hNXrKFyRaSnPzrwqghe+VN49V
	FLoo17oMG2dE1JDqAmNfHqNgaT2t/GU2d9CjyT0vbf0I40nkZpm9GANBExYkpYkO25Ql5UmDo+C04
	XYXq2UAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Dg7-0006LV-VY; Wed, 03 Feb 2021 08:38:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Dg3-0006JC-LE; Wed, 03 Feb 2021 08:38:21 +0000
X-UUID: cbc5eeb2e58b4562a459841ac0b8b959-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oDErAB3FVjC9GhdZhuC0mrhSlJPyd2dZ6/CMX1za34Q=; 
 b=a9m5KpmwEb309i+z94RE6yoO/u4urxFWHsV0V3bMZNkjaCCpPwwLv+6vEdwjcXLKbjV2h/FV4uX2jK+CQQcQFDvZD1P1tyWm81Z9jqyb6f4mzh574K8yo0wzkAFbLVB5lACs72cqhFENhuU/eYy5AnSe9BwSJtis4Sxk/0bib14=;
X-UUID: cbc5eeb2e58b4562a459841ac0b8b959-20210203
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1670895977; Wed, 03 Feb 2021 00:38:10 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 00:37:56 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 16:37:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 16:37:54 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fritz Koenig <frkoenig@chromium.org>, Tzung-Bi Shih
 <tzungbi@chromium.org>
Subject: [PATCH 0/5] Support H264 4K on MT8192
Date: Wed, 3 Feb 2021 16:37:47 +0800
Message-ID: <20210203083752.12586-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_033820_094881_645332FD 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: devicetree@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream@mediatek.com, Irui
 Wang <irui.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 H264 venc driver and support H264 4K encoding on MT8192.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
This patch dependents on
"dt-bindings: media: mtk-vcodec: Separating mtk vcodec encoder node" [1]

We need "name" and "core_id" variable in device private data to indicate
current encoder driver.
Please also accept this patch together with [1].

[1]http://lists.infradead.org/pipermail/linux-mediatek/2021-January/021165.html
---
Irui Wang (5):
  dt-bindings: media: mtk-vcodec: Add dma-ranges property
  media: mtk-vcodec: Support 4GB~8GB range iova space for venc
  dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
  media: mtk-vcodec: Add MT8192 H264 venc driver
  media: mtk-vcodec: Support H264 4K encoding on MT8192

 .../bindings/media/mediatek-vcodec.txt        | 28 +++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 58 ++++++++++++++-----
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 19 ++++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 ++
 5 files changed, 95 insertions(+), 15 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
