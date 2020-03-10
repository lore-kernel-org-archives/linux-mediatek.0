Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30945C10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 18:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC27A20873
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 18:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEma5eF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC27A20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hrgsSE8gSUcDy8o6x2MRyxl7dZsTQtnciu8f3spkx8=; b=VEma5eF0PMBa4p
	ds1W9H+GHuXZs8S23Foj2N+mLgnkkLtyNimxZqp5aA6gAp3yJfoIxNEdrehhc7kiwxhSFKH87sRjk
	YmwRZfM49Bh+/WrGlJpfMkFMtstxdpoEuHm+GKIZz8DF7iLb/ggbREwsnRyLLTLQdaM8Z+lwZ3DAC
	QTqF5wgKKAQG68JEfjVBORTLZp9WuBt36/yia6kZ1UMjzZZCMZjx/6o+2cU+V+KtAJF1j48ZdgL6F
	JgZbnlIfWWcLIqO8SQCTfLypxcdfZl9ygyV+fIPYhtb2OoGYHdk2u2R+Gb/TUL0Nc7jweTE1mlRWw
	qsYqO5kAao1mJRWPFLGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjv3-0006bv-Gn; Tue, 10 Mar 2020 18:47:57 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjlZ-0003PC-TR; Tue, 10 Mar 2020 18:38:12 +0000
Received: by mail-ot1-f51.google.com with SMTP id b3so14214241otp.4;
 Tue, 10 Mar 2020 11:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=chsItn4WiJE7pzsGnhBJBMqcVhnfvQYQFixkTol5ZYk=;
 b=DoaMkkWy4CTos3H0DwnFCo+p6h79waS/SnsIQGFjj888BhcBWPB2H+ZQCy56xopcQI
 KDInXS3Eo3aSQ9eE8xJRqJvUcOAnuL5rOQGKVRw0slqgkb1dz5JRUcoyoRmsVwctSTlY
 ILc/ZWpSIpDIxQCxwqm8VeqFBitKZyX9VjvULVBQgM7MWU2dQIxRSi/Ui56gOXWelYUG
 6yHcCKOfs2Mm1femU4EaQbwJLxud3bRfINyulsGMIDgPMZFhOAXLEbWnOWIdL1b3i9iG
 fDjQRr/fKDIolAre7W041imoR1bdty+eUAgXffNTktD2/8ARqq5BXjtkpFnkMpNNemMd
 jYEQ==
X-Gm-Message-State: ANhLgQ3VNxXDXjDS0kprCcftXA7gheihrCb14AqtqJe6N3+eApGf7wsB
 1FEGQA6Vjo5j1dGIPoB/8g==
X-Google-Smtp-Source: ADFU+vsSy3ToLL01JhINM1D/WNZOi2tkQmSVGZYt2683m4vdKUspzQPGZvwOiv6OZuKRB8eB55EM0g==
X-Received: by 2002:a05:6830:1d6f:: with SMTP id
 l15mr17301226oti.299.1583865488168; 
 Tue, 10 Mar 2020 11:38:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s83sm4446188oif.33.2020.03.10.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 11:38:06 -0700 (PDT)
Received: (nullmailer pid 25739 invoked by uid 1000);
 Tue, 10 Mar 2020 18:38:05 -0000
Date: Tue, 10 Mar 2020 13:38:05 -0500
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [v1 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200310183805.GA24623@bogus>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310134603.30260-2-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113810_033270_2D71F620 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Tomasz Figa <tfiga@chromium.org>, ben.kao@intel.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jonathan.Cameron@huawei.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Mar 2020 14:46:01 +0100, Robert Foss wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds documentation of device tree in YAML schema for the
> OV8856 CMOS image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> - Changes since v3:
>   * robher: Fix syntax error
>   * robher: Removed maxItems
>   * Fixes yaml 'make dt-binding-check' errors
> 
> - Changes since v2:
>   Fixes comments from from Andy, Tomasz, Sakari, Rob.
>   * Convert text documentation to YAML schema.
> 
> - Changes since v1:
>   Fixes comments from Sakari, Tomasz
>   * Add clock-frequency and link-frequencies in DT
> 
>  .../devicetree/bindings/media/i2c/ov8856.yaml | 129 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/media/i2c/ov8856.example.dts:26.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/media/i2c/ov8856.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/media/i2c/ov8856.example.dt.yaml] Error 1
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1252173
Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
