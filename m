Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C75C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 12:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u4vljocczANnU89Yp8wpFGeJ8zLUuIGvCpPD1nKa2W0=; b=loSBKa1XL0c57eyPm/KY1m7YHj
	dP2VWftelUrQTNkrHaVu4NysQ6CqHq/6a9EI1syFYLeDYVEm3GbHJeOEbZ5eVaHPLbriJ4s3rLZBN
	s6PEyCmo2YXWogBjd3Cz7iBdb0oYq53fMB7ZmIVqfz78zlrhdYt6ytEVSWuQ8F+dfdy23erCCDg8V
	nY6HCzyHJbMGJOMjsyRIXXwy8i6qnDimyhrfeB7J/NxsjvfEzl7GbPH1Rq7sdhVzhsshpsykZnLVh
	au8/W8zGjCbfjFIO0FWaQ0aLE4Zncatt3WKjyoGHlrjH3Y0wLI25pg8eGLxJZeJyDhoaVLbK2PdCY
	MVRvYq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FWk-004ixB-6g; Fri, 01 Jul 2022 12:13:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FWL-004inu-GF; Fri, 01 Jul 2022 12:13:16 +0000
X-UUID: 70c5d0450e9641c58c2ec622011bd3a3-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:3706705e-411e-4e9b-8251-271828a27af1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:47c85ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 70c5d0450e9641c58c2ec622011bd3a3-20220701
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2028074504; Fri, 01 Jul 2022 05:13:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 20:12:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 20:12:30 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-remoteproc@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/1] enable cache for mt8186 SCP
Date: Fri, 1 Jul 2022 20:12:28 +0800
Message-ID: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_051313_603674_2B2C4743 
X-CRM114-Status: UNSURE (   9.69  )
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

This patch is based on kernel/git/next/linux-next.git/#master and for
enableing cache in SCP.

In mt8186 SCP, it provides parts of these features vedio encode/decode,
camera, and CrOS EC host command. We don't have enough SRAM to support
too many text segments, heap and stack, so SCP will use DRAM as execution
space.·

The DRAM power and latency is much larger than SRAM. cache is used to
mitigate the negative effects for performace. Also it's designed in SCP
bus architecture and does not affect implemenations where the application
processor is using caches.

We reserve 0x3C000 <-> 0x40000 in SRAM(SCP) to support cache and set
I-cache and D-cache size before loading SCP FW. If there isn't no this
patch, SCP still works with DRAM and SRAM.

This driver was tested on mt8186 with below firmware

This driver was tested on mt8186 with below firmware
https://lore.kernel.org/linux-firmware/10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com/T/#t

changes since v1:
 - rebase to linux-next
 - add more information in commit message

Allen-KH Cheng (1):
  remoteproc: mediatek: enable cache for mt8186 SCP

 drivers/remoteproc/mtk_scp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.18.0


