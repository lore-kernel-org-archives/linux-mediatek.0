Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475C9C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa3ubMdBObBaNTQdWkrheaK3QX+4ANpOsgVC0pXI6HI=; b=PISxrQcV01+yvnJ6RXZWl3amfk
	xgkVM41fn192WXfMHBMsH8k4427Vaht6b9lkBEnpVFUe8hqKEl3yuC7FHsh1mW4XzV0gnDTN4+IkG
	VrCYkWnv48ZWFizsu0GfjIWcrbDe4TSuWnZZKVblXiF487t0ww2wNhS/yO89u9Mn856QIo03WCfHm
	bkr1gSdML8Iu+XmyL31L6jPRks4+C58sYRWVtYEmZ7i2WkVkTIU11+1UndIseULLFZ4irmQne5Cyj
	vFqHvrgHmEgjHpBRkxkzRJOxCt2PCnRj0pj2s2rJKOAKazDZ6tyLfSCNEg9Nu1WZ0iTOqrWu+mDRR
	MfsvaWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLovO-00D3hw-N9; Wed, 10 Aug 2022 16:51:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLov8-00D3a2-Vj; Wed, 10 Aug 2022 16:51:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52D90B81E18;
	Wed, 10 Aug 2022 16:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36894C433C1;
	Wed, 10 Aug 2022 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660150259;
	bh=P83Tql5tDzqXLpKNY/r1pvDY0Hno2eRYNpIyIJiqu4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjPtmmaL3A+2IOpCb/qcQi3rmMEn3fFona591VAMQyOQEShOZK3Bcg4z4jHWe1cxh
	 +l/m45scotgufR0MLbUsiCFcY/95oVeh6cdxCGHerDXLUzUvIQs+TWuIls7CSDGu0C
	 FCSZgcTuzCN9/mamt/nNI1+6BJl6UOIjhn/VlwSUEQRsx+Fa+8o0CYygygq3Xazsa6
	 vMUeEZm/sNXRF3Z84hSwALF+gT/3IS5et1OtlK3mYteK2XuHOomgVFQy9KR03A657y
	 mZKm2o8oJY1Vp5J7GGjw4LhLhn/K99ZtuYViiX0i+Try1dpbdrghmwwk0j8jzOck/B
	 xrfeTZfXCAuUg==
Message-ID: <815b03aa-ab39-ec8b-294b-68dff36e2d54@kernel.org>
Date: Wed, 10 Aug 2022 19:50:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
 <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
 <CAGXv+5HXwVpaJPV-4Z6qw14xZzEkx_E7dVks6-GBa7bQyN8hCg@mail.gmail.com>
 <5dac39d1-3b42-40e9-5693-0c127e8c689a@gmail.com>
 <0fadcd9f50d49ecbb329e76a9ceb6ee689648955.camel@mediatek.com>
 <20220808170355.c2ih3xwqxlddsal7@notapiano>
 <6271732eb27824c5b841760243738ceb062f4c4a.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <6271732eb27824c5b841760243738ceb062f4c4a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_095103_723787_996B2E30 
X-CRM114-Status: GOOD (  17.06  )
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

On 10/08/2022 15:58, Allen-KH Cheng wrote:
> I agree the advantage of patch is aesthetic. Since I also want to send
> another "watchdog: Convert binding to YAML" PATCH, it's better let all
> wdt compatibles in the binding match the contents of mtk_wdt_dt_ids in
> drivers/watchdog/mtk_wdt.c
> 
> static const struct of_device_id mtk_wdt_dt_ids[] = {
> 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> 	{ .compatible = "mediatek,mt6589-wdt" },
> 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
> 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
> 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
> 	{ /* sentinel */ }
> };
> 
> We have "mediatek,mt8186-wdt" "mediatek,mt8195-wdt" and
> "mediatek,mt7986-wdt" now and they have their DT data for the reset
> control.
> 
> It's weird and unuseful to add "mediatek,mt6589-wdt" as fallback. 
> 
> 
> Please kindly let me know if I missed anything

How the driver arranges it should not be a reason to use or not to use
specific fallback. Although Rob acked it, but I still think you did not
provide valid reason for the change.

Valid reason is usually the actual hardware (so they are actually not
compatible with mt6589), not exactly how once someone did it in the driver.

Best regards,
Krzysztof

