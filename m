Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B7BC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:47:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2833B613CB
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2833B613CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RjKg8zH9IAxSRELf4cKMb6V0VqiZUKSTmDgujORMNOM=; b=UTP/AdjLRxZ9161qxQMVUK6yn
	GfN7chyIb+RxDPtVjOzM9oVVFHvWZpe/syc59iJ1/Czig6jRJqQPXRMLGv7mK+hiXbj5GTSAS7t5K
	rW1n0+BKSr94uTG7hsRlcGzSAO7JR71X/T2br98Q2JDZPUm2Kg2l8E8/cz8L8rlW1BzUYnd+ohCNK
	2IdzeOEnVxyo7QIakmLdIUUEpHhTfN9FB46+pV8wM3Ic8e2bpG+FLpA78UQh/ZAq3jltrR9VBSHhK
	HQdu+EeJcy5bZYx1EVeZ6I9BKxj8Pqg8sA6ztKNKN3bda7vKNcwY9qZOIOU3h7STnCeotgF9BlCcx
	cSxyMr/dQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjEc-002DAq-OJ; Tue, 06 Apr 2021 10:47:02 +0000
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjEQ-002DA2-J6; Tue, 06 Apr 2021 10:46:52 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id TjEKl4QZl43ycTjENlNbh6; Tue, 06 Apr 2021 12:46:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1617706009; bh=BijuNj/gB+ekaEmmA8LrY661zA7h8cfh54Fp9N5XImY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Mj25JZmODKqH9Wa319CsXY/rf/agUte6VdLGCWrTwn1PapxIdqHWcoSSdYI49hfpl
 iicPi+DEA5/ZnEeBf1w0FLfZATxHCkVCj1qjjFxblvkq+FIlIhl62NbmnWV5vpDsjq
 Skd6gqWYNyZR04lRIlFMFMTpNRjJqaDVOs3SHYXlL4Se2CGwtMfe61htvU5YlrPKm1
 6BNQahOLRPzstWSVvMKqWI0kwcfLgHQ0JxpQk5CndLk3srw4Ws0UmiqbdGriFzf0Pg
 0wuaof6nJ7yEvYVUZsFdnmZAODLr+n5xKzFmfq9pvSaO6J7HsvTGTq3uEe1j7D9Fsh
 G5OCQ7rd0JLgw==
Subject: Re: [PATCH v4,2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc
 device node
To: Irui Wang <irui.wang@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, yong.wu@mediatek.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
References: <20210325122625.15100-1-irui.wang@mediatek.com>
 <20210325122625.15100-2-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <245594e6-a4c9-0f53-58e3-1b32ca6dc651@xs4all.nl>
Date: Tue, 6 Apr 2021 12:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325122625.15100-2-irui.wang@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfGS8Ozq7AoDb3Y768nCuFXbTPFDoeRRpDRihEFX9V+FsXaIXLur8lgJ3uFHKRwo8r4NDnNh0X/stl/UcYJsaOiks5kkt/Q+8AMDbddiMV+HystE0LP+p
 Dsuvhf6dvovyGwfs+12Q3N1n7hJ22nwlR8ppm6x9KDUjfj1SlHv6W+nuR5mZHlzFW50J+sveyy0gaDQOzOvyCq91Xk25A/E/VI1l0WTZrznNjWg8fxmy6vPN
 wd5SeiFDHeHPe3a0vxpLLBMa3ZiD1zl/f5WFIKoruigFzdZmSeL1NdcAlmjpQY9rgg177F2y5hZjQns3JvbKEvaqxjNNJC+36h7amyqnzNCE1LcEZS6teYmK
 gEHzpMJpAZQ6EPZXumjs+4mFET1co90XCYrzNhYWBQccf21STBaL2/BL6KtuWXWJMnMEdxRbusZoJORIMwq3sS7xFH15Km1DnDVMzCm2EpQ3ppf6N1aMcMMI
 Td6mvD2DcBcWfpzf1ujhu9XsKGPVWYbU4g34HfT4e/ttPT707+GbMz+z9wxPInwmuCboVC2NSv3P1/248BuaNEKQ8Rm8xR7jDy/mY/suV7pn0caD6IvFWTD0
 JuWWrXnHFQdT5SHbxHGQBTYUCRmfoSUMXtp1V2uABfdWbN1movOCKw6IdhgHrOzq8Nr4+C4DhuemH78LUODT7ng/2uVC3z9e39XrHPOpvLP9Kmb8KnfCBuJH
 dOdQ9CZVH3NZMV6C/iXw7vjIk9seppgkTZ2Fp8Rt6sEvAn+6C9rg4VIV5XnEvfnvFmjVEECz2FNYUdJTFR046jLxnrYO6WzDPWsf3zA2iCI4G+AWD4Tv/jm6
 rHW565cZ3T/015OjdYmIKwGXzpxaKE+pj69Vc+NVkqZr0ZRAcRz6q2xGK/UpCg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_114650_905038_18991E50 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Irui,

On 25/03/2021 13:26, Irui Wang wrote:
> There are two separate hardware encoder blocks inside MT8173.
> Split the current mtk-vcodec-enc node to match the hardware architecture.

I've accepted patches 1 & 3, so this patch can be merged by whoever maintains these dts
files.

Regards,

	Hans

> 
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 7fa870e4386a..f5950e9fc51d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1458,14 +1458,11 @@
>  			clock-names = "apb", "smi";
>  		};
>  
> -		vcodec_enc: vcodec@18002000 {
> +		vcodec_enc_avc: vcodec@18002000 {
>  			compatible = "mediatek,mt8173-vcodec-enc";
> -			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
> -			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> -			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> -				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> -			mediatek,larb = <&larb3>,
> -					<&larb5>;
> +			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +			mediatek,larb = <&larb3>;
>  			iommus = <&iommu M4U_PORT_VENC_RCPU>,
>  				 <&iommu M4U_PORT_VENC_REC>,
>  				 <&iommu M4U_PORT_VENC_BSDMA>,
> @@ -1476,29 +1473,12 @@
>  				 <&iommu M4U_PORT_VENC_REF_LUMA>,
>  				 <&iommu M4U_PORT_VENC_REF_CHROMA>,
>  				 <&iommu M4U_PORT_VENC_NBM_RDMA>,
> -				 <&iommu M4U_PORT_VENC_NBM_WDMA>,
> -				 <&iommu M4U_PORT_VENC_RCPU_SET2>,
> -				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> -				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> -				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +				 <&iommu M4U_PORT_VENC_NBM_WDMA>;
>  			mediatek,vpu = <&vpu>;
> -			clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
> -				 <&topckgen CLK_TOP_VENC_SEL>,
> -				 <&topckgen CLK_TOP_UNIVPLL1_D2>,
> -				 <&topckgen CLK_TOP_VENC_LT_SEL>;
> -			clock-names = "venc_sel_src",
> -				      "venc_sel",
> -				      "venc_lt_sel_src",
> -				      "venc_lt_sel";
> -			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> -					  <&topckgen CLK_TOP_VENC_LT_SEL>;
> -			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
> -						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +			clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			clock-names = "venc_sel";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
>  		};
>  
>  		jpegdec: jpegdec@18004000 {
> @@ -1530,5 +1510,27 @@
>  				 <&vencltsys CLK_VENCLT_CKE0>;
>  			clock-names = "apb", "smi";
>  		};
> +
> +		vcodec_enc_vp8: vcodec@19002000 {
> +			compatible = "mediatek,mt8173-vcodec-enc-vp8";
> +			reg =  <0 0x19002000 0 0x1000>; /* VENC_LT_SYS */
> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
> +				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> +				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> +				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> +			mediatek,larb = <&larb5>;
> +			mediatek,vpu = <&vpu>;
> +			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +			clock-names = "venc_lt_sel";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
> +			assigned-clock-parents =
> +				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +		};
>  	};
>  };
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
