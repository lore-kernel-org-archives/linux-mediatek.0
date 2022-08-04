Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEFFC19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjOc5b0zHei77TuohXdV+t0J6qAlX7EzPH7UVwUbzug=; b=JCo9WJ2N+nJ6o7mpXbGIrRFxUW
	/85dKqi0FwBp/RTO7TtH2wsveaCgJw7jsCD0gKeup6rHFQZzcBrgZsd9juD8Wk2QA2R9IcEwZmUEP
	qwRRDmLZ3uSo8Zg4kstuVUZa/gOmV0zBXOlz9T1DYZyncmkaColI+o3olTBmDr2aQBsvX28LTINin
	CmjEWQ+ipkGEwKPIB+8VvewEFpMhRuhnnTKcc59otQugIh++lbfFR9lKat1IYlRUxyHTIn/UqbiVy
	EGwdgHmZjoEcmgBJ7J5czQGKVIDTlmAvPRoRMm7ehHXsbyM2/W9+d5OFVBdw0OQ6eoqGWitpmyAGf
	lHB+LT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJX64-004nYk-9V; Thu, 04 Aug 2022 09:24:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJX61-004nVp-Pm; Thu, 04 Aug 2022 09:24:50 +0000
X-UUID: 7b1f6f859d344bc3a41454719375a177-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:79c32d78-2f3e-49b9-bbb6-4efa46d665ad,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:3d914125-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7b1f6f859d344bc3a41454719375a177-20220804
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 443263365; Thu, 04 Aug 2022 02:24:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 17:14:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 17:14:07 +0800
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
Subject: [PATCH 0/2] ASoC: SOF: Introduce of_machine_select
Date: Thu, 4 Aug 2022 17:13:57 +0800
Message-ID: <20220804091359.31449-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_022449_850884_85A7F088 
X-CRM114-Status: UNSURE (   6.30  )
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

In these patches, we introduce of_machine_select for SOF

Chunxu Li (2):
  ASoC: SOF: Introduce optional callback of_machine_select
  ASoC: SOF: mediatek: Add .of_machine_select field for mt8186

 include/sound/sof.h                    |  2 ++
 sound/soc/sof/mediatek/mt8186/mt8186.c | 11 +++++++++++
 sound/soc/sof/ops.h                    |  9 +++++++++
 sound/soc/sof/pcm.c                    |  8 +++++++-
 sound/soc/sof/sof-audio.c              |  7 +++++++
 sound/soc/sof/sof-of-dev.c             | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h             |  8 ++++++++
 sound/soc/sof/sof-priv.h               |  1 +
 8 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.25.1


