Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1DEC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:31:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C4C61221
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C4C61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yvkvmcKquU+equoptLNv0q9ou1BhPr4gaX3D6y2+wwY=; b=FUxOo4PCHVgj2WL399D0pbUoU
	8QIu9Z3k57Vt6C8w3eKMX1Sp7EcO5f5K9Js8TA9XofBA0c8sBZKrAjZ/AgINvtv0kuSbrrsWqQu9S
	Ed3A+iXqB2ipBAmR1c1bOl5wEvGZEVVt2dSLtW/H/moWb1tjsVbEhrRIPo2j11/CYtap9K7GIU6KZ
	CeqVDtIs1UxhnT+bRRkrKG3meN36Y3vqi9O/1/skQP4rq/j/7t8INwikczaaM3sw3f99orvGaOLFs
	CPbfyjo4EEjjhrzC9B+P9jRX9uzzVlKkPiprxvBb6RBEfaT4dBzxuuCC/KF4bUHRdX54XifzydZG8
	fdw5MXZmA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVr2M-005z0x-EI; Mon, 12 Apr 2021 07:31:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVr1u-005yxG-2a; Mon, 12 Apr 2021 07:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZfP02XBbfkFu9I4vVBXjUQ66unvefxr8dVKoev8755E=; b=CXl1s+5u5ZXA12wqqiAAgqbZSW
 QqCyq/4Mz1anGbwc9znDJr8xecyS3xsR4QX299cdiQCTGm1fLnH4hmwjpJpMVFxRVi/JaNChIYMIX
 yvkHPE/Yu6vcsZ4NDvRefZgIZDiK8NvaYZ8eMnc1E7eNEI/5Hy0Fq5cTdcNAiE9ByLPvboyglaRhC
 thySUYVG2NxTt56E4EJJnSlAK1GyZUi3b68nmXevCclkxyBseAk3BADMuoQ9zR8AA8QFf0kRXDUnL
 LfZagH9gc7xI+elNpoyHrvI+J58D+gF2v9QxivWGnSGf2gcVjMW2yHokFglgTVGBdhuKC6tWv6Ck0
 DmtZ1rPA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVr1r-005vlY-MV; Mon, 12 Apr 2021 07:30:40 +0000
X-UUID: 22980bb9ac164402baafe4715230e189-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZfP02XBbfkFu9I4vVBXjUQ66unvefxr8dVKoev8755E=; 
 b=csIfelLflolRS5euQ7KW0WZhmJGNO4Gaec/xTCWxDxIWGbQxsow0eD/g9v8/K9GFnLInY1a/Q1ntqgr0wbwiqTYl1n6GFUDaVntt19nFIfZS7/bRNfYqJS26M0XQTc4VTYm0eHwRIcR/z2AI3EtwR0TBvgjWuxS3oyW+s88vCC4=;
X-UUID: 22980bb9ac164402baafe4715230e189-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1392859127; Mon, 12 Apr 2021 00:30:35 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 00:25:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 15:25:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 15:25:35 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>
Subject: [PATCH v1] drm/mediatek: adjust rdma fifo threshold calculate formula
Date: Mon, 12 Apr 2021 15:25:32 +0800
Message-ID: <1618212332-3547-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618212332-3547-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618212332-3547-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DB7A3BFEED79B757735615E15A53186FA117C4AF185632B495D9651787FCF4D22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_003039_756768_8E27AE2C 
X-CRM114-Status: GOOD (  11.27  )
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

the orginal formula will caused rdma fifo threshold config overflow

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 728aaad..8c9371b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -167,7 +167,7 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
 	 * output threshold to 6 microseconds with 7/6 overhead to
 	 * account for blanking, and with a pixel depth of 4 bytes:
 	 */
-	threshold = width * height * vrefresh * 4 * 7 / 1000000;
+	threshold = rdma_fifo_size * 7 / 10;
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
