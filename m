Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A57C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyXnJNs4HektoGN5DV3nMlQeUv31yqBJelYnC6TTB6o=; b=AxEEdWrTiTzDfY
	F5V1AtH7vO2rzWQwDhjlBeulBC8I+ps6byyfFSxt5U8Sk82NDeTsw5U51R6DLfW8GDmImFXHmQpKX
	oZIu+wiwMb+OPZxK7OY73XxOODNNCqrfT+WXrUZr/wCWojK1oz4GhWlGEvcow0KElT6HZ4naykpsL
	e3Fahu0bNA4QA3fD1BF/MJ6yXxSvfHxhXG8mYmjbq9SI/ZA4o5nweYpVDSOGC165bBDZ3wa+TkSbP
	7hmotOU2JbNROc6k3FVy4yDjB5PfzkzqNbWkWJ2ds/1Ms8p7nwJa21ylE3tDYyx8UByB2JOgw7/OG
	W+VvhkMVj2uaH/3UPoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXXDV-000bSU-Hy; Thu, 24 Mar 2022 23:50:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXXDH-000bPi-L0; Thu, 24 Mar 2022 23:49:58 +0000
X-UUID: 3917b38dc66747aca5bc6408b43c6b02-20220324
X-UUID: 3917b38dc66747aca5bc6408b43c6b02-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1365293383; Thu, 24 Mar 2022 16:49:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 16:48:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 25 Mar 2022 07:48:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Mar 2022 07:48:23 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <devicetree@vger.kernel.org>,
 <jitao.shi@mediatek.com>, <lee.jones@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4,
 2/6] dt-bindings: pwm: Remove compatible for MediaTek MT8167
Date: Fri, 25 Mar 2022 07:48:24 +0800
Message-ID: <20220324234824.20588-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1648101804-3584-3-git-send-email-xinlei.lee@mediatek.com>
References: <1648101804-3584-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_164955_714050_62FF99A6 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Xinlei,

> Remove dt-binding documentation of pwm for MediaTek MT8167 SoC.
> I did not find the compatiable corresponding to mt8167 
> in the latest version of the pwm-mtk-disp.c driver file.
> It may be disabled but not updated to the dt_binding file.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index f844695d605a..f18e8bbd13d2 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -20,9 +20,6 @@ properties:
>            - mediatek,mt2701-disp-pwm
>            - mediatek,mt6595-disp-pwm
>            - mediatek,mt8173-disp-pwm
> -      - items:
> -          - const: mediatek,mt8167-disp-pwm
> -          - const: mediatek,mt8173-disp-pwm

I checked:
grep -e 'mediatek,mt8167-disp-pwm' -e 'mediatek,mt8173-disp-pwm' drivers/ -RnH
drivers/gpu/drm/mediatek/mtk_drm_drv.c:486:     { .compatible = "mediatek,mt8167-disp-pwm",
drivers/gpu/drm/mediatek/mtk_drm_drv.c:488:     { .compatible = "mediatek,mt8173-disp-pwm",

mediatek,mt8167-disp-pwm and mediatek,mt8173-disp-pwm are used in drivers/gpu/drm/mediatek/mtk_drm_drv.c.
(added by commit 58e4c5398200 ("drm/mediatek: Add support for main DDP path on MT8167"))

Is it ok to remove mediatek,mt8167-disp-pwm and mediatek,mt8173-disp-pwm?

Thanks,
Miles
>  
>    reg:
>      maxItems: 1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
