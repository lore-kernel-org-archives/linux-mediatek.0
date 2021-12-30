Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pvzqhjtPvFyrX43YSyauvP+ifIhs0iB53+iIsbXsWQI=; b=uxtgboKrn7NJTc
	tA0PIw6wSFnVq7ZP+fO1SXLauabeIyE/aE8iqTHJ8u3m5kWVUwUXVZ0Z3aVA12/fp0tojA3jO0D7s
	GsrjAEk5DyUGtDM0GziDldTu0WM3JpJj8l0nyWmBK0Gg0KvD/PsGZlf9knTbKQAIe6HH5YfiBqqnX
	EmrQzavCB3TqcV4DpasXlzCK3wlnOZ3n1J3VvVnFunJpgGgH9WOeWmsA/esoLloCwCsEQTSeJTsAB
	rGGM35+TP+m8wkOzkfr5GtJFGQ2d+v4+dvg1KKgyU6G6ZexwQ1idW8RsEgbkRcZ5+Rzw8PKUo0nOL
	RlDrZd6CqYolYyyAjdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2s0y-0049iY-22; Thu, 30 Dec 2021 09:46:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2s0v-0049h3-6F; Thu, 30 Dec 2021 09:46:26 +0000
X-UUID: 340637dd402a4353b579ef159dfb5c10-20211230
X-UUID: 340637dd402a4353b579ef159dfb5c10-20211230
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1972321522; Thu, 30 Dec 2021 02:46:24 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 01:36:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 17:36:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Dec 2021 17:36:21 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Jie Qiu <jie.qiu@mediatek.com>, Junzhi Zhao <junzhi.zhao@mediatek.com>
CC: Miles Chen <miles.chen@mediatek.com>, Zhiqiang Lin
 <zhiqiang.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Date: Thu, 30 Dec 2021 17:36:05 +0800
Message-ID: <20211230093610.28012-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_014625_257541_0ED2E5DA 
X-CRM114-Status: GOOD (  11.37  )
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

clang reports a unused-but-set variable warning:
drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]

In current implementation, mtk_cec_mask() writes val into target register
and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
should read a register, clean only mask bits, and update (val | mask) bits
to the register.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")

Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>

Signed-off-by: Miles Chen <miles.chen@mediatek.com>

---

Change since v1:
add Fixes tag

Change since v2:
add explanation of mtk_cec_mask()

Change-Id: Iec6402b0532942f4d0e8bc56817eb87b95c03fad
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index e9cef5c0c8f7..cdfa648910b2 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
 	u32 tmp = readl(cec->regs + offset) & ~mask;
 
 	tmp |= val & mask;
-	writel(val, cec->regs + offset);
+	writel(tmp, cec->regs + offset);
 }
 
 void mtk_cec_set_hpd_event(struct device *dev,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
