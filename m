Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA84C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+m1+xLeDebW2zl2gHH6FCuCM9J+sDvC8EcqcW4lKi+o=; b=PdRSw6Ai+kMo+n
	dzeKFnwfW9lp7voL0gK8l+VuSBdRaAS3Xh9XTzMPd0e10Oe3tc1B+GtUrHrTj2NaEdBh1kBJPvlWX
	7ZfBs8uoDHqIFxFrazGqy5bc47D376Me1+EdrYb49SnP2IDwAe1kpMZP3ABa5/ihDx4Zq51/W1nz8
	vUBG3mgTrVsRdltu2kXrR620E3cU4/3qEQIdeEkhYLdk+Y6hH8qoWmVzXd0uRnhLDsZXCg1l2csm3
	vYS/tmzkD9fUFHT+b8t0CCz0Yb5SdyNAZTQOhrBxg1Hou6mEwcWPNM+MwBjSQUzSDMxOJknj3CKc5
	cHSLQHL8zazOAKSfdzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYny1-008SF2-Q5; Mon, 28 Mar 2022 11:55:25 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnxh-008S5A-7p; Mon, 28 Mar 2022 11:55:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y10so16574853edv.7;
 Mon, 28 Mar 2022 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
 b=OBOwZMzgqbA4Bri1W+TQyb45lBR8NViCvJYDlk5rJZKcVaCgWCV40Bf7Mv/7s4LQTo
 o61uoNoV320FDfTmAXy0OyXXsM6xbZnily3YKTr/Pe7gWFLFh2fymA9CCUGhWiDEZlLZ
 nNwep3nx1H6RuXTTVxqC1Ux9vx68yHHOYmvP8HexVe79FWRO9Iu3fNpeAYkfW2JkM+Vt
 qrh2k9qqmA2fYydHCfMeMdCIwVVoaxO4gxjQE8JAPqhrWkQW+6YiB4qavu4HrF1R3jtl
 KNxBJkSRciGcZ0Vf/9M87/6ctraLnA19Hi8Jr/TqhQEfd0ot10wekX5HmOo9zLRLpGu/
 NhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
 b=P7dl9c9ZO1EmM/G8d6endU4JA1ZUGSYGsc5MtNc07IE/43jXIKMqYR0HQ3SZqs3190
 ssF3SurAENYwkHMme4TYi4KvZ2fGN40NJPBx7YGZo9j23bxPZhX0aQOK73yxp1g8Z2YF
 zB5Dyl/Purg0JAMCccGdUdgvj8lYZAjikZjZ+tmYY8g6qMSL5E3UzOqJIJEGM0QAjj32
 KfDSMoLoM5tawc657VF1DZ0SbYnS1pfHIGdzvQ34+hRsIpiTxH2esgDxi8qtFffMoNkH
 /fnYxDO0qItdQHLrL6Jw+8p4oKGvWWaMA1DHIi7AkOwe82Fx1a88qpIYGDYcQrdtQAlK
 3Pfw==
X-Gm-Message-State: AOAM532TAKKM9PO7AwhK3DU2YGV7q3g9GtFpViZiwEWV+QY1scuWvnZm
 1jxfPMqL5wE2LvOx23zeF811f6RR9jk=
X-Google-Smtp-Source: ABdhPJxl9m+FiC/OJjd+DqfT2L64nZ1Oy+3md9ABQHlV5EJnd26lo+025HjOApFZeOymI3r2eMPv3w==
X-Received: by 2002:a05:6402:1718:b0:419:564:6b62 with SMTP id
 y24-20020a056402171800b0041905646b62mr15482099edu.361.1648468502610; 
 Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 nb6-20020a1709071c8600b006e02910f818sm5859904ejc.157.2022.03.28.04.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:55:01 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@axis.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, 
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-unisoc@lists.infradead.org" <linux-unisoc@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <YkGiFa9DSKpsSZou@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <20220328082858.GJ7371@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328082858.GJ7371@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_045505_330463_4FF06204 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, Mar 28, 2022 at 10:28:58AM +0200, Jesper Nilsson wrote:
> Hi Ansuel,
> 
> On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > [...]
> >  arch/arm/boot/dts/axix/Makefile               |    3 +
> >  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
> >  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0
> 
> All ARTPEC platforms should be in a directory called "axis".
> Otherwise LGTM.
> 
> Thanks!
> 
> /^JN - Jesper Nilsson
> -- 
>                Jesper Nilsson -- jesper.nilsson@axis.com

Will do the change! Noted.

-- 
	Ansuel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
