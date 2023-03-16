Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEDEC74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsDQM6oA7Sc4GrwdW4rvd7swFz7mkc413XGqYjlViXE=; b=ULMtScvG5ZK0CoNWVGzwX4PMGs
	AX/VAGs7yCl/3r3PD4YFCYnGIJMuCEigvHNk8ikrrs5ActpSEaARiiszcD92Wq8ZlU0Efvj33r2oC
	my3ylmLltXcWMpxWmkagqijVQ0ueRSknj9li6AfCGjtcc+DKcISGtC+TGbae6VwCbg+kYbPVHRSLK
	wijUQREa6iagfeRKErDjwShXAKi5aRx7NfAKNmozEAiLJ5J51wOfbejd2iUCeFn7a4SR+Hge4uIe/
	u8KE1V4OvDkKorbSKBXeHGJ03cfKRl6XGrYFsTZn2Yo1vEnGFSTAkyeyPY2hJiESyIm1RquzD0JEv
	rj8C7Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcwCN-000Cbw-1S;
	Thu, 16 Mar 2023 22:35:51 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcwCJ-000CaI-2Y;
	Thu, 16 Mar 2023 22:35:49 +0000
Received: by mail-io1-f50.google.com with SMTP id t129so1492969iof.12;
        Thu, 16 Mar 2023 15:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679006145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsDQM6oA7Sc4GrwdW4rvd7swFz7mkc413XGqYjlViXE=;
        b=4M9LyoiufUFXKhpicd/hOuRrQeNAu7sGZkJNLKjlArdoFjlW0KhQk8ZiKOTvc4Zkd1
         PMOQf13f2Itopr/Lss9ZahHYNWDc2ylgHLuqkGo7ynPgDaXxhdLhz57/1LIX9QMynpBW
         TolWxQie1/CZrBpJEeifdgx5w1GVsp/1DlhLhQz5vUi5w7BW7OBjEu3QtYGzDeQUX62d
         +gsogL+vdKyD/vATE4NJKkKQ8mMxX4rYTkbUh+FKuIfcOoH9luZ3ZJ8Y42un/gwmmSIi
         qa4FhW05zOjsuywFMV0Vfa8I9P3rczbYDnaxg/WKKH367I+WEuOJ6WOj5TdYf9z+wq1s
         HYpQ==
X-Gm-Message-State: AO0yUKWhBleRDCnYoUlJbvXzC5stO18wp2NWb/fRySMcrBBpIsNGm8n1
	qv1NhVZFp8Th/HjKN+uQiQ==
X-Google-Smtp-Source: AK7set8scroUEs+g+P+YuNnzijoW4C2z9w+t4go2VOkci7XB0pxR0PPx9n8TncXiQ6U5y2eS8rnQbw==
X-Received: by 2002:a6b:a13:0:b0:753:2862:a2c0 with SMTP id z19-20020a6b0a13000000b007532862a2c0mr263784ioi.21.1679006145636;
        Thu, 16 Mar 2023 15:35:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id d4-20020a6b6804000000b0073f8a470bacsm117385ioc.16.2023.03.16.15.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 15:35:45 -0700 (PDT)
Received: (nullmailer pid 4013127 invoked by uid 1000);
	Thu, 16 Mar 2023 22:35:43 -0000
Date: Thu, 16 Mar 2023 17:35:43 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, bchihi@baylibre.com, angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to
 LVTS thermal controllers for mt8195
Message-ID: <20230316223543.GA4008428-robh@kernel.org>
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-2-bchihi@baylibre.com>
 <CAGXv+5FUrWEF4SZ6DKjoF8Oai--JGFffzQ3_DyzQrUrThVEQ7Q@mail.gmail.com>
 <e5959cb5-af8c-9410-9530-b3e19e9b647a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5959cb5-af8c-9410-9530-b3e19e9b647a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_153547_856204_38B9B7A9 
X-CRM114-Status: GOOD (  26.70  )
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

On Thu, Mar 09, 2023 at 11:39:13AM +0100, Daniel Lezcano wrote:
> On 09/03/2023 05:40, Chen-Yu Tsai wrote:
> > On Wed, Mar 8, 2023 at 12:46 AM <bchihi@baylibre.com> wrote:
> > > 
> > > From: Balsam CHIHI <bchihi@baylibre.com>
> > > 
> > > Add AP Domain to LVTS thermal controllers dt-binding definition for mt8195.
> > > 
> > > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > > ---
> > >   include/dt-bindings/thermal/mediatek,lvts-thermal.h | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> > > index c09398920468..8fa5a46675c4 100644
> > > --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> > > +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> > > @@ -16,4 +16,14 @@
> > >   #define MT8195_MCU_LITTLE_CPU2  6
> > >   #define MT8195_MCU_LITTLE_CPU3  7
> > > 
> > > +#define MT8195_AP_VPU0  8
> > 
> > Can't this start from 0? This is a different hardware block. The index
> > namespace is separate. Same question for MT8192.
> 
> The ID is used to differentiate the thermal zone identifier in the device
> tree from the driver.
> 
> +		vpu0-thermal {
> +			polling-delay = <0>;
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_VPU0>;
> +
> +			trips {
> +				vpu0_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> 
> If MT8195_AP_VPU0 is 0, then the code won't be able to differentiate
> MT8195_AP_VPU0 and MT8195_MCU_BIG_CPU0
> 
> The LVTS driver will call devm_thermal_of_zone_register() with the sensor
> id. If MT8195_MCU_BIG_CPU0 and MT8195_AP_VPU0 have the same id, then at the
> moment of registering the MT8195_AP_VPU0, the underlying OF thermal
> framework code will use MT8195_MCU_BIG_CPU0 description instead because it
> will be the first to be find in the DT.
> 
> If MT8195_AP_VPU0 is described in DT before, then the same will happen when
> registering MT8195_MCU_BIG_CPU0, MT8195_AP_VPU0 will be registered instead.
> 
> IOW all ids must be different.

That's broken for how producer/consumer phandle+args bindings work.

Rob

