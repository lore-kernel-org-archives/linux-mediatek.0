Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61106C33CA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 03:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346D620CC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 03:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fgflj9EJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dAQWXiEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346D620CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LZejlgJChaVCAc5qn2WEG0uHUkC7ukgNGfOqM947MBE=; b=Fgflj9EJP0cuG2
	1y7jKjJ7Dl35K/l9jUPn98lHGV/5reTI1k3fmJSn6FY9AY5lfGERY+ofehuOzbCOgVz+UIQZ+LRgp
	PHFEISkih/49zJ4k5+8Kc0PsDHX7MqPaBsIfIg9wjS6qghbBIbhCLLR3UddThPm/W4avWDmUZGH5V
	TyLw01oSdmxyzqp3YmyXchX0ChOeDFt3uM3pWH/jqL3IIR6aS2J3oukuBhNbakzbl9eLHmH2t0UZd
	L8Ewh0Hi7SSLmHCWJeVNueZprHEXjyP5f4JuFz3TdUArXnO3to4fcln3CJwMLKVOmFvT0tUpBuWp2
	Wll6F8TuXyq9cQLDx0pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irCt4-0002yb-5g; Tue, 14 Jan 2020 03:29:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irCt0-0002xw-QO
 for linux-mediatek@lists.infradead.org; Tue, 14 Jan 2020 03:29:00 +0000
X-UUID: 23ebb97127384643b1efdba029edbfd7-20200113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
 bh=3lK1Ebr64dtMdpNNko6BZFpLwXLNtP0MU90WQGJmPks=; 
 b=dAQWXiEQI34eCnADVne70Fx0uu6Mu5+WU4GofNtkYu+uvGY0qw2wK16ll1/C2ABqScdpuqZ0SaNLOrxR2TnJt8TCp0Qp/NDzvjumNXSkUL/IG/Vwk7SxMgkyNQTwQ015bYHKo/Te4wTlDyt4h2wYmSf2Qs+uO/11FXxAsNspnmk=;
X-UUID: 23ebb97127384643b1efdba029edbfd7-20200113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1793462547; Mon, 13 Jan 2020 19:28:55 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 13 Jan 2020 19:29:42 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 11:27:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 11:29:30 +0800
Message-ID: <1578972526.14594.8.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm next for 5.6
From: CK Hu <ck.hu@mediatek.com>
To: Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 14 Jan 2020 11:28:46 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 071BCE1FFB819546AB63B32ECE7083E45224F80BB23B15F37DB2B6807481E9D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_192858_859532_A0173547 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave, Daniel:

This fix non-smooth cursor problem, add cmdq support, add ctm property
support and some refinement.

Regards,
CK


The following changes since commit
e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-next-5.6

for you to fetch changes up to d04a07a8dc93dfc40b3a41c977db78ba340f209d:

  drm/mediatek: Fix indentation in Makefile (2020-01-10 14:10:49 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.6

----------------------------------------------------------------
Bibby Hsieh (11):
      drm/mediatek: use DRM core's atomic commit helper
      drm/mediatek: handle events when enabling/disabling crtc
      drm/mediatek: update cursors by using async atomic update
      drm/mediatek: disable all the planes in atomic_disable
      drm/mediatek: remove unused external function
      soc: mediatek: cmdq: remove OR opertaion from err return
      soc: mediatek: cmdq: define the instruction struct
      soc: mediatek: cmdq: add polling function
      soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
      drm/mediatek: support CMDQ interface in ddp component
      drm/mediatek: apply CMDQ control flow

CK Hu (1):
      Merge tag 'v5.5-next-cmdq-stable' of
https://git.kernel.org/.../matthias.bgg/linux

Fabien Parent (1):
      drm/mediatek: Fix indentation in Makefile

Mark Yacoub (2):
      drm/mediatek: Return from mtk_ovl_layer_config after
mtk_ovl_layer_off
      drm/mediatek: Turn off Alpha bit when plane format has no alpha

Pi-Hsun Shih (1):
      drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane.

Yongqiang Niu (3):
      drm/mediatek: Fix can't get component for external display plane.
      drm/mediatek: Add gamma property according to hardware capability
      drm/mediatek: Add ctm property support

 drivers/gpu/drm/mediatek/Makefile           |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  76 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 +++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 204
+++++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 184
+++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  56 ++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  47 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
 drivers/soc/mediatek/mtk-cmdq-helper.c      | 147 ++++++++++++++++----
 include/linux/mailbox/mtk-cmdq-mailbox.h    |  11 ++
 include/linux/soc/mediatek/mtk-cmdq.h       |  53 ++++++++
 15 files changed, 666 insertions(+), 261 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
