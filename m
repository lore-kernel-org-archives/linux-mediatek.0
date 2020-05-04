Return-Path: <SRS0=oHVa=6S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1DFC47257
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 12:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E57020661
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 12:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sa1TXCPx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NpY8F90B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E57020661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eqcwhw74B5iGxif2FO2ntsp5tN+Je19O5vLfwhEogQI=; b=sa1TXCPxZPpP/X
	OI6o2j+yL3+Ya30RMr1bScDDvYcqayW4ctvSOBbXitAKcSwAGpL80LYDI+AjJvRYSkqG1YZC4qmJ+
	EjU+/z/EWFL12mPiTsE250qjZNJGaBFgOJoGhkD9z/bwg+biR3Ygg9TjhdZJjkwg2JQe5eXYQlwbe
	ZLPHq2JjOkLUEXERPjd44ZItkSrtAQ58zNoBN+8TxipHip5/TVYsUdsmUQHkErClDrCM5cdNWz8DC
	oemnvOiJixAcPeZC9CGKXoB5DwfeikUc5ymno4ZFfeBXi3rFrlXyPDF0m/ho6dMtb83uiohVRj4pg
	SkYr6hQoRbw/5znzgsKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVaT0-0003XC-93; Mon, 04 May 2020 12:45:02 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVaSs-0003PM-WF
 for linux-mediatek@lists.infradead.org; Mon, 04 May 2020 12:44:56 +0000
Received: by mail-pg1-x542.google.com with SMTP id s18so8394179pgl.12
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xeLFFRxjayddvBRhnid9ILi0KvAvgA9E5JIow98J+k=;
 b=NpY8F90BRltGb4GXWEpu15PIYA39hWgN/vjRE9Ek/b/9GW9wzoD3cKzg1ORQbVdpzg
 efo1I3GN7J7X33UTFoMJ/eu2PsADoTAYvDaOMlTjW8elrMi4BiFGa8nRmECVckYCnT1C
 7KCADcckuDMNWkx0X4b8cBJVDqkY/JjcvnQio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xeLFFRxjayddvBRhnid9ILi0KvAvgA9E5JIow98J+k=;
 b=JvWdfBT1vkuXuVZ5nMTinp96BfzZuUTyvI+DMAhHc1mkGA+M0ZDW7YDJbWO3Q8sJVz
 VyBffEZAKHUgIXWbOp6RmsQ3QD7xIPbSYcb/H6UbIU71OTdGHqIWTCaFTPvSoN3WSSnW
 t8r5/CicO6ID67JsiSLTU7OJI063+UKorsmcOKnXdCjj5grZrH7T8sPAX5uqw2G+6qct
 lBvLWTuV1jEuvuu5Psz+2AOYIquM98wHZ5RBXypLsfXikOQtw3GOKUg1OfJiS7ikhOBT
 H6hxr8JNVeIyivYBLaOPAy4OC6VMlqTIEyRe6fTZUSLT3y6Ex61ggMZhQiXSTjPvctWF
 Bs+w==
X-Gm-Message-State: AGi0PuZ+aWPVxYmf/SnKwHSsyMGmCa6qyEV2gdX8mUw/2QVJwpHuIS99
 ZmonNU8ERY/Z4CYfPBgHoMUx+q2yGQDXPg==
X-Google-Smtp-Source: APiQypIsMuPoACD4kDg+3c6GSsELr2TwlWwMVfHmHQccbvWxqpghPB7vzmBRwg1sRRP95stLAqZs3A==
X-Received: by 2002:a63:1e18:: with SMTP id e24mr16016160pge.296.1588596293785; 
 Mon, 04 May 2020 05:44:53 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id a99sm7154563pje.35.2020.05.04.05.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:44:53 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mt8173: fix vcodec-enc clock
Date: Mon,  4 May 2020 20:44:43 +0800
Message-Id: <20200504124442.208004-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_054455_081744_AB14BD95 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: gtk_ruiwang <gtk_ruiwang@mediatek.com>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Qianqian Yan <qianqian.yan@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the assigned-clock-parents to higher frequency clock to avoid h264
encode timeout:

[  134.763465] mtk_vpu 10020000.vpu: vpu ipi 4 ack time out !
[  134.769008] [MTK_VCODEC][ERROR][18]: vpu_enc_send_msg() vpu_ipi_send msg_id c002 len 32 fail -5
[  134.777707] [MTK_VCODEC][ERROR][18]: vpu_enc_encode() AP_IPIMSG_ENC_ENCODE 0 fail

venc_sel is the clock used by h264 encoder, and venclt_sel is the clock
used by vp8 encoder. Assign venc_sel to vcodecpll_ck and venclt_sel to
vcodecpll_370p5.

    vcodecpll                         1482000000
       vcodecpll_ck                    494000000
          venc_sel                     494000000
...
       vcodecpll_370p5                 370500000
          venclt_sel                   370500000

Fixes: fbbad0287cec ("arm64: dts: Using standard CCF interface to set vcodec clk")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index a212bf124e81..d0e9a2aada2e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1422,8 +1422,8 @@ vcodec_enc: vcodec@18002000 {
 				      "venc_lt_sel";
 			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
 					  <&topckgen CLK_TOP_VENC_LT_SEL>;
-			assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
-						 <&topckgen CLK_TOP_UNIVPLL1_D2>;
+			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
+						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
 		};
 
 		jpegdec: jpegdec@18004000 {
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
