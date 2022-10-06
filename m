Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F1AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 18:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdAt9/qLW5IR5INzlShOk7D7K7dX/WFEcR7pwh4Zg64=; b=F9Ogtxp4s114nSi3F0+tU8e5HC
	UWu86b3RJh9B94PLo9bHxf6uYsoadDEcRhWGblrGjMPpiC4qfKsmOQ982g+H3OFEios2FxsUPnMO5
	fIa5mXoS66Xvf+kSl94Qc1IfKck/+M7K++7eD+2tBZxKsJNSEVMqV+9fMeLGFj4R03QumHcvr77cJ
	Lm/Jxgv13JiumcP4Jr6BDllxSbIhdtWGdSwq/eVd6QAW/SImn3APATAnYnaqmeJEKwfSrR9zVYCPN
	lXdd+D1+THn6WoLHCoZKAaGY5bERfyQXlUeacyBBtF1luQoAQyRxb0Xpoemo7Rd5gHmC2+nyuhm57
	5p5l2VUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVpz-004Wuf-5J; Thu, 06 Oct 2022 18:43:15 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVpo-004WrW-Jr; Thu, 06 Oct 2022 18:43:05 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-132fb4fd495so3175226fac.12;
        Thu, 06 Oct 2022 11:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdAt9/qLW5IR5INzlShOk7D7K7dX/WFEcR7pwh4Zg64=;
        b=tKvcJVOWaKQvKRsE7FCI0JPzyXPIM0WaoloxCYhzh7bbpb1JGvjAlMdbYja1AJmioE
         nI47hNKTuoEfAYWGtpGl6WT09FEPIiQQ1MbUEMTXHIFINcgOSEbwRFsnwHUT+8IBHnn1
         /lUWxk6sYCC3RJALNYRuYoKeaATuh66onjhtTdPmZq/auVW/WEaMHWVigF1hetjMyJF1
         3RnjBGJTAkSPNhWJNIY6wDSMstwkQe+11riaz2ivmyPD2CBpF0VwXK763uknhx/VuNQX
         vO+dQFBhjhwCr2X0MFdd0Q41iAlM6pgKbBq4vyWSKzypVPX9e+dT7/pT/AsokT93RE8B
         7VYg==
X-Gm-Message-State: ACrzQf0QFgz/Y/9L6nd+w6tlq3jx3THMy8pigheSFoyIshDdNsjasNWS
	Igz4+N6eD1MHLZ+LTRnjjjzqZxwaXQ==
X-Google-Smtp-Source: AMsMyM55YDTxBklF/F1OYqyNGI1pGr12gI6xwgyldyXHl8kwNwKlvT/IyxyprHweGspqsaAZBnXH/A==
X-Received: by 2002:a05:6870:178e:b0:126:7055:fc78 with SMTP id r14-20020a056870178e00b001267055fc78mr661154oae.58.1665081783067;
        Thu, 06 Oct 2022 11:43:03 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id t188-20020aca5fc5000000b0034fbbce2932sm6078021oib.42.2022.10.06.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 11:43:02 -0700 (PDT)
Received: (nullmailer pid 16909 invoked by uid 1000);
	Thu, 06 Oct 2022 18:42:59 -0000
Date: Thu, 6 Oct 2022 13:42:59 -0500
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, pavel@ucw.cz, cy_huang@richtek.com, linux-mediatek@lists.infradead.org, robh+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: mt6370: Fix MT6370 LED indicator DT
 warning
Message-ID: <166508150927.12105.8845851165188366469.robh@kernel.org>
References: <435f6888ebc20c5abae63eb9cb3a055b60db2ed1.1665050503.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <435f6888ebc20c5abae63eb9cb3a055b60db2ed1.1665050503.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_114304_673448_DAD7BEDF 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On Thu, 06 Oct 2022 11:16:13 +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add '$ref' and 'unevaluatedProperties: false' in 'multi-led', and remove
> unused 'allOf' property.
> 
> Fixes: 440c57dabb45 ("dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator")
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../devicetree/bindings/leds/mediatek,mt6370-indicator.yaml          | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Applied, thanks!

