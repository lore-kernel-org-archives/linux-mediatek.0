Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26960CD13D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt+OxCGq9e8n3CGg5e+xxIu82/k123T4ktSMPM8Uz+E=; b=O6X1SG/p71cGK2LJ/Mj6PnOXXw
	R0ZsubRM/LhUL298iRW2LisyKc7yjjDylF0UJGsXwGh8HEhB7ffjHZ8kOZpB7EvGo2Qz0VCRYPMJF
	wiDkMz5WvgW9EUP10exvjzkkQK8n3A4/nyCQQC3z9mwIyRbg9NuF77fpz3EoRhbMiQPtXeyc4y5S/
	14OfH/r9I9/YTgifU1KAwPY57wnckUN1mRnFesrnxUYstUhiktKTK27oXJ09TCAzxiM3tc/4l4hK5
	BC0QN0grBwf1+y2mZqUyXUVO+xCoxW2B7sqGC4+Nf9kG+WeULhppHu8FhBpd7PMSLN3EqQCTw+UUi
	N/KQ88dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiP3-00000006dn5-1BeS;
	Tue, 11 Nov 2025 07:02:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOn-00000006dTv-0Nmx;
	Tue, 11 Nov 2025 07:02:46 +0000
X-UUID: 63ea7974becc11f0a52f393f94899d25-20251111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bt+OxCGq9e8n3CGg5e+xxIu82/k123T4ktSMPM8Uz+E=;
	b=rAhuILIhiIjS3I0SFN1kj9el8LY7mk4f5nG3dGZR3CsjN085BdUirr8OaPd7aj0WPMbxtJmJtI3z3WAB+K5O1oaYSSp7hR20VjYu1sPS8tdP5WfNsgMsV/K0gqXqEz1AHt/nUXJgVEVjOw5VEYzwtgxzF55a1+7nwPNBiHg0zDo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2e38b968-5e7c-46df-aa34-c737c099b8cc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1f96aaba-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 63ea7974becc11f0a52f393f94899d25-20251111
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 237315593; Tue, 11 Nov 2025 00:02:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 11 Nov 2025 15:02:26 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 11 Nov 2025 15:02:26 +0800
From: Jack Hsu <jh.hsu@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srini@kernel.org>,
	<ukleinek@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<chunfeng.yun@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<sean.wang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<andrew-ct.chen@mediatek.com>, <lala.lin@mediatek.com>,
	<jitao.shi@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jack Hsu
	<jh.hsu@mediatek.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/9] dt-bindings: arm: Add compatible for MediaTek MT8189
Date: Tue, 11 Nov 2025 14:59:15 +0800
Message-ID: <20251111070031.305281-2-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251111070031.305281-1-jh.hsu@mediatek.com>
References: <20251111070031.305281-1-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_230241_145138_E0A4C093 
X-CRM114-Status: UNSURE (   8.79  )
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

This commit adds dt-binding documentation for the MediaTek MT8189
reference board.

Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 718d732174b9..cb0eda4e87ac 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -389,6 +389,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8189-evb
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.45.2


