Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF43C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 08:46:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B34C76139B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 08:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B34C76139B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J1pnuIgmaM2GuPfHyGtxRJishorZMTluSakxRoJEja4=; b=qu1mH/ojlCSXovDQi3eTkWGQb
	Epoz3qRospAikSBZQKAwkWuD2ksrVvMcN/VHddqQYXySljpEjB23AFb/Ih7fxxQwsMRjuATvmM+aT
	ooZM+KCK1eN21kivPnlyOP384ee/UFjBh7A/fBy7O0ZsSpU/tOlxW/NR/zh9q9A91yrvtWgF27NuR
	UsUpuC9EfY52BhLOjMrSAKH0BhAJJ58czqkQ6ESywvuRL5JH93TmxCNiEk+i1WUpoTIgjmRFk80fy
	NOBM2CpeA+kAXp6M6xcrX697QuCMoAQpdPUsRervKk+VjMTkrC4mSjqXe2AGV1mzbmZgfjm9/tFOm
	PvRUjvX8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThLh-001tgE-S8; Tue, 06 Apr 2021 08:46:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThLV-001tfQ-Pw; Tue, 06 Apr 2021 08:46:05 +0000
X-UUID: 933d0d7f66364ecfb5db18034ffc5579-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bqn/G+VhP78puSnvGXkpc29rN1YUb+2d0IciUIQHsk0=; 
 b=rbtI1lAi8bXwLeItjZHu9a1qdQp+TypJluFEyLVyhJMBxjJ3u0ClQdg9YUOnNGrqjROD0kWj1iNjS5ZHVz5+igwpPF1F+S8VTBO5yY68GQ/DKCBrg5iNz4I6blfCA8wsSY+NiRbOaiTfIbuEDUlv4XWRvEzq63MeyGL9zSXK6no=;
X-UUID: 933d0d7f66364ecfb5db18034ffc5579-20210406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1435150859; Tue, 06 Apr 2021 01:45:52 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 01:41:27 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Apr 2021 16:41:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 16:41:22 +0800
Message-ID: <1617698482.26944.5.camel@mhfsdcap03>
Subject: Re: [SPAM][PATCH 4/5] arm64: dts: mediatek: mt8167: add iommu node
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <mkorpershoek@baylibre.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 6 Apr 2021 16:41:22 +0800
In-Reply-To: <20210405200821.2203458-4-fparent@baylibre.com>
References: <20210405200821.2203458-1-fparent@baylibre.com>
 <20210405200821.2203458-4-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 36539E6FB1540913C723FBD948E87575A3B6FD7ABF948FC5D14E72BF364F7BA12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_094602_396594_1D057767 
X-CRM114-Status: GOOD (  12.59  )
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

On Mon, 2021-04-05 at 22:08 +0200, Fabien Parent wrote:
> Add node for the MT8167's IOMMU.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 9b352031c5f6..3ba03ca749b2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -173,5 +173,14 @@ larb2: larb@16010000 {
>  			clock-names = "apb", "smi";
>  			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
>  		};
> +
> +		iommu: m4u@10203000 {
> +			cell-index = <0>;

Remove this line.

> +			compatible = "mediatek,mt8167-m4u";
> +			reg = <0 0x10203000 0 0x1000>;
> +			mediatek,larbs = <&larb0 &larb1 &larb2>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
> +			#iommu-cells = <1>;
> +		};
>  	};
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
