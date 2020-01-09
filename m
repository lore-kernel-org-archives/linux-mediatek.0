Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8BAC282DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 14:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C012072A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 14:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rok/8o94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C012072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUGsrRjMpBHllVZ2qWrrQYGDq/bvTOIB6BL6qweMKQY=; b=Rok/8o94pLhE7d
	I2+LAygSSRe4W3qZr2Y8objM8C8b5fqx/EHng8/Ach5pUIYTojciHZ3dOBT5MyYSqj1tlZVa0How6
	pAanm5CzAx5WttFHlbEwXxoWrqBZgtHskSf2GEH71/Ke3VWvX0quMiOiJarvgECoxpQhPmEeKgVkK
	/3lQzPpHQxzJ0vbbQXRwsl7ejipkpt0t6+fXqPbinwlQVo1hq5wDNW/IrB+ghErSP5Qt3F0dB8ZFw
	En9N+lYWq5D/jf54JFNUZJoyvrJz5F3ZD/BcH4ISzj08T6vXNdAN4/j5cbp0LC5C4Tuk5QbusWbGY
	qaubwGHCtFnqDXWV2ACw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipYle-0008On-A8; Thu, 09 Jan 2020 14:26:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipYlW-0008Hp-78; Thu, 09 Jan 2020 14:26:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 5E0F22934FF
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8173 elm and
 hana
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200109101042.201500-1-hsinyi@chromium.org>
 <20200109101042.201500-2-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <46ccc713-5951-62ee-1909-f572772217c2@collabora.com>
Date: Thu, 9 Jan 2020 15:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200109101042.201500-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_062626_389505_33DCCBB9 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thanks for sending this patch upstream, one comment below ...

On 9/1/20 11:10, Hsin-Yi Wang wrote:
> Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
> SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 4043c5046441..a27b22f264a2 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -86,6 +86,24 @@ properties:
>            - const: mediatek,mt8135
>        - items:
>            - enum:
> +              - google,elm
> +              - google,elm-rev1
> +              - google,elm-rev2
> +              - google,elm-rev3
> +              - google,elm-rev4
> +              - google,elm-rev5
> +              - google,elm-rev6
> +              - google,elm-rev7
> +              - google,elm-rev8

Did you run dtbs_check [1] after having patch 2 applied? I think that will
trigger some errors. I am not sure if this should be a const instead of an enum
like we have in rockchip.yaml?

[1] make ARCH=arm64
DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/mediatek.yaml dtbs_check

Thanks,
 Enric

> +              - google,hana
> +              - google,hana-rev0
> +              - google,hana-rev1
> +              - google,hana-rev2
> +              - google,hana-rev3
> +              - google,hana-rev4
> +              - google,hana-rev5
> +              - google,hana-rev6
> +              - google,hana-rev7
>                - mediatek,mt8173-evb
>            - const: mediatek,mt8173
>        - items:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
