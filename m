Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F89C5AE4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZxZ3pd9QKUMQPsMbgxXDTSwYVgjtwCn7yO7jHi/LzbE=; b=pNrPE6LRdmbF9pk+XkCjNHpsSN
	9jenApxOMuDL2cHWMoPf94BvT+CmhxZfdnL4kqhKNRUVl+2pm3C+K9S6WaNgZxDhNJ7zv7Bgccdx5
	4ckg29WS7G9EDrAWdIw73H+PAKmxBNC0kNW6mU8/fkPt0tP/ao9gX1MifA9LjsGGvrcFeDjymmCO3
	rbb5FSiN9V9alc1Ll/ClelFKtmIXlm14RG20HWO93scDc5j5ROdvH4AAD8OBwF55KWuBKA7E6zXqU
	HiVEAcPBO/dYdGJPe3CTsLk0n2HnymesEDc5uniin3jgyy1/0YvrzqmJINYJ47Ezz+5uVAGQUaykK
	vdJt0V8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3XK0-002ozQ-0D;
	Thu, 16 Nov 2023 08:01:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3XJv-002ow2-2x;
	Thu, 16 Nov 2023 08:01:53 +0000
X-UUID: 5cfda666845611ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZxZ3pd9QKUMQPsMbgxXDTSwYVgjtwCn7yO7jHi/LzbE=;
	b=H9QzLX0W28DUY6eL2Mp5Qh90yZj/wksb+Iu4YYhJNCUtlfnRtf3Ilv90VM8fxVQ0O30n7PXlMuB4r4dPn4F0IQ/kPmRdtw31iBcTc+jaMMXRQmiTJoRJ3SEw7+G/tFwTiof3nMBR3GsAthUdkcqsxJi07rUMTPpHr3YCgwzKri4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:ea1985fc-5153-436e-8e4f-fbdce74a15f0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:46dd7595-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5cfda666845611ee9b7791016c24628a-20231116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2019243166; Thu, 16 Nov 2023 01:01:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 16:01:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 16:01:32 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Garmin Chang <garmin.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH v2 0/3] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Thu, 16 Nov 2023 16:01:26 +0800
Message-ID: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.560300-8.000000
X-TMASE-MatchedRID: C+hvtS4FT8uvVT6bfkFW/gzi9ePw0R3QsEf8CpnIYtlkDFfw8NSG/Gb6
	PphVtfZg4wnhOb+JR+SAMuqetGVetiVvu9chHp+mavP8b9lJtWr6C0ePs7A07X1HhKzShSYnDel
	VDFbKGP8qA6iL/EaSBdVNHrvW36ZUesAV/+a7hKIzi4B1G5jJU3/5funDHxqRQFMdvtQNIUtW+v
	GRK1IMn9lrv6b+lasIdmtRsRmKkASJZPT2ZDPuzPD2QfzMDLjho65UufHcDvg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.560300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 46FE3587E7C58FB6D44B59ECC25C0B042683D82F71CDB16E6E8B57DDC73891D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_000151_956319_929DCE76 
X-CRM114-Status: UNSURE (   9.26  )
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

Changes in v2:
- Refine commit message
- Refine commit title

Hi,

This series is to reflect VPPSYS' dependency on mtk-mmsys driver for
mediatek MT8188 platform. The MT8188 VPPSYS 0/1 should be probed 
from the "mtk-mmsys" driver, which then starts its own clock driver
as the platform driver.

yu-chang.lee (3):
  soc: mediatek: mmsys: Add support for MT8188 VPPSYS
  dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
  dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml        |  2 ++
 .../bindings/clock/mediatek,mt8188-clock.yaml        |  2 --
 drivers/soc/mediatek/mtk-mmsys.c                     | 12 ++++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.18.0


