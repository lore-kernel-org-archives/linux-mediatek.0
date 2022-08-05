Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A16CC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/879l+H3RFGaLmfxga/PuY3eIBIJa84JsBHgmHvRwH4=; b=tt/d7PUQbdL+bwkgYw3YOI/CgE
	JTz/ZNc3b/67dLUaGzOrFqoL6slRdREB7rOe3VQ8fUtkrhjAgfosASn6ejd4VNrqsxLaKzW9cJV1K
	+g2x/gYlgzrlPraqUHdigSb9V9Zzpt5nmhog0mhN/lmnhaEzyrTRvKe5JM3krzqdZUluBxsi068dI
	9+J24KlidoimNCnQQpixRjXf3ZQQjYVmQcPyO8OgceWy6oCJa+pnN43yS2/Ex3m1p1NU0hoyGJTrs
	owJpn3B9FcbZSVlAo4JQN0QTXAkGBl4VBb1v7WmRxm/2D6QjYa2EYa3WSTzPduY0nUsu/ysqU8f6F
	XtuGqRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrkj-00Crsu-Fl; Fri, 05 Aug 2022 07:28:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJriG-00Cq7Y-SL; Fri, 05 Aug 2022 07:25:43 +0000
X-UUID: 5a468348d45049188622b193445d617b-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7ef28299-fa17-452c-8289-25085da1b9f8,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:5b2c02ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5a468348d45049188622b193445d617b-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 306442886; Fri, 05 Aug 2022 00:25:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 15:04:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Aug 2022 15:04:53 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, chunxu.li
	<chunxu.li@mediatek.com>
Subject: [PATCH v2 0/2] Introduce sof_of_machine_select
Date: Fri, 5 Aug 2022 15:04:47 +0800
Message-ID: <20220805070449.6611-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_002541_476077_64178641 
X-CRM114-Status: UNSURE (   6.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "chunxu.li" <chunxu.li@mediatek.com>

Change since v1:
  - remove the callback of_machine_select defined in sof-priv.h
  - move sof_of_machine_select to common code, and called in
    sof_machine_check
  - rename .board field to .compatible in structure snd_sof_of_mach

In these patches, we introduce function sof_of_machine_select for SOF

Chunxu Li (2):
  ASoC: SOF: Introduce function sof_of_machine_select
  ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186

 include/sound/sof.h                    |  2 ++
 sound/soc/sof/mediatek/mt8186/mt8186.c |  9 ++++++++
 sound/soc/sof/pcm.c                    |  8 ++++++-
 sound/soc/sof/sof-audio.c              | 30 ++++++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h             |  7 ++++++
 5 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.25.1


