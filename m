Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536BCC4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axG3mfbjbz/W134k+YbcMH+7XBFg5Rppc/71KawjxBY=; b=PIVZmfkYx6Hje1fCiq4yUWyjaA
	GG9ujIk2ebHl6PLIXjq7AjKJUdO2vZYWtv0i7pwoXMd/wo2uw72otV5O6MTlUJ6EZfLxsVK59JLXn
	PMLqj5slPx07GxUD3JXcFnuB6ah/jpyKYpzCL7C0R09WRv1yuoDnaw5cC4XribFEnWYlwSHh7MY1I
	XVxYMHBm39XQdEb1Prer3PCUnhk8bp/sx98H2DALta4u1+TNm9lYSB0tKC355q4TKBM51T70Y1Sy6
	e2evaxq59O+FS1HiA2RMRosUtjBWnaBaXMtftfkJOrNnwQpopREMC6NYmH9uxMozLOgtS93xS0YSv
	MThlUVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wYm-009ZGt-0y;
	Sat, 25 Nov 2023 17:35:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wYi-009ZF4-1w;
	Sat, 25 Nov 2023 17:35:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4083f61312eso23011035e9.3;
        Sat, 25 Nov 2023 09:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700933709; x=1701538509; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=axG3mfbjbz/W134k+YbcMH+7XBFg5Rppc/71KawjxBY=;
        b=jZUetEsgblRkZsWGo2Jbx+joUm81tUwn5+jxM2FVXdKjRP8WOUKaPdPiNA9T0bqCu2
         EzB5z2k1PU/JdNDjj7KcBabXL241QvsGS3cxr9mqh80UMYgAQth5RVhhXLQ7X37OvJ93
         kd4BcU01cDQuWEAiRPwjIx6eB/X4rMPME+6/+ukunRfLQl4TcsIDz+bcmBY2B7bUxODU
         Ra8Sud4H9ycLB0HELAfmBqz0C1g/RJ3aVavcYSL/F8FxD+tyQs9P3pMpyiBanidwCa0o
         5qm6/b/l1mH+VbpRdMcTtk9peiByxEhVFLNUnfAck+AsaTQIW0g89cEPGua8QkLUVe2z
         yjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700933709; x=1701538509;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axG3mfbjbz/W134k+YbcMH+7XBFg5Rppc/71KawjxBY=;
        b=lD8XJuFAobmzi1mAAqCAX2jLQJyyZy/rx404jqZb90y6jwxIFp2zwOnQ3RxnbkN9tq
         WW0/GALPjb/NpsQ5o3ftADqIQyL3JrVlyw7/S9W7xdlKqsUthA/YLgqIbrjpUCBZ6STJ
         81CGjXmDkqlTTuwCXFD/N/4zerHOIlFbYZv6voVg924obuPX18Q+b3cjRoXWLqbNj2xP
         8z10+qCrmVIE47m8VFbs9kNiPUFdhkhvppM2Fh6xQ9qDr8+Tm+c9gwhTYoKBaVgR2YoW
         CURuPYNwxAX4rHpVp5fv3ylwUtrzoruNZtZyqCicHazmLtqUV2XqFdPWEktaHlGmovsh
         97UA==
X-Gm-Message-State: AOJu0Yzpy+c7WxD/3su2LMVqg+jV6bGS/laAmfT5hRge/j27nR0bL7R6
	8upoWfQrVtGNyHNSSvACdD8=
X-Google-Smtp-Source: AGHT+IF2k2jTI5R4V86TMAzGvEmeagVATmpSvXj1vel8cBJdrhFvqOUF1JNx7OrJEBc8H5AxuK1DRA==
X-Received: by 2002:a05:600c:a04:b0:408:3a67:f6f5 with SMTP id z4-20020a05600c0a0400b004083a67f6f5mr5297187wmp.18.1700933708421;
        Sat, 25 Nov 2023 09:35:08 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c199000b0040a44179a88sm9027766wmq.42.2023.11.25.09.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 09:35:08 -0800 (PST)
Message-ID: <6562304c.050a0220.44374.e4b3@mx.google.com>
X-Google-Original-Message-ID: <ZWH7iXQy9SMwbyZz@Ansuel-xps.>
Date: Sat, 25 Nov 2023 14:50:01 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH v2 00/11] net: phy: Support DT PHY package
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
 <bf26ba4b-ea21-450d-b2ce-0f68f2d2796a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf26ba4b-ea21-450d-b2ce-0f68f2d2796a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_093512_878732_C09508A4 
X-CRM114-Status: GOOD (  18.97  )
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

On Sat, Nov 25, 2023 at 06:28:06PM +0100, Andrew Lunn wrote:
> > One example is this:
> > 
> >         ethernet-phy-package@0 {
> >             #address-cells = <1>;
> >             #size-cells = <0>;
> 
> Please extend this example with a compatible, and include a property
> which is global.
>

Hi, don't know if you notice the changelog, I now check with the node
name prefix instead of using compatible ethernet-phy-package. (some
requested and didn't like using it) (easy to reintroduce, was just a
small proposal/idea)

Also in theory the compatible for specific PHY package can also be
skipped. (we can use the select way and match for PHY id. Can also be
introduced easily but shouldn't that be checked in some way? Or it's ok
to have a compatible that will only be used for documentation?)

> > (For Andrew, we are looking intro making this in at803x PHY driver and see
> > what functions can be reused, idea is to move the driver to a dedicated
> > directory and create something like at803x-common.c as the at803x PHY
> > driver is too bloated and splitting it it's a better approach)
> 
> This sounds good.
> 

Thanks, also for Russell, I forgot to include the PHY mode in the
qca807x commit, will include that once I will move the code to the
shared implementation with at803x. (sorry)

-- 
	Ansuel

