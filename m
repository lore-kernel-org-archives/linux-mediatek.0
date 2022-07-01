Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD95C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//R5OL6nfJMjY4IafIjAtD1XiWxeu/lLOhZ9/qBWsd4=; b=PYDU5H+XxgYBWf3B+c7SyP/48p
	vSH3Ct5Krt6PD0rIUG+jGSfL3xMNn+VXQqM8oir+ZUwNd9f+m14Fgbt26mHVttjGwo8YGTCAro/rs
	XSSU02Ar+nd/iVdPcYoqcp7xb8gpOfL0ph5ik4JE4xe+VZ+qVr4LXd84w8PQ0RuTazlA/VrRNG9gs
	CfBq6zVEz6mzFRYZhvE1U2PhrdtWngQ7JM8QM/imMdPaVoHEqdg1AGvwy8TawmWE2oA8oj6fodZSJ
	r/UnQzax4wUKGnPAhZXRfqmchzlV4pAz7j1xd2cHAiCwa5OOA+jnJTCIVLX3jF/7vHpnwBiDy44h9
	8lUZvg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Ngb-006tF9-8S; Fri, 01 Jul 2022 20:56:21 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NgY-006tE6-I2; Fri, 01 Jul 2022 20:56:19 +0000
Received: by mail-io1-f43.google.com with SMTP id y2so3341776ior.12;
        Fri, 01 Jul 2022 13:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=//R5OL6nfJMjY4IafIjAtD1XiWxeu/lLOhZ9/qBWsd4=;
        b=jDvC4L8VR13AwaLV+7YvIUAbY16z0eb12K4gcFEzBt8kQsD1kfcJefJMCh9VnYGbJU
         36gll2gxoFMZTnf7IDgibevyXOstQux8wUr7WK/cXM0TxJqa/G4RnXbLHiIkNQ0l1k2M
         OcmF/XerqajU7PmZj1+zbJsb3VB00ydx5MU7N+atmrSNkWSLrA+bzY1gLDMgsq7ZmcXP
         YZgTKDKnFEseUytUfXU5CVg2/GCEr0dm2/uX5ZAS9kiEI3JRSbE9p4nmW7HY9LqB8x0p
         I2XQQU04DXNhOazWu30ZZG+uAeA/ssPIKHUXC4E1eLzxFTpSiLASeWczQkcv2/CxUfdA
         GFuQ==
X-Gm-Message-State: AJIora/IX+95holWX3sD81H657gIMMBhczVfJOv8rCcYIiQHUlEKh+LE
	xlLhEnhHGZdtmhkmS7SmmjEV60ZPvQ==
X-Google-Smtp-Source: AGRyM1vI0hHEPLAgIWEvI2HzthyWUlepD33+89JKXHfUuxBkw5IuJWP+pdS0TpmWDRS3CFVU60LpLQ==
X-Received: by 2002:a05:6602:2ccd:b0:675:aeab:4e5 with SMTP id j13-20020a0566022ccd00b00675aeab04e5mr4796123iow.130.1656708977040;
        Fri, 01 Jul 2022 13:56:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c35-20020a023b23000000b00339e158bd3esm10150647jaa.38.2022.07.01.13.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:56:16 -0700 (PDT)
Received: (nullmailer pid 1514284 invoked by uid 1000);
	Fri, 01 Jul 2022 20:56:15 -0000
Date: Fri, 1 Jul 2022 14:56:15 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Lala Lin <lala.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: efuse: add support for
 mt8186
Message-ID: <20220701205615.GA1514201-robh@kernel.org>
References: <20220701103428.22099-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701103428.22099-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_135618_632106_75BB8B82 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, 01 Jul 2022 18:34:28 +0800, Allen-KH Cheng wrote:
> Add compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

