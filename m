Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B51606A338
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0yiOlLpU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGkooVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=; b=0yiOlLpUrbiRvi
	h30ebKFMfxVPTWE6dUexWtiW41PyNfd8U+oFs4+abeMF2pzFf8NoK/eehuRTHudVRQJ4bjozYXzZS
	86kP0wTBxc7HlFYwbKPD+mMl8C/shlEs4snz3c+iQOsfEKAjPrBAA+fxvMwNGWhwvWLiFqN8srLAr
	EQrcluePR6dShO2jQXTS8CsX6MPLgxlHxs1DpOviC6PW9vvXG7pc4YhYPv5uVp7yXdI/sPPo9JKeL
	bs7KJKzP3zO39OQV4S9vf0SvlmjkectS6nKvvZhK78RBArtvdxRdh6vdMG/vb8mlAo4DJlMxE8dRF
	OTGS8rdCbLZweOvaF+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkgB-0000000FaPf-0CHZ;
	Mon, 02 Nov 2026 05:33:59 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkg9-0000000FaNu-03ry
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 05:33:58 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-6de48228f20so298903eaf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 21:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597636; x=1794202436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=OTGkooVWC+kviMbk59cJfj8FJl8CPLmIIc5KyjU9ZZgVaCny6lyJh5x2uiKPLPy0MJ
         nN/XcDS/BUYCyNnKu2clnnOL4WfUr2ukVHGOLf6TbixjoDc96vQabLVzIYKTwbKnUVJE
         U7vwVFIdAIK/8H60GXySshO3PoVdR8Wf+rsyBgjlt5leKjSw9hzeRaf9IJ4rihE8CEuh
         7YjYj6mM+kcstIu1GM1bhsoQpzAsyVX7cCBKCQCoTCA2jz0U0MMkRv7kUPfelNbvsSwc
         c+NwB5TSTlWzc3eRGoqbSiCk1ANKC9vKN76AAG0to3Vmimzq68kdBMcA2sX8fursQk2r
         RuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597636; x=1794202436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=BZweoe/QIAfkasIW+zqZQaDnlJvh+pcDUwmD8omyB6Qk22yXJtxiLtbgVEIeKtsBe5
         /mbjk44lNi09hHGgdXZQEQ1ekFj9DyCkkyqOdSI7f8VzMypHY5hr9Ll+GjfNmCKXiyNh
         2/bOPUrKqeqg3npQy8Gry4oDfqOSZ+VeRyUgKv4D0Q5VIyHh1xQGX23B1jYJqr0u8wUZ
         KKL5/4gj4MgnX0nVlIvAc4bP9HPbhOiBR8l1if4ZPthhto6ga10/20yKS0jbwtDi7GdL
         5Z8vfzsn3dD63WRBIKNb7WwEEQ8+PD/f5QgTMzDbKMWnN4S8QPz+bXUgS5DP3stapzPn
         1sEw==
X-Forwarded-Encrypted: i=1; AKwUvBwrwB6bCCOJX6U57i60SE+14tXTKjfEYDTaB882O9lNUSQfZ6R62fKIJNIydCuEAOv3hY0SAVV8MQrT9oPvdg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIOJOH3bdyYdrtuzAPCxBegvwYs1ufUogrYJIwxn/lKpcEHtPxB
	7+xDsxwpxgA7zD5/FsTgOUGxibPjR1uQ28DL3HCglsu7zL0RrI/E6FR0
X-Gm-Gg: AYBFou37NRHvkPFQpKHgVnPGQrKEH6dYXc7DcBxPN+1jmid++tMZymBUiXlUQOp1+B8
	trtkHQSO7HJaZA+N5ZCsGewF0kDA0PXScWjqvzricSyG28oI1mqp/ai1vsmjf7mWqCo4XBUocP9
	9Q5ZRT+xMuViE4NEA/9C0H0SpogA+Gd7BWZEtJG8m2VK4dQmeVlaVoJHRAJCk3krLEb/x12v+O6
	hb5p5Bw9ktcJb/FPjF43lFkaBQQ045jgzFYiNZgu0bvYRy0HPfj3SHj4fn3xHvg2m8TjG5hsG50
	Rzap3CVDnmh7Qg5HMQ38mRELCHBklKkL4fnfxhJSvxGVEe4DV4ppOLCYujOhj9mxP5Z9wWxqa4Y
	9ISfyFc4rXu40OfMD0W9kxQKTaO/Ci2o0j5VXe4dw1BCHUo/hbpaGw4LKthbtJ+kimTrBdGFPDb
	Nae4rj1NlgB7u0NLIZrY7E3NXa9JTBX98fjukHR7WNttOSjaG+XbRxqRmR5VVK4BRI5kQXIixVH
	7HtmBv7p5hljVi70vDrK7muyRSb++JO/rrngn776ken7QuS2ZNi9z6shaBGKnys8sfDxL/CXUX8
	Nq4u22PG/FYtmUqcPNADracw
X-Received: by 2002:a05:6820:1343:b0:70e:3e8e:efdf with SMTP id 006d021491bc7-714f2ae369bmr4807837eaf.89.1793597635764;
        Sun, 01 Nov 2026 21:33:55 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:54 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:33:46 -0600
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 32 kHz output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=1164;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=GgCulyiRe8JqnSbuYJBNp+S895kQy071XDUKSDOt2BQ=;
 b=UE2preFnWrcfBUGQB9fs2ZLD6a5Iic6l7jXV2HPJqVzl40mf4eCBFIpiaxRBYwOVNNpkVcGzQ
 NP955JBBzvAD5zz3cEjRiUa5q86u2PzDOoj38Yx6ZzP9oKolUFV8h/8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_213357_069581_D3763861 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0


