Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1835C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E8A061179
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E8A061179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv5eyUorxqslnp1DwaXCpEjsGuerg2NvOiKpdE7e//w=; b=A+RXpFz2Ys4fVz
	tw0C8s5JOoKU7/zvMLyVsnGt8k5/vi8l0CE9dpisjGqHij8LYdibEKRUC/+sNiIudvGXJ2EGRGUaY
	9cB9S8fElpHa5YYojrAzVMVs0P+T5QJN8ePihQTSsoVanqmdsS3hshKXog/Vv+G3lHNMnIzos/zEX
	zK9qC++/VAjjRiecQbcmon7ttQIrV1ycDJVlAeBDV7dtE6ZKXnj6Woxr0W2f0ld1ShdsQJqn+bTe7
	dYvGma5Z+KIRq3Y87y3oP+pt4f6qeD2ZPzwnlky0M6JNF6i0NQ1xhYctISoRSsSF6LrY3PC2uCuzm
	5JIPliWh0udZ0jOL3MeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkhA2-004a4H-SC; Wed, 10 Nov 2021 06:32:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkh8t-004ZUR-KO
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 06:31:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id b13so2215883plg.2
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 22:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VRwqE4mljaTBbEn84HnhMeSkIM9YCg3MxPTKXVa2zs=;
 b=MxHJDM8GyITaPlwz3hRFlgPApmlsT9vH5iVCcFw+8JIfbbL47ai6x1PvNOZC6AQgeR
 ftRLF7CGq4Ssj11u1VdXS+5MXQVdO56WEXUWli/maqXwqKqqnpk1UEu9KpzdpYTwwB4g
 hFY72GezTFtdjkz6tOUTG2GjyEMthOe5d+lAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VRwqE4mljaTBbEn84HnhMeSkIM9YCg3MxPTKXVa2zs=;
 b=T6Tsl2djxA0lqNZopHq6j+ZtaS7bg+SaW7sT8kfwwCIqMYw4DkSzJayuat0GoUCdYn
 q4EkJk6Rhq4fLY+6UZKrBvWbu3h+tL6EqCI/UUeQFDvqzZIAGvGfVvIPraphD0ttjFlM
 Pfw8Nxt7AVaw8pm+IZslihocPeXXYQCmYkFsQbcxmk/+ze7Tp0RivySGv+W7yq6N56ej
 iVThKoMbgBH9cA/9LrDdd0STpQn3hn8VeOO4coaqCQrHnCjwDvYwugNw35SOwvF4Uru8
 2AKiPoMkUYxuwxYDb4gUG4b/+RCzLjFnVbs+IuNT6FSsLUQHSSzCjM5aj3q/J1yXEgLS
 kjRw==
X-Gm-Message-State: AOAM532YHyK8AxpUrT41bzXXVLmuaAhzs9Ca2jMU8FCaPdXaBTr0goZU
 QJSqntpWiNvU4aYbwxod5v5oDA==
X-Google-Smtp-Source: ABdhPJzq7nkp3CFD6DNs6EgqOZnXl05X7pcntes1Voih0ZR8rTI5/EB7QCsokvu16RpAIQDlHFT1Vg==
X-Received: by 2002:a17:90a:4212:: with SMTP id
 o18mr14163484pjg.154.1636525890398; 
 Tue, 09 Nov 2021 22:31:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6886:f712:1a79:e3d9])
 by smtp.gmail.com with ESMTPSA id w1sm15623959pgb.50.2021.11.09.22.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 22:31:30 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] dt-bindings: arm64: dts: mediatek: Add more SKUs for
 mt8183 fennel board
Date: Wed, 10 Nov 2021 14:31:17 +0800
Message-Id: <20211110063118.3412564-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211110063118.3412564-1-hsinyi@chromium.org>
References: <20211110063118.3412564-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_223131_728514_9585D87A 
X-CRM114-Status: UNSURE (   9.95  )
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

Add sku2 and sku7 which uses different audio codec than other fennel boards.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 7cf0c76cd31006..99e7f8e294cd03 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -147,7 +147,9 @@ properties:
           - enum:
               - google,fennel-sku0
               - google,fennel-sku1
+              - google,fennel-sku2
               - google,fennel-sku6
+              - google,fennel-sku7
           - const: google,fennel
           - const: mediatek,mt8183
       - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Chromebook 311)
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
