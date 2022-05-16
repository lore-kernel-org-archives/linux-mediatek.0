Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1447CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eksJC9fsh7em+XMd86UdDc9iD3EXkYEsnlOWjxZ4go=; b=aXNafm3KPvsKjP
	3op1CCRlcU+0MEoB0C73xTbGDxc85a0wboouFsFf4m1Lcz7w4mq/BOAItg7kP11ZJ9gLh2n35GQx0
	RHtfKED8qmH0hw8nnoOTFo+cYG+8eN5EUZlvAs3iAdupiYWS/fYM7KyMv/fGjr6Rp1Oh7Dt2S/Z13
	74D83bcT0Ort9ZoR0E2MO411EBhWofT0y/E4roaRhhEsmX2EbzAYG2vckRI7gIkqkZAXnrHxkMCxH
	hSVw39GEdWoRe442/z14rduMatYbIlVlrIJ4HKeCihSCquIQEH22zIK/YOsGJSfMsi3SOXy5hgos1
	W+t2PqZMugs2+CpD0roQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdBi-008oqy-Mc; Mon, 16 May 2022 16:03:14 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdBe-008ooB-V6; Mon, 16 May 2022 16:03:12 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so10344929otu.4; 
 Mon, 16 May 2022 09:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yo1mI8/R7Wy9riO53UED6LxgLrSXbz5A0ENaW2C9bpU=;
 b=CXJJ/1xv2J6Mhi+hFRs+vPScFNs7BQIdtsPv0NvKp0u11R737iT7bfgowYe7H1+SXE
 2h77kKEQ6MQyqMXuNEmpfkMzV0nHAp5ZeM1wHmXVEag5YVEw1fG3DEd45Wf8maBGCwcP
 vA4Qofvnq/h4j3ApJpakk5CnKitUDbZS0LIiPlDP4r+n4+O04YnfajJbks4RlD7BSKtW
 dRkSgq5V7Bq0tojcNWC3+z69n8dIHdkXGxa1wbL/FcFrASmVYYyauY2dSV+MJXIOpExI
 j7DGCz7dFCbJfJYiIG9j7NxMAf8i46JT1sUz/Rs8Eb3tkVArDArVDuNctdUORsIHiAlB
 ZPIg==
X-Gm-Message-State: AOAM531x1KD2UL4fzXVYQbBggsRihNEYKFYKeMQ0dtTTQuytw+/COXqd
 AD+TyQbaa4V/19WUoWR1Kg==
X-Google-Smtp-Source: ABdhPJyZnvv3MvtJ0BpFTLVD4WxJ+CJ0091/m0FsrkT5PDbPjdHQaNeoSy79FCWg/C3J1d8uUv1Vyg==
X-Received: by 2002:a05:6830:12c9:b0:606:4482:74a0 with SMTP id
 a9-20020a05683012c900b00606448274a0mr6234159otq.17.1652716989012; 
 Mon, 16 May 2022 09:03:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q5-20020a4aa885000000b0035eb4e5a6b6sm4288330oom.12.2022.05.16.09.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:03:08 -0700 (PDT)
Received: (nullmailer pid 2732699 invoked by uid 1000);
 Mon, 16 May 2022 16:03:07 -0000
Date: Mon, 16 May 2022 11:03:07 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: martin.botka@somainline.org, linux-mediatek@lists.infradead.org,
 robh+dt@kernel.org, konrad.dybcio@somainline.org, paul.bouchara@somainline.org,
 krzysztof.kozlowski+dt@linaro.org, will@kernel.org,
 linux-kernel@vger.kernel.org, yong.wu@mediatek.com,
 ~postmarketos/upstreaming@lists.sr.ht, joro@8bytes.org,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 marijn.suijten@somainline.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, iommu@lists.linux-foundation.org
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: Add bindings for MT6795 M4U
Message-ID: <20220516160307.GA2732645-robh@kernel.org>
References: <20220513151411.395744-1-angelogioacchino.delregno@collabora.com>
 <20220513151411.395744-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513151411.395744-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090311_045764_197D99A3 
X-CRM114-Status: UNSURE (   9.18  )
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

On Fri, 13 May 2022 17:14:10 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  3 +
>  include/dt-bindings/memory/mt6795-larb-port.h | 96 +++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
