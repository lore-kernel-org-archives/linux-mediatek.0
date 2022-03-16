Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB3C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OIYpLOb8Ao1hG9Yno082GoSWuprqw65NfV/CF48xXI=; b=t3LoHY/ee4sTAy
	7SE+oP9RWWJ3mtLzXT9zo2gk9ocqF7/L+E5gb/lF0k9oNIQQ5im6xJDQoEUxDhKT7CD0rWzp1WqLb
	JBOcus7pRPNTjiLwnuAWmRqYbfQ/641WQLqLDjoeUexSjm2uW9RF7xcRo82YjNAS894Pw1yLB8Sqg
	uRNFjApFyMJG85+cmRgx0DmKpuoI9JoYxzlz8qC7cHIuegW9PkB2stckvPrBnXC+oajrCy2p63NuR
	d4xuOGgU+UMWVfZxTozJ/+MfxlVl+YgGOHy7W2Y/IXPCdQB3rujJOQrdGd4VK1RBoN4SCi1R5k3sJ
	x+zLpwf2JEsSOCU7KN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUOHV-00ByxY-TC; Wed, 16 Mar 2022 07:41:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUOGl-00Byf3-4V; Wed, 16 Mar 2022 07:40:33 +0000
X-UUID: 3e35a77baf9e456ba39f81cd1e9585ed-20220316
X-UUID: 3e35a77baf9e456ba39f81cd1e9585ed-20220316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 426325937; Wed, 16 Mar 2022 00:40:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 00:40:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 15:40:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 15:40:22 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
 <kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V2: 1/1] dt-bindings: media: mtk-vcodec: Adds encoder dt-bindings
 for mt8186
Date: Wed, 16 Mar 2022 15:40:17 +0800
Message-ID: <1647416417-15176-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1647416417-15176-1-git-send-email-kyrie.wu@mediatek.com>
References: <1647416417-15176-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_004031_203118_2857C9C3 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: kyrie wu <kyrie.wu@mediatek.com>

Adds encoder dt-bindings for mt8186.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index e7b65a91c92c..6d52947f30a5 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -22,6 +22,7 @@ properties:
       - mediatek,mt8183-vcodec-enc
       - mediatek,mt8192-vcodec-enc
       - mediatek,mt8195-vcodec-enc
+      - mediatek,mt8186-vcodec-enc
 
   reg:
     maxItems: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
