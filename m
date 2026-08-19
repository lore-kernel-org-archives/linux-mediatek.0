Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6F4C5DF85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MtCs8dnl1tQU2h4oXHMcOoDEsGNNkInvX360HS1foA=; b=z0VwfcTxoRK8e8pooEKdgXTtm3
	RzVJTpVi/IGeE9WrfEPbFZyVrkucmrcyelSbJbWxQYty4poo0W1FLHdIl4uBcYq8rFoihqLOeqhYg
	9qCXlAPbaXx/GSr3tZjyOTDgSqmxAiaHkeEKhp/FvnE6ctmV19PFyeApOqzDrjms5Lk0vyHay4gUY
	SlbNyteXXdM+RwemAyofgv6QWjqP2q0G7ZjnUUB5f74+SkFqB99dnh5cNI9FJx+yF4aMd0rgvbLJE
	2VcnfZNAlgeh3k/eBfkys/r8oSjuXikwvXz+9yDczkSF1sIw+5MKqZFZwJ72Cj5cQLdd86ky6+OmU
	cAaZyUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkKM-0000000AIb6-3WVE;
	Wed, 19 Aug 2026 17:43:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkKK-0000000AIa8-24cE
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 17:43:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc891373e0so16383675ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787161428; x=1787766228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MtCs8dnl1tQU2h4oXHMcOoDEsGNNkInvX360HS1foA=;
        b=QqRp8Y8/anIOgOU41xFvPhsvezFiIQzsOH5VDt2jLf9PqQeSN0nD400o5p7vo7NjXc
         oF082juD406yI9RQGGt54lYQA0Yhol7+xatWpss/fFjAOyln4KQfbUh39YBEcvLeIeFu
         YrKsgs9FWmSWLNNiEBwvu5aHYHF93nPtRlLBkB1YNaFgoIXUaPWCMydWCggE4Ys1b9ja
         qsFV2E2G2AhM+m2/GLfRle02xM56kehx8YcycrG81UtdZuZFik/Ccdcm+98TdKq0k0yu
         2+r04SqiST5tQ1p0374EHEfeRHcV2934wYme14RAqYE21y4mBeJ2WdLAi9ui3FXYHzW8
         DjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161428; x=1787766228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MtCs8dnl1tQU2h4oXHMcOoDEsGNNkInvX360HS1foA=;
        b=K0omt5VaszRPXLCa30KL4Msmk9KDYFAvzthruPG0J0XT3jkBV5hVohMec2mpOL+Mma
         aqfqNwXsOj5lr9Z1hYzQIQ50IVp8oPSswYQ2L1uUyUb/KjOoykr2eGrKd1+YHksE3Nc6
         59YM7FSBovVI46Gx9bdMGb76m+G3wF18td8As1UvS4mreKNqGQiKs7N6l61o8uUlGqXR
         3qVT70jiaLQqka/qm/+FeBLaaUEiWhunpW+6MjTlGdA6nAWcoN2go412RUxBWw2ULvtO
         UV/mfymQ9jfWgR+7proIGo1/4z0Lk7WhlwgnvXs5i4zsQtEoOWg17L1rS4U6fbx7TwRe
         PDcA==
X-Gm-Message-State: AFuF++kNnwk5EcK82FvNUzafcqU6MGxfYMf7k3ZLYRZbsFTw0CmWrvbP
	TKxFjNJWPCEDkjQE3zXGtq5QMe4a29Hnszm2vyrd77EtZnMUEWxPuHrO
X-Gm-Gg: AR+sD10jFQvilnntwM4Ik8+6tWohlrs3AzzjqSLjbf2IadrmdVXAWLOV6dctFXXOBte
	iFlUAY+A35vx7uKeWzTCseV00DJaqSBYcTCDte/Ngt8tgQOl9sgyNf67dBJW9G3fY3abeG9V9og
	wPvbKOlIMB9fc59EaWnZ4S+K1bQmjyjsIeaAIm7wHYgf6arU9V6BmtGq0HJrwxwkHZsbT85ESjT
	tTuld/CXU8v4tbsZk6Cg26AAIr/2hcudmZA6Y/5ncvBWQ/vygmXousZV66flNc/WeFP6zPv/hUg
	EdydzlYVODIpP+EJEaNgeVrs/5cgaYcFBttI0BC5noaDjcn32gTF75M2O7XB8yxb3cj7+1g5hja
	KEjBfyk0OIY+7iqFs8d9/WVV1x1L3m0eOdCOV4IYZKf90FezMy7LN9sFiwiKsEF82gKjfIk55fx
	nJFiBiuaUHA9ZBJasZCe8kGJTYStcEvJgVjBLLl14SJOfM6lp2L7P0DqRZUf+RaeraA7U4PYjgZ
	p59CS81KqqPpOVlVOjX
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr126123935ad.11.1787161427501;
        Wed, 19 Aug 2026 10:43:47 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e81sm30466825ad.1.2026.08.19.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:43:47 -0700 (PDT)
Date: Thu, 20 Aug 2026 02:43:43 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
Message-ID: <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
 <20260819101853.44681-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819101853.44681-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104348_538221_DD7E1AA0 
X-CRM114-Status: GOOD (  12.99  )
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

Hi,

I noticed that my Signed-off-by is still present on this patch in v4.

On Wed, Aug 19, 2026 at 12:16:24PM +0200, Luca Leonardo Scorcia wrote:
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sorry for confusing you with the v3 patch discussion. As discussed in
v3, my Signed-off-by should not be included in the sign-off chain.

Please drop my Signed-off-by from this patch.

> --- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>

By the way, this header is not used by any part of mt6589.dtsi,
so I think this line can simply be dropped.

Best regards,
Akari

