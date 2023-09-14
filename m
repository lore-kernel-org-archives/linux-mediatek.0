Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7CEEDE9BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKz6L0fgQbYGVpoCL894aRiXFIbPCR811nC+nBXMf/E=; b=D/oYm4tBMw/1ow3Eb8a5Luy14w
	sIWdNJjKTMBL4aW/VidaZWip277VvWuhbpznrmC99ESv9oIFCSj8WAOO5kKW4xBRcFMN5quURzUML
	yapmJDRO7JZa4kfJjOitxwqClmgkSUt7K+91MLeCNt4UvFA8m3193G6KHIQy4nyyv/fbWZiKAp6GZ
	IcNk2Q73wH1Telt8lbOJZTzVmNMmTyRz7qrJ9xLJ4AzfWy3n3a2202GSXfcSQizKyQ+NbK/VwZ0XG
	G1o1PzhQqHo8ks5ogLvHVN/tB3XtXtm+UxqiVPxeAWA7CHOGr16wy+hkj6rF34m/PBqv6tv063A8g
	KAcQpY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglVC-008Kkd-00;
	Thu, 14 Sep 2023 12:31:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglV8-008KkH-2D;
	Thu, 14 Sep 2023 12:31:20 +0000
X-UUID: 97c07c3452fa11ee86758d4a7c00f3a0-20230914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YKz6L0fgQbYGVpoCL894aRiXFIbPCR811nC+nBXMf/E=;
	b=BlsXrh0hNBXlPTnkVfrHxAylmud/v5u5vnil4adaHD99rnA45EpkIWR6XCuAQhNs9/7+rEGWc/pqcy6SB6cmnrnZrqmPaiR7cw8R293KTXmbOIvjgXN8NGZU0NZPMy2ohW5MdO0SwyTGHUul/Sq1eEQjqdy46QqdyeoOl6gMgfg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a031de19-89dc-4129-93ef-681b44afdb38,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:744a07c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 97c07c3452fa11ee86758d4a7c00f3a0-20230914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1670071579; Thu, 14 Sep 2023 05:31:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Sep 2023 20:10:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Sep 2023 20:10:38 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v2 0/1] arm64: dts: mediatek: mt8186: Increase CCI frequency
Date: Thu, 14 Sep 2023 20:10:34 +0800
Message-ID: <20230914121035.17320-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.963800-8.000000
X-TMASE-MatchedRID: Zel3CUePV2i2tlYdo0NnhMAmcZEx8XHJ+KgiyLtJrSCzWpZM44wgRHZb
	RsJ0HDLLlLIxMfkcZY6gVbxI8zQaQh8TzIzimOwP0C1sQRfQzEHEQdG7H66TyMdRT5TQAJnAUxC
	rBvsxJqSSIRqjlsng6kUWYdxa9w6cq781MopyYmTBkGBTIlURuXoXDz8+lMxFpW+aIDJ4DaRzkx
	J+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.963800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D0AE13EF9D738D9BAC88D0512FD03EE7C45DC0BB77354DF636728E6A14A4E8CD2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_053118_736635_5A30F7B2 
X-CRM114-Status: UNSURE (   6.69  )
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

Changes since v2:
  - modify subject and patch reason.

Changes since v1:
  - arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping.
    https://lore.kernel.org/all/20230911080927.17457-1-chun-jen.tseng@mediatek.com/ 

Mark Tseng (1):
  arm64: dts: mediatek: mt8186: Increase CCI frequency

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 90 ++++++++++++------------
 1 file changed, 45 insertions(+), 45 deletions(-)

-- 
2.18.0


