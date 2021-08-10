Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6A6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA0161052
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCA0161052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH3YrSiozib/f8b2FqsXL0d7fQy6/woUp9nE/ky/gYg=; b=p9RBmXVnwfKbqI
	XsMePNB4bxdnfOUe/ZsrSjfeNgigya5vq5nloLrysN/qfrpwu7f3q0Wm8dmGA6gAYsccJpOh21qGG
	jY8/oiXPnhKAG58y+XVNTQgPAPcVXXGUSUi4rWtF2172fMow0plko9wAkkuu6iqVGE/eiKhL7XD9c
	mlZOVBmAaWZWXZBA6B2fvHxdhmml9wf+YSB73FYhs8v5IbUKBWC+27tcKCeXDu7QO1COe3aiEubx1
	ElnAzyoSr39FVDgdycRcMqgWF//LcqKb4lFZwerX14E2vAKBul+bn3XidPjynRjyaViRea+1QtXbS
	MDH+XNgLWlcKMiF/7xoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDN1e-002z75-TK; Tue, 10 Aug 2021 08:22:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDN0O-002yi2-EQ; Tue, 10 Aug 2021 08:21:04 +0000
X-UUID: c3c1d2be14c0462ea432ef5c3c3d1fad-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UZ7BUXa49A/f1cxnGgnrFv/R092rftI20TPi4wb38Dg=; 
 b=sA2/Cwl5uyP6h4PuGD0EeovH4ATTmJ6MUHoKnGStv/lvPT8Wigqvm9b8M7GkvirqtAYw1LC9sjHSr6bk8lzVkxtqqobzwL8qlaChLvwOVNNC6JtFjb0WJDDaN2gxDIHdq4uQnhA/8EEnJtRS0dOQaifCjETPAyX2K4WkWY5bzmc=;
X-UUID: c3c1d2be14c0462ea432ef5c3c3d1fad-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 888297963; Tue, 10 Aug 2021 01:20:57 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:10:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:10:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:10:47 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 13/13] MAINTAINERS: Add entry for MediaTek SMI
Date: Tue, 10 Aug 2021 16:08:59 +0800
Message-ID: <20210810080859.29511-14-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810080859.29511-1-yong.wu@mediatek.com>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_012100_554287_D560E921 
X-CRM114-Status: GOOD (  10.40  )
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

I am the author of MediaTek SMI driver, and will to maintain
and develop it further.
Add myself to cover these items.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3b78a9..91af55b45e80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11754,6 +11754,14 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/char/hw_random/mtk-rng.c
 
+MEDIATEK SMI DRIVER
+M:	Yong Wu <yong.wu@mediatek.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/memory-controllers/mediatek,smi*
+F:	drivers/memory/mtk-smi.c
+F:	include/soc/mediatek/smi.h
+
 MEDIATEK SWITCH DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 M:	Landen Chao <Landen.Chao@mediatek.com>
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
