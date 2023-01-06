Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43502C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11f2m6HWavy1ycHJjCqVibR6VCcvs9IjPFDFLxUESd4=; b=mjfgRQ1DmlARsRo0I8h6bPYCfm
	UAGMOsL4izxQyY9OgiC6q90OXQ4s6lQBfxY9F1rd8qw9NdOj+iM8pCwHSwM/Q9K950ffldOU+8JFH
	L4t07YlZVMhBPD7aQUwKLxvu2bTedd8byb4PlyAX4S3dgFwPo3xGjdS8P0tHqN33YTwFepISOXm5H
	61tD3wYGE7trsqTYfgrsTKKcHPTA/Rq7cvh7AWTWbEC07q5CblMKBotu5A1auY8P/1fLWV5D8DP/2
	NzyGDX7Z01iMEjGrcNvPkq/5Yv9lYAzy/eez+VP016R9FPBgM+86LE9qfjNqEhMP7ut4SsFqVJAS4
	VmH1HmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlcd-007xl5-HY; Fri, 06 Jan 2023 12:14:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlcc-007xkA-3M; Fri, 06 Jan 2023 12:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=11f2m6HWavy1ycHJjCqVibR6VCcvs9IjPFDFLxUESd4=; b=DD4uU2plmlx3uTr/+RTYYnDT2V
	ASS3DhTcbWhABIZQ9xVy8sqEQFMUGW5cET5J7JSeispLlharUkvKdKpCboSmb0qeltd7znPbFSIGN
	gNqz958NnNS5nGfWdyZ34DYHN7o6v7oxGD1pBRPc+1jcnbhy8bObRu9RLHF9tQFKUAUJVsLbCwlyH
	yvmWkg6GPa1ES5PqEPGc2aZHhdMxKiTDmPAdxjYnEwjsD/XhXZo+cWJ022jZfMGgH3AzXux+nSJIK
	PJKXHbH6mA094gA0dUy6zNxoDnW1prIZfiYPBSS8+BriEcEK7SpxqHM8k1W/Xv0qQ4yGHaCyzrkKe
	1bN1ur3Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDlcO-001mHG-2A;
	Fri, 06 Jan 2023 12:14:44 +0000
X-UUID: 4be63f2b7bc7495f8855deb8a7e1a02f-20230106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=11f2m6HWavy1ycHJjCqVibR6VCcvs9IjPFDFLxUESd4=;
	b=KWMm219cnN+xu6dKaEdI49NOOeeOul9VVoHiZOPRxpRGRG7rR4n3GUXkdjQXeBA3MwDL13tH/iDdNOHbhobazSfVajyvn+gO9YVlXXs16nQSOm4VYhqSylzyQGo6eyXpmxZ0B8dMlgABrvEQjSuOH21Wvj2oYdHE/Tm+2sP57nU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:97d32b3c-4852-4a8f-9afe-f550300c5f89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:2c5bde53-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 4be63f2b7bc7495f8855deb8a7e1a02f-20230106
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1665324938; Fri, 06 Jan 2023 05:14:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 6 Jan 2023 19:54:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 19:54:31 +0800
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
Subject: [PATCH 1/2] dt-bindings: watchdog: mtk-wdt: Add reset-by-toprgu support
Date: Fri, 6 Jan 2023 19:53:25 +0800
Message-ID: <20230106115326.15374-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230106115326.15374-1-allen-kh.cheng@mediatek.com>
References: <20230106115326.15374-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_121441_550793_FF33D59A 
X-CRM114-Status: UNSURE (   9.78  )
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

In some applications, the mtk-wdt requires the toprgu (TOP Reset
Generation Unit) to reset counter after wdt resets. Add optional
mediatek,reset-by-toprgu property to enable it.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index b3605608410c..bf06dcd0c12c 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -52,6 +52,10 @@ properties:
     description: Disable sending output reset signal
     type: boolean
 
+  mediatek,reset-by-toprgu:
+    description: Reset counter by toprgu
+    type: boolean
+
   '#reset-cells':
     const: 1
 
-- 
2.18.0


