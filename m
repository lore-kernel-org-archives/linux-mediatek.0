Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E21FED2CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=; b=3LlyBD4PudRX2XeIHGXSGNwH2E
	EO/lSD402PPvXCax3Z41/JyP1a3cRV27cxzMb/bWHgBmer0z0LTfoavZUN7oyk+wYUpUCQg1YlBBP
	GFNZZCAOUwyj7IRzLH+FCSojOIgTfWNQgX6X6lyVD3qttzRmgGp0t40EfCRAjPiAFobfHT7gKR0Q3
	/hncPvRRQDY17mv9wJGcDMfgJX+Rj8qu6lQnifRzuftrKK6LfYwHQl9IOv3j/BWFWL8DlzeVbpvOM
	L/Hx6c8qdSnvYb/ASJXgyEkTtwrnlr7xk+knJiDBqCsjz2A0zFpbkwNNmOuVM7rLb64wTkMIKG2mH
	b2dOz2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTK-0000000DEUl-3RTv;
	Thu, 12 Mar 2026 04:16:30 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTI-0000000DERk-37ab
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso214976a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288988; x=1773893788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=;
        b=Hmo06y7tIRM5WuBcZ6SJ1NzHh6wn/8FhuoVo+lrSLyxC29S8YKlQtquXag1UnDfEj1
         25WAPUqjtZ88/PFh+sVPpzUk6G4ag2awXnleD+UusSPxZNfQzcheuVHfwAGBE5Dl3nQG
         XZ6aFN5mylgsYfGKxw6YBEpP0l8gtW/Ary91lhNyxxKZGObun6USigC9CUgsPvZmT005
         zfBGvayhIClJLzUfEbdvlJ/SCfhvdGMHEXc/lZD8gSY2XfAApgpE70UTTs9BuYDGe4cY
         U+wvURcQujgecQzzzhzeRn7sY5R4vsXAIDUpNBtY0xTZQ7B4hsNEIAYcjT4trVdDZsAG
         TMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288988; x=1773893788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=;
        b=o2AfHL0Nbg2SkXp5nOsIitADNNqloX2vzrlO6QRYMTVl79HdA3fXg4ntQIL8ic5nH+
         5USnG553eV5Ps3m/AImwOgno34FexceUlJWgxN3X86qrpW9OmcI2yVw7miyONv9jDuKQ
         qfYaBV8+3ddCXnncfmXiObv2e3QJsL0iSVRm/qQASYdvIBzJQxljEVtmkDDAofmHXfAO
         WwCI1tfAtOQz01lHrThhrj/90T6ahdiPrOgyfHoF7EjzhJeeUHdPUIuKKDLXtnqxw8Ub
         arRlpLL+OnpaaNidKORPIEhIF3bIgTUd2TEhRrMoxTa3RbJRPK2eh7aa3R5KCnTP8z7B
         JyhA==
X-Forwarded-Encrypted: i=1; AJvYcCUr/LLU01pBvx4UM9z6LKPoalCPLWB6CX9tuEinsuDED5L2XIH9fLWmir1vHbfu2rZVGkoAPWT5+370ZQVRtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2kI8ST1Zh4tzvVhUnz2zeUzhD47gCrlDorDbK+Nfw6l6O/TMQ
	OQoOqJPK2NR7zNpsQnRZZFYXMUpvPHsNpJkcwbEHeHL1wxyoIrgQknha
X-Gm-Gg: ATEYQzwiWvAaoc1KJ/HLIAGsFuy4eenj7GVT0KagG8pd6PTdzXjN/d5Yt4X0hVQ05FF
	AaSL07VE626uElGfcefh/4NnTkUzB+r8iL92XxLtfPgCrqBkTC+FAt6FM7ZVTxECTtMwXLCr+Ts
	f1ZDQZy/gR1ar1JnBhVexSP2S6jk2nzrv15wwsj1rOw/EMfdAl2AmVeunkFB/8Av3uUx5HS9zWS
	9FrbMyDpoM0ODTTPb1sWpACr+H9vMuGDlFQUyZdGBIcdN0nQf2Re7DP7lPWSjSvycO+82z42GSW
	RVP57FiwRl+KHNeiEemX0yM5Ah8JYOz3TepNdbtk/CHXn0BC9PfRw08e9rgO7uUrhQWHmRaqMUz
	rSoXQiTW+DDPnK8ZR9dx5eJ30VhktbTWcck82sQNGj3rAFexGskLq/zZdo7HHGvA7nVGMm7WZez
	TlaTe85e66BIeQMWnmOjNAstOPM5XEWAIIdLwFcW1G8SDPwq1fs7G5VEhBu4T7weQW0B4g7ehNx
	aRD9qo=
X-Received: by 2002:a17:90b:37ce:b0:359:120f:d3aa with SMTP id 98e67ed59e1d1-35a01201dd9mr4941745a91.14.1773288988147;
        Wed, 11 Mar 2026 21:16:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:27 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment
Date: Thu, 12 Mar 2026 13:15:33 +0900
Message-ID: <20260312041533.187553-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211628_910341_1456F4B0 
X-CRM114-Status: GOOD (  10.98  )
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

Correct the mismatched macro name in the #endif comment.

Fixes: 9f1bdd7e8221 ("dt-bindings: pinctrl: mediatek: add support for mt8188")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
index 2688da2f621f..66a451953838 100644
--- a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
+++ b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
@@ -1277,4 +1277,4 @@
 #define PINMUX_GPIO176__FUNC_B_GPIO176 (MTK_PIN_NO(176) | 0)
 #define PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA (MTK_PIN_NO(176) | 1)
 
-#endif /* __MEDIATEK_MT8188-PINFUNC_H */
+#endif /* __MEDIATEK_MT8188_PINFUNC_H */
-- 
2.53.0


