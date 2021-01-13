Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FACC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 20:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5EE2078E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 20:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5EE2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3rQC9iJneYj3DpR0RLQj13+p8evH5yu/iTYKXf8smQ0=; b=SjfFl8MfL+QCSVfw6dFPZ+er7
	QQWoBzLgI87cpSV6RsqbjurWlQI7UXi7mJSH9Lfsn5qCv5rkX28SlZpEkTY0sJFm+3hcOpe+oAbJs
	6rxzyByfK/rOfH0/kE7YsoJ29LUCaJ9ov6oWHP6sVj0GcoC6y07Vc4ZAhd5kyae7o6nYstZlWdSqX
	h/+G6m9rZ9mZ7vRPouEpHUehSOfDlVDY/0Sej3CyaY7aNZ7mRN2e6uajWYu7HnrnzES7tLcmKm02q
	x15BjtILPSIfxAlwsr1OslCmI4gfATV8WsIdGllnuWAgzGF20/r0/+Zf4JH2MfltKcpD4t+dHsRj6
	V2Vws5Gbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzmKk-0002CI-JN; Wed, 13 Jan 2021 20:01:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzmKe-00029x-16; Wed, 13 Jan 2021 20:01:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E89E71F44C55
Subject: Re: [PATCH 1/3] dt-bindings: power: Add domain regulator supply
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20210107104915.2888408-1-hsinyi@chromium.org>
 <20210107104915.2888408-2-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <4824b486-79e7-a382-0168-8cf51e20f7c7@collabora.com>
Date: Wed, 13 Jan 2021 21:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107104915.2888408-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_150128_332104_7048754C 
X-CRM114-Status: GOOD (  16.87  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for the patch.

On 7/1/21 11:49, Hsin-Yi Wang wrote:
> Some power domains (eg. mfg) needs to turn on power supply before power
> on.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  .../bindings/power/mediatek,power-controller.yaml        | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index d14cb9bac8497..e529586af5a12 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -82,6 +82,9 @@ patternProperties:
>            be specified by order, adding first the BASIC clocks followed by the
>            SUSBSYS clocks.
>  
> +      domain-supply:
> +        description: domain regulator supply.
> +
>        mediatek,infracfg:
>          $ref: /schemas/types.yaml#/definitions/phandle
>          description: phandle to the device containing the INFRACFG register range.
> @@ -130,6 +133,9 @@ patternProperties:
>                be specified by order, adding first the BASIC clocks followed by the
>                SUSBSYS clocks.
>  
> +          domain-supply:
> +            description: domain regulator supply.
> +
>            mediatek,infracfg:
>              $ref: /schemas/types.yaml#/definitions/phandle
>              description: phandle to the device containing the INFRACFG register range.
> @@ -178,6 +184,9 @@ patternProperties:
>                    be specified by order, adding first the BASIC clocks followed by the
>                    SUSBSYS clocks.
>  
> +              domain-supply:
> +                description: domain regulator supply.
> +
>                mediatek,infracfg:
>                  $ref: /schemas/types.yaml#/definitions/phandle
>                  description: phandle to the device containing the INFRACFG register range.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
