Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE72C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0hyUN2C7BZ8jVZKqrrryijZX/Ej18OXHW5ztfQohzY=; b=GPtETn0+rvlkrkDct1fqFyc5AW
	021nihlQOUeGZvZaeJG2rSTXQwQUMmlYGRInWR14UhuYAr0qNE+NqWlRJeFoIGTsM47WWtvvSVk3A
	xwPGnr7dB9AqNotdaQxRYDjqtBf13QK8eFl84C7w8AewCsBLmGgJwvlHkfR4feM0/DYbtx50N5iLk
	m3By8UwQ0iXXy5QMX2sKStvmb07Ed2npvQLaeZkqmE0t7/cvZTm4hkAOKJ7JlQcNEk2fGN5eSFKqQ
	VQ9j+aSqsVPVjD7E6uGL3RIVWOB7k1dTP6LZouNOKgWTNDyOcnkSGwH2nSeKLPCY5vtQYHJZgFxlW
	InYYBWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pazWj-000e0K-Ps; Sat, 11 Mar 2023 13:44:49 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pazWh-000dys-5D; Sat, 11 Mar 2023 13:44:48 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1763e201bb4so9078200fac.1;
        Sat, 11 Mar 2023 05:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0hyUN2C7BZ8jVZKqrrryijZX/Ej18OXHW5ztfQohzY=;
        b=iWHw6cGm0KlJfjQwdxiESl7FWnF6XriNc0jGc7SHfYFw5dDPR9lAUDSJp5NUZMbdfF
         hppMtZ6ymg/tQ0vRFhGsGiEr8zvRRsknANiYUiib0bGceaE8up2ek+0gNdgeoynyXEBz
         zXLpoHHMDDY6BWb2ap5y7x5JUMthUk4I3xMr5er9lZpPwKkqqeHiOVE78s58OK47Qpm8
         sQbDlWdm2ZvwzSo5J0YYxRDNZsL4VezwV6C9V6ToJ8pY68+EYVw7kMSF/pxcSs0I4+Oo
         ryAbAtZWwEhlUqLqcYrTe3TLMRA4R6+SFnvC+0Z3guqYUiqdOSC+oa+1CrbJIBHuGuZL
         3r3g==
X-Gm-Message-State: AO0yUKWx5OQhFVhPttT6KxEaE/btGiG4/+Qdo4Ie6DRoa9F3/WCQKcOT
	RufclE8hXX8iUOn3c+UqBA==
X-Google-Smtp-Source: AK7set/rLkaFClc4znKPpav+nzsqeHO94LkJ+fiEk32awaq55tpq51tK/F2CMuYjeMLhY0UjRz2QOQ==
X-Received: by 2002:a05:6870:460b:b0:177:81bb:1b30 with SMTP id z11-20020a056870460b00b0017781bb1b30mr1388328oao.31.1678542283119;
        Sat, 11 Mar 2023 05:44:43 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:ec2:d840:96d4:1bbf:55f])
        by smtp.gmail.com with ESMTPSA id bd3-20020a056871b30300b001718e65a5d0sm1109969oac.57.2023.03.11.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:44:42 -0800 (PST)
Received: (nullmailer pid 30642 invoked by uid 1000);
	Sat, 11 Mar 2023 13:44:40 -0000
Date: Sat, 11 Mar 2023 07:44:40 -0600
From: Rob Herring <robh@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org, maz@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH v11 1/3] dt-bindings: irq: mtk, sysirq: add support for
 mt8365
Message-ID: <20230311134440.GA28029-robh@kernel.org>
References: <20230309213501.794764-1-bero@baylibre.com>
 <20230309213501.794764-2-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309213501.794764-2-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_054447_223538_71B168DD 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 09, 2023 at 10:34:59PM +0100, Bernhard Rosenkränzer wrote:
> Add binding documentation of mediatek,sysirq for mt8365 SoC.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

