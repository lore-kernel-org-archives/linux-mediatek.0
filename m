Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFEAECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MejZ45imBUmARIas+DeHQy7CDZJTQ5WsCnsEC2OPmlE=; b=2aH8y/NHlHD8PCHplwM7pC2p0H
	DSCJnXDKh9cjvVe1hPEeSLQEtomqCr9GF7USQotvvk0S3cigTucgj73xVlZoIlNOzUWJNuxQq/+Av
	DqufQtds/P8aMpQinVF7FG/H62XbJIUvhtQl6149bErZDG2oYyTX6I2VjdxZ5sNXlRJHrYp8Bm/Xf
	YvbvVPSgmBqhcv6AMy99DG7h+AlADx9PxpDGKBP1PQ765a4+i1bZNEEpWdSpCP+pMjrLkThgSKto8
	zXxBDgVSSP6H0SulGgWVbSEf+ZseAaENa24MfF2hVeZyn7AEW1+2gyxYpQqIBZt1MPr/yRUF2kUY9
	KzJnA/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYQBM-00FZtb-2g; Wed, 14 Sep 2022 11:03:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYQB7-00FZbP-PE; Wed, 14 Sep 2022 11:03:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 923B3660201C;
	Wed, 14 Sep 2022 12:03:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663153416;
	bh=+Kc1BTT+7JR7Q+bC90Z/3uuTzcHyB9pkIgoBxNhmiu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N6O6LPhipnVjR2hh/zZWKYkmyGNGkuXp5l0vo0pB4OkNjt2PcguMhAjSTzYag8LDd
	 zmzBnk5vdQ0V7FplA3myBJmalejHMuPTCT9FN5OtPyDTpPk7ZLt2W/VR7PvccCeXCB
	 FcTiGcpJfmBJRupnyxzaJIh/uP93zh+oeel3kmYpcTUZDpU3bUY6GLtyLMjaOzDHvY
	 Qtbyu4NhFIWvmJwfWJRzNdMmW48eBEykqGQVyOs0DtC+MIKIfVFn4vo9bU8/oqI6UI
	 InmhwT+tZrEd5DG8650i21+i6CZe2ijeBhG89DA6GPA81kppd64vnu/uL/qYV9SmDB
	 Yiqmyms4mDk0w==
Message-ID: <aa144d4e-dd9f-2ead-9ab5-e519dfab7709@collabora.com>
Date: Wed, 14 Sep 2022 13:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] dt-bindings: mfd: mt6370: fix the indentation in the
 example
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, chiaen_wu@richtek.com, alice_chen@richtek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1663143803-28660-1-git-send-email-u0084500@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663143803-28660-1-git-send-email-u0084500@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_040337_997072_17C64AC3 
X-CRM114-Status: GOOD (  15.20  )
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

Il 14/09/22 10:23, cy_huang ha scritto:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Fix the indentation in the binding example. There're two redudant space
> charactors need to be removed.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

This commit needs a Fixes tag, please add it:

Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")

Regards,
Angelo

> ---
>   Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> index 410e2d4..250484d 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> @@ -119,7 +119,7 @@ examples:
>         #address-cells = <1>;
>         #size-cells = <0>;
>   
> -        pmic@34 {
> +      pmic@34 {
>           compatible = "mediatek,mt6370";
>           reg = <0x34>;
>           wakeup-source;
> 



