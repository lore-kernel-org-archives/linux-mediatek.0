Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB67C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:56:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D87520674
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aykrjwnP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cXHGGEDq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D87520674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grGjiGuit+0uMUjsJCnuKQmlbJpURqXZ4pB+vVrv9uo=; b=aykrjwnPqdyCmBQWkFIAmB+MeO
	E0LnNFRyhS5b0KPDFgScOxMllwRT5j5ysFqQYfNfvXvAIxy4xlCGVInMkDE4UiS88X7wColb40M57
	sOdtbIgO/W6RcEkxVbIXvQ+Qk6XIx30jqgmbFFwKpkXn88vxxcqHHQh4YankABF0kyKYKthCe2Sqn
	qw2S4BlQhhYc6LYK0Nho3GALZ+vGX1KuUiVcpdkgl68tpsvyOHzOgnZA5fe3ZEVb8ddnVQldhj+li
	RsQguS1SOMDJ8qTYyqggkWOIwNsltTvP4PRDeqJM1kl2v5JJIe1xz2pQbq08YN1P+2r85ADIKH1Dv
	0ZuCdOvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jspxf-0006AL-A9; Tue, 07 Jul 2020 15:56:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jspxd-00069a-76; Tue, 07 Jul 2020 15:56:46 +0000
X-UUID: ddf069f79dc7464b81c5c99c855fd24d-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KMWcgcPL1XjMD/Va1W+LCp1J+xXGTJ5bSqx6Wn/nPUA=; 
 b=cXHGGEDqx59+r2LSl0F5kJuTyeyqdu1jsUIwwX3006c2f6SqatMaXkkcaSuKEJBYt8d4vrPqXo0thCVIqBLFGCLR7/SSOafx1kCcgrXSLVIwMP4MmQ8zb8J/rfgCxdL+fxrGiZqa2E9r5Jdrw+c1++UP8jw61aR+cQzZvU2bm2c=;
X-UUID: ddf069f79dc7464b81c5c99c855fd24d-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1100505115; Tue, 07 Jul 2020 07:56:42 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 08:46:35 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 23:46:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Jul 2020 23:46:23 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v3 0/9] support cmdq helper function on mt6779 platform
Date: Tue, 7 Jul 2020 23:45:05 +0800
Message-ID: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_115645_493707_220072DC 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch support more gce helper function on mt6779 platform.

depends on patch: support gce on mt6779 platform

and depends on following applied patches
soc: mediatek: cmdq: add set event function
soc: mediatek: cmdq: export finalize function
soc: mediatek: cmdq: add assign function

Change since v2:
- Keep behavior in drm crtc driver and
  separate bug fix code into another patch.

Change since v1:
- Rename cmdq_mbox_shift() to cmdq_get_shift_pa().


Dennis YC Hsieh (9):
  soc: mediatek: cmdq: add address shift in jump
  soc: mediatek: cmdq: add write_s function
  soc: mediatek: cmdq: add write_s_mask function
  soc: mediatek: cmdq: add read_s function
  soc: mediatek: cmdq: add write_s value function
  soc: mediatek: cmdq: add write_s_mask value function
  soc: mediatek: cmdq: add jump function
  soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
  drm/mediatek: reduce clear event

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   2 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 113 ++++++++++++++++++++++-
 include/linux/mailbox/mtk-cmdq-mailbox.h |   6 +-
 include/linux/soc/mediatek/mtk-cmdq.h    |  93 ++++++++++++++++++-
 4 files changed, 206 insertions(+), 8 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
