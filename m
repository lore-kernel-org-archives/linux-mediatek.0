Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvv8o8lyQDs4Uqc/cTXEEqb+afkYfTSqGgHooIqCpbA=; b=vBKjLQe4Z+Rx2Ry48UdMYvD14S
	/UjZhiQMu0s7/SBCH6gA00u+ew0v7SziDfCROH3QIcJNVmHsIeU9BjmxGMXBN4ZziNUPa3EIjCNgd
	6Yk+p94VsIEHLPP4ZrECoeF04P7fE/+gmcFN+HdvMXKKTAC7t9cadCqpy5rJzHykWy8ZMDoP6410y
	8QGhYeaQdLVA8nC8qMfL+/Bc8eZf9WAjC4467TzoLCRBmJ9UbxaI8an8aETgDs+IqgKJH/5T4zAo2
	HYZhPnkU6WY39PsupIdgiC1Amk/9MQfbJHbYjluGbkMpVGHawjq/UDNaOzV/S+TlnZHcnAEInT9dV
	usL+E8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEul8-001Ym8-1L;
	Thu, 29 Jun 2023 16:44:42 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEul5-001Yk2-03;
	Thu, 29 Jun 2023 16:44:40 +0000
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-78372b895d6so38036439f.2;
        Thu, 29 Jun 2023 09:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688057075; x=1690649075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvv8o8lyQDs4Uqc/cTXEEqb+afkYfTSqGgHooIqCpbA=;
        b=XSc4kCY5GsCGs2SOx5uDNzP/ZuAWcOmdfSiaVlynIdPfMv5vvPxxW0iS+8lQybB0+K
         6fH0SScaoImJKtKdXSHNUCcBWk02Ey6qX3jc6wnOSnnBiC2PCQhE0F898c4B/FuLhgKF
         Ks2gz53oyqTrTtW40L0uHNpoRw4FC3tFDU2gt7q/SgKil4hUB4KWB8aN9fv+TNlCR2Fk
         hy4+oXumuktSoY32jO65xBYxB7WWfmBV4OLRFKeo9UTxMY8Oln25I7q87WFhMOetdTtl
         RSpgnWr3wc4X4jBptWQ4LsTgQlJp6vFK3+S4U7UyNEkW+nqCout6+Dro+ocooff5xsXM
         OdOQ==
X-Gm-Message-State: AC+VfDwvXBj9Ecc37iJRLzlE/j13ILWgi0LhrhPtYBqdwaLff1+2oKlF
	s115mthLpM4WwCaCd7JCgA==
X-Google-Smtp-Source: ACHHUZ7Zq2rHGHa35R4f5/6RnXVSjZz6xktb2tp91v9Fy3aAm2hQ7f4Z40Tssnpm9/HIk8qiWdMP/A==
X-Received: by 2002:a5e:a717:0:b0:784:e618:e6cd with SMTP id b23-20020a5ea717000000b00784e618e6cdmr9008iod.20.1688057075474;
        Thu, 29 Jun 2023 09:44:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id b8-20020a5ea708000000b0076c7a2f0f41sm1627336iod.46.2023.06.29.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 09:44:34 -0700 (PDT)
Received: (nullmailer pid 3171062 invoked by uid 1000);
	Thu, 29 Jun 2023 16:44:33 -0000
Date: Thu, 29 Jun 2023 10:44:33 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, perex@perex.cz, linux-mediatek@lists.infradead.org, tiwai@suse.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: mediatek,mt8188-afe: add
 memory-region
Message-ID: <168805707144.3170983.17451535547887085687.robh@kernel.org>
References: <20230629074348.21670-1-trevor.wu@mediatek.com>
 <20230629074348.21670-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629074348.21670-3-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_094439_053395_B7487DD9 
X-CRM114-Status: UNSURE (   8.79  )
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


On Thu, 29 Jun 2023 15:43:48 +0800, Trevor Wu wrote:
> Add memory-region property to utilize the reserved memory region.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-afe.yaml     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


