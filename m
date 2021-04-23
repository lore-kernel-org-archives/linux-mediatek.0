Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CADFC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 13:01:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C481A613F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 13:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C481A613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nf8s4uS7BLLvqI/r/XmTcwMAu7l7Cyfl4UMvRlDkNSQ=; b=BkM5BrauRuCDYrNrO6hb0WQ5A
	vwbyTfccsFe8FxjiAozJJsga8e1HdhJlycr7Z9py7t9FsI1ydIyuVurlL2q30b9HvkPCnk2nAm5Ek
	3Ot93K30oy+hh+Cj3kiFfQAyjJhjM7hgGIYXifA+JjCx8n2Yglht0AYhSUC6zrMuENCQ2/KtWbmO0
	NzlsAlUaAwbSBUqXa9AzJZKh7J3ULc+zGUO9lkD/jRHEsL3DSSS26TQI8+3GRvarpmM+wd/nd2W9+
	VJ9jHxDOVvbvZmtIqwHfY2hPe9JQuKNgRVp+vZsf6Dm6b+VJuwc5ieVZIfVgH9kJMxzRiHVouzRuy
	uW2FCO0rQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZvQh-001VzG-C5; Fri, 23 Apr 2021 13:01:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZvQT-001VyN-3d; Fri, 23 Apr 2021 13:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=33oBmfkDWcD9ZJLoyh0qu34VUv2AbWUFgZ389bdxGOQ=; b=5EEDcL5MZb23+1725DYe73qu82
 1W2GEBVpvXOhDR2hg7FgnFArE8UhvlKuzycRDPclSIbVYIjTwxShqPtkdtSeWDQ0dd5avzDaPf4aK
 bDR8AVn2+cnqYBdFGc1t65AStTeQTpPhR9DC04IHVJYNjtyprfC4R1Wq4kMQIS6Drz0unp0+DTBv8
 arvPZwBNQo5K139Xu2WPXco0UbO8OaeMIKvOSnko/SO2Ty/crT5V8dQ3/cA0TRepro6c0FLdDIUsp
 brJBT3jLzCF5a7lasCgY+OttDyelnP6zIrqQWodWt3AclcUI2t7WsV+MkGW/BJNgRbc7U0lnfTUU7
 ntp16NwA==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZvQQ-00EPTZ-Fy; Fri, 23 Apr 2021 13:00:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 1792A1F43BBD
Subject: Re: [PATCH] arm64: dts: mt8183: add mediatek,gce-events in mutex
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210423065327.1596075-1-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <846d2a7a-d9c2-7d9e-9d7e-843ff604be44@collabora.com>
Date: Fri, 23 Apr 2021 15:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210423065327.1596075-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_060050_692895_45574F47 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Hsin-Yi,

Thank you for your patch.

On 23/4/21 8:53, Hsin-Yi Wang wrote:
> mediatek,gce-events is read by mutex node.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Although I know this property is used and needed I didn't find documentation
about it. It would be really nice document in the bindings this mediatek property.

In any case this patch LGTM, so

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a..cf22d71161e5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
>  			reg = <0 0x14016000 0 0x1000>;
>  			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> +					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
>  		};
>  
>  		larb0: larb@14017000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
