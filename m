Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAD4C54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 01:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oPqNoh4XwViDpcqgPnVTYVHmgJBWp1+827qEDxJS0Q=; b=DZ0pjwRNccZ515jDXAzSpV9SG5
	fCLrsD7eyKzeBJyKYmbqVgrv9XC+Bt3UWkQb5BDUj61rP0FfUrfvq9ADzh3zEcskwC9K8TcjzKEk5
	dDSowCs/YX3KI2B7XKxUG4JRV3ZVv6a4f/dUuZcY9zgHKy4MO53gl+IvSkBswDD8XfKL2Y+YiZ4o1
	JpDcVYSfX/8T6r3J9ffUWHDxKOak68UMWnlk6oDk8tyiBU0pjO0ujfgFonhawKpq6v7D1a8L5W38c
	JsVg+OxUfPQZE41XQAnKprGbF5VbA5bYe6xVNLG1DUQ/xe8XeRN/3l4qC4BFdfq1TDVUGogFFxFpp
	48l59d2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHayi-00CWWN-RY; Tue, 17 Jan 2023 01:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHayS-00CWPq-UM; Tue, 17 Jan 2023 01:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6oPqNoh4XwViDpcqgPnVTYVHmgJBWp1+827qEDxJS0Q=; b=qf80N2x4rXkmyaXy8SIHPknJrj
	O7r5mVvjGM9wWzQNtdeMEBc8xHDx0JbNyR634/y8TNiWWfMOnJ/t2E8nrVfdS6bmWBFyA5KcNLOAd
	/q43M2nXkveakYDYXaOIZPMdoDbuuTjCXwc76tXmKCCQxcniaWYC/qkuCvSdN1sxo6fKomwx996e1
	jWvTwDLCvT31fqnpqPIvvXFysd7S+XrXKpN2NStyo4Fkzav24qzEIL1qcoJ7/oB7G6Au2aUJnr0Fm
	5X6/W5R2lsfdpbrE2/13xn0f3YXg9nA06fWmj19A4819gGBJU1/hQsYcCFj49pLvgVOjEGBu4hWSF
	6XZ1GiUQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHay7-005mtL-1k;
	Tue, 17 Jan 2023 01:41:04 +0000
X-UUID: f5443d38960711eda08d4d6090ec5a5c-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6oPqNoh4XwViDpcqgPnVTYVHmgJBWp1+827qEDxJS0Q=;
	b=oUzzpq7ebqwSk/gnoBji/C7Uac+qDLRj3G8PgHtARt3uNO4HpgenaZ9BaHQ24DNIqyg3t7U9uaomra2UnSSXHVzYe+tqh4y43Sq38Cnnle8FnIUFkgtfx2TIy8+dg+zzQu6g1BTqtU/3N18jjp4ZCNt0QpmAwb7zRcpzSxVSlng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:594f28b9-21ba-429a-9d87-3fdf3e142418,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:594f28b9-21ba-429a-9d87-3fdf3e142418,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:7226fef5-ff42-4fb0-b929-626456a83c14,B
	ulkID:230117094045QY00FNW8,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: f5443d38960711eda08d4d6090ec5a5c-20230116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 118414364; Mon, 16 Jan 2023 18:40:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 17 Jan 2023 09:40:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 09:40:26 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: watchdog: mtk-wdt: Add reset-by-toprgu support
Date: Tue, 17 Jan 2023 09:40:22 +0800
Message-ID: <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
References: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_014102_166302_2FF481A1 
X-CRM114-Status: GOOD (  10.66  )
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

In some applications, the mtk-wdt requires the TOPRGU (Top Reset
Generation Unit) to reset timer after system resets. Add optional
mediatek,reset-by-toprgu property to enable it.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index b3605608410c..55b34461df1b 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -52,6 +52,12 @@ properties:
     description: Disable sending output reset signal
     type: boolean
 
+  mediatek,reset-by-toprgu:
+    description: The Top Reset Generation Unit (TOPRGU) generates reset signals
+      and distributes them to each IP. If present, the watchdog timer will be
+      reset by TOPRGU once system resets.
+    type: boolean
+
   '#reset-cells':
     const: 1
 
-- 
2.18.0


