Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8109FA373D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GxTScHc95rAlhDh/s52djMefw1krEYgEA7nv6cnnb8A=; b=v7mWt6h9LPULM+QDBo/IXVmoqU
	ObNVtPKHrahzWYcnX6cwdQxfUOlvvM8H0VQ1nfrKTITQ2nrrxkXv8iyZMucldDWVqbsQ11XDIJQA5
	aY243yammehaza3Kdg2G/xxVTZdVPSFdotUsISWE9iDlAAfH5sj2m8TF7AsKykEy9hbHm/oCb2hgg
	etCdtrtCxo6hIo0icsPXOFEPIFrW+L0TSWP7MJpsmz3U8L4V942iLXc3pCZdJoxegMvuK4ycNurRc
	A2YCVpBP1ir+RceTtSBd4xmpW6idNERzv+rwIqVHoGkBUYFpl9A5pAG30GVyrTH1O1HFAasoLztJ8
	WSeJklvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkVF-002Nxt-MZ; Tue, 01 Nov 2022 06:12:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkV4-002NvO-GY; Tue, 01 Nov 2022 06:11:51 +0000
X-UUID: 764e085e631747288dbd3172d1c165a3-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GxTScHc95rAlhDh/s52djMefw1krEYgEA7nv6cnnb8A=;
	b=Z00mFAFZlNTpt4nb5ZCIDDjaCCJjJA8W5pv2/hCkaCNAaWgbeqREZrj6FZEt7TfexhnWPZ4Km7fLco83l5i2zbmrd2bCXi5hDnmRb+sCgyBKdoIsy2rPX7l9QGdBZu/t3OHBsFuXpysiVVcYx9/m7SxPaXJqNgpweq9EKK0xGLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:695a3a9b-b4d1-4ab1-80f1-b6af3e22519a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.12,REQID:695a3a9b-b4d1-4ab1-80f1-b6af3e22519a,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:62cd327,CLOUDID:c3433590-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:221101141143ZFIW5XC0,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 764e085e631747288dbd3172d1c165a3-20221031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 99588834; Mon, 31 Oct 2022 23:11:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 14:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 14:11:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Yaochun Hung
	<yc.hung@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 0/2] Revise mt8186 ADSP clock driver
Date: Tue, 1 Nov 2022 14:11:35 +0800
Message-ID: <20221101061137.25731-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_231150_574223_864F4166 
X-CRM114-Status: UNSURE (   8.14  )
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

Initialize the dependent clock sources for mt8186 ADSP and
fix the enable/disable order of ADSP clocks. 

---
Tinghan Shen (2):
  dt-bindings: dsp: mediatek: Add default clock sources for mt8186 dsp
  ASoC: SOF: mediatek: Revise mt8186 ADSP clock driver

 .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 12 +++++--
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c    | 35 +++++++++++++++----
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  2 ++
 3 files changed, 39 insertions(+), 10 deletions(-)

-- 
2.18.0


