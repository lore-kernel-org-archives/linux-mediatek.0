Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE0FC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 22:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLw3uwkCeeUAAV03Tbbd6RIpAi5xQgVb6ft9jGrKTas=; b=RAY0+hu+iBqA6AZefzWPLj6w5H
	R6IkoiOpaJSMVmBQZqMQbh+qf49c90F4TOkvwwZ5pHrcoVm1vUosWWrumNLZoZToD3PXGcfvdMj1m
	UR7BaGeAKiDSfjHNNi+Vk0Lb9ncJghXHJwCGh1tVeHNipCD7lFjsYYIOUdoeif+hbt/ZWZXGdQkFe
	O4mBKlBnwyOe9RrFJD5SYQvNzq+rfr6+3MdE0/OZkABKmdL3WztULZ3cdXRFnenoqhAgsDWTgMX9R
	1OymzBcqNcJY+aePwk4hhgu9b2TFGq/Dg+QRRoDanRtkswbLpHxtvkwfZyW0QVIsT2hAh6LMIAfq+
	tmmGq69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjDe-004Yms-0Y;
	Wed, 12 Apr 2023 22:45:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjDc-004YmI-0y;
	Wed, 12 Apr 2023 22:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FLw3uwkCeeUAAV03Tbbd6RIpAi5xQgVb6ft9jGrKTas=; b=KSN5PLtVbt2vcwU7iJSL67zobf
	04FjaKWOzQWGOSps0EqKCeoN06iB+tRhIW7NzeuVAPv+JmDwSGKndDGfkVjIuj2xjg4UH9Y+5p4u+
	f2uWkoNHlT0kgq0d+QUAuR7uac7WconTmK0Nhil30JO++FkFtJSfY//DJTTW3iKXq3PAfZdhi6jR0
	Er1wpaXN5Qaev4+i61WPeqXIzmsUNu/gUPB20uddup/QoWoiZyAmOgVScnO03HUHYwto7QcFWKMSc
	PGREQzSTYU+WYBHc5vZd+trDQXSCnZ1rRFLMwUG43OvELOtXsfoorxzURDGsf9H2EFDHB+pHl8ko1
	W0sfZzmA==;
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdA-00E2MN-15;
	Wed, 12 Apr 2023 21:04:07 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1842eb46746so15279692fac.4;
        Wed, 12 Apr 2023 14:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333430; x=1683925430;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLw3uwkCeeUAAV03Tbbd6RIpAi5xQgVb6ft9jGrKTas=;
        b=E+MSVZ/4bEfggMeq+T4NpxtZ4W1Er+26EgKcHPIyipdSNf/eT0RQlUd4a0oo6biwGf
         EBO2L9yQM8lghrvdsfVKqIm9iN7E2ihrQEtM8grqy+6I2viFYmV8V3G+uIc+VtDfgNlD
         Hci3fFbFFyIe+/9lU0fog13qbwTr9eiEHnM32py1r96aPrtk1F2no2Fo8S7M4xXppj+p
         lmotbr1zzqQmT+jMwDtSoklP+7X0rFHDvOK7RDyQyZeQ0Vu6Ka+F2EzRY1HShO6HlGcj
         6307EiTBBC/Jr4zRejtOlQHP1Cmq58pvBO4DMrd+TlzJxFty8th1+R+BgYrU6B7Z+/qi
         05Fw==
X-Gm-Message-State: AAQBX9cC+oF4xJmxBwEFz2nRoN5xus8ydGwZQx8xa974AaaB+vh8nioL
	h68EJy198wDMx147cq1Gwg==
X-Google-Smtp-Source: AKy350ZSC5jj3xISsp6oFnvk6oBWEtks02c+F/U24WBNcLmHcB6s1GI9dgP3edZehcoihI5kfSHupw==
X-Received: by 2002:a05:6870:c6a3:b0:187:76e6:7527 with SMTP id cv35-20020a056870c6a300b0018776e67527mr202541oab.17.1681333430215;
        Wed, 12 Apr 2023 14:03:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z21-20020a056871039500b00183ff6b45a2sm66090oaf.10.2023.04.12.14.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:49 -0700 (PDT)
Received: (nullmailer pid 3200541 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, chunkuang.hu@kernel.org, vkoul@kernel.org, daniel@ffwll.ch, kishon@kernel.org, thierry.reding@gmail.com, airlied@gmail.com, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com, phone-devel@vger.kernel.org, u.kleine-koenig@pengutronix.de, dri-devel@lists.freedesktop.org, houlong.wei@mediatek.com, xinlei.lee@mediatek.com, jassisinghbrar@gmail.com, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com, ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
In-Reply-To: <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319930.3191493.4677860733560353143.robh@kernel.org>
Subject: Re: [PATCH 14/27] dt-bindings: display: mediatek: od: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220359_027013_A3D36DD2 
X-CRM114-Status: GOOD (  10.32  )
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


On Wed, 12 Apr 2023 13:27:26 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's OverDrive (OD)
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,od.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-15-angelogioacchino.delregno@collabora.com


od@14023000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb


