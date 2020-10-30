Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662CBC00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 19:17:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11E320739
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 19:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdI1CHkq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11E320739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UFjLQEwK2lmKMlpeuKoyMlGkw409ycy+G/gq3PdXyCk=; b=NdI1CHkqv2txAydKS4xkpDLfN
	6eewAoL/6AarxeXxbXbR06B9QGu2KUmznLmWLQKH+apiQBWhswRZNLiWz+kxyQD/hX0WxFa/yzpq/
	M14av2o1A7/ZQQqFTmWT9OK6HtSGl+su+yNrcTJSKRzBMNM67tI1Tgn/1ulxUZe7mwOOo6G1tG6VW
	WH/KaplAKkhe7chQjgHPsGAj+9FHbMpVChHFtw/Hcl2VyO7GpM8UNT7JcEenP495UxiXuKTJLSI8b
	jmS2ANqGUm3b+6DHAJ0RJKxHYDV+266+6eGMwkpVbpbpcuSpAHaLTAyg6cDYD84z4KET3cCLlLsT8
	Gd63e6VvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZtn-0002LL-E3; Fri, 30 Oct 2020 19:17:19 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZtk-0002Kh-WF; Fri, 30 Oct 2020 19:17:17 +0000
Received: by mail-ot1-f68.google.com with SMTP id j21so6504209ota.13;
 Fri, 30 Oct 2020 12:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nxrkk9Iv2AWHaT0WKNIzblJXKtrPRJSPWGObFgk4jlk=;
 b=LnDd6pIvYbO4KwSrvM66xIY2l/tb3rgOVxKZsfQaIpTN5GdvrTXhIxnR8GLSBfXjux
 aK2iHntAB8nON+fCz4oU6zBqn4A0i0IIHGBHBkXg3w4w0zYmu/St5PyOoFYDz61zTK4v
 8KSLMHHyl1IB+LPOtcQxuyHabC1CC5jnPj8fW+DkyNhDJ66iSKXqCKXoCCmmL6LZgOc6
 XWr+jweJuGkQ/lAUVYWtgVZZcs+x9Qs646Mk89v0Xvu6j9LCXnQr7ycvIq8YlHe11eXd
 IdyI5Kr58cNJqRMwNGjBenmXFFUkFvflZyNKjCFEXRLtuEySgi/91YoqfgsKJUmUP1vW
 ee1A==
X-Gm-Message-State: AOAM533HVDbHLU8ZJnHtSoCCuppN99C2T9MyoCFcT94ntOX25D9UhoAE
 f64dcFKC1kAYMOGgkJbjRA==
X-Google-Smtp-Source: ABdhPJygQrcQk8DOYwH2JCmsyvPO4Db+UAz26pVxZPE6H/WdMPDJmz4K5Wf5ocx97hzjSEuCVTz6xw==
X-Received: by 2002:a9d:da7:: with SMTP id 36mr2891601ots.288.1604085436239;
 Fri, 30 Oct 2020 12:17:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w25sm1437531otq.58.2020.10.30.12.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 12:17:15 -0700 (PDT)
Received: (nullmailer pid 4171668 invoked by uid 1000);
 Fri, 30 Oct 2020 19:17:14 -0000
Date: Fri, 30 Oct 2020 14:17:14 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
Message-ID: <20201030191714.GA4171611@bogus>
References: <20201027160631.608503-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027160631.608503-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_151717_040287_B6BB3EE4 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 27 Oct 2020 17:06:29 +0100, Fabien Parent wrote:
> Add binding documentation for MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
