Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC3DC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:35:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593142064B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dC3gtbJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593142064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FZEZfd0I0DBdUXJ816owWhI6GRtZH8NfDN9nLcH5Yyk=; b=dC3gtbJIXFeEL7vRJ96ikGO4G
	w0YLg1XbN+/0KyAUquSIsf9wDpAHvkzuR8Fbevk8aS1DkZAUo6pS7ng9pLXfpUbNY5KMosq84AkSH
	DyZyp8wNWs/J4+/GwqLY4tN1EqAQ8EMZNXLuYyqh4kF/48BinAmfNhJ9P6z8mdAVBmMI0MFLIpHQb
	RjaQimS5dGpMbdTqXdbOdT317DPvFre+t7AjTqfrbs0jl5YHVxA92RgQcf1Jjpc6A0+JhQvWCDOqW
	E7IpDENpkQYqyCUtQLT2CSTXXoG9Qmcbq4u08U1/3+jFelL+VYHZm27M2ISI+D+6fBixudwZEhHvN
	thwo3gI4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvReI-0006xQ-Uv; Tue, 14 Jul 2020 20:35:34 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvReG-0006wS-Jt; Tue, 14 Jul 2020 20:35:33 +0000
Received: by mail-il1-f193.google.com with SMTP id o3so15346930ilo.12;
 Tue, 14 Jul 2020 13:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dGBfIif028yRfOAIF7nvieaHolrVE+/bJyTO1qa47oM=;
 b=tUN3ROySV3JFED2j9USuEAriQLV8830CDflIx1NaG75ELDmaibIEU3o/Ko1oJ8EQop
 LvexSOvtkrcaVElGGicLRu7DjPGS84RbTczDRXFrf87121CSWu2F7Yv/5pCGPWgj4gre
 2ZutAojmwYzqSg2MMn0dK++br+ZOWbOIjUo8ttq5U7sAvv3PgOCNwDr3x5lJ0VyPkvs1
 ynjq5tD1qJkz5hd2g11igwxmtHVYLlJpSB4SUYFgqw9zpGGAAs2OWLc2Jt2Ec73Y6TwO
 u9rDDXOyRgDcHyQB4EDFpT8tZbcbyBYQ45HFMjDd6T6Ae2BnBFVy0ViuVmo7yGeZ7GS8
 6AwA==
X-Gm-Message-State: AOAM532xMUOJ6MXn6GjInRlU5QrrSmEGghmEfpsJIMPrTjLi+Kn9j2Rg
 vjNhz2/Rehcv+C052Sb8hw==
X-Google-Smtp-Source: ABdhPJybh/BzLaIPevAOuDihB4bRZa7+AeUmETXLadjPPMl4jbfYYXujNZQry7Wa4saZu0z0T+vYag==
X-Received: by 2002:a92:d308:: with SMTP id x8mr6288332ila.3.1594758931658;
 Tue, 14 Jul 2020 13:35:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q4sm23374ils.11.2020.07.14.13.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:35:31 -0700 (PDT)
Received: (nullmailer pid 2875322 invoked by uid 1000);
 Tue, 14 Jul 2020 20:35:30 -0000
Date: Tue, 14 Jul 2020 14:35:30 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v8 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200714203530.GA2875265@bogus>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-3-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594718402-20813-3-git-send-email-hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_163532_716915_D086439D 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2020 17:19:57 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 203 ++++++++++++++++++
>  1 file changed, 203 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
