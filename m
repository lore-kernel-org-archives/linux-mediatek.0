Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 02:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BBC61042
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 02:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2BBC61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh3oxo7axKyWt2j/9roxTByj7hbWKwtDf/dUwKO9+18=; b=zxcef9H1fhTzwm
	4WK/JhxK/jzb0s7PCkqMxx7K3zpx8KVEVqp6mWl6AkPU/tT1twZlLhg7Y7BjDLTuxwauVXW03SGS0
	WZ3yq9EuMa0P/LgFCdtH0bMDEJx9NoOflhbKe6qqraxSgLBKymrHckK6/loY0vSmZsCy5FKNAHo6W
	npJCpJz/qYmAzlNfSm++jxhVihHg85Y0OCVVnCiQ/KKvdvP5xrGI3nNKGAFpI70pSrY4v98UWPs/U
	C+0QMOGJiSWDvca8KSXF8Ec6zY86MENGHVaAWUrgpMlpRFAv0ApT3WLa7jsMd/pfDfZ+KmR3kpzpY
	J66uBOFgyfQtE/RFGneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mANXR-00EgrI-8f; Mon, 02 Aug 2021 02:18:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mANXD-00Egpy-Gi; Mon, 02 Aug 2021 02:18:33 +0000
X-UUID: b93617fda1cc4590aa26d94969db9fe8-20210801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eyKZc/ALoPV+sqAMaOz1Ex/8blpteLeS0dT9Y1aMYcs=; 
 b=Ws95q8ncTsOXLNFapjueL9oBx++0VGzRMwwxw7zDT4OkgaXEvdUPEBBf1g1oOx/XiECYJzVrLbdxQI7WzT99mfYIb9qefV5f1DZsrPygVd3ZZDjIOoN0P+FXCqBZ1CqYipHEt1lnM6vAxTP6+AYLZ2JO8rprOt1VcGDNOyxXScU=;
X-UUID: b93617fda1cc4590aa26d94969db9fe8-20210801
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1926656059; Sun, 01 Aug 2021 19:18:22 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Aug 2021 19:14:20 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 10:14:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Aug 2021 10:14:19 +0800
Message-ID: <1627870459.4533.1.camel@mtksdaap41>
Subject: Re: [PATCH v5 2/3] dts: arm64: mt8183: Add Mediatek MDP3 nodes
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 2 Aug 2021 10:14:19 +0800
In-Reply-To: <20210719074640.25058-3-moudy.ho@mediatek.com>
References: <20210719074640.25058-1-moudy.ho@mediatek.com>
 <20210719074640.25058-3-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_191831_593640_C8725F80 
X-CRM114-Status: GOOD (  14.90  )
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

Hi, Moudy:

On Mon, 2021-07-19 at 15:46 +0800, Moudy Ho wrote:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
> Depend on:
>    [1] https://urldefense.com/v3/__https://lore.kernel.org/patchwork/patch/1164746/__;!!CTRNKA9wMg0ARbw!zIYDSC1kafxhfEfpyIjKYA5S2fo7ND5cvC3uL06yjladpA-22RCjaGcPPqpKhw$ 
>    [2] https://urldefense.com/v3/__https://patchwork.kernel.org/patch/11703299/__;!!CTRNKA9wMg0ARbw!zIYDSC1kafxhfEfpyIjKYA5S2fo7ND5cvC3uL06yjladpA-22RCjaGerzVNylA$ 
>    [3] https://urldefense.com/v3/__https://patchwork.kernel.org/patch/11283773/__;!!CTRNKA9wMg0ARbw!zIYDSC1kafxhfEfpyIjKYA5S2fo7ND5cvC3uL06yjladpA-22RCjaGe4IDGnpQ$ 
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 114 +++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a..30920d6ce7d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1127,6 +1127,112 @@
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>  		};
>  
> +		mdp3_rdma0: mdp3_rdma0@14001000 {
> +			compatible = "mediatek,mt8183-mdp3",
> +				     "mediatek,mt8183-mdp3-rdma";
> +			mediatek,scp = <&scp>;
> +			mediatek,mdp3-id = <0>;
> +			mdp3-comps = "mediatek,mt8183-mdp3-dl", "mediatek,mt8183-mdp3-dl",
> +				     "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
> +			mdp3-comp-ids = <0 1 0 1>;
> +			reg = <0 0x14001000 0 0x1000>,
> +			      <0 0x14000000 0 0x1000>,
> +			      <0 0x15020000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +						  <&gce SUBSYS_1400XXXX 0 0x1000>,
> +						  <&gce SUBSYS_1502XXXX 0 0x1000>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +				 <&mmsys CLK_MM_MDP_RSZ1>,
> +				 <&mmsys CLK_MM_MDP_DL_TXCK>,
> +				 <&mmsys CLK_MM_MDP_DL_RX>,
> +				 <&mmsys CLK_MM_IPU_DL_TXCK>,
> +				 <&mmsys CLK_MM_IPU_DL_RX>;
> +			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +			mediatek,mmsys = <&mmsys>;
> +			mediatek,mm-mutex = <&mutex>;
> +			mediatek,mailbox-gce = <&gce>;
> +			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> +				 <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> +				 <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> +			mdp3-rsz0 = <&mdp3_rsz0>; /* debug only */
> +			mdp3-rsz1 = <&mdp3_rsz1>; /* debug only */
> +			mdp3-wrot0 = <&mdp3_wrot0>; /* debug only */
> +			mdp3-wdma0 = <&mdp3_wdma>; /* debug only */
> +			mdp3-ccorr0 = <&mdp3_ccorr>; /* debug only */
> +			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +				     <&gce 0x14010000 SUBSYS_1401XXXX>,
> +				     <&gce 0x14020000 SUBSYS_1402XXXX>,
> +				     <&gce 0x15020000 SUBSYS_1502XXXX>;
> +			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> +					      <CMDQ_EVENT_MDP_RDMA0_EOF>,
> +					      <CMDQ_EVENT_MDP_RSZ0_SOF>,
> +					      <CMDQ_EVENT_MDP_RSZ1_SOF>,

RSZ event is sent by rsz device, so move this event into rsz device.

> +					      <CMDQ_EVENT_MDP_TDSHP_SOF>,
> +					      <CMDQ_EVENT_MDP_WROT0_SOF>,
> +					      <CMDQ_EVENT_MDP_WROT0_EOF>,
> +					      <CMDQ_EVENT_MDP_WDMA0_SOF>,
> +					      <CMDQ_EVENT_MDP_WDMA0_EOF>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
> +					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
> +					      <CMDQ_EVENT_WPE_A_DONE>,
> +					      <CMDQ_EVENT_SPE_B_DONE>;

Ditto for these event.

Regards,
CK.

> +		};
> +
> +		mdp3_rsz0: mdp3_rsz0@14003000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";
> +			mediatek,mdp3-id = <0>;
> +			reg = <0 0x14003000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +		};
> +
> +		mdp3_rsz1: mdp3_rsz1@14004000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";
> +			mediatek,mdp3-id = <1>;
> +			reg = <0 0x14004000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +		};
> +
> +		mdp3_wrot0: mdp3_wrot0@14005000 {
> +			compatible = "mediatek,mt8183-mdp3-wrot";
> +			mediatek,mdp3-id = <0>;
> +			mdp3-comps = "mediatek,mt8183-mdp3-path";
> +			mdp3-comp-ids = <0>;
> +			reg = <0 0x14005000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +			iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +		};
> +
> +		mdp3_wdma: mdp3_wdma@14006000 {
> +			compatible = "mediatek,mt8183-mdp3-wdma";
> +			mediatek,mdp3-id = <0>;
> +			mdp3-comps = "mediatek,mt8183-mdp3-path";
> +			mdp3-comp-ids = <1>;
> +			reg = <0 0x14006000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
> +		};
> +
>  		ovl0: ovl@14008000 {
>  			compatible = "mediatek,mt8183-disp-ovl";
>  			reg = <0 0x14008000 0 0x1000>;
> @@ -1272,6 +1378,14 @@
>  			clock-names = "apb", "smi", "gals0", "gals1";
>  		};
>  
> +		mdp3_ccorr: mdp3_ccorr@1401c000 {
> +			compatible = "mediatek,mt8183-mdp3-ccorr";
> +			mediatek,mdp3-id = <0>;
> +			reg = <0 0x1401c000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +			clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +		};
> +
>  		imgsys: syscon@15020000 {
>  			compatible = "mediatek,mt8183-imgsys", "syscon";
>  			reg = <0 0x15020000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
