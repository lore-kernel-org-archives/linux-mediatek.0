Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CB9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 05:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+SzzZGGCrVaqygz6i5gQwvLdnzMj887i9+5Ms/mJ2M=; b=1K68HdzLFqBiRv
	dqb/f/RbQHjzxj/EusEkYheiZRh8GjUwAyekO7eJXxpsJn/JOwbEBr/XKy2/hmcr4iq09UZJp2d1j
	IqfVls51oORA26qHo0QwDVEYPXITj4MfriclSPHmk/CCHyane7i2VBdpLfbG1KJDrWGJ9x6LwZaL+
	trq0JlXzHlbP6koi0Aj8niFfS2Ay1JAkkMjlCPTLAWRRZUEWLh+g3OR10CufRFyUdu/xipiaItW/9
	wnTudHtlW9T8nb9r+cFpC3dL5V3Dt41/o6B8FCMxroH7ly1IQEE2Lf6g9kf75ILy6xQiy0WOn95sU
	9pSola4nEsqk9mwIEA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxiuu-003ZzD-Q5; Thu, 16 Dec 2021 05:02:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxiut-003ZyD-0i
 for linux-mediatek@lists.infradead.org; Thu, 16 Dec 2021 05:02:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id k26so22601481pfp.10
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Dec 2021 21:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pfDndh5e7Tg9q69/YQCj2DgRuK6iAt8tciGnd8xjSmI=;
 b=mQ60iAZHmviFhEZtFnaYnuwg7xBPRGJJ8/24Gz5sxtDAv4ZjLaJWmxB+KO0MAA13tO
 Qd1nmvYJFU8zT5YOa1qI7rWVU4gKTR3/dJHiPA7L7fdo2Wjfu2vHT7klLTbcde6k8HVX
 2009CeKdaus3+e1oCfWW3eZDD1BwKTMVXB3+foDdqUGH+nbAyjyQbo5I7KliLtVRCRkA
 +Cn8geXx9lHF5vZv6SepQssTvui2xIxZSOEU4EFH+kg+7OfgAROubebzmmfGsOQo/hSq
 ivD92P1tFRDCCukstrweUvb/gdLH3WJ0jK/fA990hefh/eT/yV6CSscXz3DBV0Qnc+OW
 Asaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pfDndh5e7Tg9q69/YQCj2DgRuK6iAt8tciGnd8xjSmI=;
 b=nJ+3aSAvJPo9fKDGWGUkjXBl9ml31u3CwHj9+aFzT/PTze0Ya1v+4GI6WnyzPyKJ9G
 aprifjuXHdSENuhOl4Z4dg0j+GaBSZS+hEnKrKHoeObiGUVGL7hYEFbprzR3sWznIbp/
 C5jdPDadZkJ6xZHvf9FWbTNqROCiwHUrnH97zxdYPz4xGsx4mA3t4jyckFtHrgxHnDrs
 uzdoAdNZ1AzPUrvUzHJ5F7WNKK2zYNQvGSmHGerrL8pxR7N6fbvG+c6LV5SksNkVUXXg
 f46ktq/m1CRxmRZlM6WpnOpS1xqw4BbE8Y9TNsJMIjjV9x+FAuwbU2okam6qj5TYIpwZ
 w98A==
X-Gm-Message-State: AOAM530iqIzyF2OEzWw4kTnHUTSTBFQluDJmY8O98DKfz+TkyoaDdBse
 qN5Yt++N9M075UiBfRG2/+68HH7eW7+GYg==
X-Google-Smtp-Source: ABdhPJwVq8Jr3aN71SKClzCOk34eBWZvVcMoOmFxHXjyNBwML3uULOKbn6p3eon3jHFwIvPuypS/8w==
X-Received: by 2002:a63:5a18:: with SMTP id o24mr10519774pgb.459.1639630970703; 
 Wed, 15 Dec 2021 21:02:50 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:af33:9cc2:c307:ce8c])
 by smtp.gmail.com with ESMTPSA id j22sm4599968pfj.130.2021.12.15.21.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 21:02:50 -0800 (PST)
Date: Thu, 16 Dec 2021 13:02:47 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jiaxin.yu@mediatek.com, shumingf@realtek.com
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-ID: <YbrId5gnJSjeT1Ni@google.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <YbmlT+OSwpGuylsx@google.com>
 <0b99c46f84c98c56e8fc99b2e103f52f756b5bf9.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b99c46f84c98c56e8fc99b2e103f52f756b5bf9.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_210255_085238_9F64C6F0 
X-CRM114-Status: GOOD (  15.79  )
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

On Thu, Dec 16, 2021 at 11:37:34AM +0800, Trevor Wu wrote:
> On Wed, 2021-12-15 at 16:20 +0800, Tzung-Bi Shih wrote:
> > On Wed, Dec 15, 2021 at 02:58:34PM +0800, Trevor Wu wrote:
> > > @@ -1072,6 +1119,19 @@ static int
> > > mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> > > +	if (IS_ERR(priv->i2so1_mclk)) {
> > > +		ret = PTR_ERR(priv->i2so1_mclk);
> > > +		if (ret == -ENOENT) {
> > > +			dev_dbg(&pdev->dev,
> > > +				"Failed to get i2so1_mclk, defer
> > > probe\n");
> > > +			return -EPROBE_DEFER;
> > > +		}
> > 
> > Does devm_clk_get_optional() could make the block more concise?
> 
> Even though we use devm_clk_get_optional, we still have to handle the
> (-ENOENT) case in probe function. In my opinion, original
> implementation could be kept.

I am neutral to my original suggestion but devm_clk_get_optional() returns NULL if -ENONENT.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
