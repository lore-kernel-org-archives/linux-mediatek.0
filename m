Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2070AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 03:09:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E048C61074
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 03:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E048C61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTp3o6omLXgclidIL/NyDxLTgeYUQfWa7ZIi0yI2Pic=; b=tRGMcMuHpWjll1
	F2fYg8FO51TvqjA72IC5k8FbVslZqZX8jIhb4fj7g2LD7ph8r/CxsqHnPX6d7z+a27jZf21m6k2qR
	aUbtkEoY99O1gqIQXlED+JhSxw0uqHUsLYiuc+3d0VyY1eiUVPl7VgIGudl79jKMNENYZWktv4IPB
	LU2ECRR0Pa0z2gdEOWE9wZJIX0uLt5UkgdzwXjaUziDH+rVrCoIghmhTgfgcVdLt35T/0wvlDVmYl
	WTtDDcuapkSIg5Rmfo9b22pB/dtMZ1Nm3U4hZJ4XF12RrbV6tHj7QtHAS4b4qnZsJaPl5MCXMYDtY
	Rbjm+phNq0jwtwxmtAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfZJw-003iVM-K3; Wed, 27 Oct 2021 03:09:44 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfZJk-003iTO-Dq; Wed, 27 Oct 2021 03:09:33 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 k11-20020a4aa5cb000000b002b73749f3cdso457308oom.4; 
 Tue, 26 Oct 2021 20:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fF9QXgLzosjL4TM7VadwMeUj8EchUoSjjtX4csjl1rU=;
 b=hBL1FbNgssex4YxLSCjP1zEMNtqdiM8BUsO2wgXeULzUmy2rzJlAFe/krbhTBLM3ZJ
 ysCqFUYgptwRrgYcmSdp1BDBm2T/tQdXRyfUUKuK38bJiSvnUpeA85kjntmJSiEvD9Ym
 XKG8ZtcxxlGADFhKpd2IBEwpkGt+9e8uauNoR+mup1abVM7RhJRxQRP5qjbVSS7PVprU
 CGrUO+plHyZexf9F6jB7FdrPpw0pQLIifHqi2zbXpq7sBwP55/CC57NmXIP/96v6qTQ7
 buji3X8wbPP9O9ATnPdXohCLCkvEUY/JLYC6rWCyZQ0OQHFuPOJLe0O3UmHZLbcg59/x
 2R6g==
X-Gm-Message-State: AOAM533ObPS3BbcFqu5tragm3cTWaQAnr0FUxyA5KPSYftl3G28tVK97
 OQtWCsBgWj9j1mlLFJnSyw==
X-Google-Smtp-Source: ABdhPJzP41q/WyN+8LLe8tlwuSoBpsMFovkHFy5Yho2Qv71qtpA7ktzQadUc9hIiXylOeSIXG44skQ==
X-Received: by 2002:a4a:b307:: with SMTP id m7mr4884736ooo.83.1635304171532;
 Tue, 26 Oct 2021 20:09:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j6sm4395944oot.18.2021.10.26.20.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 20:09:30 -0700 (PDT)
Received: (nullmailer pid 3941875 invoked by uid 1000);
 Wed, 27 Oct 2021 03:09:29 -0000
Date: Tue, 26 Oct 2021 22:09:29 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 khilman@baylibre.com, linux-mediatek@lists.infradead.org, fparent@baylibre.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: mediatek: Add mt8365
Message-ID: <YXjC6VkMSrOECEEu@robh.at.kernel.org>
References: <20211019093404.1913357-1-msp@baylibre.com>
 <20211019093404.1913357-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019093404.1913357-2-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_200932_492092_6AA45B40 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, 19 Oct 2021 11:34:01 +0200, Markus Schneider-Pargmann wrote:
> This unit is present on the mt8365 SoC as well. But there is a
> difference in the usage of an apmixed register.
> 
> This patch adds a distinct mt8365 to the list of compatibles.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
