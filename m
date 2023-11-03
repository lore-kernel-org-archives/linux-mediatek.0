Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E270C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=36KOaLQYZpx+CBVDxAIZQHr56OQpZtru/mLgKhFMQEI=; b=Y0YQo4oCPAmdg8zu9r4LzCbOB0
	2Z69keL7NuGzX4AY/iDS8bGVDveERwnyr3gd/yLgFSIwvEMK++wCvlFZQ/XHznwUBfaH//gDrcDlK
	MDXAIOUcKqJa/bm6Apasscj1akOr+vt8SAQK8L7REpmerC3zQIvyMhoGtIDn+hj8Agd6cl7Sagche
	SjErp4ETpfTytACY0ZJS2/urHlwaw6euXLCofD4UiXcKPLrwM1JaGuPjCiB1DJe+dO8TyfE1/BBKj
	I0XcfDKfyMgRCIjMU4JTjdmGibTlsJl632PfXYbL5VYrOQICVs0dG8W5u/ca4POvL+kFTZjNwK+lF
	xQszwOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyqtm-00B5Gk-1M;
	Fri, 03 Nov 2023 09:55:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyqtf-00B5D2-2k;
	Fri, 03 Nov 2023 09:55:27 +0000
X-UUID: 1831991a7a2f11ee9b7791016c24628a-20231103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=36KOaLQYZpx+CBVDxAIZQHr56OQpZtru/mLgKhFMQEI=;
	b=XNCq4frNl7Ure2q48Gzr9eohKPPCXYcUD08RYIj7e4srQZMUo4WD5pl79ESAMyk+u68lK7dqaCLtE5RZROPCVw6TNg62Qf6zP+VwIKL0Qwjn7sHVcABWQFTj3bB6sunQOttBV4Z1EJM6zjBIhHLpq1WmDep2vbfT7TuiZ1x2HwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:0bec67f2-bc5e-426f-aa84-4da7eb0228f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:0260a55f-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1831991a7a2f11ee9b7791016c24628a-20231103
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 804619034; Fri, 03 Nov 2023 02:55:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Nov 2023 17:54:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Nov 2023 17:54:40 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] ASoC: SOF: mediatek: remove unused variables
Date: Fri, 3 Nov 2023 17:54:29 +0800
Message-ID: <20231103095433.10475-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.552300-8.000000
X-TMASE-MatchedRID: CZ72wFVpXzbtt0HEL3BUV2ivjLE8DPtZhQaFqMRElgmctWHPLT5FfaOh
	e5t05aXCoMrRxniPIdrzXqndlTSd4XrAhMQyuycqngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AEgBwKKRHe+r9sGaC9CZ9ufaSe4AUD2MhNW9T26wF2Q0+trTZbfiv2vIgRPkrFqNz8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.552300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A73DFE082454B4F6E5DDA2F6EB029BB6F4A21EB136424A16F44F6AEAA72751B92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_025523_914580_8E1EE87B 
X-CRM114-Status: UNSURE (   6.39  )
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

There are some variables that are no longer being used because they
were declared for the deprecated memory layout. Currently, these code
sections confuse the users. Therefore, this series removes the code
that was implemented for those variables.

Trevor Wu (3):
  ASoC: SOF: mediatek: mt8195: clean up unused code
  ASoC: SOF: mediatek: mt8186: clean up unused code
  ASoC: SOF: mediatek: remove unused variables

 sound/soc/sof/mediatek/adsp_helper.h   |  4 ---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 49 --------------------------
 sound/soc/sof/mediatek/mt8195/mt8195.c | 49 --------------------------
 3 files changed, 102 deletions(-)

-- 
2.18.0


