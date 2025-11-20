Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E8FCF884F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhFHowXMcyHG6GlkMqEO6UqfBe56kP38J9fnw9ieP9c=; b=C/ETztXXioQFyTO9x3CnBos7qf
	S84dezATStWcpL13F+q5yiZcy9Bw+Adcn3zyNd5c8DtVhr1TqOMO+bNlYLlFt9lJNKPYpVHhYh6Ab
	zhoqW3JCUxZSaiLKfoDVIy95gPSK0AO577fiBgrpb/0Z//JyEuruF/aRH/zggTZJMkETcxxRhh9jG
	0Ns94WTtHczcPZM6THuKNXdPtI1R4acLsh54L86whMHvg8KwXhgkLWOWslMQ2ThszMjT5fC0hOZ9b
	2FoZtKLdyQCNQ3EP3WxdZgPRzaYso/UMFOoAu84Lr0/1hQA4MxKYlUacDW+GlMS80MpALJjrfmpmH
	DTDPaPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cW-00000006ecW-319j;
	Thu, 20 Nov 2025 12:18:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cJ-00000006eV0-2b4M;
	Thu, 20 Nov 2025 12:18:29 +0000
X-UUID: 01bc737ec60b11f09f706fa2197c6ceb-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dhFHowXMcyHG6GlkMqEO6UqfBe56kP38J9fnw9ieP9c=;
	b=hiRh41++VS38xsUpRFkq21EDzJzQlUUC1jYcNEpuLoz1MZ41sHh8LWcpsjdgr6MLzR+JjxPLE0AimzZh3QwZiMAJYuTKrh4SSBMpWmYgo5KacaJDcYeaVn9TVXa47INxk+PXTNmEK3pcVaVo9X6VoXrpSaULsZGehgwKXRZkL2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d8f65f48-b61d-4e42-b889-ed96b594e93d,IP:0,UR
	L:0,TC:0,Content:51,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:51
X-CID-META: VersionHash:a9d874c,CLOUDID:137304bb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 01bc737ec60b11f09f706fa2197c6ceb-20251120
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1282097305; Thu, 20 Nov 2025 05:18:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 20 Nov 2025 20:18:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 20 Nov 2025 20:18:19 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eddie Huang
	<eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>, <Vince-WL.Liu@mediatek.com>,
	<sirius.wang@mediatek.com>, <Jh.Hsu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt6359: Add alarm-sta-supported property to RTC node
Date: Thu, 20 Nov 2025 20:18:01 +0800
Message-ID: <20251120121805.6775-6-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_041828_226079_2849697C 
X-CRM114-Status: GOOD (  10.00  )
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

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

This patch adds the 'mediatek,alarm-sta-supported' property to the RTC
node in the MediaTek MT6359 device tree source file. This property
indicates that the RTC supports alarm status functionality, which is
essential for proper power management and wake-up events.

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 467d8a4c2aa7..62a2d745c8d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -302,6 +302,7 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 
 		mt6359rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
+			mediatek,alarm-sta-supported;
 		};
 	};
 };
-- 
2.45.2


