Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A0C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQXSzsZMJZnsLWdCsM/m+xJ0lR6ba3BNbI//iLuwLy0=; b=RtDzmFbCPWzs2MKik+XX8WOz4V
	p+FuxwL5iS6fvH952Ap6ZZadWPDWf0iqg6hGqfMyFFBbvc915F+UIPBuwiVreu49KLh0pFTxiC53c
	lklD1WiR+XOeTOiIwFhA5+H40WFfjRH9S6+eiCcPDR1X2G/Vl89gaXT78A4trBDj/EQPlI+ARuBTq
	vBQPcBh2SKZtUHwLEw3OoIS+6HJFK+qwrZhiDir58CUC457xJ4BIe1IUbPUW22kKY3RMlf2UcWtuY
	Oy31uNwQYhMAy46Bh6Nv3I5DdOSoiPyjUCNS6GEW6AOvrFlOUZeZUnD3vlNa4oG3Ss/tIftRLxs/w
	WbOW3tKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBTN-002meL-Dh; Thu, 09 Feb 2023 18:16:41 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBSd-002mCs-OY; Thu, 09 Feb 2023 18:15:56 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-16346330067so3663711fac.3;
        Thu, 09 Feb 2023 10:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQXSzsZMJZnsLWdCsM/m+xJ0lR6ba3BNbI//iLuwLy0=;
        b=OY7xd62LqRn62jQr9Z7IwBsNZC/HLKN1LXNgBRBC6mWBtOO4fx61/Tt32gdVJW6LRG
         IeuVUTjFe9Ep0fyDS8E6spykRpCm3RgdyUVu6j33X2aPZKPQchYHAbPrd9FNCwLKcf4T
         4M+PGlkffin0JZ3z/EgOyCnNiiSes0br5AfVWLScIDUirAPx8ZjvefPgnc4HKRO4JJew
         tGZcSI65RJqw3I7heL48a6Q8/FwnuMCEQ7H/K1CJ4iFGhLa16zuXZoq2rkVNwWwTTT/+
         RFOlor9TdE/w91V5rt22hd3lTI2zVaNePUi8Xz47qZ+8hjPezPBjWJ9S2FcS1P5oT+yy
         V+fA==
X-Gm-Message-State: AO0yUKVevpCiLTrPYYXHsh6venDl2V6OQdpCcWBZL9q+0q9ravbccsY6
	nu2K9UDREY08+wrZK93+5rnfJcn2vw==
X-Google-Smtp-Source: AK7set+YmvLpY9HqVM+xUbJq3vy7hLO//HB2AnV0s8lDsqBKdWE0jNTtCstDuwkFYC/+P4B6nmCcZw==
X-Received: by 2002:a05:6870:6011:b0:163:2c2e:b3b1 with SMTP id t17-20020a056870601100b001632c2eb3b1mr5646434oaa.9.1675966552749;
        Thu, 09 Feb 2023 10:15:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cy3-20020a056870b68300b00155ffbdbaffsm983220oab.18.2023.02.09.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:15:52 -0800 (PST)
Received: (nullmailer pid 589042 invoked by uid 1000);
	Thu, 09 Feb 2023 18:15:51 -0000
Date: Thu, 9 Feb 2023 12:15:51 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com, linux-mediatek@lists.infradead.org, steven.price@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, alyssa.rosenzweig@collabora.com, tomeu.vizoso@collabora.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Subject: Re: [PATCH 4/9] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
Message-ID: <167596655120.588989.9166090358280103013.robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208103709.116896-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_101555_832328_E0E6387F 
X-CRM114-Status: UNSURE (   9.81  )
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


On Wed, 08 Feb 2023 11:37:04 +0100, AngeloGioacchino Del Regno wrote:
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


