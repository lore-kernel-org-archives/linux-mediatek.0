Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/M4yirx+oc42MxQ8MXIOVWmkBO/EmmNFivufz6EHuKU=; b=AvygzzvUGcyR8p
	sOIp9TCdUmNGkuK3eT+9R4Wt5G8c+YGwrcUIx2x4Vw2FCjdwJe2uGdts+b+1qi3VgcCJ8vdFXTfz/
	bnut7ca7Da6L629i4Dcw5IMFp57mTSj2oQ/3hJ4ACcpNOkLWMxWuC4AoH04B0XXLvvGsyy9WhpfOW
	LeLFKfSooZ19brR5JP2tDQ8FSAfuGEofKfZ1ijleCQRTH8k9Ad3jmKqYFN8G5mD2VLcz6dZ8NhTBI
	KvIqg8k/1iCD359DdnCZJhH+65KpJTXULvJH0rqbdBkTeXX1qVWfM7tf/q1xD4+3OLSI9YyEah5xh
	2KlarwgU97TnY+neOQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH2Az-009z5N-GA; Mon, 07 Feb 2022 11:27:21 +0000
Received: from mailgw02.mediatek.com ([66.171.122.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH2Ax-009z4b-3T; Mon, 07 Feb 2022 11:27:20 +0000
X-UUID: 48a0e5c349fe472d957c870db0b3c836-20220207
X-UUID: 48a0e5c349fe472d957c870db0b3c836-20220207
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593260247; Mon, 07 Feb 2022 04:27:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 03:27:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Feb 2022 19:26:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Feb 2022 19:26:59 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH] dt-bindings: pwm: mtk-disp: add compatible string for MT8183
 SoC
Date: Mon, 7 Feb 2022 19:26:57 +0800
Message-ID: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_032719_177395_A1D1D984 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Add compatible string for MT8183 SoC in device tree binding.

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
index 902b271891ae..691e58b6c223 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
@@ -6,6 +6,7 @@ Required properties:
    - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
    - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt8167 SoC.
    - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
+   - "mediatek,mt8183-disp-pwm": found on mt8183 SoC.$
  - reg: physical base address and length of the controller's registers.
  - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
    the cell format.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
