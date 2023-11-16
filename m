Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C8EC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9d7TXQIk3+RrPTfENZLQsTLYBMK0/HZ3yBRZwqiBzg=; b=Dw6waqZRkfv9RqgYmN8zz+/2f0
	x4WHBQA9HpToszr5CMCrTEZl/UbYaFNP4qk/FLZovRBsnV0r+x6/H6Xp0MEkUTo+XxFXdGsqAxjmy
	0AYg1uknsO4XnLy9GkO3k9wri5PXQ1Vd4DogHBv9dJ40fh3Wty3o310t2gUfNLnPc+0pnAemsrcJX
	dOQ/wsCwUBd/jFzq6VpvIut8dENP+ym73tH2V93xYocc8xMLb2lBuWYmcJPzz6oTmRLQASEYZSieQ
	ZNSOhsNxnT7yTsVhrFZK8sNcrGjyycGnbZXJjaiVMPguxPHr/udD4+nGeLPThMFo2oXdLjYQUrRRm
	gKndKnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3XJy-002oyR-0X;
	Thu, 16 Nov 2023 08:01:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3XJv-002ovr-0t;
	Thu, 16 Nov 2023 08:01:52 +0000
X-UUID: 5cd85d5c845611ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y9d7TXQIk3+RrPTfENZLQsTLYBMK0/HZ3yBRZwqiBzg=;
	b=FDkNYtspbE0IgZqQJrwFlgddtzYut1OghpkU0Y04k+YSyL52lnWpC/i5ubXiCqfrPR8ITogbz2tC7RJ/tDwNAMh9prpSOpyCSGZTCg4teTn2uzp0izeNRhB8OBHZocBDkhCXSS/lti+rklNIzwhAzWuv/mcMdDLbyKMDTUk2gZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:80b4d5b0-2f06-45d0-a3a1-8613636c23be,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:33bf2060-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5cd85d5c845611ee9b7791016c24628a-20231116
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2101944219; Thu, 16 Nov 2023 01:01:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
Date: Thu, 16 Nov 2023 16:01:28 +0800
Message-ID: <20231116080129.20617-3-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
References: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.043400-8.000000
X-TMASE-MatchedRID: Ot1QB8gGm1gQKuI1NEGZQRWCVBr+Ay98PZmbnY2qDInfUZT83lbkEA0F
	DzFL1GEo4vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpnH7sbImOEBTSpd0hmga4zp8Fot46YbXYd9y
	mTdOmg6JVHgGjvtJvdFNRG3MBWsYcNOaXFu8svTn1xAwvzFHhRyE2EcaDHQ/UlJ2a0It1u9ZJmt
	82E/eyBQGH0CAFIQWsmb5gmylW+PbGS+seVPx64j6Qrn3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.043400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BE4296F2674A09CA42AE309399C1EFCF975177F8B1DBD697B12B72AEE86BC5A32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_000151_320610_AC23A74F 
X-CRM114-Status: UNSURE (   8.61  )
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

MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
populate device by platform_device_register_data then start
its own clock driver.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index d7214d97b2ba..860570320545 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -43,8 +43,6 @@ properties:
       - mediatek,mt8188-vdecsys
       - mediatek,mt8188-vdecsys-soc
       - mediatek,mt8188-vencsys
-      - mediatek,mt8188-vppsys0
-      - mediatek,mt8188-vppsys1
       - mediatek,mt8188-wpesys
       - mediatek,mt8188-wpesys-vpp0
 
-- 
2.18.0


