Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC451C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5wkQFQZ8D3wZvZt+Ctl608nIloX7ZO7gbAcj/n8yy8=; b=ZZYnfKp1j3cXhY
	j1pxc6JtLIz72tPi5CbVQfAR79DtutZdX/ugHp6l0TzOc0ItDqfeze+4mWa8Q2ivkVstJG8KlusWs
	13pocOk0ZmMCYqnN7Q5smnRHfUF93RItt9a5/fnxVwJ/PYra3+whjBktgn0bqqCTfL9nzRhxOWtO+
	IKOS0NScvzzBkWVukfsSEPg+lRddF/bVDjeZEkXQBoQaAcz6gCs3kRXynS3xi9T6w5FfAlN5rmhQd
	lVWqD7RxlTvOtrGi7rwASUHFZUMlcudILW2a2aXlyFYp+WJyJTGU4Wf0qloawMq4/qbuM6HLUJp9h
	oer+Dqh1STshiQSu3oQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsAyy-00Ejmw-Kv; Fri, 20 May 2022 22:20:28 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsAyn-00Ejft-0R; Fri, 20 May 2022 22:20:18 +0000
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-f1eafa567cso8409271fac.8; 
 Fri, 20 May 2022 15:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M8rmRCmN4GlSEfCUYx10TspLN6s4IxFkT9OjnFWex24=;
 b=mHKmg1s2d7fH7e0y4KaFmEZpv3UG2Fz6tKRMpLPWyTdoNVbWortuWV+D6RX4z9rigt
 brMX8k6iQTmc/7sMpLtKPcC4wqjGeITFzXc1K5mc6LOVY+/GftMNkFtQxX8NoMHCfmNw
 uIPNf8es2nKLFJlB5DnWJ8N1Cve4DdD2uFLvFnIjiR+eA7cro/XCg9Lub/bMmTbERB+r
 3+Tp18PF/JFXuDslGm3vnoeHL5IozBP66sfFduGUroAfFyEOwiyUU9wBZSSUU3r8RAl0
 yVAC71wQ1iP7DgdoLLfLdMTEpT3HIPT7cEuKhQOA5Z21L57c4Ybvz9v9HY3aZz/Flufz
 KAxw==
X-Gm-Message-State: AOAM531hxlfiMCduQLXXJ95ijwQDujof64MJhol3OMaxJJuiTiGq1xU7
 qUdJ84mjn0Mv++YPxEpSTA==
X-Google-Smtp-Source: ABdhPJwJjQIXPU0/UMu0hOETcS+SXwtTymvjCnqffWHXLumHewxkv7m+SwigscCX2nOUGYR5V10jnQ==
X-Received: by 2002:a05:6870:d109:b0:f1:ab23:9e with SMTP id
 e9-20020a056870d10900b000f1ab23009emr7621547oac.187.1653085213482; 
 Fri, 20 May 2022 15:20:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 184-20020aca05c1000000b0032698578409sm1572229oif.38.2022.05.20.15.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:20:12 -0700 (PDT)
Received: (nullmailer pid 354579 invoked by uid 1000);
 Fri, 20 May 2022 22:20:11 -0000
Date: Fri, 20 May 2022 17:20:11 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: konrad.dybcio@somainline.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org, joro@8bytes.org,
 linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, yong.wu@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, paul.bouchara@somainline.org,
 matthias.bgg@gmail.com, iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mediatek: Add bindings for MT6795 M4U
Message-ID: <20220520222011.GA354543-robh@kernel.org>
References: <20220518101849.46804-1-angelogioacchino.delregno@collabora.com>
 <20220518101849.46804-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518101849.46804-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_152017_093322_A57758DE 
X-CRM114-Status: UNSURE (   8.59  )
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

On Wed, 18 May 2022 12:18:48 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  4 +
>  include/dt-bindings/memory/mt6795-larb-port.h | 96 +++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
