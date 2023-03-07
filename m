Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFEBC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 04:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DB2Uxt1RaCktv7zz4ekz5QzDi7zff0EFv7ICF/t918I=; b=QQiod1XqQ/5K3+gXgbumIbTTHK
	BGycCTeNPFJdYmNQZwfco+mph5mhf9G8udfl5hP+sHKYVGnTcXVHfzVUu6S0L7FrVUEsTFXvtVwKY
	u4OIn6WPoSAaUiuFoRSzvm/bpx9nt/K9N5l/P/IZrC7kUpC+Z4/0asv5aAAMZnQX9TKR73q6PU9Z/
	c1bmAxhmj5fFc7TBWzqWxTWAn3/zzpAbOpWDYXMeyfymyldglwpd/d5kACStwIA28QQ1yXWsw0b5y
	X9ODrvK7F7tTLWgZavW1JCfOB9OVWzoV18t81zfIQoH8RqZRe1f8pp5kIuBeQ9B3APQtHb6KU1XK/
	3bVPbJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZOec-00G7Gq-F1; Tue, 07 Mar 2023 04:10:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZOeR-00G7BD-BU; Tue, 07 Mar 2023 04:10:12 +0000
X-UUID: eeb3af64bc9d11edbbe3f76fe852e059-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DB2Uxt1RaCktv7zz4ekz5QzDi7zff0EFv7ICF/t918I=;
	b=giTpxcRhqeUDEp33iyl/SXAv0sT2tktJgpsi+2gn77uaNm7prHs35gwfC/y6QC27EbjgABCcQo2apOKL0gHIYIQQs9LbUKHQQAubxyT3fR8LtLg0yJAgzaPsW9Jwo2DDyKr3EMt2BBHgOq8Mi1XYTkL+1lveq7TvyeEZgAGH7js=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:ebdffb73-09ac-4ba3-a74f-fe5b2e989d61,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:07188c27-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: eeb3af64bc9d11edbbe3f76fe852e059-20230306
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1659819314; Mon, 06 Mar 2023 21:10:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 12:09:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 12:09:40 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <jiaxin.yu@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] ASoC: mediatek: fix coverity problems
Date: Tue, 7 Mar 2023 12:09:34 +0800
Message-ID: <20230307040938.7484-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_201011_418049_308D9F0C 
X-CRM114-Status: UNSURE (   7.09  )
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

Coverity reports some UNINIT and CERT STR31-C problems, so we add 
initialization and dai id check to resolve problems.

Trevor Wu (4):
  ASoC: mediatek: mt8195: add dai id check before accessing array
  ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
  ASoC: mediatek: mt6358: fix UNINIT problem
  ASoC: mediatek: mt6359: fix UNINIT problem

 sound/soc/codecs/mt6358.c                   |   2 +-
 sound/soc/codecs/mt6359.c                   |   2 +-
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |  17 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 177 +++++++++++++++++---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  26 ++-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c   |   2 +-
 6 files changed, 188 insertions(+), 38 deletions(-)

-- 
2.18.0


