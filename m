Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116B9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 17:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D0161077
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 17:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9D0161077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLMeyouuOJO9JdlcHf+aekTLws0OjJjORsM98JZfoXc=; b=EOET8ncCf1FUiG
	wjgDvTeJcbNKXrCoUQUw1AxSGAiBGMJiSpd4jagnm5OaQ8ssOf1beY55pbv/IX9McJYWivomHLnl0
	l2MiAbRJzAwk1QJiaG2MGHBo56FAwMB4jaCzxHpD6tZk6M49KUAPj4R/4S7Z/KJpxu6AQB1hYSSp6
	DV/7DcSRdM51/ryJ0CkJqGJE3hwU5OhWJamg8QR1d0qKQyc6rKRIlmb9bs0rUkdTDGm75YKndVbPu
	R65Jj3vej/wGfZFR+PIOC6lyRDL0hqFxoDEUowUCY2VQr/DObMYRVAC3YCbgN0YcePIeYFArY0KDa
	KGA2JLAmNJZbC03Pnn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcWVd-00GegD-2X; Mon, 18 Oct 2021 17:33:13 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcWV9-00GeYm-63; Mon, 18 Oct 2021 17:32:44 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so747486ote.6; 
 Mon, 18 Oct 2021 10:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=RHy3ZoTJ5ER11Swn75LpbiD1h4u7AequpZ+0XI4U4+w=;
 b=CH8ZHZAMFmmCa35yZ5v4HiL9CoELjBmQkVU/N1I3TnBtmK3gSUqO9HtUsaIz8Ji74y
 KYXIOoS20k5Ve5jD9l27A4CLYFjNneOGYUtm4QExKKS6wRHMmmZVIDpXFLIN96Ek3Wh5
 8kvtryHPThj1Z/iepweVc/E7N/NfmeWCV4Jy2DhloEus4e07G+HwDpyDMVrs7DM61sqe
 8qLXvv5hSrZNjrDikr8lnpTdo39VWYZbyG2YRZa/eI77LMKdAIUw21yBev7NoTlzJi5W
 rO0xymwyEx5rwJqjQFhSbeYSCP+Ws9lSW/tZJBUyKzRbdL+OTWcOg4dCp6HxsZrXoEba
 C7Aw==
X-Gm-Message-State: AOAM532vW5Y84nEIJYk++LuuVrkcqyqqXmMW7oQI+dGttRsGmgZQqbMU
 qk8d0/FJTMIiLgf4lSy8Kw==
X-Google-Smtp-Source: ABdhPJzfQ44Eru9QB7/gzKIkq4F5Lwz75ZrkkyfLU9Xtzn7rDzu9ppJs/+xdULly0x2mhJkpvhriBA==
X-Received: by 2002:a05:6830:1f27:: with SMTP id
 e7mr1020556oth.234.1634578361786; 
 Mon, 18 Oct 2021 10:32:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m23sm2584303oom.34.2021.10.18.10.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 10:32:41 -0700 (PDT)
Received: (nullmailer pid 2612843 invoked by uid 1000);
 Mon, 18 Oct 2021 17:32:38 -0000
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org
In-Reply-To: <20211018115111.14096-1-tinghan.shen@mediatek.com>
References: <20211018115111.14096-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mfd: change naming of mediatek rpmsg property
Date: Mon, 18 Oct 2021 12:32:38 -0500
Message-Id: <1634578358.531021.2612842.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_103243_249731_554E02DA 
X-CRM114-Status: GOOD (  12.50  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 18 Oct 2021 19:51:11 +0800, Tinghan Shen wrote:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1542563


cros_ec: 'mtk,rpmsg-name' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
