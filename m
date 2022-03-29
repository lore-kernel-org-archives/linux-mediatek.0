Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3468C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZT9+XM2XfhqZCUUH7cm391PiGbGScmhVFHzWKnsZM4=; b=VC+y50io790H/s
	QCz3cD0N6DNGl8FZKpkEfp8Y8pMOFKDjxsyCOaMrkGbDsZUfuRvbzT/WIDHfhwtgImsZcVB5CUbg7
	QjtdBSB+GUAzc1XpAgPY0uXrkOnMFXVls+voPuxUFsZE0v+2NZ7QNJLsEi4cHXmhWx7JqFlgUt92O
	FArPRskyAeWAjOi75SkOMum27tIG1N1axgc7tX/vHBkxJLXlT1ZB+/vaHgv8JZ2tuXYjq3/bq1MRh
	iLTIsAwyNzWaYMvzVdL3zFwCF1yTjhrRV7+oKWbgKJfILlZC3djshyFW/FhFKr+NVmA24KgJWA4VE
	v4i7xCdgAS4irHgOZeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZLEj-00Dk0Q-Kl; Tue, 29 Mar 2022 23:26:53 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZLEU-00DjwE-Gt; Tue, 29 Mar 2022 23:26:39 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso13805121otd.6; 
 Tue, 29 Mar 2022 16:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Onx8whWtYNziaSOWeikFCxBSNS52wmmziZDYwpwSOs0=;
 b=EtSqdVBiL3O9KgCHk49C9dPWZBwHlA8fYHh9lwI8zvCtDgElqZMQ8V/qepeoi+KJIC
 NiAMso3CNoXp6KzySPIFAJUIWS2WCo/3IfvKEXsLchA69Z66DB2bqBmICi+sftBQEVH1
 SwpVdAwq2mSenIBzgR/EzD4a/TF0DvED75dMmAU1/6wcGlYhKLUMANC0rdiEr2CB3XiZ
 k1VjOEMrHSiq6mda+S2/BvaQLNFPTRTT0BtgVwEF1YYE6orL2JPAtgpdMGwt1H+5sJjb
 YVqH0M+7yOss8UGcWCbmxSjdzHaFeOFr6jDIeo5AKBj+qk+mL9jgLjyzekOiBIRsMTvK
 zhPQ==
X-Gm-Message-State: AOAM530CIQuCQEYvYApd4cffU41BpnCJj1UIphedcF7WM9vKRLbe3mbZ
 Tx+sBrowXaR+JNbi4uf8PA==
X-Google-Smtp-Source: ABdhPJwgMeIuk1f9wBngw9sMNVUFDANIzQF6qRJJfG+W5rTEJltAFjng0HItLceLMRGMH3tlj1E5wg==
X-Received: by 2002:a05:6830:82a:b0:5b2:36d5:1603 with SMTP id
 t10-20020a056830082a00b005b236d51603mr2173120ots.240.1648596397558; 
 Tue, 29 Mar 2022 16:26:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q12-20020a4ad54c000000b003245ac0a745sm9268545oos.22.2022.03.29.16.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:26:36 -0700 (PDT)
Received: (nullmailer pid 1552943 invoked by uid 1000);
 Tue, 29 Mar 2022 23:26:35 -0000
Date: Tue, 29 Mar 2022 18:26:35 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, broonie@kernel.org, miles.chen@mediatek.com,
 alsa-devel@alsa-project.org, aaronyu@google.com, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 tzungbi@google.com
Subject: Re: [PATCH v4 6/6] ASoC: dt-bindings: mediatek: mt8195: support
 mt8195-mt6359-max98390-rt5682
Message-ID: <YkOVq9XA9VGSNqzc@robh.at.kernel.org>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-7-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-7-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_162638_612096_8436B7E5 
X-CRM114-Status: GOOD (  10.34  )
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

On Thu, 24 Mar 2022 13:38:51 +0800, Trevor Wu wrote:
> This patch adds compatible string "mediatek,mt8195-mt6359-max98390-rt5682"
> to support mt8195 board with mt6359, max98390 and rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
