Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C374C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A840020708
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ru5iIrsK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="odfnDU0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A840020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yPnYcjy/ovg7uOCZbRGE4H8n2WeU8Umr5P9WQC6V+jQ=; b=ru5iIrsK+pc5oDN4F+IWpjdgG0
	ka/skM2/dDSlUiHK+4pE3/O3FZ9oeL18rNUBF35UD+Sb7JwL+W+KMaETYDV+ikf/S8DrbQ18rtq/t
	KkHFk6yhy46RsbOzR5ymfPq2CQeYXa8P8A6qrhRX3uxHPoCr25CDFE9BKoaqi02zfAsR+XooQIPbR
	XvqFY+By8SAocW0XCpJ9fLZLytw78VtQQYpOXDQOwb6q/ftrtLZbx5GuxiTIfU3uEtZj0SxqJtSM3
	bm+Z4LYjOkMP9OokiG08apMYVNwm47vUbbOgbUdXSn6rLZEW+zLaCdBVfWyIAxHrbyBBbCosPMVdy
	LLjMf/jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSHKy-0000Ud-Ri; Tue, 13 Oct 2020 10:15:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSHKx-0000Tz-2C; Tue, 13 Oct 2020 10:15:20 +0000
X-UUID: 803e5bc926c54b818feb9ae62afb2d77-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gr35+E9wzqD1OxifIpp0yw5HOLR0PL48ny+X5AWGPOA=; 
 b=odfnDU0iKJ67vy8izRz2evieWK3gDBUcvZzQ5pHhwbOdEN+rtezSJ6/mq10yYFHpfALTaLp+SeYxh2Y7Nkzqa0OfdWzaI5ZZxbSMCavtCGqlTc9O9KYHyq1DpYFOVl53nWU6sw0vV40bX9XENm7wPC4+aES1id/gnXfD311E5IU=;
X-UUID: 803e5bc926c54b818feb9ae62afb2d77-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1398042181; Tue, 13 Oct 2020 02:15:14 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 03:06:30 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Oct 2020 18:06:28 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 13 Oct 2020 18:06:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/1] fix scrolling of panel with small hfp or hbp
Date: Tue, 13 Oct 2020 18:06:24 +0800
Message-ID: <20201013100625.13056-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: C951D73D807948089F1EF863B8ABC438D1D86F1001F1BAEB1F78D927A0FBAFD92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_061519_299462_45552D3B 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v4:
 - Merge revert path and fixup patch to on patch

Changes since v3:
 - Revert v2, for v2 will cause some bridge ic no output. the cause
   the video linetime doesn't match display mode from get mode.
 - Make sure the horizontal_frontporch_byte and horizontal_backporch_byte
   are > 0.

Jitao Shi (1):
  drm/mediatek: dsi: fix scrolling of panel with small hfp or hbp

 drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
