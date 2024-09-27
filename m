Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480EFCEBF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/LHB3ZMIqikyE3aOw6Fje4NJlQOFH8RU3i7QXhs1LQ=; b=vc0LxAD+7+64unEuHDDJWCp5qW
	U3t4n/3Jf8+7fIQ+3IDed3HQ+R47b8CUwy+uq6TWD3zytIfXKr4PWYfzTekrFh7Vnc8pG9hx/tqcy
	mkxkb2CesHEwmCLjzm0+lZqDvgJrqOMgxA1K9aDxvs8MBCL/iPwzy0u13BJ3sF9Matxd1pK71e/4T
	/40Vmj59J13SESe6OQ6XyhVhMNTPwEGqSd2pc//MrRX7gpB2r9eV8FUu40rSJaAMUu4pUKFKejzwc
	OYx90+LYmKUiGgVIDnf+huo/tkMnOKPHn+B6rqOPsDNOjb85x7YoERlG4QYkBOXIpnTktH3csDtgG
	y/I+zAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su8LU-0000000ApnU-3kh9;
	Fri, 27 Sep 2024 10:37:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8Fp-0000000Aomu-3Uik;
	Fri, 27 Sep 2024 10:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h/LHB3ZMIqikyE3aOw6Fje4NJlQOFH8RU3i7QXhs1LQ=; b=ZWOy9l3nH4Qt/tCOXkfqqDm8FS
	55eqefOFOC9+lManSvVIh4KZAIU4XORIQre9hgInSb442edNHekph0GiNbMpeqBtq5qRsvMW6GCJR
	rC9wFLkAQtnXjWPfdBjdiINd/Kr7yQ1hjNxPPv7nOmtneaiFSoLfE/7FJPtlV06HGkEefmhqDps5H
	Wd5XqKI4LVXHqAGP7LJI7QrXL40t53/SUiEM+EcvUWCF5Qtowvl5nks0LlIvUNSOoquIr28SountF
	VROJ1t9caNg7Jf+7lQmWo8Bw5F11WEGZuV35kyKsPl+MCNkCR0oKZgpoijHZIQaQ1mSrVlMrT54DQ
	wxQXi2dw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8Fl-00000002KVj-3ybR;
	Fri, 27 Sep 2024 10:31:16 +0000
X-UUID: 96839f047cbb11efb3adad29d29602c1-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=h/LHB3ZMIqikyE3aOw6Fje4NJlQOFH8RU3i7QXhs1LQ=;
	b=dJykBayBELalyMMTTdLm7zNKyVO2NUlQqhmPQ9jbS5T7Q40RwRp6LtEa5Kz7y+lVog8baOfUbSgKxrhGT4Dt7HPDhHXE55R/JD4/6x6BES9LON6/7ZdLsM0Lo9fpZqKu7uWHBSwWvGjGdG+dKBNKCXKaRFcII+ZXRQMfAcgIWsk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:eda72691-f79e-46c4-9463-a81b8974756f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:dade5a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 96839f047cbb11efb3adad29d29602c1-20240927
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 360115072; Fri, 27 Sep 2024 03:30:59 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 18:30:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 18:30:56 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v2 5/6] soc: mediatek: mediatek-regulator-coupler: Support mt8188
Date: Fri, 27 Sep 2024 18:30:04 +0800
Message-ID: <20240927103005.17605-6-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240927103005.17605-1-pablo.sun@mediatek.com>
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.054600-8.000000
X-TMASE-MatchedRID: msJaThnkmNZayfMsaQo1Yu0yyL51qL/RoA9Le8XJpbpcKZwALwMGs5cF
	n+/+Esg7Ev0kmovGJccBtjkcfRMmqUfr6WG4Th9ayATMS/tDL5h9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrQK0HCTribQWTnu6+Q9g++1ayR4tFJT475kkMxBaxnVVvPWAcMDQBWtqVT
	6JmZ7BwDqjXUZtJJR/TCQXVISdQxKZ5ahCeX/umsGQYFMiVRG5ehcPPz6UzEWlb5ogMngNpHOTE
	n5IiRSOady5RJQR05c=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.054600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3CB527BD4A245732867C341859077F95F8FB5A44F287851BAF02C0D236C39F702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_113114_477572_27BFE4E7 
X-CRM114-Status: UNSURE (   9.37  )
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

The Mali GPU in mt8188 also requires coupled power supplies,
that is, the "vsram" voltage should follow the "vgpu" voltage.
Therefore add the compatible to enable this coupling behavior.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 drivers/soc/mediatek/mtk-regulator-coupler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index ad2ed42aa697..0b6a2884145e 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -147,6 +147,7 @@ static int mediatek_regulator_coupler_init(void)
 {
 	if (!of_machine_is_compatible("mediatek,mt8183") &&
 	    !of_machine_is_compatible("mediatek,mt8186") &&
+	    !of_machine_is_compatible("mediatek,mt8188") &&
 	    !of_machine_is_compatible("mediatek,mt8192"))
 		return 0;
 
-- 
2.45.2


