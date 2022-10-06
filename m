Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1828C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSeGwdd1h0eArxw0/Cs1IlyZ0sg0R0d0VuaW7/1/fjA=; b=PIQvzJMBj2AEClKaD4py/BrwV7
	yQZxsLeCyH0mFmNgWXaiiYq8ks07xV6VWJvkIQyXkGMJQnXgGOJ4g1ANGHKHOOgKm+pT6sqaWddfM
	d7Q/yKsnzyuDbJIpq9XEC1dlALAISNTDzvWTkU/bKxgfshk9WzLJeGTI0Ojx5IMFQmrPuK7NSGcJV
	fabIIPkllGeFY4reArSADtBRRTUsbG/pX994r++KQ30ifY8M6SGEnAAwG+is3PpyWfa14OP3Ulu6u
	IBKSCn5B7e0AaG9v7sEChto9q1SOTXAjuBtX3WRxyY0maAiqkscjBRXU6dUeaMfa4ErvijwpymBu7
	hkguaPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWL6-004fy6-6P; Thu, 06 Oct 2022 19:15:24 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWL3-004fwf-Sd; Thu, 06 Oct 2022 19:15:23 +0000
Received: by mail-oi1-f178.google.com with SMTP id g130so3088133oia.13;
        Thu, 06 Oct 2022 12:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSeGwdd1h0eArxw0/Cs1IlyZ0sg0R0d0VuaW7/1/fjA=;
        b=HBjOH1AGFVwlT4aIYPQg+gN/Qirn0f8I9TT2N1e/UiPoAD+GG27J7twplkqkMDfsgQ
         HaBE5W6xBEI0TEglTpuUl95rrOSCWJv7c4KK1xLx/tdJ+V0RUx/dHrCMYPDm9ouKyf70
         pgF/23T3V4jevidZ2lg32OMeufEBGSzwHXM5gDv7BRdZtY5LYtjqrnTNkWmU8P4ExADH
         /Gq/eaCsf0a5bM6vZ3LcgSGhVwGgxZBGBo/ZBDcRwUTPzK84hLWs7Y7w+lIgQ4f/CC0A
         b042g4yivU1UZ8HfXt9RrS6RJxB/hmQPFbJ3+LB4ZngwyU31yVM/c+u5xF1DLRLWCNl0
         Gk9A==
X-Gm-Message-State: ACrzQf1pQDZs9z6X8/DFFrVqCF44RCyzIXrI/Iji7itVaaNI2S+f9TFp
	X/toKjev1aS7pq8OTD59C9bBHPLlIw==
X-Google-Smtp-Source: AMsMyM6n/l5A3cpqNPJc5Pcf2MD5XwLNIlPtA8DpqPA07b3UMAXxD4ppfGl5DeEdEvKLl43AkzrxbQ==
X-Received: by 2002:a05:6808:1b85:b0:34d:8ce1:d5b0 with SMTP id cj5-20020a0568081b8500b0034d8ce1d5b0mr5662048oib.194.1665083719643;
        Thu, 06 Oct 2022 12:15:19 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id b130-20020aca3488000000b00353ef11d6c9sm2467oia.19.2022.10.06.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:15:19 -0700 (PDT)
Received: (nullmailer pid 46581 invoked by uid 1000);
	Thu, 06 Oct 2022 19:15:17 -0000
Date: Thu, 6 Oct 2022 14:15:17 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] arm64: dts: mediatek: mt6779: Remove syscon
 compatible from pin controller
Message-ID: <20221006191517.GA45995-robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_121521_946261_E9213A56 
X-CRM114-Status: GOOD (  15.61  )
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

On Wed, Oct 05, 2022 at 08:43:34PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Remove syscon compatible string from pin controller to follow
> DT bindings and pass checks. Adding the syscon compatible to
> the DT bindings documentation instead causes a different check
> error due to the syscon document specifying a maximum of 1 item
> in the reg property, while this has 9. Nothing is using the pin
> controller as a syscon at the moment so it should be a safe
> thing to do.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

