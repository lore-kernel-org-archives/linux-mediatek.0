Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4830EC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=; b=CHrAc/U5wOLiEZYep8iEew90TX
	d+0e2Pdtvv2l2k9mB1JkWv90j3PGQRVx3hs2RkZQOyVWqWhUO/aiNlkrV3pvos/VFLJdGMqRVc1Wu
	A2Sy9Qc9MTBb439uHPakuPYyv2Qe94IpggKMceRH7ecuPsY1DWmjw8MvPIHfRRSklQ6qSbq3ImWNq
	+phcm8DpQX6VycQH1TaMFLcNnTtgtaxGp3or0t5eKncr7Uc8SiExAecjRMKcNlb+vq02QEVgPceuO
	bjwilQPWIkUYqhUg9o0SwGHAXvclxMvU4I/BNy5zAurDcWS/QPV53QL5UOeMOPrFF5WwX9wpn/XOl
	bMAOxy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNX2C-00ESzu-87; Mon, 15 Aug 2022 10:09:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNX1t-00ESgd-V5
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 10:09:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bv3so8523028wrb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=;
        b=Q2bJb0gcve+toJBBcF3NJDnzAW0PYtNEMYzldvGWquVi3ZwNnMiF927RQ4XD401w1Q
         aqApE+LzZaF804S8NHNrDNnz8VcYTD2U6CLYjQtPCA0hvMrO7+jrWUUN0416udv6b/3N
         j0DcxZKkFiISmo3jjJ5bHRXLA5SH+pXC1EGwootfPQIhe0uOztl/i8zAmb8ixOT9pd3T
         azeux2MTH1rpO1Q7ByHU5ZrZAkuuadpYbpO6FTBqH/DVLWI4sSbbZUDAwJTGXgIB3Fj9
         aZXYEa2IyWIsKp+g0FPxJ3fQADvGYEJEXTALcSEbjJ1sUhjschl72EaI+m1QKh6kQEKp
         mNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=;
        b=DPv8Vi9S914+p2em/aAso5dZKh2mV6FozcYVUDFddbRLXOH07OwEL3/sLGwgAxnkMM
         E59tNa688NrA5cteXoXO2sqP2gqdgFQZR/JbMktSIIEBgTjiBK4Zy4r9tjRjdx8HvBTX
         AXOxiIdiY6GHZxzMNz+Z/bdSWOX0c2M7TuyC6CD+ljJp2Wlw/19eyVinipnvqgBeucdE
         BombgP+FOoAYStRBRw3eymvCMIlwpt8PynaNkf2PRY+BbHY9p5SQ5VW7eF6MprjfJD9a
         AwZqAFMEXNQ2AejXKt62a9PqumaoDiG19EXJlI5hxV3vNI6Z4tHbSjedcwJAXFs5TVAF
         FL/Q==
X-Gm-Message-State: ACgBeo3WeADaqJCzd112D1WwBL4sC5SfpCxyC5dtJxAUZJlkHOZ93OwB
	YxfUx++qJC/3Sd9ajMByyUC/9w==
X-Google-Smtp-Source: AA6agR6d5kQNwJdr555MMH+HrNG3/sAUb0Op9EljHjT0wTZDPmBgOVTbFs55jQ216/Ed/j4i1HlcVw==
X-Received: by 2002:adf:f851:0:b0:220:732b:2df2 with SMTP id d17-20020adff851000000b00220732b2df2mr8761477wrq.716.1660558142782;
        Mon, 15 Aug 2022 03:09:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d560e000000b0021f0558e51asm6890533wrv.55.2022.08.15.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 03:09:00 -0700 (PDT)
Date: Mon, 15 Aug 2022 11:08:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
	broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
	andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [RESEND PATCH v8 12/12] video: backlight: mt6370: Add MediaTek
 MT6370 support
Message-ID: <20220815100857.hcna3ksejzcq5x3l@maple.lan>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
 <20220815090125.27705-13-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815090125.27705-13-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_030906_071787_5230FBFF 
X-CRM114-Status: UNSURE (   9.78  )
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

On Mon, Aug 15, 2022 at 05:01:25PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.
>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

