Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E014C25B44
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7PS6ahcPaPVgkaLyfG2/5fLxZhHFw2R9jMfOoRovw4=; b=2vC1HrQKoeknCMWqe6coKcj9l2
	hIUXzIyJr6jtt7o8fajKb/r+2ab64OG/EbvXCKRWhEauEt/aJ9Mn3AGrixwD9yK8hPw+/yFXlZqId
	jTudKipTaqgSrim98kfsmpKHeAs2hVj6w79EDoelLQnNdwKAWmkF3/VYGRxjr2zcUIYoTbfKYalic
	r2OIm6CZxFdM7ShZ4Fjuz/HI2N0cJVO8UUZEZYtyOAq8pM4e3Jk6ny72exA7feQ3b+HVTodnCItPx
	RyZEemdc0jD8izG1yMWdLXlTg/BFde5h4mSSz0UIxLjl1iz8iGT6+DROz2yz9/AkkIUOV4t0jhcdO
	mXPWkDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6V-007ZNQ-0g;
	Mon, 23 Oct 2023 14:40:27 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6R-007ZLE-2k
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:25 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-778af1b5b1eso202292785a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072022; x=1698676822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7PS6ahcPaPVgkaLyfG2/5fLxZhHFw2R9jMfOoRovw4=;
        b=dLwSN9aKN/MWPbKtbR+qykUZS7pvFVthEGWLVpc7fFLxSW5IKrLVKg0QTOZYIiflrg
         ppq1lNz+QRUQzZ894eGM7oIsOZnghlm+qcZTUVZieIgp8GabnBa4eiDcDZPzF3ghz/04
         f2rLU3yd8gjXfHVvtyOJ8W0jz7UScFViGA9vr3EH+WJ1Xfrh+VnQg8kazcTRGlevbRrE
         AblZJUXSCE49rPhaAC9TJHo/CebQZVpI/WLSsY0q+hwGgBj0xP58gVcCErUCVctpVRY0
         d7bb+m1G99WoUxcM86xftSpZuP0ihhDXI8sZdH+HZVrML4H43rlKLMcODhq+I/uB1lu9
         /AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072022; x=1698676822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7PS6ahcPaPVgkaLyfG2/5fLxZhHFw2R9jMfOoRovw4=;
        b=DRCGiGW1NWBZVKDZLu1PSJT+85Ob3kwxNqFlszMD5BLuWKn1l+zTRUbiQb2pQOSbPs
         4hf4m4GnLRLLUU/ojd4c2flHt/r3tELE2lZwoFIo0XwiZkQXIpFDrH18zk+V+hSlQJKV
         QhsVCKay6LyxqMYe5gZJUdiXTH8u7deSQfGivwruG1MVc9miiWAoFKDcC+NAo21gQTwd
         hdGMEq59h4ZLi00Jw43115KZ8HeiETmQV4SIdYS9umKimIWBEwWGY5la9ja3C5m9DxJN
         g9wdNioSeCcgtCX6Zk9sHNUJ19pnZKvLXlTd0Re+GxauOTK2cRTLGd+HYWTQzhEE9v4y
         Mbfg==
X-Gm-Message-State: AOJu0YwI87Hcqkk82l2pPk8+Ifk3ay8CddRHMpLlEBZLtBmFcR72kzQo
	aOeaY8joTPH67Fq6vX4cUkbxdw==
X-Google-Smtp-Source: AGHT+IH0nODYbrvEMwbGxVa26dTGc2msGtTG34VMr3BZQ5GiO1cLSJzBEsMmNuRzIEAMQXxLVf8RPA==
X-Received: by 2002:a05:620a:2451:b0:779:d1a6:ee76 with SMTP id h17-20020a05620a245100b00779d1a6ee76mr5162073qkn.37.1698072022214;
        Mon, 23 Oct 2023 07:40:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:21 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:01 +0200
Subject: [PATCH 01/18] dt-bindings: display: mediatek: aal: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-1-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Ui729mTu13aA0ns8kExm+eoWD4rbfjwSg3rfyfGgZBs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOcFzr25uHjdnQfeDxVFE5X5hyS8aufQwwKFCN
 G43v/POJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURa3LD/
 99DHn31961gfxqzckKqZvja192V6gfiNXzsC6hHBBZ8geTJi8IPYTSVbFQxhFdyZ+auYgAjFP5m2xq
 BemZnwKfzObqDIyzohgIPuAu9AlAR2rG1N+HlnAtyqdooBQfywPdJds3RDO1TcMU/8HQ67qtPTa3T5
 9vDOBdgqAb3x5IF5ZiWOd/a9M9V3UHmSIoTL4KQBea3kynTtsw7AE7yrjJpgqv/jBfAq5FhDh1B8pm
 vSv35urioNBPCXdjyegst5HBRzIVnUqhK7c5xwnLaZmsJVXlgWdfkLwQrV9KJS6y4nc8/gmqQLOQIc
 MJxYUXah3PdpvkNr+YfECux5xjQztcI3oHxmpqL6hG/PQmrA5xgK8d76w6fLbXy9T+3N3PjLU+6l/n
 dubODhA5S/1uBw15CbmV/WsA6UKYerpl5W5kkIgSWAgz2KFxcb4AnOBdfwXN1SAri5BMeSz3wGzL/W
 j5teR7NaRxFwczR+3MYebDqu+7sWbcxmAECe+JpDB9QyNhme2SgQ93rYOx3hyMrR97nVPOhDvGmMIh
 gxB8/5AXXSSeqR9YIuNZfCvNq9R3FLFNQ5rAt4WLIexZnWX+vUxROE0pqg6FbrswpRTzcpJYsYOPfO
 nh5gp7N0SCNp1bdgVDKrQHGD+5Dsm8j3ZoiQnMgoOhNBa1lxOGzoY36JBAPg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074023_889149_8A1D2058 
X-CRM114-Status: UNSURE (   9.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 7fd42c8fdc32..840b48a878ca 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
2.25.1


