Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629FAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 02:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24DBB610A7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 02:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24DBB610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tk053I1C8es/Rjnofk68LRp9SMo+xt3/nOnslar+ngA=; b=jHkkolj36/ekkF
	IeLSYLxrjcAM/ta9BA2w/QAe4ycElBAxJkxB4NYtMfBRdOI/C2TIOWm9NWmN6wMZDrBk7V/hmT4ML
	4NInhKz1DLGVz5cOuzpcP2IJwFNt3osoOEFzemjIZfi0kp+Z6rd3MQu06W0ssaKwb49beM+HY66p8
	z7vWTE3juqudCQFUSQQulsDRgCm57+0sYjLN/x9ODbpLFMEeONJqcBzLhzzo7ZnZT18W2tpUg6asy
	xanKxdHRMR8YVzAyGrC/ZiGlkSqJwAmQ0RNIwOVqoWw1j6Ml6LFECmtoexMePRIyGchTVX5y3pH0C
	31DgHp0+2yUBkcxCfc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAOAe-00EkGX-HB; Mon, 02 Aug 2021 02:59:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAOAQ-00EkFT-7x; Mon, 02 Aug 2021 02:59:05 +0000
X-UUID: 8f3485acc1b44a4090588f6ba91c4bdd-20210801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1dlZMkUGK3Ieq5qd9vK8M2eSh9CK16dJJu3knpl7zCg=; 
 b=Vf9fAoYsA0xa4v8siVAHs9IYvYe9IvaVAXi2v97geBZGRaSYSFOlCd2fJIHtM8ZaEAtbX9hLct4kHZlB2kZ39tDgOE3r9PEn9W2ec6bPpuxKaON4f7sOyxep2l18b6z7Bpxu09rf+sLmb2IRfuwscCm9NFtCy6eFNER7TgzhqD0=;
X-UUID: 8f3485acc1b44a4090588f6ba91c4bdd-20210801
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 776174557; Sun, 01 Aug 2021 19:59:00 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Aug 2021 19:58:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 10:58:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 2 Aug 2021 10:58:56 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v15] dt-bindings: ARM: Mediatek: Add mmsys document binding for
 MT8192
Date: Mon, 2 Aug 2021 10:58:39 +0800
Message-ID: <20210802025839.16763-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_195903_738873_A7DE6076 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the mmsys document binding for MT8192 SoC.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
This patch is based on 5.14-rc1 and [1].

Due to mmsys binding document has been converted to YAML format in [1],
so resend the patch in [2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=485165
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210726105719.15793-3-chun-jie.chen@mediatek.com/
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 2d4ff0ce387b..f9ffa5b703a5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8167-mmsys
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
+              - mediatek,mt8192-mmsys
               - mediatek,mt8365-mmsys
           - const: syscon
       - items:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
