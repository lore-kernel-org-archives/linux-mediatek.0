Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776E3C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 22:51:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218ED64DF5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 22:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 218ED64DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oNhy7NFIa+pSvR3iePZDpQzRdSGAqukCsZ/J+S4s3ik=; b=G1Th9tZOejb+Rz4JneHPHRF4G
	FoM48vTRlzzGG4Ja7DKW/DzzLah9JeR+5s0A3RI35MB9qoBPd5G8c8SocdEKXBtdX7uC2y8w1duJ5
	25HEIo2CkTHZ4fze8ReEhOPD75bIqDJCI1yO78VPkwBlTsJMSHbAOVckyHILtheILvIqmwBl9v7bl
	pCVr0iFSx8wuvx2pqMlyAZbokN5myn2pa8Qq4GZLD0168ThL6tjRHnchLr5pp20ehjZSuLjhlfs/j
	aYnQsF3OvHJuGMlNj/yoCTYoGmrz5UnMdvGP/RTRurbSd8EJy0YYs2E0fH2r4d45IUAULVJsy0upR
	+OK2lqK1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9brA-0003ie-Lx; Tue, 09 Feb 2021 22:51:40 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9br8-0003i1-Kh; Tue, 09 Feb 2021 22:51:39 +0000
Received: by mail-oi1-f173.google.com with SMTP id m7so21214231oiw.12;
 Tue, 09 Feb 2021 14:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gYxKP75LmIpzRSgUYVpjMw/sU2Fxi77FH3ZjQaBxftc=;
 b=Dlk1NUDRpdOXmiSIW2XbyPZdnWihEf+z3g6PTMnJvvYzn3/sb0CnbpyyZw3982u1X0
 KAMpWoCfaJMGxKOq4/0s/aHcyF+IYKlqINoXMdRb9fBlJXnh03+giLrUfF+HBf1fblzD
 81EGFjrlpj/xmT5Vo57MIuJSXUosgByhmdk5Q3TUyE7/RyvDAdjxnCxBjtZKog8dbYVS
 rU8XGuT8V5mOitWS9kftew7JEhOF6ndDH+Jor0AlJu91pUm7LEeH7sUFrX3aZwURynH1
 lsNZBXZzUQ6g+oR6EqtSbTiIH4PaYmzEQQNOUVPkz86xA3m5DVEJ42oOC6BgyJZyn+n7
 yO0g==
X-Gm-Message-State: AOAM531qWv3r+EdzdRyyotAPA/Sd4F0h0O/L2uXrmYJs6J3Qoo4Jj21E
 R2W9GhTasM/KceF1jeNfeQ==
X-Google-Smtp-Source: ABdhPJwrvMZfxWbpsM9XyfvegpZTNctZFmlC+br/cQVMXgoJbjSrAO3hMqspjmEgwRgCTu4EaLUXWQ==
X-Received: by 2002:aca:a914:: with SMTP id s20mr29215oie.33.1612911097993;
 Tue, 09 Feb 2021 14:51:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o14sm3831253otl.68.2021.02.09.14.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 14:51:37 -0800 (PST)
Received: (nullmailer pid 370189 invoked by uid 1000);
 Tue, 09 Feb 2021 22:51:35 -0000
Date: Tue, 9 Feb 2021 16:51:35 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control
 properties
Message-ID: <20210209225135.GA370159@robh.at.kernel.org>
References: <20210204125718.1646082-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_175138_743629_3BD72DF9 
X-CRM114-Status: GOOD (  12.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Shawn Guo <shawnguo@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Stefan Agner <stefan@agner.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 04 Feb 2021 13:57:18 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "pinctrl-*" properties should be grouped using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt    |  2 +-
>  .../devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt    |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt  |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt   |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt     |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-single.txt     | 10 +++++-----
>  .../devicetree/bindings/pinctrl/samsung-pinctrl.txt    |  2 +-
>  8 files changed, 13 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
