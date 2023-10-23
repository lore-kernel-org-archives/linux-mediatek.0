Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42747C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxTXywbu9otyoHiH2LyJKtB0YMAbr6Ld4vLKRXgmSv0=; b=ZdoIhLsjhOhwy+J2R+0UPe6C9V
	4ep5jIR1Bdqzq7h6lJBZfdr6zFH2ewxtK4p2EQL7OkeasyTS7Afqa3+5zVkT7W2r/rka+JYjURWXp
	Tgx/UUGhT7ZzSntfl3cEm4316SSH6uQNdK5bu6OBLM0yJhwLYepHBFV6QW9DAYavBySIU48XH729W
	CiLwNqQiB6wgVqTpMZ3mHVeFiCnUfGD7T2ADlOj6sqHIvFriR+J0eM8J/sOpKm/mytfjyGJFlhcOo
	d6rdrcOu//NGHbD2sNUPKVF8BTKlan39koR+hab4zU/R7zOsnlHq+ccsEnGl0sdL8tHRrSbVDFo4/
	kUZ3Zygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6m-007Za9-35;
	Mon, 23 Oct 2023 14:40:44 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6Y-007ZPK-2Y
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:32 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-778a108ae49so332334785a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072029; x=1698676829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxTXywbu9otyoHiH2LyJKtB0YMAbr6Ld4vLKRXgmSv0=;
        b=DsXqj9cEgtPoMGH+zXe7wikTmYpzNHjwPsoxwsCkZizZZVaaY7TVQHqowDl3hnaV0A
         6RYfDkZtqi+zCglNxK1Ow2q2xt+pnriJbDqBnekFfZiyZKX1VyZUsCzJbQQQk5hO0xs6
         d8G4fCoun/9o9fBoCL1KwYtAJFFBOmDzBL9vCnOOzlM0EX7mv7xYZCRRQuUeGuSXbB6t
         iLCp5yfZL2TYsc1L38fgew/kEqSA7rTCl5vX1BoXD4nkOxs7kX81x20XF1BZWtru5PSo
         SeTELIjuUHTLIrFFAsl2UNhCUsJT7pUF2f+fulCsujeaPxdq0lJSMkvoImCzwTDnt3XJ
         4lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072029; x=1698676829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxTXywbu9otyoHiH2LyJKtB0YMAbr6Ld4vLKRXgmSv0=;
        b=Y0zSwNe5eSNS+sR35D5HK11uECQSer1uk8cxHk1d/Xz8JYnz51YNhZPEc6Om4vpD9G
         fKAkMQlrXXxcUPv9foQgJJPBj8ODDZw95+CdVeo061OcialKCaIkbiQ+FsDFdpD7WaH1
         +fCVdcUybN4ZAtbPSh78GVO2whDOgFjL3VdApow5jqbUxb0Fkd1OUd+ChW521C0MyCKt
         DzpIHF5GXxwm85VmGerKCLV8/4n3+IwZxGrDzEQhW/SCegxESnbvWiy7gYSaV+/Uzs1s
         5PGWqR3Tyw8fP5ReV2EzFbFevT/xK828pFebMQ0hixvOfEMPQW8P4tRXC6eMMj0JPYtX
         7hNA==
X-Gm-Message-State: AOJu0YzWO+8E8iuL8FuvFmay0fzae5e7X6T5NzNqgPsVY87/ZVS5DR3Q
	VD76fiAfeU+0DuWkCdVsQ8UANw==
X-Google-Smtp-Source: AGHT+IEgDRtfc3NNADXRb/ZlUHXnY2jqVnmdnhhEIJ55dIpMP6Yd7xxuXciomAvhvv7MbNCOmoiiqg==
X-Received: by 2002:a05:620a:25d2:b0:774:2470:6797 with SMTP id y18-20020a05620a25d200b0077424706797mr12666017qko.21.1698072029091;
        Mon, 23 Oct 2023 07:40:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:03 +0200
Subject: [PATCH 03/18] dt-bindings: display: mediatek: color: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YU1e5sIok1+NbWY+6HobM33V2no6aYQT7i5d9DqejUU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOX/azDl+ertxlsp4unLNJxzKKT9zEjAR6PtwW
 hAs1qQmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURRc1EA
 CyDaIaIfkyDDyAVVQwiAwHwJfYWVP8v6IFzEHshzqijzeYNEzhU5kywjLlaKyoNWzwS5QwYGw4ydP0
 rGGtLrS0sTHSrcZk5hPSOItdc3deukZxSxsBNw2L6QidCWnsCRMwK3R6wWpajt2AKap0WgUZXz8H2V
 XQ7YFHDkgZAEbK/ydrb0ywq4K/agzoHG190lbBvBUm4LHMTLWbA3zf0lermqAUExlOrVuT4c7k1ive
 SuJelX66K7WkPjqZj/WsxOUSrxhid8P6q2DoHoZC9cU4oaN8JqwnZzUtI0kVhggWylulFlyCiIyQ4S
 Uq13CkltChuXB7zrdWTYNZ3oKXWfUtf09TYzn+aD4KEszGS4CCBkx/Kx1PEurAZEWDOcECD8+ru40w
 rQG+Vh1XazpuQ/v4ItapdZssXcsXx9gGuFfps/Ag8tZhLHBtlKQS2YkmckrhVefSbXhkRwgbvMAJS1
 6DNHYYjAKvEqeTTsV3ECPQCeYrO6w2b8WxCc3gVkkLNdavoY+d3Fq90pgpV+XxIyul6+1/aNJDhn9o
 nEpRrs9plK+W/0nyUwkrWlbVBppj2gon9XQm+rRZ9iiz47Srd4Io3ZVSnBOh1ebM3iqcBG8Xd+Lb3z
 GCialIyQYoWGFpw0U96qCACTy26PC2yItVewLkUg/dDXskEGrmlymiViqVng==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074030_830985_87E090A6 
X-CRM114-Status: UNSURE (   9.14  )
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

Display Color for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index f21e44092043..fbf15242af52 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1


