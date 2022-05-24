Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C86C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 02:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnOfadqtyx3+nyRGzNDm04iEYChsbsxUTuSu5+laGIU=; b=PTk0G/cZk5KYBD
	yD/cEgeO94WQI/9xWKXTbNR0DWkfUqWfGHFVHx++Q84YlETMMdx5fkfAn/NSJa8k/V38CPBhumQ3g
	KL8XXp/8D+fSu6nScACkW9KhJ1skzjjuRK9oV9EhvINJ63rxRqIudVWmisfx1B8fLYh93C/KB0qV5
	625nSbNqc0g7t0yZ3EgltpqZRA/URKZNCu7emRPUPxwRPGQEl71Fr5LCKj3PSk/CA5Pax5YchKIIZ
	VcrVRgrCUtYYQUHbAZJEZKOkIF/lnT3qQrnnszviZaXyy+Y993E2NzH10ZYOrO1FYMGynXkW1S24s
	qmiODD1koTmX1E2qK/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntJvr-006YMx-Sz; Tue, 24 May 2022 02:05:59 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntJvg-006YJw-G3; Tue, 24 May 2022 02:05:49 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-f1d2ea701dso20657900fac.10; 
 Mon, 23 May 2022 19:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dcv6C2UUSOPY4hLFgz6B6erXRgJFajWl9sQxIWWG2SI=;
 b=iOLOtzicIGxKYN9/dx2UU2Eqk1infiIl7segBLiwOAUKHPd0FeivsDeVwvWar6+2MO
 z6hrLkCRw2oaA/e/9AVn6HGoh5kFmzbNqwLi3boxoPHMIIYN0Dyct5IRZmWto3LOyL41
 K5Ek4k0GAMRy+KcCXcq/lgj7Y1b+7PlCvjbEtv1yivC9G9rTJKUi4n5qT23LPSx6xMVy
 05bVvEmcgwm5+AewE9K9FWd4zscIQtQYerJjcfa3R3g5b8mk1+JsgTglFQ9zGOVcsbiG
 FvV+Jj8ZPX60BvagGaxXFwjGocN2fhWiBe3EK+Olej5FhJkeVrn4Ku3zbwWU9XbDHjik
 veFA==
X-Gm-Message-State: AOAM531V9aCHUYd+NSND0nRKnydGeAffyFSwOProiDxgyq7ifR/LdfZm
 p1kz1YC7VpAtxpR1BTMCyQ==
X-Google-Smtp-Source: ABdhPJy+WQejQ6HeO+BpEljjIZUbifyIibjiumiOLLiHb9rdI1HKatwYHJVZednKlIkp91wX9c6Vlw==
X-Received: by 2002:a05:6871:87:b0:da:b3f:3208 with SMTP id
 u7-20020a056871008700b000da0b3f3208mr1216398oaa.184.1653357946254; 
 Mon, 23 May 2022 19:05:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o192-20020a4a2cc9000000b0035eb4e5a6cfsm4822509ooo.37.2022.05.23.19.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 19:05:45 -0700 (PDT)
Received: (nullmailer pid 2605806 invoked by uid 1000);
 Tue, 24 May 2022 02:05:44 -0000
Date: Mon, 23 May 2022 21:05:44 -0500
From: Rob Herring <robh@kernel.org>
To: Tim Chang <jia-wei.chang@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Roger Lu <roger.lu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, hsinyi@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: mediatek: add mt8186 svs
 dt-bindings
Message-ID: <20220524020544.GA2605761-robh@kernel.org>
References: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
 <20220523084034.26802-2-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523084034.26802-2-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_190548_568475_89E4F784 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 May 2022 16:40:31 +0800, Tim Chang wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Add mt8186 svs compatible in dt-bindings and add myself as a
> co-maintainer.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
