Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atWecAtjZCPC/cmouVlzB7Mf5dJjRuUM3Gyg+OI6Lv0=; b=dIx5TsRVx0WPJq
	ektuf2p1jyZQDcvfrwOtgif0jvf0HKnmBk4N2Mvn1qC0HJ/qXXWrGTxkZw7BW0CMe2iq+5V7LEzHZ
	2lt/U5Z7NtmbCUkZDdPJCE+0aMWYdDVDnYJB4L7kaRWm4MrIWpjWSQoIF8xt6nUR2P/of3J/Skwpn
	0iFEAjzKFQPXmwUUpuXP5DlLM1N1XIrRjGzeweiFawjFmEYJBvHSAC4Ee+rs+MwbM5FTf9EbHf9sw
	iBS609SMlSM2OYIjiXP7u8TF+x7dISCPcROw+9WhX1oGASPvMZVPfbFLLCkooJeeJdBqr9kEWjkbR
	oJi3E7T4ZpLSeTWQACbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muDfz-003tws-BP; Mon, 06 Dec 2021 13:05:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muDfY-003tm4-8e
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 13:04:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so8263765pjb.5
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Dec 2021 05:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQR+kR3WwpJ3Zy26d331pKgr2CYPFgiv2xZ+MCXMP8M=;
 b=h/lHjJphG4555stXlAjuauMjPqax3T/xIUWCDpSsBXjMktavAXzGmylbtFiOziwDpe
 ZCDqmnZEJnuBljR3SdS0WhaZh4Ed/Fo+RATgXH/+ID5tC75UKcUm5vvt7hnhI2vzgKoj
 PqFIud/7E4pLwKXZ80cWh7C17RIxaImNqffZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQR+kR3WwpJ3Zy26d331pKgr2CYPFgiv2xZ+MCXMP8M=;
 b=G0qktwEschY3lmJIebwTILnSvg4deJeyUb2slGnk85tZTwR+IOYcSq/PfBJY2+jfHe
 XwTkN3GVr0YImFW5N0juwb8VHjiHsIfNzonaQf79MDwEDvOviEBk0XrG+01syYxWb/gu
 5OB5znL0A3Q4qM38rXPZ2vCI4IgSAz95dB3rUNUSpOZEPY66gsnY88E4A2K655E30QON
 1VgTX6CmPvZwgnRclYIRf7YKE+81PU23W9SmEaKlBghAixPeawidi4U4bAw4OR32NpuO
 u6rH5JgG7E0nZWGxQG2zIhFXWbefaFfiHzv/s93VIuGf1RVA2X1AzgYWcvEsP03WxQT8
 N4gw==
X-Gm-Message-State: AOAM532DyF3zr+wFbV24XGag7M32G/OzH7NNDgdbl5aR4BY6wTdRKxy6
 Y0MSNKzRGepSPKpykWE/58Jbcg==
X-Google-Smtp-Source: ABdhPJw3w67XPpbowJr/xRyiaADp0b3n5k+jd8bmuixQtzKdWHKfEg0QX6nbBbiL+1/SvdSpMP0eyw==
X-Received: by 2002:a17:90b:4d08:: with SMTP id
 mw8mr37474521pjb.236.1638795875119; 
 Mon, 06 Dec 2021 05:04:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5044:6464:4ad7:572c])
 by smtp.gmail.com with ESMTPSA id v25sm12402292pfg.175.2021.12.06.05.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 05:04:34 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yong.wu@mediatek.com
Subject: [v6 2/3] dt-bindings: mediatek: Add mediatek, mt8183-jpgenc compatible
Date: Mon,  6 Dec 2021 21:04:24 +0800
Message-Id: <20211206130425.184420-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211206130425.184420-1-hsinyi@chromium.org>
References: <20211206130425.184420-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_050436_329426_AE4C2C00 
X-CRM114-Status: UNSURE (   8.44  )
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

Add mediatek,mt8183-jpgenc compatible to binding document.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v5->v6: no change, rebase to latest linux-next
---
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5e35ecfd21f1b7..fcd9b829e03662 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2701-jpgenc
+          - mediatek,mt8183-jpgenc
       - const: mediatek,mtk-jpgenc
   reg:
     maxItems: 1
-- 
2.34.1.400.ga245620fadb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
