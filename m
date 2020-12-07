Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75495C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 03:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4C4230FA
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 03:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B4C4230FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wuxcAkxtKAwY9FeYdOQrXWTzetjS1aJ/HQUYvqzRtmk=; b=Z2ZalkwO92giDWcTQF3yaxtMH
	ncvOeTl0fqWPW6zJhSN2ME5mzl3azSdGgZv5vhZDbD3uuUczp9HxAkdQb+LOQBJasp3nsjXqvGiu1
	1IX/lqzWW7zcSuugTHRgxmOrq6jOuSXaRyenmI9LwFibHsZTCNZjJeAHeRDCfQ5+COphWjioCs2YK
	T+iQd49cLqyNRjn+a5dKviW2Qlz9Irbc1m+bTQEYA/d6Gp09ctagkTjWMo8sJCBYgTuFwrpWDmlxg
	JVnweDuljViyyOgONRYkiA+Nc3LigfgxwWl/LZe74X9vaS7jRRyw2YVuXAAf2T4ATbVYuUZ/AIwth
	3V+cQDGZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km7Ax-0005BD-GN; Mon, 07 Dec 2020 03:26:59 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km7Aq-00059E-NR; Mon, 07 Dec 2020 03:26:53 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cq7y66F1CzhnWh;
 Mon,  7 Dec 2020 11:26:22 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 11:26:40 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc
 <linux-mmc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] dt-bindings: mmc: eliminate yamllint warnings
Date: Mon, 7 Dec 2020 11:26:26 +0800
Message-ID: <20201207032626.1445-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201207032626.1445-1-thunder.leizhen@huawei.com>
References: <20201207032626.1445-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_222653_024875_011CD61A 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Eliminate the following yamllint warnings:
./Documentation/devicetree/bindings/mmc/mtk-sd.yaml
:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
:30:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
:33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 030e3fdce49293a..01630b0ecea773e 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -17,21 +17,21 @@ properties:
   compatible:
     oneOf:
       - enum:
-        - mediatek,mt2701-mmc
-        - mediatek,mt2712-mmc
-        - mediatek,mt6779-mmc
-        - mediatek,mt7620-mmc
-        - mediatek,mt7622-mmc
-        - mediatek,mt8135-mmc
-        - mediatek,mt8173-mmc
-        - mediatek,mt8183-mmc
-        - mediatek,mt8516-mmc
+          - mediatek,mt2701-mmc
+          - mediatek,mt2712-mmc
+          - mediatek,mt6779-mmc
+          - mediatek,mt7620-mmc
+          - mediatek,mt7622-mmc
+          - mediatek,mt8135-mmc
+          - mediatek,mt8173-mmc
+          - mediatek,mt8183-mmc
+          - mediatek,mt8516-mmc
       - items:
-        - const: mediatek,mt7623-mmc
-        - const: mediatek,mt2701-mmc
+          - const: mediatek,mt7623-mmc
+          - const: mediatek,mt2701-mmc
       - items:
-        - const: mediatek,mt8192-mmc
-        - const: mediatek,mt8183-mmc
+          - const: mediatek,mt8192-mmc
+          - const: mediatek,mt8183-mmc
 
   clocks:
     description:
-- 
1.8.3



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
