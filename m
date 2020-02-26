Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2555C4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 09:24:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB68C21556
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 09:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s580DmIs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB68C21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoLaCwhVT+6CxM5OnLj09LkeVQdFsmgancmarwdqarU=; b=s580DmIsr7go+y
	rQaRPBarC5wVcfcbzWLjX0ggaZWnEhbTis7NR6Mt40W26JYVGXR0RW+Evjbl1vjYZ7QqbH4+9HqKQ
	0179MmJz0F+daleITMmAoFD3DLqr1EUPtTa4LkW+CtfKEDaxM0O6JRDxha7Hwc8FQie0MAnpXxGFv
	uJQGtDl+m+OMMPqt+fgMViCmgy5kAQITIcF5hje80cWxVFtB5I8F79fKFAB7nxSODgBSlzr/mh9zG
	WB+b9xXyFHjqCujsmcsBAxkw+DerbLB16G7yXUeFGT6c7X23zdefUxXH8Ifpft9eX+8cQFvDQbPsh
	4+Gbh4mbaUxl74EBvK2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6svV-0004Ln-HO; Wed, 26 Feb 2020 09:24:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6svL-0004CO-29; Wed, 26 Feb 2020 09:24:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 0209328DB54
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
To: CK Hu <ck.hu@mediatek.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <1582259996.1846.7.camel@mtksdaap41>
 <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
 <1582277229.25992.9.camel@mtksdaap41>
 <1393a8c5-065f-cccb-2563-8b159c951d4b@suse.com>
 <1582283518.5889.10.camel@mtksdaap41>
 <6deab0a4-44a6-a15f-ac01-374f818b267c@collabora.com>
 <6eb9da70-9a0c-27fc-6c31-3ac62ede5a35@suse.com>
 <d9ad35c0-57df-ebb2-67e8-4aae55dd2fcb@collabora.com>
 <1582523544.25316.2.camel@mtksdaap41>
 <688f6c85-0063-9458-858c-de7bbfb8a530@collabora.com>
 <1582695176.8324.4.camel@mtksdaap41>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6355f1fd-b929-730e-e0f6-96dd5100e3f9@collabora.com>
Date: Wed, 26 Feb 2020 10:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582695176.8324.4.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_012411_233200_A989B6D6 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, Matthias Brugger <"matthias. bgg"@gmail.com>,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

On 26/2/20 6:32, CK Hu wrote:

[snip]

>>
>> How do you see move mmsys to drivers/soc/mediatek and instantiate the clk and
>> mediatek-drm driver
>>
>>  mmsys: syscon@14000000 {
>>  	compatible = "mediatek,mt8173-mmsys", "syscon", "simple-mfd";
>>  	reg = <0 0x14000000 0 0x1000>;
>>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>>
>> 	clock-controller {
>> 		compatible = "mediatek,clk-mt8173-mm"
>> 		assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
>> 	 	assigned-clock-rates = <400000000>;
>>  		#clock-cells = <1>;
>> 	};
>>
>> 	display-subsystem {
>> 		compatible = "mediatek,display-subsystem";
>> 	};
>>  };
>>
> 
> Let's start with the simple definition.
> 
> mmsys: syscon at 14000000 {
> 	compatible = "mediatek,mt8173-mmsys", "syscon";
> 	reg = <0 0x14000000 0 0x1000>;
> 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> 	assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> 	assigned-clock-rates = <400000000>;
> 	#clock-cells = <1>;
> };
> 
> When we break clock control to a sub device of mmsys, the reason is that
> 'Linux' generally categorize clock controller to a device. When we break
> display control to a sub device of mmsys, the reason is that 'Linux'
> generally categorize display controller to a device. All these seems
> software-oriented reason, so I think we do not break any sub device and
> keep mmsys simple.
> 
> When I search of_clk_add_provider(), I find that not all clock provider
> code is in drivers/clk. Maybe when a clock controller is not an
> independent device, the driver code of clock controller could be placed
> within the device driver it belonged to. We could place mmsys driver in
> drivers/soc/mediatek/, and it control the clock, routing, fake engine,
> memory delay,.... I would like drm driver to be placed in
> drivers/gpu/drm/ because display function block, such as OVL, does not
> belong to mmsys device. And finally let mmsys driver to probe
> mediatek-drm driver.
> 

You can apply the same reasoning in the clk subsystem, not all the drivers in
drivers/clk are pure clock controllers, some of them are already
system-controller or "simple-mfd" and some of them even instantiate other
subdrivers via the platform register API.

Note that moving clk-<chip>-mm drivers to drivers/soc/mediatek will imply move a
lot of code, I'll focus only on mt8173 for now because is the only platform I
can really test. Let me prepare a v9 and lets see how looks like.

Thanks,
 Enric

> Regards,
> CK

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
