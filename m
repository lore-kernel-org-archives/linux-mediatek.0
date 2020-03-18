Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FD9C4332B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 22:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE5720772
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 22:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kIGv2hiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE5720772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8n+3AGFqam9IxpyKftjfUKO1KxCSTY6QDbddiRvfp98=; b=kIGv2hiX9Hg4Q5
	SelpuJZEGwiPQhd8zVzuj69tiN/480qPkjVrNf/XOiT0p7BqxzbJV8jgzhF62ts3erOK2swK48Prl
	cJ1c64SahvkXNfQRgrhv/Ti32YYZ8PzZsaL1UPwTcEPaqUAy5j/+hfimU5P8NRvlIlXUP7y5eCY0Z
	xAi63Qa7F3dKUObj72LduXXscZHfI8FajPRTgceWPjdXQVazr3Z7aazs6XEei4XmH9oJivNcYwFIF
	WXVd3yBW0eRLxN1SxxISymgyU0Ei0mi0W/y2pwFLs8z0V7y2Th+8/1r9tEvkD9EmQqMWVJ5RDDR9O
	jznZEPxLtisZ8/LQbX2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEhKr-00056P-6L; Wed, 18 Mar 2020 22:38:49 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEhKo-00055u-3S
 for linux-mediatek@lists.infradead.org; Wed, 18 Mar 2020 22:38:47 +0000
Received: by mail-io1-f65.google.com with SMTP id q9so265596iod.4
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2020 15:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hjd4cWdqxb7vqLIGudSEI03tN+skbBZc4IaGVCWe4bE=;
 b=VNf9ffoQUVP2JQ1wsOufjqzmbi030xQKPbrB4yw4jelr5f/hbjM/9awm+YEHymYGjO
 2qrSh2yHWHsYYTeAlU9YDxemC+0U0V3FlkP1JN8fQCCDpTUXFBTUepZys/bKY+/UHhju
 H23spAuzF6DmTgRd55IpBr3kvs5Yn5yhPDMhjOsYLCiZyTBJx3P8WypVOowK3UWsPTJB
 aqjfkXrPOQIUf3jm5ahO8SnPCLuP+41nRbN7tFeLjH+uKt5XxntizHZBVABPdY1U9MjI
 2scOk/rRowxMfDKdK81LNet3ZOCVhMsmfob1UenaB6S/wcRqqALGduB+/0lfUZNWjHL4
 0R3A==
X-Gm-Message-State: ANhLgQ1+bjZI9lB3GcL0g5iLar3xvkT6impBFVOS95o25Sqi/lpD1kVN
 OEy1pPqthPR8rLulIfclFw==
X-Google-Smtp-Source: ADFU+vuWOZ5C5oLxE9dB/U/jglteCOUaH90nZHmvZdWYJLWdri0o66f9VabHUrjNFihG7WzqU2uzrA==
X-Received: by 2002:a5d:958f:: with SMTP id a15mr70087ioo.170.1584571125436;
 Wed, 18 Mar 2020 15:38:45 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h29sm96397ili.19.2020.03.18.15.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 15:38:44 -0700 (PDT)
Received: (nullmailer pid 31930 invoked by uid 1000);
 Wed, 18 Mar 2020 22:38:42 -0000
Date: Wed, 18 Mar 2020 16:38:42 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200318223842.GA31707@bogus>
References: <1584454007-2115-1-git-send-email-hanks.chen@mediatek.com>
 <1584454007-2115-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584454007-2115-2-git-send-email-hanks.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_153846_146220_57EC7B07 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 17 Mar 2020 22:06:42 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Change-Id: I92586369564948f2628f70421bcd70668f132c4f
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  208 ++++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml: ignoring, error parsing file
Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml:  while parsing a block collection
  in "<unicode string>", line 28, column 5
did not find expected '-' indicator
  in "<unicode string>", line 29, column 5
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts] Error 1
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1256429
Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
