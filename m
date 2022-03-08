Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J08Op9JFOeTejqeU7wqgTynPrkMJ04FnNyBgFZJy/A=; b=11xGr/OAD4I95L
	pk6KoSacNUeLsbI5SHj/9TH/36FOchk9lAaknxswXOCOStcvSr61RBheQdueDftlmO0f+BPVi81ii
	6umitEnZMV9IBuye/r6KVJ1OjafLYzIN1Qx3JDjhUcZy+IF0j/CshnMFOcCUDlRFucaL7Pe1oBNIf
	tGEvDSkSfAOzD5KloaAOgd2WVgjswCvwlLSF/d68PRqKnr1qbQsxlEfc3P3bJlFJY5XdX5TkCqU9m
	jIJnz0UohmKZgzdPdAl1pqx5FRp+e1D+ccLyyuqHCmzaaBovL+iNqnChQFBNJEXStYuUNWFoXlTec
	2ncfOSnLn7JjsmL7BPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWgK-003hDu-Oe; Tue, 08 Mar 2022 10:03:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWT1-003cB6-6U
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 09:49:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id t11so27547953wrm.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 01:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6Vptup9snjTByrwJQ9zSJpQbWeuT9OeToRX24egqXZE=;
 b=ZkvqwDQcHKwDX84OOnDMiAlBzjBS5NMVrq2VBIAW9dRo+lZGFGg3x8XK1DFS0RuYw1
 jkV5mgBKgGBFp5ULdFQWgj/rYPEFcRog/8vMTiSd1HDGyxrndTzswnzycMaUOgt3FaSq
 Si4oRF2seEYg/4ywLp4m+dCSVQ21bFYQs4tdSA/h9Zqw8dlrlIjX/8JZ7tHQoslw4+BM
 mfZcM7JvwHmpjVfSeSZpYHdOEViNZa1ftqdyTxnwads01Am5McQdyroikyUjnWjDG/ZM
 vas1/rV6+k4Du8d0onFwDWKgrEL58IWmFBTXPLQ14vSzHRBVn/5T7oAtbmci3wBzyYAN
 RkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Vptup9snjTByrwJQ9zSJpQbWeuT9OeToRX24egqXZE=;
 b=uZeNTlsWjn9Gc5xFtphNsQP1j00FWKM4+X9dYleNxwd6lRpXSL7UE12uDJUbsF32WE
 jQw2IcyWe3wv5MXPM9SLccWSio1CfILwGAKnZyd+RMvQ/sAaLxPe+g0dM1OXCaCQt6O+
 krwqfREUYn3hfTu/AnU8Lafu3tVbbTXqPgbjqVP1j7gszeOsBkUa4eOGM6w9GFmA2wPo
 ssmbNPlUfr7/mrmWVz7QsBJgP8S4u6p9y0vipY0JpHq6lo2JTwks2kZnEchllKH0D6bo
 0Qg/6tv9jIa0h7NSOL/4jXngTnMEh9krhGPTlppze67wzhuIjSQi7drC8iNAPlVRkW/U
 0y6Q==
X-Gm-Message-State: AOAM533Py7CmyDac7+4bMQjpU67/fwvr2Rh+P7ohhKQzup6eHid6DBz7
 nEbsDGp8My3LKaziesL2lEmRzg==
X-Google-Smtp-Source: ABdhPJwyHtSnI5DdyZsEddgf/hq4aj4GLJcAaVuxD5wI/kt3z5s/DN1pKpabP9/LthhErPegg06whQ==
X-Received: by 2002:a5d:6e0f:0:b0:1ea:9418:c2a5 with SMTP id
 h15-20020a5d6e0f000000b001ea9418c2a5mr11280082wrz.244.1646732957483; 
 Tue, 08 Mar 2022 01:49:17 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1684885wma.21.2022.03.08.01.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:49:17 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org,
 laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de
Subject: [PATCH v2 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Date: Tue,  8 Mar 2022 10:49:11 +0100
Message-Id: <20220308094911.2680291-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220308094911.2680291-1-robert.foss@linaro.org>
References: <20220308094911.2680291-1-robert.foss@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_014919_262235_E3D0F738 
X-CRM114-Status: UNSURE (   7.61  )
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

This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index e8f133dc96b95..8f7bf33f607da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -171,8 +171,6 @@ port@0 {
 
 			anx7625_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-				bus-type = <5>;
-				data-lanes = <0 1 2 3>;
 			};
 		};
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
