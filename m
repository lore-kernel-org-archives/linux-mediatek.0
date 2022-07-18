Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF581C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waGojzQJKestAFlcfSdCqvEWi/o6eYFkAoN0J4xqLlM=; b=GCMoELvq1EylfOMhXFngUPSrdb
	YC95nOSCfhxhOUqufVzEgfJ7sCDUsXk11o/oxPzAfoIx+4hN+PQ0rIYNF3MLY2ICLPfRt3n53nfX+
	cpRdv4YsBF+khLp49+I6syAknOUOJLuqW/dJGZ8Hbx91J2mO19zsu5exWomHUEHLXprvv6qWONTiM
	QJfV1AcPCb4reYBUpAfT+J3JxEpGnFpWsAlpM8S82OcxQMIiBn2Ud0imbo5wqR7Xt8z6GjGnvwyy4
	7N9Zs7SQPuM7wbUdV+tD++GNI+YBGVJORqyUSbk428Y0x7UUTqhLW1p37jkDu2D1K34IjSCqw+p3Q
	x/+ftyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDY57-001TMZ-OC; Mon, 18 Jul 2022 21:15:09 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDY52-001TJL-9V; Mon, 18 Jul 2022 21:15:08 +0000
Received: by mail-io1-f42.google.com with SMTP id 125so10365819iou.6;
        Mon, 18 Jul 2022 14:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=waGojzQJKestAFlcfSdCqvEWi/o6eYFkAoN0J4xqLlM=;
        b=fTgjIjuEgTekwHMVMuSBGS6oafKhLCnC9tH3+8j7aO3llzKUFuYyJXdsnVfP2q6f0+
         lveeP56vsuSCOCQHEd6KImqNrKGV77RcS8GO1ar50lpjOHYAowrHEQwZhbPRIAXSj5o5
         nmAMifJI5jpzN7JrttZQBIauGtSclP016v6n+q1eohGBXVULuqnfBRBVmtDd8JIuvPOl
         gwrv3RPgzN6/vq98tbb6aKhzRf2GcxTfQAGsoewr/zivQvrsLFNbXo5V9a3Ntbi/oIxP
         dWGoNJ+tHIhByVORDF8EX8zR9JGeQ6wc7uHZ5NQqTE5cXXoKUctSvU5xvZfrDYGFILVY
         EeAA==
X-Gm-Message-State: AJIora/FljFOf01aUTZFwXYdpczQp3NY2gdD6QJnKyAbmFqSMdtMpD/G
	U3MCXzH1xOYtXE0EKNCsxw==
X-Google-Smtp-Source: AGRyM1vzkO++HsbSir7ZbCZNk8RsHLKO5mm6TyRRsK3Bu8hhHALzdY+MkTYM98ZV7iYjLMb5ueJJrQ==
X-Received: by 2002:a05:6602:131a:b0:67b:dbd5:49dd with SMTP id h26-20020a056602131a00b0067bdbd549ddmr8950312iov.1.1658178902508;
        Mon, 18 Jul 2022 14:15:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x13-20020a92de0d000000b002dc06989d86sm5196511ilm.52.2022.07.18.14.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 14:15:02 -0700 (PDT)
Received: (nullmailer pid 3569024 invoked by uid 1000);
	Mon, 18 Jul 2022 21:15:00 -0000
Date: Mon, 18 Jul 2022 15:15:00 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 03/19] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Message-ID: <20220718211500.GA3562861-robh@kernel.org>
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714122837.20094-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_141504_349348_0D8FFAEF 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, Jul 14, 2022 at 08:28:21PM +0800, Tinghan Shen wrote:
> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.

Please coordinate your work:

https://lore.kernel.org/linux-arm-kernel/20220718180654.GA3260460-robh@kernel.org/

> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,scpsys.yaml         | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml

