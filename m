Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81456C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Feb 2022 22:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMTqCaa+ru6aHKWwgD/8N4XFIp4P2kAO9te2ZVKrjS4=; b=4S4p1QWw2Ad8eq
	+bZ6Ruhl3S1oEiUstixVKLAUYLZ3EwZZib651rBRBkVNVKKV62XmagKFOCQMUVuVpU5c98tziksg4
	A2zhDaMQlE61caCEq21t1H53ZZH1ImT2fTzClIfJPQcEQ+nt9IOZ8fPxCmM5wxQw4aokAK7IrMVEu
	TrARtK9tMJYPzKbUSzVGaxjno1F96r2xsd220syQb61SagxU9qZS2+fgOgMUnMbnvNU2jUmMISXOD
	UaBxXwHXxF+3+t9HbwJrBr8yA7CYic2VMVVzp4WdnOTkQjsUKdHsAwb6ibs8QvnGRGO32K5kuITYF
	FA0TdS8pGFYcfl3zjacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG6xg-005Yvr-UP; Fri, 04 Feb 2022 22:21:48 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG6xc-005YuE-N5; Fri, 04 Feb 2022 22:21:45 +0000
Received: by mail-oo1-f48.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so6200616ooq.10; 
 Fri, 04 Feb 2022 14:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VSSqlk1OwbpfMCFflvyzMx5ImvnYHmqQIDxXeCyLZws=;
 b=4AwqRcyeXx5kacpzVVbVBkEgc5KVhkx0zxTK45wxsUzrzbdfbx6IT/Bda/hW0SrLCW
 v3RW9vmmbl/lXpLM5VbpWjUmPRosEO82WanCo76N/eIavOHpT1pF1XvZpddP7252HPW4
 hvelvT45PmOLOtSe1Ib3zzjJ3nksgdfjcPyERqtyfx0LqC9VZyQPCYs9SLGXeAtC5vab
 6XRqRa/oylnAFLEPsxRTYU7nZdtMMOi0vPB4KzvvHYdvIdRxOmc2goIGFcOycP2qlulH
 Kqn9YwItaI+LlsB6tYOwBW9EbNtXEFH4XxaV++LQn8cyM7vW8EOpWKnj7kLjrU+/n8Jc
 fF9Q==
X-Gm-Message-State: AOAM5305YVqszd78nfK3hQ55qSU4fItRaM7VMsoHIEuw5p5L3THYtJfk
 dP8EjXjOW2WuhVIGoOuCjQ==
X-Google-Smtp-Source: ABdhPJzBiBKs5CGPfpkFRLuyyWzKtB05ObCQJbQKHDPTM77tzihcGsXN38Eqvb7S3cWiaJbAXwJdoQ==
X-Received: by 2002:a05:6870:a242:: with SMTP id
 g2mr1230497oai.305.1644013303426; 
 Fri, 04 Feb 2022 14:21:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a13sm1023373oan.11.2022.02.04.14.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:21:42 -0800 (PST)
Received: (nullmailer pid 3287001 invoked by uid 1000);
 Fri, 04 Feb 2022 22:21:41 -0000
Date: Fri, 4 Feb 2022 16:21:41 -0600
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>, linux-arm-kernel@lists.infradead.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Lucas Stach <dev@lynxeye.de>, Yue Hu <huyue2@yulong.com>,
 angelogioacchino.delregno@collabora.com, Satya Tangirala <satyat@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: add cap-sdio-async-irq flag
Message-ID: <Yf2m9Y0DAo3rVlyR@robh.at.kernel.org>
References: <20220121071942.11601-1-axe.yang@mediatek.com>
 <20220121071942.11601-2-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121071942.11601-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_142144_779019_C64B8539 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, 21 Jan 2022 15:19:40 +0800, Axe Yang wrote:
> Asynchronous interrupt is a mechanism that allow SDIO devices alarm
> interrupt when host stop providing clock to card. Add a DT flag to
> enable this feature if it is supported by SDIO card.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
