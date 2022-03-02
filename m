Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C92C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WlPIC0+o3wVjCrfVFhn1xqwrj/R63X2MqZZX3C+sUI=; b=Y9esdxxqz/zWtF
	EjtKyPIRYKcQ91XWIyHPOjiOrPd8/DYzA1VWx6p27IxO75vkvfj31HXqKYTr3GeN46jiYXlwxbEP2
	PdZGqTCWCK9iuW9UthKZQ4dYFnfDErjIUqxvPK3oZnJUm0ZnP8+Qq/esaFVWEzvX9GQijDYFLvTbn
	GA6K1wtOsaV5Cag5bDzL6De4rc3anz9lYVr/z0y8OOXfa6QWLm9ZpNubmQQ311iOS4bplxY0v77yN
	BFuRI1t1AfNzko08HPtD1VstgLxogIV3n2swN3lCP7zcMXkXy4BDf6tJYe4x2UAeWxHZj2rv0CSvi
	Imy3ZHG1nslZCbad5eHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPPkx-002wkE-BK; Wed, 02 Mar 2022 14:15:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPPkl-002whP-55; Wed, 02 Mar 2022 14:14:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DB7F41F44672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646230493;
 bh=qicDU8a/aQVHGR0OpxT7GfZuyLBKrh3Al3E4YeEHPCE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T2p8R/VWCXLp4Dv4iLMWAy3MUHP0IEHakz4Cjt9R78gLbThc41i6lpjfFEr58iMRX
 Be/s4JcpcxtFzA8rPsm7mzE5GVromwEzO2Sbxj2WLFw6w4T8Kz/u8Q16ni87D2lLKV
 gMXMoD0hVqUeG3YJjJfmWEG/s4FMlN0ybHe2jyWUXzwK09UYtqIp9NcNtGF408IE1s
 jRYe8iqLdkjC+1j6KejSqMjAc0pyiVTzhudzBZp7/w1lp0BEk/qLNI3XtTVxgr5n0w
 ikOctsoFKKV4euH2B3em0DHCat6NN15MLK1xJ1k68slXvjZLTc5rmu8RhRA7UGhVk2
 lZ4w7Yu3zTalA==
Message-ID: <b5d3d996-9c4c-b245-ad59-4fb2218dac1f@collabora.com>
Date: Wed, 2 Mar 2022 15:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3,6/6] dt-bindings: pwm: Add compatible for MediaTek
 MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-7-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1646199106-26879-7-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_061455_360134_768CD883 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/03/22 06:31, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 3a5d1cfed94d..053805846cfe 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -21,6 +21,9 @@ properties:
>             - mediatek,mt6595-disp-pwm
>             - mediatek,mt8173-disp-pwm
>             - mediatek,mt8183-disp-pwm
> +      - items:
> +          - const: mediatek,mt8186-disp-pwm
> +          - const: mediatek,mt8183-disp-pwm
>         - items:
>             - const: mediatek,mt8192-disp-pwm
>             - const: mediatek,mt8183-disp-pwm
> 


Hello Xinlei,

even though repeating these items may not give you errors, this is not really
the best way to do this.
I've done something similar here:
https://lore.kernel.org/linux-arm-kernel/20220217095242.13761-1-angelogioacchino.delregno@collabora.com/

So, for the compatibles needing mediatek,mt8183-disp-pwm it should be looking
similar to this:

- items:
     - enum:
         - mediatek,mt8186-disp-pwm
         - mediatek,mt8192-disp-pwm
         - mediatek,mt8195-disp-pwm
     - const: mediatek,mt8183-disp-pwm

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
