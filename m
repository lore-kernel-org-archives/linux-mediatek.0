Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189ACC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/kVlD6bPMIhAnTmJOpXvdq/gKa5VtB/wWiI4P7LYBg=; b=f6trcjfoLI8vua
	k7FbGFBkE2PU1NzVUp2ST0erUuykgwsfLpn8037/zRXx+tAZsdub3vBqlXFkn8qw9Y9/cwDAAx8cy
	XVklOO142mTYpjIcyUELNgx2UsUTkPUl7ixT3wi82ZWHJXxlUDXGHWB13yAu+IqfVvK9YStd2dd7l
	23INzJrsJIrykuv/sUuOK7lEvj1qwifDEEXH18sEnsHsWLMSPdTMaIiw1pBXJJaN7x+/iQzvUVxfM
	9SO20wUc5lRoyHXNG5RZgg4mM0tdaNYSDXlXOrotjI8uOA35hgLC1EC74kaBHDzROUJYwjhhiYlg7
	hlRe8ojPJZxnx+XtyHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZKpZ-00DhCj-HX; Tue, 29 Mar 2022 23:00:53 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZKpW-00DhAl-Gl; Tue, 29 Mar 2022 23:00:52 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 p34-20020a4a95e5000000b003248d73d460so3324809ooi.1; 
 Tue, 29 Mar 2022 16:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ufsH4kPmkwYwUY4XrUsn1zP4xDV7A/GblHEkZpfic4=;
 b=s6p/I8YJg+XI16/krrra1HeZrDTPpl+tRW8LS4hbfKVWqdZ3HLQ3HFfgYpBzhLQHk8
 wfNPOF90jpoc+UG2tKiIUqLFFysH6Lig5fzOBHUAknQneiL5PkTGP6WsO5r41QURurzk
 zit3t8XZVvsH5EX1/oa7zgAOh1RIA9JDn1DyCYJMsvtdWa1ctjlLIvAZEVLhzTB6IIdf
 VO2y7mQ+esQDWJ+NLIF16vw/1OHqfWJzUbykkuXooZvwyioxlXE6xDlTSxJCebffJArT
 /TyizwAlLJySgaPt6MPpCXNLaM03y8O3eF8H/9AhkHLxVwiqSZ7wR7HVAT/q0YAJe499
 rrWg==
X-Gm-Message-State: AOAM530BEhJkgVVqU8IyFY3dCNwKXVg8GzsBfb10xnZjcM1vokC0WN13
 1sATMrwsQatlwr49mCjYcw==
X-Google-Smtp-Source: ABdhPJy7C1m1dEvCRktWVO5I/Fo2UO/XKIY/6vOY1H7aF/ef2qykqq61ZyIH386G0Fd71hfq7+6S8w==
X-Received: by 2002:a4a:2f0f:0:b0:320:f7cd:58d2 with SMTP id
 p15-20020a4a2f0f000000b00320f7cd58d2mr1912170oop.85.1648594849162; 
 Tue, 29 Mar 2022 16:00:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m17-20020a0568301e7100b005b256697d7csm9487340otr.72.2022.03.29.16.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:48 -0700 (PDT)
Received: (nullmailer pid 1509915 invoked by uid 1000);
 Tue, 29 Mar 2022 23:00:46 -0000
Date: Tue, 29 Mar 2022 18:00:46 -0500
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Tian Tao <tiantao6@hisilicon.com>, Satya Tangirala <satyat@google.com>,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mediatek@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 angelogioacchino.delregno@collabora.com,
 Chaotian Jing <chaotian.jing@mediatek.com>, devicetree@vger.kernel.org,
 Yue Hu <huyue2@yulong.com>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Stephen Boyd <swboyd@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v9 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Message-ID: <YkOPnkFz2DDx7Qr0@robh.at.kernel.org>
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-2-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329032913.8750-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_160050_577561_432C9B05 
X-CRM114-Status: GOOD (  11.52  )
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

On Tue, 29 Mar 2022 11:29:11 +0800, Axe Yang wrote:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml         | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
