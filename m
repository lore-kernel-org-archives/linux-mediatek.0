Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801C8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfEUJaApz+IhUpwhCTCmtyQZb6Chs3B5CEiJdWU/Zxc=; b=1LGWzUxo8tqbdu
	1T8OOYQALumLWkCZcdShWk1s6NvE3wdR9QdE0aU9IFg8S2W1FbK4EJA1zVJszr69rNTnjGRxKJPxZ
	9kQAZwOKYGRMxPdtGbmo6L5COjsrKZ/6CIXD2Af31GsbAr8tSS7eVmCz7Ri7Ix4LCT5DNXrzXO8ri
	JXBPonieCZ4k1KSQqbxGd7erygAkb95zWwzRWQd9d0OLhFqsbgVyf3SMSHhkuEOF858tLZabjwkN8
	tgAQ546Dsp12bUdWOraZfFx01PUqU/dyrt3m0G1MHG9rDx4M2V0OWy8GdY3ESXSjePdPTyaSwzFRi
	jm/adlNiQx00JANGeUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFZT-000gD8-FQ; Mon, 07 Mar 2022 15:46:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFYw-000fwz-5r
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 15:46:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id w4so17993484edc.7
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qbuVe6nDY03YrLd6EKAmfjy8Xa7+ttYaCGu9Ft8mXNk=;
 b=Z7nFErSwglbyHm076TpKKK2nIpM57+2I1HSukjcbHGh/+3RomimyAmQGKZaQIPpthE
 M4kR3yREE4Auw0YbeTEwnkgbVJ0ceknXRpL9h11nrwD3G+jK1jkXPytJBQwvz1+Hd3N9
 fHD9mSbB2Nual/+Jpe7jdaprB3qAg74nAvwqBP5i+pwII4D5K7fdK0NnS1dFXIbpJkvf
 wZd90jrlqkuzBfMfdo00cRbMBiQGAZzOlckyYxZJNkUFjPnlXq+d1+F0qoFP8XhWFhEE
 6aYVMrchJv+z+8fK10mCpwdb4Aw2VIkHrlBVgOp9LNFMcSPP9gZB973t9zB8tybpWcQL
 qNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbuVe6nDY03YrLd6EKAmfjy8Xa7+ttYaCGu9Ft8mXNk=;
 b=WUdxy0XrjzOyovxcJ7PTgbnXojzlKOQ9QhhVtAV9oWJAJ/njXAjNlMI8DBX5gLkAqb
 d4hVbx4t5XERBZAPDceViwgf9lK5nprhy+v9hpejuP85CqgNiohjm0tYCtlA0iY0naJm
 Amf8Z+w1jC+tdspilRBYipnAt6QKW4cb+oLOj3BU9cJqie/iOHJY0qmqVZDwqr221vNA
 DDirOM/COJwMIig1a42/jTqJK1RMk554WtaYlu627cRPr/rsH3WoKrC1BrmghuhPodMd
 W1AnN2rch1F1iNDOUPZIGRJH/+7v7rHj2NydDn25qRlokaZuJ0vXwonmlZj4E3t9llgW
 +b8g==
X-Gm-Message-State: AOAM532Nz03ae+k6yxd96g3B5tElzAylK3n84dL+8d1nIQJmuZ2ofy/z
 uinOtD9wcSCvySKmaIeV4/p8Tg==
X-Google-Smtp-Source: ABdhPJwX8/FBbfGH5wS01NOcZx+cCthRhK0gDbtRwrXcJKhFfUh5mmx/x3w97eCLEhwf40YzairJ2g==
X-Received: by 2002:a05:6402:1386:b0:416:d5:ecf0 with SMTP id
 b6-20020a056402138600b0041600d5ecf0mr11510281edv.212.1646667976991; 
 Mon, 07 Mar 2022 07:46:16 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm4210747edz.60.2022.03.07.07.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:46:16 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Date: Mon,  7 Mar 2022 16:45:58 +0100
Message-Id: <20220307154558.2505734-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307154558.2505734-1-robert.foss@linaro.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_074618_269899_8FF1B7C7 
X-CRM114-Status: UNSURE (   7.32  )
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
