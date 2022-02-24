Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4DCC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcQiOZW7UHl4cZNrNhCysK/P7MehRaI16CBghTIsXfc=; b=1IVBq+v4PxAEc3
	QbQ9v8INQzXTdVE8VvUWm1p3LWdntE/UK9w3KrsQGEjND2GSV/viM9qKXiPNeS04lkY5c8m0Uc0OH
	r/+7rIT1OTh9UdHv6aH7RKscXw4LPLSNNol72nAAk0iC3J534nQI1IAJg3jV75JK6zBhqWpbWvqpI
	vbmEb97yygBrnmJWSKS3SOYrjfuuTdDrL7qHEGs5IMud/aIMPvBvYJYHR2pYUpO+nkzaQ79kdF7R9
	si3sJwHkLm0aDqDW2JiEjSygSNaCV/NaSpMHZlAjj0E1v9fJQCQqmXmAgT8dzSwNgg8222jyMlk/f
	bkwAuGYP41sWGc+HqF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNL87-002NrO-FR; Thu, 24 Feb 2022 20:54:27 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNL7u-002Nmu-QG
 for linux-mediatek@lists.infradead.org; Thu, 24 Feb 2022 20:54:16 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso2239897otp.0
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Feb 2022 12:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=w7kYYicECLFYqJJp06iUhZt+dZdvmlULZGafsy+TJYY=;
 b=jZEz+rzkZ3qSK3QIGheoWaMmA3vav7COKy6XwkN2b1xZlR8w8uHw9DU+hsfVrKT2A1
 U+nJo9oYUOhKL2bluBtJc7uA2lL279nyzDvXpMQrF6jfqgRTzBzicWt8M5L7O24AeScr
 c3tANUX7ruj1tgsLIYaMxWfWfMHGFsBUoBh3oTqvs+HCxFWt0HI6kAvxv59aVIEjm5qB
 DHNii3B4lT65JyRyop8S4Ye+rYq8DgmRA7P6XT51vRvnKyAkiODRXBDabFIs6jRMkJ4R
 /Dzfvtw98dOOGyzT0mdluTBhkcSOBAFD5TjzwdK2k/Xz3Fluj/VsS40oZVY+YfhRh8J7
 CwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7kYYicECLFYqJJp06iUhZt+dZdvmlULZGafsy+TJYY=;
 b=4S2R51RyH/vCNigmMzlmUyQTVuOArCTiZ/AFi2AtfYkYVKquJdm0a7gI7LJcaT8VuG
 iihpjokl+z2uFPd4B1+5kY+vL3FppJGpyQth9Bi7mZUkmnUmXJGr+Ss/elC1hQl2WW2c
 1T5C/GYvzbwaImKamrLgxi/FGmSVbQOu52YEJW9zfc/PYlMnOk8qr3CB6JmYUSXGOnYb
 KxydKONbzfaQceyAXy0rLAFYS3HFotwj/Lmls4cteqyz+jVdXbYgyjtbJVTKJWMqU99U
 GplwD6bOSnNFILDvPRJx108BHUhJka/caLux31l2LpfzVkTt6ivOoQV7UQ55gE9cs9L9
 AXJA==
X-Gm-Message-State: AOAM531Z67Yi6kfLh8qXpiDdHBcGCJ36eKpKxUt1xG2DLXRMLnIMMao5
 qepuwggoNw7KBNu/6yW8WZOsnw==
X-Google-Smtp-Source: ABdhPJwqpinof7vCzpo3JsDgvR8WPsKLX9v8AOxpnybjdBazfy5rwg4vCIHUvilq1nJfyHr4S8hplQ==
X-Received: by 2002:a05:6830:1098:b0:5af:a452:2f17 with SMTP id
 y24-20020a056830109800b005afa4522f17mr1620669oto.175.1645736053623; 
 Thu, 24 Feb 2022 12:54:13 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:54:13 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: linux-rockchip@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-mediatek@lists.infradead.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Benson Leung <bleung@chromium.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: (subset) [PATCH 3/4] arm64: dts: qcom: align Google CROS EC PWM
 node name with dtschema
Date: Thu, 24 Feb 2022 14:54:00 -0600
Message-Id: <164573604161.1471031.3877884989605040071.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_125414_877146_E8ABD3AB 
X-CRM114-Status: UNSURE (   6.93  )
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

On Mon, 14 Feb 2022 09:19:15 +0100, Krzysztof Kozlowski wrote:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> 

Applied, thanks!

[3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
      commit: 1e49defb863638cde53e48805747271f80f9abec

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
