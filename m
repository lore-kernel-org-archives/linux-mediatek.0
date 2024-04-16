Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F3EC04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQKlqQdoXWwPEeES/FN9TpeW+WzqvlnmGreawKt4ncg=; b=xVKfXUO/4tvMVI/YTgEFe1zIot
	MQLl847Laiaif7ey8Jq0EBJrF+Ogc5LJG9RGATafyKy0gNw1tH0MP6VmCH8KRWL0epRIDcniLL9Ps
	kG/YpRQ5YugdmG/lKxtNx7aNiH+Kmd1/qQTyTGgchwrBMV35nxmuc/jCifn2i4WIoefy77h1ux6gc
	PRVk5yY1xK4Qib08FHB+ZxjbWPEdD46b7AFBbjrwYiQNocIfLc0g8rhpkx+c+0jp7WDa8pjWjlxme
	LKU9ibEhzTGIS0/E1SmOvJmeEhgYJYtVQy1ODgRwv0qNC+tjymN26AmszXo61b5U3lJlnOvTC+yV3
	k1OTXucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl9A-0000000CrfM-1nFq;
	Tue, 16 Apr 2024 15:55:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7t-0000000Cqn9-1P05
	for linux-mediatek@bombadil.infradead.org;
	Tue, 16 Apr 2024 15:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rQKlqQdoXWwPEeES/FN9TpeW+WzqvlnmGreawKt4ncg=; b=gG8o1Cpwa1hBoj8lJ7ptTK30SB
	BzgZIgoa3ae4t7Q2r/8FVTfXTlCZS3ckxsvKLQ/7wXLxyFpcg9r+SF6dU9UvQwsVUm5fq8LUoevW9
	xC3+6hYBNsz/SBVvfblsctxFL3gwH3qf0BQJiptdKepxiPBoDFtNLeJPg1k99uf63RDe5uvr6/ojf
	YONe2DqQ/QklyEJRAc3qztlu4xjpcO+nG/UB5pC63N78o2x2OASmnctLfeT2z8QhHfgJi59nRkkox
	uLlI/2cW7RK8wiboN/DIM6E2hQAxtkkaqhtCf97XvkCBFKke0Dr5Lp3G2iUdTggmqnphJf5/KN0xe
	Eu89Zphw==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7p-0000000B8bw-43WU
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:40 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a53ed18f34fso237104066b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282816; x=1713887616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQKlqQdoXWwPEeES/FN9TpeW+WzqvlnmGreawKt4ncg=;
        b=obne6i05V/qPvnjuZGO53isnP5kq5NrmORPM0y1Ig11F58U9oKhu4ef1LnOKDoDtUv
         6cUY3VFrhNDEBuaza+Bx9yNdZYiNELu0Y+t61uzt0uZldWU4LzSzcmNFXRnZtikUP1kK
         mXEiJoOp73o0CW04AUi6zNedJOSJXENXnAvJJJxNHvgHDFnpQCsNES31+JFD8fllBd1W
         JX2ycN/RhoIOxvLNYoUq3PAkuOd9lIsn7vLjbf59fGtix2eInKrombl9XLLAqnp9yIps
         BEbjg3Z5o8I9zOiVSsfHfyKqlxWaIUghoQ2la/xwFd43Yk4A4FAl49V6O8H2kacED6rt
         FCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282816; x=1713887616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQKlqQdoXWwPEeES/FN9TpeW+WzqvlnmGreawKt4ncg=;
        b=dOvfDLHLWswvQiJYJO4U/C5W/sMdUZZva0DL7V1b54T/Ls8h55QRxN8obJ9Hx3/3Yr
         A/xF+y+mTP+ApV28OS7CAJbgkmq7UTlLIlq41IRy6w/RW0XOxKhpyPfyeIm51D/lg2l0
         3abSSv81eCwepDeQWrJerIzQvxipILCG4s9JNILpxUNhNg/PzCxe/nLcYbPObLFuP8/i
         sx84KKMiAPr/p7ATZpjT3cUCw9o9A2QjmWY0Trd0kLBKpkkeHT19zV0yBYEo8wMeLyKg
         k/X3Zhzcz8L2lWymn2JHweWgK4m2v2mcNEJGNLy6DdZt6OduvBxr2pdxuGrAqC1Uw6wi
         hi/w==
X-Forwarded-Encrypted: i=1; AJvYcCXXyr6xJLwoN1xaj9kEuM/lgvZlBn4iabvW3JL15RY3ejDzrrFrgaWnfjH4Wd0L5wqUc9Vm9J1uS6rGAZqal7BY97rm/syOsCUNmJhMgsuxzmOr
X-Gm-Message-State: AOJu0YwOrrIqIZ0/mlnKhF2UTYiS3bZVyNS8VgR6B/kUalFeF0+6EXog
	Cm/+L1Z10bgFWCjsKdx5SyU6POPU2XiDqI9YI5xcrlP67pFBT7+0Ig7KeR2eAs8=
X-Google-Smtp-Source: AGHT+IG5OHqnqUsnTyNTrbs2nYwMJVuo+moQf2T02fHCNlrjfcuq4FRmRxDm22VoPJC4CBn7dugEWA==
X-Received: by 2002:a17:906:c094:b0:a52:3623:f498 with SMTP id f20-20020a170906c09400b00a523623f498mr9213020ejz.31.1713282816235;
        Tue, 16 Apr 2024 08:53:36 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:12 +0200
Subject: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ofdmgJd5VzPCJdOxt//1dMUAAyFDN3WtUwt9Q4Dw2mk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qxOZhJwN+amyZRjgtZoEdl4pUWh8cCetZpi95
 2LCQ/KWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYIUEA
 DDUtcfuZO39u2gAlupF0qEhOdmTU7v1BrvGt7UBgJQNnNAIdJx4pwcw38kzaVcxs/VJwBF8kosuLCj
 dyeS+BSNX/sXe39SV13zv2A/7Cajr+FXat4cehh3PqXq+oem/pS46y2EjVSpuwig8WEzoMHWajg+IB
 bqgl2bUfXUxg7ZQX3u0+7FcdRTYBCkRHVwTROX0GlfXqsoIqGAUwD1gFdxqRPhr0jyVhklRZRN07CU
 s22WL8eZh+pTXSmYQmbtFFLF8KP5yC7Djn18HtKSuxbPNXNnjbaAZ79ouQ5dyCm6hhTtpaJEeBPOQ8
 BpnlJhYdDl5qb6IbzdaIK7sedFkzKwDuAmebP+ATxYNo5HwH8qkPNGryFKCB4JsIVaNDRNNt4CHt9r
 zrJxCxzpDOCN3vlyoOGQvjEyq7yoeVT8q6++i2ndmp8/MUgl3RFVbr1Qq8srLeyOn1hVC2RpevzT1S
 f3DyogERJynn30zh1Tb+3bkC7vwf9h4XR7259YLQA/RE3jEewRf0iAPxeUsYRrSQziWUW7fRe3d3pw
 j5aeQ+dnpnM4JFhAGYk2gs+fIa613ERanAJ2DzFOiC9+QWW+W96ha4Q/u27vi/uRsXnx35Mmj44myX
 vCuQGPTCjQsj6M1gvir5mdsnpeDwBeek2Lm/PcUPl8Bj9I6uq+p+ONja2rCQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_165338_196961_63378F0F 
X-CRM114-Status: UNSURE (   9.28  )
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

According to the Mediatek MT8365 datasheet, the display PWM block has
a power domain.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index afcdeed4e88a..f8988af05287 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -52,6 +52,12 @@ properties:
       - const: main
       - const: mm
 
+  power-domains:
+    maxItems: 1
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
 required:
   - compatible
   - reg

-- 
2.25.1


