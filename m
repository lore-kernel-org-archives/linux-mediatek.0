Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA632C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 00:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svBiMu7ePrEjE8c5T26rK6uc47fXmHIbYkk7Z7EzSHc=; b=USS90e5NlaXcsJ
	R1ae8WAvV4cEd4eoV8y33qH+lYR+fmY0NKplpB92cS81Hu1u3FyZUdrezgjTz+hvLbbUtt2ISym9y
	4gzdMs1xqO01+QJiWLmOCxBP9yYjP3a4tWoMYtqD7MyqR4kB6ZweVwKpFEbQ8CY96tR2PrmAz3reg
	J+ba16IdujuILPZ3E4oUxiCkV5VGbR3JAu37pLHKNYskFzNUy81rKjDSDzfnXpyi04zFWZaQbq4XG
	xh9lY2uVuQZ5gJ0ftGeZjHHMJOMmjQjW54qBD4WNrSbVTtiOtWh6NmB1Y2brf8L0tkQqBVj/+TLYb
	Vu5iebnvsOAJHC7+9VTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHxNT-0027e2-QM; Thu, 10 Feb 2022 00:32:03 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHxNF-0027bQ-NP; Thu, 10 Feb 2022 00:31:51 +0000
Received: by mail-oi1-f174.google.com with SMTP id m10so4367219oie.2;
 Wed, 09 Feb 2022 16:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H+aB7MEEh65erIWPmlmykpbHBq+zpDiRSwvKXtfqf4Y=;
 b=h3heG+HPoz34bZTwrfR7zBXjLTK6JVpYM/e/jdOkn3o6j15+XFUxKCuOjfasQqf1Q6
 S5vye8XT8dYdDM1C6GXlxl3ckD7CuClFQ1QOiKTka7MpYRPXbUyXMN/1H+bsJ6wotJGP
 i3TJ1Q3WQUgA5Si2hzExM3x7lJ/KnQb4bUg9BF6UINGc/9D5mzti8bVVaLDGOMHW/plM
 yTwpYYvTIokjrgWuPUAryKQ6remOye0qBt4CJbPdI42HzI2EGOrXdIeqotIk6k/cLqJE
 wyt9QEMUHSQKUM8bkGBdxpUCY9YpYBexCo5zGrjIIWtn6TupQuWGjbWp2YPTiis5rl4K
 vcgw==
X-Gm-Message-State: AOAM530a39e1UNnxmBvN1La+L+2zN7EtjNa4v3sksBTtJ0P/4duxM3h2
 gcxY0rVuYmXCmVxux4UeeQ==
X-Google-Smtp-Source: ABdhPJyEseR1JkYMfiGodATxo9VXU0oluRqUhwbN59lnCsGWCuMw6s3B1TsytqnRqXVGNm5eIiUTnw==
X-Received: by 2002:a05:6808:168b:: with SMTP id
 bb11mr2221766oib.184.1644453108777; 
 Wed, 09 Feb 2022 16:31:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s3sm7743074ois.19.2022.02.09.16.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 16:31:47 -0800 (PST)
Received: (nullmailer pid 1260233 invoked by uid 1000);
 Thu, 10 Feb 2022 00:31:47 -0000
Date: Wed, 9 Feb 2022 18:31:47 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guodong Liu <guodong.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: fix bias-pull-{up,down}
 checks
Message-ID: <YgRc860w5Pj6RSlS@robh.at.kernel.org>
References: <20220202153528.707185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202153528.707185-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_163149_780567_4C8014A8 
X-CRM114-Status: GOOD (  12.63  )
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

On Wed, 02 Feb 2022 23:35:28 +0800, Chen-Yu Tsai wrote:
> When the constraints and description for bias-pull-{up,down} were added,
> the constraints were not indented correctly, resulting in them being
> parsed as part of the description. This effectively nullified their
> purpose.
> 
> Move the constraints out of the description block, make each description
> part of the same associative array as the enum its describing, and
> reindent them correctly so they take effect.
> 
> Also add "type: boolean" to the list of valid values. This corresponds
> to having bias-pull-{up,down} without any arguments.
> 
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 30 ++++++++++---------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
