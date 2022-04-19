Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5E9yuRgUkVSj5uPE69XrWeFx9bp6fg8pHdRuz6JvkA=; b=vIlOk1Sp2WdgrL
	r/1fjBjaXAx2WCZTJpmriJGKkZsy1eff7eRKJsXDAc4ZI0H+x8MzXOTaj7I+NxdgpI8xdU0Ud38lo
	gN4g893f0DegTajqwXpPeLfGovaVqNu0JX1S4locGIjgpeu2c0B2UoYlTcQgqtSZMONLzYpOHvAuo
	hbytJPx7dw3bPJsw4dtnIL3xyAcFxxm7541VzecbjCK2fm/R9wzMtedM45hDMYqqomw6GREunMihm
	Fm6Aq484N0xGDfLX0xvbV7EPJ8RzOsjRDtACnJ0uthG/adXVgcqKPFL0y6IEMIGYxVx6ZyOd0bvsD
	8GPDtIZY6rlBvP0UhC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngkqj-002jVd-Ls; Tue, 19 Apr 2022 10:12:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngkqW-002jOz-5W
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 10:12:33 +0000
Received: by mail-ed1-x529.google.com with SMTP id s25so20129576edi.13
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YIh3HDPztean2NUp4hEk/5KOUaDqmdwW5sVxL2kVTo=;
 b=rBaRAPk3AqWA19QNZAYo+MvnfyKVAXmMzDjvfxy3awdYBFUjJDIWchT/uoTa2lA/MB
 t3li31ngEqo03wKDbvw8LAOv1yBoOBt6+QholcPsrxhmjRiJy/BNE6Pz81qIWA2uowW9
 yyDTHs9EyS+BhjseTzNCJgcEdeWnf3Oqqh/f/4UJQz1uGRvSIB57/76S5PQ00R7BmicR
 YJ+wXaEppdTpEJhnUBj6rjf5ex2MOlpNzvWV2tgfhxJ02lP58q+4+BgHjqnR+zyb6PA+
 TJo1dnPANE4XQltS95X9dsjNYDJZQCP2ejYEQeCTCv0C8WBzc4J6pS5gkLHjooVGE72q
 B4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YIh3HDPztean2NUp4hEk/5KOUaDqmdwW5sVxL2kVTo=;
 b=DUv+Bh6t03dfgHe1kSgVKNXIvtJBnmaFkANRJLK3mhbHjDE8VjhwRolOPzvdicA2WJ
 Cc4kF7EPLgdLGWBK4WaPZd87jtSWSYcAg9cyQbpPMstinU/XUMhuVaHMCVsJapFjQmoe
 WXYZHvU076p68eodBZ6O6JJ6lZbi1utwj59rxF+xCpYvrvZw7Mg0iiU6WrkInyhrJ/TD
 5XpNlZIfZ6hEJYgqGsxk6N2h9dp8jdfJbSX7cJ8JT5y/AORs5EpRgj3E22vAKLawb2CC
 4lb7CYBfnmFpMbkcMUR9bkWAm++3SocA2oCDGWt5zAisUlVcqF0zsgiL621VDIz+LTU5
 L4Ew==
X-Gm-Message-State: AOAM5300dVbMF3WCGdGYLJd0tPRAijer+PdgrHffbJMIam3Z2wTz316+
 BcN3vxTkN1NrevYHONYhtP65Yw==
X-Google-Smtp-Source: ABdhPJzzS0g9hBuwjfOsu4N4YsswKBvUI+7x79YPwkoHM+EZQ0AKr3/TO+o5s/RZeAxjY2G/d8x7DA==
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr16773920edd.405.1650363149990; 
 Tue, 19 Apr 2022 03:12:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v21-20020a1709064e9500b006e8973a14d0sm5581177eju.174.2022.04.19.03.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:12:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Guenter Roeck <groeck@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM
 node name with dtschema
Date: Tue, 19 Apr 2022 12:12:25 +0200
Message-Id: <165036314213.180327.2519068046721343173.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_031232_281233_134EA7C8 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, 14 Feb 2022 09:19:14 +0100, Krzysztof Kozlowski wrote:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> 

Applied, thanks!

[2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
      commit: 559d2104bff0c9a6379db652136d30836859252e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
