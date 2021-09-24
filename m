Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41C660F3A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F41C660F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tPZHVznzY4vHwLxTzdnYxdWR3RpdbAN7sb14wf/vyc=; b=s6I3NXaT4vOQhl
	w86GDw2yq2d6V25oMFb49LEy+/yAZQTjLGVUbvorOlvMg+o6Fr/5bjiecnmFBy1tRVx02dshMfo0j
	QD2glCsPyF6po3lNOk6+92SRuz2a+kHbhNCWh4zGAtnGUOAk7+dLtikyshC/B8M8/I+DrSENjhRcu
	9lHKyL7NXY6mf9TziDFZczImeypyQ5DgGSYfJwmDUUpdbNlIEQPs+Xt/nfjFcf1Iwys1pzIIZgSXA
	82vBybpnmYn04wyA7+uuTUEq/ceipWEHWmbWFpFmt90ISSjFpB+VYDcnwHRfn66h6qf8BXtlsr6O5
	dil3+hPH1r0VfJLuPgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTgF0-00DRLX-Kr; Fri, 24 Sep 2021 08:07:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTgES-00DRAU-96; Fri, 24 Sep 2021 08:06:57 +0000
X-UUID: cf65a6968d7847c4896bc63ed3126d06-20210924
X-UUID: cf65a6968d7847c4896bc63ed3126d06-20210924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 104544989; Fri, 24 Sep 2021 01:06:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 01:06:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 16:06:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 16:06:46 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v14 3/5] pinctrl: mediatek: fix coding style
Date: Fri, 24 Sep 2021 16:06:30 +0800
Message-ID: <20210924080632.28410-4-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_010656_351352_99A5E7CF 
X-CRM114-Status: GOOD (  11.05  )
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

Fix Camel spelling coding style to avoid checkpatch
warning in a following patch.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 85db2e4377f0..38aec0177d15 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -577,7 +577,7 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
-	unsigned int gpio, char *buf, unsigned int bufLen)
+	unsigned int gpio, char *buf, unsigned int buf_len)
 {
 	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
 	const struct mtk_pin_desc *desc;
@@ -610,7 +610,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
 		pullen = 0;
 	}
-	len += scnprintf(buf + len, bufLen - len,
+	len += scnprintf(buf + len, buf_len - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
 			gpio,
 			pinmux,
@@ -624,10 +624,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += scnprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
 			r1, r0);
 	} else {
-		len += scnprintf(buf + len, bufLen - len, "\n");
+		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
 
 	return len;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
