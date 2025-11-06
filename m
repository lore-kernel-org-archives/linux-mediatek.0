Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B22CCFA05
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=; b=yoHxgT6ItQq1R9vArkmL654dz+
	e6J7O6GwWsZEyBcWWie/wa93iNpnLwuj5nb+ii/S8s/j/SrTSzlZ6zrBJwg5YHzQMhC6PPen7SYqF
	+2hc+wb4VMglN8RrvdaoJMcoNWezaXFOgyoNr4SCRZqZ9Juid1Bia5LCu5Pzsvl4hJx02rbk3IFNg
	bUINUHon96ZMGNXYRISHF70A/Njn4SMBJYMprFaRrpYTsD7uRvvcSM8sTAVk702XX33VUeQ7Yulzo
	vHMRMc8HNogqOankrEyMtIGEjpaWShL5pqSxeSK9R8r/hXcRZrfxbnq8dvgp1AAASw02xEk7DFSwt
	jsfNUdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LW-0000000G8MA-39TX;
	Thu, 06 Nov 2025 19:08:34 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LQ-0000000G8CC-3j19
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-640ef485673so229300a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456107; x=1763060907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=;
        b=FmpnlCkFveegQB7KDpgct3c5QgIBLilgwlxqou60OuHGgjuke2wPogWPqYbcJY+lFq
         jg1uhVscQlDjBJGbt8bSo4DjNXQQ05XdplY8osV4UeRZEi833LSwi9clDOeMYSTEusxx
         JDi+W9oyeBR1MZLh67QlDBfF7AaDsLL/3/Xf9sGwiqHNZV9tfm78n5oEx8w13xYOlwa9
         ZBCs8irWDIEcJjXO2cl/XAHSBVYIqZWMfxE+vvwbHl4tfet/mmiOXyWVmos07ay6AKjs
         W6u/LmtEQkHljyClp80U7V3o1uN5fhnxTlLT5uNdBUeaU6Ag0jP+2uxLcHZ20mIjeUHN
         Q+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456107; x=1763060907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=;
        b=hqDHCefhxJRgBOXkbaYam3jy2gvG1ArVSjXaAX8lOGHCaw4I8/QLZ/QkU0mf6J0G0S
         ZELA5edDLLYAqAPJZYx+a/ffsJ7mBv5tVlWs9VZS1Cmqv2q0vBmTrLZkiRfYOTZaCbrK
         pF2y6hUaGHHjC0YPe8vzrJ10/zlKUHXXY+1pnO4T68CcmwFCkVP0HtHxeE1UhoOH1NoT
         kRytaLxK/lzOpkbbYQfhnVMYzNpg71akdNlcVdnY7b0nAUzxnaY+YDDFgOYSB5aA1xJQ
         SFos8sbpe5mukkdWmyC1VqDfVB8TtROAWBjmjkoRh3q9NucIqoYy2BAhpJdJfQGLsdPK
         OMiA==
X-Forwarded-Encrypted: i=1; AJvYcCVZYvReKx4TjNyVfDgsqVWvI9QNaOCTPLiKzfaxcGhQF70VXY/ShozFnFYxeoD7VnKVvW+fcdPVvZnrpsBc2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+THqxbP7LcHkNgBXMOt7ijZuVvhGKqTEdpgYxEJDkV0erWa9p
	1yu4+AYOafY5O9L0VP5kTcJ5Wzg87SLU3zN2aqzZ1AxqstUkbGUzuyeZmlSd8Vs0RSk=
X-Gm-Gg: ASbGncv34rhxm8bmddxJZfxofQADTeXWOTzPM2lTM0soD1GOlbxDEDPy7/re2rGplIt
	O/5qvlFtyG2vYBH5IG93XD7fyIG5U+Fj3KNZuS9P7fOXwMh1YePHqhxhKXpk/u85xoxz9aWuNLo
	68ZbRS3VOFOHgrY08nz5Lr3xH/G+lr+tvN+Z+zl58Fp4QUumdp3cZLleXhRoG6xvWfjoeNFDFb8
	ApyU4MvpkFGFsB2yhqln9+E46901eeG79FAnoBl/oAElD3JPAOj8z4JSO1OzWPXyHYSCjTd16kP
	+kD2jyYt4yZtGfhHXHZl3dU7v9e1DMBKb7vtknshLqemXrUnSJSN9Z5m9eq3T1ddl1F6pkOPooD
	qK3/Jsn2Z7jqW9RMDAE3TmeOJuvRYIHkMO7XWCL/dwcYxSixYMTe2+5ZOCCeQdecLBrwNH1mv8m
	xCkXDaL0qtQIW8JT87hgu6DH4OffZNjLKf+hurpA==
X-Google-Smtp-Source: AGHT+IHV0gcmtT5dHOFz2RWdjjPo4Ym0Dxek/nZLw6T0N6UfI+vf5qBD6z9VCh47UKxNTUDt+Fg2GA==
X-Received: by 2002:a05:6402:1d4c:b0:641:2a32:b8bd with SMTP id 4fb4d7f45d1cf-6413f062ecfmr273551a12.1.1762456106689;
        Thu, 06 Nov 2025 11:08:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:15 +0100
Subject: [PATCH 08/13] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=em6T/0hfaUrxxPHQSOCVHJqt17fZcoSzBpufVPMk75E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIQPP9Q0idGJx68rbMt6LPDzi2dtyc+qS5Mu
 2MGYLCnw72JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEAAKCRDBN2bmhouD
 19RJD/0S4D7rWxJnMM5I0ZYvnbWMyO/Pj+zZl5eFKXP8jMODrKLvsKA6Fg3LnSAdO8L+5R5rOrn
 4EUnjlQYlM54t/RRDk+Nzjd/KH48/DE/2WCAFiGImlDsuBP056TT98RR3yrY4NzyX24N/8z3ax3
 8GZFPox1BIaAcX+3EomDyR36I+92AkCvbnhnFPDKUTooHlSVWPX+K3FdtM//a58/chL6TZ86jq6
 1SgBn6KYSc22lQ59475GTGt4ta3S+5ZvHrQi2366EGm69VLEQq9Ysm+AGe/x12eHW53kGE9p0AM
 wapt3PIh/Lvpie5yT6jh7TtmdKuIaka3XM6EOgFwnkDLzsSGOZCBPg2Rcpos//m5AjddN2J1KGl
 0EZJIVYOqxPDRKY61SJacWclPPPmdC+hJOMGk4tr4v3b3IMuXPSQOSyZSkCuum4QMkPYk7LPZO/
 MVGJ3XH65qFgUsUwv7MGHHUkz2dgMMvzpi2oFBbsriL+FY82SE0gsjda3sfKcjj4IKMEEb5wCRu
 jHeDHhMGRpgqfbXiosWKNkJQpOp4gHIsuCueX40vRwcWy89afIZXxJ9cyXTBcyDrzOQVF6NovFl
 9Nz4nRsyPVVgw3gPqrDfWqzQlrFQeSwu5UTDL0iIWxTLElBqYmjApnQ6PvZPKC1N8OTCYhLlGUy
 JC6bgRbAddOP0nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110828_973081_CC47D001 
X-CRM114-Status: GOOD (  11.42  )
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

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
index 3cad30a40c19..e68853815c7a 100644
--- a/drivers/irqchip/irq-atmel-aic-common.c
+++ b/drivers/irqchip/irq-atmel-aic-common.c
@@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
 
 static void __init aic_common_irq_fixup(const struct of_device_id *matches)
 {
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match;
+	void (*fixup)(void);
 
-	if (!root)
-		return;
-
-	match = of_match_node(matches, root);
-
-	if (match) {
-		void (*fixup)(void) = match->data;
+	fixup = of_machine_get_match_data(matches);
+	if (fixup)
 		fixup();
-	}
-
-	of_node_put(root);
 }
 
 struct irq_domain *__init aic_common_of_init(struct device_node *node,

-- 
2.48.1


