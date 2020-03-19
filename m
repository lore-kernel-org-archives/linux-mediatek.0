Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834FCC4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 01:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5909120752
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 01:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kpt4DZT2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V+Z7V3jm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5909120752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nn7Fs+DsOHmYkOr37aNUji5ShimySLgedh5z9SKUR+Y=; b=kpt4DZT2WQOMRW
	iAsoDynkhYgPpHF8Devi95JSeL9Y0laQCmLW8qcUzczh51Hxd8Nw0gDjZepzd35BF7EFl/Q0dfTg0
	SlrGq3PpbbE2PhV8fVFRj7LoOKZfvjYfy9Dsxc0kTgt/d0gPxakcwJpAQGKYXgqWg1gqN5QEkimmj
	qQPozpbAFYP4QtWrVPlLoY1djT6ElPkz7og/wX3BxhQDy1ZXsumIZiWp9opBC7eWQkDtBPs/+vhmE
	v2afOrEu4ixKVAaptNFAnLjmq9G6GM16FMJOv004bS5jU8JO+3ax0DpcQsuwYm3ePRzyqebdyAxwm
	YTRtH9zksCcv8Hbfjm5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEjpC-0005wt-6c; Thu, 19 Mar 2020 01:18:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEjp9-0005wP-QM
 for linux-mediatek@lists.infradead.org; Thu, 19 Mar 2020 01:18:17 +0000
X-UUID: c8c4d920ba5148b49e73974d50f34998-20200318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=ZjMX+7xVGwyxaN8g3c7u6vzV75JbHB1dkDLFcT9779A=; 
 b=V+Z7V3jmkIcDrqYwHlaH/0VUwIhntFNWs5QixLkcePUzOgPZVS80dujXDfpaIOCyq4e08cW5NC72T5nKWuvUtBMJFaz0k1MnBm4w+Xm9zrHbTAPnXi9FCESX2alSebsKVb2WC4FRa+H4PKVTkdSJsPeo+8HGmK8VvGjzWwGSuuU=;
X-UUID: c8c4d920ba5148b49e73974d50f34998-20200318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 658230409; Wed, 18 Mar 2020 17:18:08 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Mar 2020 18:18:05 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 09:17:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 09:17:23 +0800
Message-ID: <1584580683.29614.5.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm next for 5.7
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 19 Mar 2020 09:18:03 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D2F63A9CFFBB744500B527E47EF66C1D04286D5F7550FC4B2C7A35BED8356EA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_181815_862597_8FD7E0E7 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This include MT8183 DPI support.
And I change my email address to "Chun-Kuang Hu
<chunkuang.hu@kernel.org>", so I would use it afterward.

Regards,
CK


The following changes since commit
bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-next-5.7

for you to fetch changes up to 93e97f715b24114169d18654e09c646fd9e14979:

  MAINTAINERS: Update Chun-Kuang Hu's email address (2020-03-09 09:23:47
+0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.7

----------------------------------------------------------------
Chun-Kuang Hu (1):
      MAINTAINERS: Update Chun-Kuang Hu's email address

Jitao Shi (2):
      dt-bindings: display: mediatek: update dpi supported chips
      drm/mediatek: add mt8183 dpi clock factor

 .../bindings/display/mediatek/mediatek,dpi.txt         |  1 +
 MAINTAINERS                                            |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                     | 18
++++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
