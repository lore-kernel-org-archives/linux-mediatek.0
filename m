Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D2BC25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS7+tyIUs9rfVOlSsQt+PukwNB/K7NB7wUW73q4tlEs=; b=4CVWB82iHGRYQc1MgnrpxjpRA3
	sPQuN9ve8HhlWiLodN7vQPXxnMiWtLfkW4QldJVdGlbuJBMQSvbILjUmTJJASuS3vNkGQjRIWlOzF
	EgyeZEQpKW2J8ie1hSOAlpIBZNxBDJfyrp7QomSM1QAPh01V3FoG2bgxNRZUAtvNsHI0Tnqpv9ITC
	I7gOnUQvJRn4D2iqDGnJ6Lm3rkpDa1HZIQ0vFnmyOrjd9bLkmSXTJ1WYGLpGfi7ODhw4RpZg4n6o8
	5d31rJmYKenEona/BO4Md1lH8TsOZ5jEODIA9E2RLYj241qa+nTKYTvZQY+fWrb0LppqUAXvguSrU
	m735kTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7i-007aMm-09;
	Mon, 23 Oct 2023 14:41:42 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6w-007ZgR-11
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:55 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7741b18a06aso268387985a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072053; x=1698676853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CS7+tyIUs9rfVOlSsQt+PukwNB/K7NB7wUW73q4tlEs=;
        b=prvcabzH2J79vQBhk9ycmBRq7ngPUxY9GGaBfo52gR4JePkI4uzpU4G1XmeUBiyBt6
         b+VphQpCW0+nRAL7xqURhOcedl7z/VcBJpdammXJZTzJODGGbHViQIClznWsiyL35y/f
         9GD8+rOMe2wtzBOLferRtezEz+921REqBzlCzC6GYkOHY27iCxycejYDnFYEcPjJF6Z/
         N/gQSgUFOQvwu6RNqfoIAfsjcJYhVWpvc53mwsLZFSG90FxA2pXVyNQt0NL6xXB168Cl
         sVVsstqHWmH+VeVU4/rdHCq5CXuGTXPQx+uLenuPu39YNyQg3XEd/uqoiitL3avWTkWX
         QPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072053; x=1698676853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS7+tyIUs9rfVOlSsQt+PukwNB/K7NB7wUW73q4tlEs=;
        b=uW0vx9T/NlWXHkSdMz0Q4Wh967bRTwXUZl9B/oLmJ0hREJVwokyRI3Z2D1fapOqkvR
         qpTUBSVScJFrmCzfMLFd+AJhwmrZ8BgWdn/SC9WmriHWNfR3UEuZmhkvbhAmS051lYNc
         OTgyeCJgfkELLNrmrF3D3s3wqwEa9U1/i32XHhXAhsm6ZH0T2CYAMuwU6fEkcQirAVv3
         9fPqUMgt8ZHm67+rl1ug+u3QmMfCt3TZP6veBHO6ZIjqFVSWhdAIfSmZRD0SMgPUjW4+
         gRNOHCWDApcyFSlE+lyYiDbhv24JsKDkti2bweXtZ9MJwvSIZ8PgN23zEP29M3vgkTV1
         8RMQ==
X-Gm-Message-State: AOJu0Yz2y+EVxXKiUAwJDklyNfkczE764MK58BcKQPgoCtuEZUtSsgyB
	bBevgNok5VdywqLlAUcS6n7uVg==
X-Google-Smtp-Source: AGHT+IEvoOYM4IjzQAb2DwZjFpHa6AfgFG/jeaxPD3Y8glmdNz/IF1lkLRc91XrRLdKpqXSeUPXi+w==
X-Received: by 2002:a05:620a:c4f:b0:775:687f:4c2b with SMTP id u15-20020a05620a0c4f00b00775687f4c2bmr10463449qki.44.1698072053532;
        Mon, 23 Oct 2023 07:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:10 +0200
Subject: [PATCH 10/18] dt-bindings: display: mediatek: rdma: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-10-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=JdRv1/SmSo/E5fP2RWWWzxwGKldluGDuZKeVPiQK0pQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPSxJ3NhBHAKqvJAyKpooI3Iy3NY5MCOPzNpgw
 m7QS6s+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURSPAEA
 CBHQlY624f0VJRltvATnFGmjv22cWRywnPXucDp/TEpmb0jC0gsoFqnxgzsOLXejQsq4OSA91OHScS
 29zmAuA00ddrwvCJYH9yBOfo4yiCAaBzucnvMXmOx/etDsUZ9OCAmtzQBsMokpK9LJtKb2UpIqbx2K
 nhlPBCa20wL06o1wbNRiK0EKbiAn7bougYHXdXXoiq8lzADg02mQKneQU+FyZ+vXCSedF3N6ciaA2L
 mlCiGR34sx0+LYduMKroR0FzoFe20wiZiphLziI7qjIyP6mFssUXfcouZnEyUO7pivdOAZRjA4ns+C
 W0L2ZERj7YswDoENOrxebw3heXOVEZWoCU27S+PyIrO/v87mRjLF/QlKQX6EKkbOHAZeL619gS7CST
 VTccb+HoMWt+EU2hQfWm1NmZxzCU27HJVGlDmk0Vp8z8wX2maCXxNmRQ1wdFidRbsgxGiweTVOE5D3
 eyKBxQ2ZKykMWFafl8th3J0U2IaVT0aNNa2xp2/avLOvC+0aVVlgCmFHpZierzyrO2j5KIfo6PM8AW
 johWF/+kOjLPdM6SXScvILReKIrun7Y3xka+Msd4ckpalB/sJUTOym3TeXoVDT+8OGnh37ys8R/oVC
 KcJyWNeiJqeotDGEL0WE0eFDygyQCZYg6+6DFW0ZouePIP3e5d7Z1QK9+KqA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074054_365452_9BEE0568 
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

Display Data Path Read DMA for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 39dbb5c8bcf8..4cadb245d028 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -45,6 +45,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
2.25.1


