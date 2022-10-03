Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF59C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC6MSONY3vLkuMDaO7L4lnAgj63J2DwMG65oUzBFyAk=; b=NzpEoxe2EhnJ2V1nSgVFZhfi82
	BJlKrw6/J4M5u/EhVJ9zM8IU3O4wDIwzvFAuCMEnrGaY8TbZ4ziFLRG37WOvixW2Qp1W+hGhSsjIb
	/TJktJNN3lOVQeCgl4xZLzAxdIsEjZcYgZ0oPrwwGuVo8eVC0yEX1j+j1r5ZmPX2NZwfdk4zKswA6
	xZghQQnQLRALaYs0cQs3d7awwW6nVVnMmvGliAPPv8G5MkgW3nSVgLqjMivDjcTxncl3eJHOWh8+x
	I8WWIUgVDK9wXtewpGVSdoRNV6ZDz5uK4FdZGo52eh05GCVJL9Ph9kjvSNcf7U1bcu7ZVy/Sy0JSf
	coqkRpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLRZ-005yQn-He; Mon, 03 Oct 2022 13:25:13 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLRM-005yJI-5s; Mon, 03 Oct 2022 13:25:01 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1324e7a1284so4266499fac.10;
        Mon, 03 Oct 2022 06:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UC6MSONY3vLkuMDaO7L4lnAgj63J2DwMG65oUzBFyAk=;
        b=5w5IUg1j4bOQrTyY4xooFDEuaPN667BbkgSDl3Drt/50rG4nFXhcLI/LawBXKS4Fmt
         0+cqwZRPopXeJg35ZD2LH04MhcRkqvO4hJBdpY41h+z9hbxW1e4xfszcBiL5ov9fjj+k
         t/V1+EsIDnYNJsWBrgo+O50c2Rfvyyjc1t4iIvoE+lgn3ziJXODkYdtyXVn3eZixCY93
         pYOyEAe14vI4aTjwiikoItFpgcroVTG2i1oXCZfTQ7tVpfMbNGfKw+Jb3l2NJNEFCF9p
         v5VFCZJUNNtYUHdow2KVxD46GX1loQBt22/RWElsJzmaESBBsHdkR3J4nZWaElwQCjix
         qHzQ==
X-Gm-Message-State: ACrzQf3N0uj0au5+IehmUFQ9tQND1o1NI5HxBfPUQV0blt94m4MqEOcM
	b81bhrnBVK1ajfG4EWNyrw==
X-Google-Smtp-Source: AMsMyM71sXM3bBdvdcws90nBNoMbSopHlJ/SFYjN9kST5ujwFHp2n7tEk53k8931au5a/27ttw6cSw==
X-Received: by 2002:a05:6870:63a3:b0:132:8fec:b67f with SMTP id t35-20020a05687063a300b001328fecb67fmr825243oap.27.1664803498467;
        Mon, 03 Oct 2022 06:24:58 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a15-20020a056870b14f00b0013191fdeb9bsm2908984oal.38.2022.10.03.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 06:24:58 -0700 (PDT)
Received: (nullmailer pid 1863811 invoked by uid 1000);
	Mon, 03 Oct 2022 13:24:48 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maoguang Meng <maoguang.meng@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20221001030752.14486-1-irui.wang@mediatek.com>
References: <20221001030752.14486-1-irui.wang@mediatek.com>
Message-Id: <166479591681.1661748.6265395941647267106.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mediatek: vcodec: Add the platform compatible to schema
Date: Mon, 03 Oct 2022 08:24:48 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_062500_239181_17BF5C1D 
X-CRM114-Status: GOOD (  12.70  )
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

On Sat, 01 Oct 2022 11:07:52 +0800, Irui Wang wrote:
> There are venc node warnings when running dtbs_check, the clock-names
> was unexpected, missing properties '#address-cells' and '#size-cells'.
> Add the corresponding platform compatible to schema.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


vcodec@17020000: clock-names:0: 'venc_sel' was expected
	arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb
	arch/arm64/boot/dts/mediatek/mt8192-evb.dtb


