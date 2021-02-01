Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9216BC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 04:00:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208BE64DED
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 04:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208BE64DED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lpBgcvSwuq4DqDV6dFDXZGihz4weiB7wzAgNlkDHW2w=; b=bU3Or8kHbtQGlqy8/42pWrwMQ
	Sft6Wr5/XDvcIysZBp+/x5eHJx8blZODWnnnMjcghj4u4AoXYtEwGE2K6uq63iJz+ODlLextbqDbY
	wwQvh8DspqugYVhLEVMfo6tQGcQruaY1q2owkLq75FLdh21xdS8ucHnA7phxuGH4Qs4JMoLOODe92
	zHcyerd6CpzcM0AfBHREFHtnKJ3HSiTfZfHnrpAHAWdexknL0Dl8eIoobtU8JGDnaFbnJidTN0ysM
	uZABprOMSq0YBvJOd4LPGZsHU4poCr2E6bm8X2TVzRyuE8L2PCz+lq7cyb/UPUqWvrrxSRNh9nr6H
	kf+l6pMgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6QO7-0007jh-Ug; Mon, 01 Feb 2021 04:00:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6QO3-0007iy-2u; Mon, 01 Feb 2021 04:00:28 +0000
X-UUID: 6798dc64365247d1b13bccafd0cecde7-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W7j0qnZCuDm/c/ZVR70pA2PQDZr2UBJafO52J6IePAE=; 
 b=NtU7tF/GZ4cceKcYUr2n8XvLlToczMY6+6wTz9wQzeceqH3XI5QUIN3E08tt9tT2CJ96DvM6apij09IswCngqKIqL0i3xs9WTrne80Znq2nr24dw2n2vSA5D4dDYF5QSCk7rJxPYiRTApS2xOI0SSj/9rmAm7V7nQz+34Y9ZscQ=;
X-UUID: 6798dc64365247d1b13bccafd0cecde7-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1449894050; Sun, 31 Jan 2021 20:00:22 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 20:00:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 12:00:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 12:00:13 +0800
From: <Yz.Wu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: nvmem: mediatek: add support for MediaTek
 mt8192 SoC
Date: Mon, 1 Feb 2021 11:59:45 +0800
Message-ID: <1612151986-19820-2-git-send-email-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1612151986-19820-1-git-send-email-Yz.Wu@mediatek.com>
References: <1612151986-19820-1-git-send-email-Yz.Wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A9B9CF9EC05C6A67E539CEFFE0CBC3AEB744CEDD3B1C5646FDE5AF1DE18CBE7F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_230027_382576_8AAC08AD 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Ryan Wu <Yz.Wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryan Wu <Yz.Wu@mediatek.com>

This updates dt-binding documentation for MediaTek mt8192

Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
---
This patch is based on v5.10-rc7.
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index 0668c45..82dafa3 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -7,6 +7,7 @@ Required properties:
 	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
 	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
 	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
+	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
 - reg: Should contain registers location and length
 
 = Data cells =
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
