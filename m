Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXhQiUCc/kSGg7T54Fdcn5M8CpdJitJ7WUXZI1TnpCQ=; b=llVmnNZy6uRGtl
	pCDywKVN3jy/V2dfoCJWUSVT7dZXMsi9JGeIMTjs5M5VyfjAuC+4toN2BqOeZwkDl/Bn/IxAmZ+sE
	Yy/i5sqbmjJLR7ITeT2wPWfV7OjMslCw4lQ88L3sgsML5yMfCGGIDXhK6kWkNEkB/IGLXWxqpms/S
	UWW396Afmr9g5o4eIxh+cqI10Uz9R4Yx5rIPPdkdY3Mm669JwVKJPlfgccE1cDMSTtQ8mhfsaxRUx
	JFnOKIEVLAVD0HypIBaBrj4yN/30/rD02xrA1f13i56wtNZkLVTJb95Pe4Jqd7pGS5LRe3PeWvrmo
	6MQ3EnvcK7edoHSJoj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonTi-007Fpi-EX; Wed, 11 May 2022 14:38:14 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonTQ-007Fga-F4; Wed, 11 May 2022 14:37:58 +0000
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso3069288fac.2; 
 Wed, 11 May 2022 07:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9BCuf6md1fXzU+TlOHk5VXDJaJ6H3g0zAe1qyFY7QIk=;
 b=vl3rBA+hPs6XCdVKi1N75St88Ez3rW/2oTCu5lTTKzMEqDS3hDSCb4riSEJkcOi81v
 Onx4e7trRq3OfYjszXJwiAze9orp4KhkBWbvC1XK3fpBotl8q3MHsBV9y2MN0WRPlkWK
 7iFgYSIrjQTRdimq2G2undxCauJklIwZdj+ZNB6QDjt1YGvkIgwtEKP5U/EowV7a3WhF
 EthQewoWRunWYe2G/XEXCzr8Pv6kFIngST2SxKKbzP2MoQAS7rxrS2N9IxyURVcOEpnr
 /ufDaZYSBDdWsHDUkQWf9e1od3tcgrEY6vk4uzuq8SidmkCk/LuEjgxbbUbVluIEhT0I
 jPqg==
X-Gm-Message-State: AOAM530of4MW3gz8vOauowTiSpziv8HElelsuwK6cw1GHcF/nVZF0T0/
 iBhil5fF4L3P+XB/+tq91Q==
X-Google-Smtp-Source: ABdhPJzV7lHSAaPCIpfLtDq3OLUgefj/X2KavadZ2NnmpnbPgLsOcT7C0+3CfdxjsheCNj3k9xF1Cw==
X-Received: by 2002:a05:6870:65a0:b0:ed:a635:eee9 with SMTP id
 fp32-20020a05687065a000b000eda635eee9mr2795975oab.48.1652279874613; 
 Wed, 11 May 2022 07:37:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t2-20020a056871020200b000e686d1388esm600266oad.40.2022.05.11.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:37:54 -0700 (PDT)
Received: (nullmailer pid 272781 invoked by uid 1000);
 Wed, 11 May 2022 14:37:53 -0000
Date: Wed, 11 May 2022 09:37:53 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, roger.lu@mediatek.com, krzk+dt@kernel.org,
 robh+dt@kernel.org, hsinyi@google.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, khilman@baylibre.com,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-pm@vger.kernel.org, viresh.kumar@linaro.org
Subject: Re: [PATCH v6 01/10] dt-bindings: cpufreq: mediatek: Add MediaTek
 CCI property
Message-ID: <20220511143753.GA272748-robh@kernel.org>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505115226.20130-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_073756_528447_3B764AA1 
X-CRM114-Status: GOOD (  13.11  )
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

On Thu, 05 May 2022 19:52:17 +0800, Rex-BC Chen wrote:
> MediaTek Cache Coherent Interconnect (CCI) uses software devfreq module
> for scaling clock frequency and adjust voltage.
> The phandle could be linked between CPU and MediaTek CCI for some
> MediaTek SoCs, like MT8183 and MT8186.
> 
> The reason we need the link status between cpufreq and MediaTek cci is
> cpufreq and mediatek cci could share the same regulator in some MediaTek
> SoCs. Therefore, to prevent the issue of high frequency and low voltage,
> we need to use this to make sure mediatek cci is ready.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek.txt       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
