Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E939C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqez+BT8T3P+bnOJ89Ly81+tB76MJsWmGJ/qmPRTHh4=; b=XXd+Dk9CJSCZM21H6Qa3uM4Vt5
	mMpoNGPSlE4ZJcokBQOhQcmi2LOt77c1YrsPChEh99zjuJZTykbTp/JbUqKF8fAfoLSVgHr4Pwg+F
	U6pcK9PwaKGKKdUmmtSCu51S9Nm/LwTCGnHOnZME2fJ3tPlFCRqu8pZfmZvm0Pz/svqBch8z6IBmi
	G7RG2rNgk1idBuNPhEl52toeQNybWH3GcmJ8ShTDxgt3MgLDcfWpcYTAnmRnla86LMRH98d/Aqpww
	hn6j27hKSSKgpi/ui30RTQX/GbLvKdMFIyyLhxBWQCADqqSdgrcEm6I2mlGVJlE8vRcUcjeaGgpuQ
	hP7ANkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFavV-00BTl2-TX; Wed, 11 Jan 2023 13:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFavM-00BTiy-IX; Wed, 11 Jan 2023 13:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cqez+BT8T3P+bnOJ89Ly81+tB76MJsWmGJ/qmPRTHh4=; b=c88ct4T7P4uXRrLyFovaye4b3Z
	rMcIQ1fjsx/PTA4M1glNSUprxPnPh3Bq6WceFYfLkEWWBn/GUZcLYFSvkLCEzE35KwFSu0JXPohrT
	QGm5qTkc6D+gusRgzDwU0mK8PPZkYEEOrGCo33QA5rYEKZzz7QLLHhJ0nVIk+jt0JlRBSN9yyVU4w
	93I65uwPuuRJ5oomLM0D92lkWUCoDsD4RbGz+RqvpYzngE7ZxpkXWvMX7F4l1DwORw06h/tVvxb2b
	vcIAGHayCQXKsb+NvTGeLWWE/zw6XYjBvfY4Mcg74kidu1HtRbtLMlktFkiMJaAhTDeO8dVeqNGI3
	l5Kv+iRg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFaMX-003fol-1L;
	Wed, 11 Jan 2023 12:37:51 +0000
X-UUID: c263783491ac11eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cqez+BT8T3P+bnOJ89Ly81+tB76MJsWmGJ/qmPRTHh4=;
	b=RnFV5b7lc667HA65k5XkZ5KUiMvBwh5hTOo0+gl5PgSKMsRCL804Om7NsxdcywOnONTrJwo9kifbM/F2Tn1DtgrPxR//AACseNH/eMET9fc2ZcU1hUlKVQX5fQP/V++yU4EX2zxXw95fWDZbw2IXHY2AM+/Vl6x/Uo6vSGPYiiM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:fda5f81b-f636-451f-8d06-969365f43090,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:6e2485f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: c263783491ac11eda08d4d6090ec5a5c-20230111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877388026; Wed, 11 Jan 2023 05:37:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 8/9] dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr
Date: Wed, 11 Jan 2023 20:37:10 +0800
Message-ID: <20230111123711.32020-9-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_123749_984235_838C177C 
X-CRM114-Status: GOOD (  14.40  )
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

The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
implementation. It causes a crash when system resumes if it binds to the
device.

We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.

Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC binding")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..117e3db43f84 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -32,7 +32,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr
-          - const: mediatek,mt8183-disp-ccorr
+          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
-- 
2.18.0


