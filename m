Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAE3C2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 20:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=; b=uW49VPsjzHE+ANItr2B0exh/G8
	a6gKTmEDbRLclv/LFcpA1GnjrIFJbd7vWIys7nzJ6hWYnHeS7RpaXhzSrvE37/9LVHw2F4NBXFAVW
	vM2kQEVcMMwKp6sSYjunv5huH78LMYl6SzwRY1fdkX7gTEvV4jCuznoEj4K6L2E36HklA39WPK0ZF
	afmULdqTIUD+FOe3ji9vRiKCV+lClag3uX4swpjFe9rCHY5Xbb34bl6Eu8vBsYCntsqiCmJbIDa4M
	CwDVKI3ui4Gyn0Hd6Wp/kEU8TheSUboUyfaWpsPXameBAMd1UmKFHX0zUo+k6XnRfeQ7S7SG0kvhr
	xVfGH61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRV8-00000008jlo-1CpJ;
	Fri, 07 Aug 2026 20:49:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRV5-00000008jl0-3MIk
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 20:49:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47362928f65so3162037f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786135746; x=1786740546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=;
        b=HXJ9+YJPXIxNCrYuKS3Q7+b5ZcALmZzJwlRzKLujF2c2we+pHVwSveNulM8Wv3AjWS
         6xPFUyfhXNd0yDGoKV9hmRX5b4OSgt1W2S58IuGa+hriexUcAA+l2ZBJ3aReW4+NiWwZ
         sBy8ePYgTJ8jF5wuvGZCENAKfrEWecV8QZHOvIGAjPkNIDUzhS2XTXIlPq60OFOtJ1g5
         x6JTcoRS4XzzF3UmF5DigGMtPzdzbmd/Ck2hCGo7WOF6dhGo0fjzXZVe9Dp1fPT2hia6
         hv8UKFK1/uHLCYxdlqdFkRhfn7gaGHD4JstXLIleKolpbvODQ07fAEbF0Jsn2YeUZORf
         hyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786135746; x=1786740546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=;
        b=hh65VkCKGvsLKWgmgcth+FSCRsPb41Y6NnHiqyBWo/vcDqVt0EOxgJojhPoC0vrGe3
         UZqtEzGLS9O7Jq896jE15vH7u6f5GT7RcBCzgykXFjpBYfhb+k/zvv+xfJEgw/KNQ45F
         SfAOX5r6SUJVVrKieChTMPMdxN1+C4DcS8FFRFuxvUUmTatWakbkzXbmb4PJeu0Lc3+6
         8vNMUChD7zxXboYPROKgWQVOLRLHUHf8gPHkkkUJzc27tLl+HR7CdfatgonHUrDAS8tz
         Ez5JUKYUOui4nhBDRnfOPvK9iaXDKn+9q6rONal7vtqb9hRCjRL/uAZAQEBshilaI9rb
         VADw==
X-Forwarded-Encrypted: i=1; AHgh+RrMWdhNu/bSoT1oYXGnLvnp9zdmZFF/upUy0AGzMvsXRs31AH0+qAnnEzfCQGKZBIfqKGRwcyT4QkSsPqKMLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlwfj1Pv90jAgBfR1XyUk4Rorgd7+Z4OWzZFKjj3ir/JLYWF/J
	8lo17lxHZ7owASGilo2hLG4rcXa+xQfEnCT1sOY2gDX4/5GsHsb99ZaX
X-Gm-Gg: AR+sD12RXnqIj/dCqYIzF1A5YV0UbXzFPTz4CtGHwyJSgpGKJ6ONmQCKA9dlIrlnDXj
	Ra5tdl4jLjaogIlXVYJ5gewSrcNlnLm/K84ZJ1HzOop8DZ1zAN991SruSWrKsIlLVGizl6AZja6
	Z9xZXASSMHZeFOEPkOLvJ4sT8608Ocr751ExlSP32L2LP6PXW6nC4jCEtAIzGvKo/DvxixfM30v
	O2F4qnL+GwwrqZ8wpGFClBiJRd0HyL/6j8+Lj/QkaUwQlxi3Qxg4m1fMyyr7IA3ZH2D1rKV2/AG
	WSmprQU4OdhmoSYO4mQY9lWc8mnB8cA45/L6/vk6V/6uQMfa4xykXJlb597e8mhloWnljdNxKjG
	32agpSuHl/vZH821xIdy45mRXTHgzRwzR83F1Qf/+J+10qM7sv8SHJ9V86Xip9Z0Ft7IG91Sj+6
	cYKNSvnlS/X8kWB9jkaKRi3iZDyIrv1NFQdyKzODaYp/HM+a0wy9YNuP8yCbG8orqvHwUiKK9dK
	QoezCa984zvRsNc2scNDbnfuZreI1Vt/RhG
X-Received: by 2002:a05:6000:41fa:b0:47f:fa17:ae0e with SMTP id ffacd0b85a97d-47ffa17ae68mr22949317f8f.11.1786135745578;
        Fri, 07 Aug 2026 13:49:05 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm9756544f8f.23.2026.08.07.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:49:05 -0700 (PDT)
Message-ID: <6a7644c1.df882948.3a7741.2280@mx.google.com>
X-Google-Original-Message-ID: <anZEvaEjN5i9h5ww@Ansuel-XPS.>
Date: Fri, 7 Aug 2026 22:49:01 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v11 03/12] net: pcs: implement Firmware node
 support for PCS driver
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-4-ansuelsmth@gmail.com>
 <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_134907_869230_57FADD9D 
X-CRM114-Status: GOOD (  28.27  )
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

On Fri, Aug 07, 2026 at 01:29:41PM -0700, Randy Dunlap wrote:
> Hi--
> 
> On 8/7/26 6:12 AM, Christian Marangi wrote:
> > Implement the foundation of Firmware node support for PCS driver.
> > 
> 
> > 
> > Co-developed-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/pcs/Kconfig          |   6 +
> >  drivers/net/pcs/Makefile         |   1 +
> >  drivers/net/pcs/pcs.c            | 240 +++++++++++++++++++++++++++++++
> >  include/linux/pcs/pcs-provider.h |  65 +++++++++
> >  include/linux/pcs/pcs.h          |  75 ++++++++++
> >  5 files changed, 387 insertions(+)
> >  create mode 100644 drivers/net/pcs/pcs.c
> >  create mode 100644 include/linux/pcs/pcs-provider.h
> >  create mode 100644 include/linux/pcs/pcs.h
> > 
> 
> 
> Please address these warnings:
> 
> WARNING: ../include/linux/pcs/pcs-provider.h:39 function parameter 'pp' not described in 'fwnode_pcs_del_provider'
> WARNING: ../include/linux/pcs/pcs-provider.h:39 Excess function parameter 'fwnode' description in 'fwnode_pcs_del_provider'
> WARNING: ../include/linux/pcs/pcs-provider.h:62 expecting prototype for fwnode_pcs_add_provider(). Prototype was for devm_fwnode_pcs_add_provider() instead
>

Yep, they slipped in the rework. I already fixed these, just waiting the
usual 24h.
 
> > diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
> > new file mode 100644
> > index 000000000000..5df48022bc6e
> > --- /dev/null
> > +++ b/include/linux/pcs/pcs-provider.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +#ifndef __LINUX_PCS_PROVIDER_H
> > +#define __LINUX_PCS_PROVIDER_H
> > +
> > +struct fwnode_pcs_provider;
> > +
> > +/**
> > + * fwnode_pcs_simple_get - Simple xlate function to retrieve PCS
> > + * @pcsspec: reference arguments
> > + * @data: Context data (assumed assigned to the single PCS)
> > + *
> > + * Returns: the PCS pointed by data.
> > + */
> > +struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
> > +					  void *data);
> > +
> > +/**
> > + * fwnode_pcs_add_provider - Registers a new PCS provider
> > + * @fwnode: Firmware node
> > + * @get: xlate function to retrieve the PCS
> > + * @data: Context data
> > + *
> > + * Register and add a new PCS provider to the global providers list
> > + * for the firmware node. The relevant PCS from the PCS provider
> > + * is retrieved from the passed xlate function.
> > + *
> > + * Returns: A pointer to the registered PCS provider on success, or
> > + * an ERR_PTR() encoded error code on failure.
> > + */
> > +struct fwnode_pcs_provider *
> > +fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> > +			struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> > +						   void *data),
> > +			void *data);
> > +
> > +/**
> > + * fwnode_pcs_del_provider - Removes a PCS provider
> > + * @fwnode: Firmware node
> > + */
> > +void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
> > +
> > +/**
> > + * fwnode_pcs_add_provider - Registers a new PCS provider
> > + * @dev: Device of the PCS provider
> > + * @fwnode: Firmware node
> > + * @get: xlate function to retrieve the PCS
> > + * @data: Context data
> > + *
> > + * Register and add a new PCS provider to the global providers list
> > + * for the firmware node. The relevant PCS from the PCS provider
> > + * is retrieved from the passed xlate function. While at that, it
> > + * also associates the device with the PCS provider using devres.
> > + * On driver detach, release function is invoked on the devres data,
> > + * then, devres data is freed.
> > + *
> > + * Returns: A pointer to the registered PCS provider on success, or
> > + * an ERR_PTR() encoded error code on failure.
> > + */
> > +struct fwnode_pcs_provider *
> > +devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
> > +			     struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> > +							void *data),
> > +			     void *data);
> > +
> > +#endif /* __LINUX_PCS_PROVIDER_H */
> 
> thanks.
> 
> -- 
> ~Randy
> 

-- 
	Ansuel

