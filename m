Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MRg2fm0s6bUDIbASGkqLnl+zPVREoIqFAcA0G6geEks=; b=KV5Qw5cUI4CgMo
	/0kyawMBGSegpOn7j3dU0ZyMJ7Z8KGc1brzAo1gqkbMUlJJw5MO5nYEkmUBNOfwF+B+CJ/I+8Mszm
	N0XOunCS9VYKWBAxw/i9uulstdBeiY9aiDVaDSJFLxpxEMLrLfhZv1RKR5PepSmdzHlQdN6uUITqf
	vvqQfSSHJ8tLh/p9tUO8vbQwyKktCmslYIglRY++9fK7w3ACjo2g9sr6v+HLJXaupoqk1UC/3UliG
	jnFVzmpwe0buDmS4D4cQBR/l65P0I3K9y4bIjEL/ZIADNjrk9fcjoCz0t5kE9a6GWr4i+rxvB6Om+
	8emdb3Y2jVilt6rsvfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRquq-007dBa-1s; Wed, 09 Mar 2022 07:39:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRquG-007cxu-0g; Wed, 09 Mar 2022 07:38:49 +0000
X-UUID: aaaaf6bad4414c098500337f5499dd5b-20220309
X-UUID: aaaaf6bad4414c098500337f5499dd5b-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2128275266; Wed, 09 Mar 2022 00:38:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 23:36:40 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 15:36:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 15:36:39 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <matthias.bgg@gmail.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <narmstrong@baylibre.com>
CC: <xji@analogixsemi.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [RESEND V11 0/3] force hsa hbp hfp packets multiple of lanenum to
 avoid screen shift
Date: Wed, 9 Mar 2022 15:36:34 +0800
Message-ID: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_233848_079157_FCE492A7 
X-CRM114-Status: UNSURE (   8.69  )
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

Resend v11:
 - Resend this series for reviewing.
 - Rebase to 5.17-rc7.

Changes since v10:
 - Rebase to 5.17-rc3.
 - Add more maintainers.

Changes since v9:
 - Change description of "MIPI_DSI_HS_PKT_END_ALIGNED".
 - Use mode_flags directly instead of another variable on patch [2/3].
 - Add explanation of implementation in mtk_dsi.c on commit message of [2/3].

Changes since v8:
 - Use mode_flags to control this limitation instead of "hs_packet_end_aligned".
 - Add new bit definition "MIPI_DSI_HS_PKT_END_ALIGNED" for mode_flags.

Changes since v7:
 - Rebase to kernel 5.16
 - Add tags of reviewed-by and acked-by.
 - Add detailed commit message for flag "hs_packet_end_aligned" in DSI common driver.

Changes since v6:
 - Add "bool hs_packet_end_aligned" in "struct mipi_dsi_device" to control the dsi aligned.
 - Config the "hs_packet_end_aligned" in ANX7725 .attach().

Changes since v5:
 - Search the anx7625 compatible as flag to control dsi output aligned.

Changes since v4:
 - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
   "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".
 - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".

Rex-BC Chen (3):
  drm/dsi: transfer DSI HS packets ending at the same time
  drm/mediatek: implement the DSI HS packets aligned
  drm/bridge: anx7625: config hs packets end aligned to avoid screen
    shift

 drivers/gpu/drm/bridge/analogix/anx7625.c |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 12 ++++++++++++
 include/drm/drm_mipi_dsi.h                |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
