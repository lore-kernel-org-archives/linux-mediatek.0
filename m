Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CEDC43331
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 16:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC5120787
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 16:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1EA1sT8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC5120787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZbNI9sUbA9CGRGT52leAmDsnK83JGfdys+yM4R36l8=; b=G1EA1sT8eIuKRO
	kF1JgGvTIyrU3qSp1m38Z9Ij/SQP8m6pDq9j8jEsTiclw5oEXxaG+yZ5xQqFuPHTP4L3G9CSo9Jyk
	CNaZ3PPMsq8o7+1awoDfrgBlmgDS7/tn3/pmFbTafht3n2iagR7uP3iGqe54V9K6fCjHZmhcdXRbL
	Le5RuHaJv3cc2nex8BaCSQuliksSpLwVEUSI3Y9Iki/jiUtmRrMtbxJBiomsAeE48oGAipiE/y2oh
	L3OvkStmC65dsjL/8INNpwMz+GwytsRyvAeS7luXPMCtlMAbc82T3V3qLfMD9O1Sv4Y8CTdkLjnXa
	D4aa1vOEmw9O6KHT+Q6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVN4-0007Gr-Kl; Thu, 26 Mar 2020 16:28:42 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVN2-0007GM-Cb
 for linux-mediatek@lists.infradead.org; Thu, 26 Mar 2020 16:28:41 +0000
Received: by mail-il1-f194.google.com with SMTP id t11so5955896ils.1
 for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2020 09:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bVlPuJGOkEhy8wUjtWWTKaIM8+WWF/4LOBG59hrlu0Q=;
 b=bpqBtD/Q42PP8mJari+QrP2RRrhAVJFybGejTKZPW3jeuW4bvYpsoQgYzLwQKsuIsH
 fxzpbwx5HzXRfq/vk5+lCglLDUsV2YrmSi9JOie/Zu3KuZMifQPkFCHcfqfpmwMM7NwZ
 YU3MOWtf1WOClj3tpc4oNiY/hUAi9bWJVoA61BOLhOjvoO46GlhvfsPLngQwQ9yjk6xw
 3WSgJ8wEN3IWkhQbAUvj1jmEx+WpG4OI56LB0bdct2KyoMlfmRqqDIw+zWddeZVjvC01
 NH3BQ5keAPFsJfCB79P36XnzJA8/hbbf+J24nmz32tgs5V0GGThfqSsQKkPnbVqvCslG
 PkFw==
X-Gm-Message-State: ANhLgQ0bCZ8JyJvNCXCvXsS1yXtyhaGknmKM/qYWcSlLBwZApXpVWPy0
 F4r+PulLW/f6ssqovqd+vw==
X-Google-Smtp-Source: ADFU+vv9v63mvl8nbL3d+kPz17rDcePdFHGMay9b2YDWdFNR1yprO8F2JIv29ubqXRzM95IVux8Eig==
X-Received: by 2002:a92:8fcd:: with SMTP id r74mr9905848ilk.39.1585240118456; 
 Thu, 26 Mar 2020 09:28:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id o23sm972322ild.33.2020.03.26.09.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 09:28:36 -0700 (PDT)
Received: (nullmailer pid 2135 invoked by uid 1000);
 Thu, 26 Mar 2020 16:28:35 -0000
Date: Thu, 26 Mar 2020 10:28:35 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200326162835.GA1429@bogus>
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585128694-13881-2-git-send-email-hanks.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_092840_424731_FAD8F310 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

On Wed, 25 Mar 2020 17:31:29 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  208 ++++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt6779-pinfunc.h: No such file or directory
         #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1261248

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
