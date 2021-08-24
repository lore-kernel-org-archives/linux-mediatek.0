Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A71C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:03:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C26861248
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C26861248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Gy9wCKt5E7Za66LbCsQMZmEX8R3hHQWuJsZ8UfkVvM=; b=my42D8AMxrOzuu
	R6RELvYpqzOdEPg5JHHv0f88ErsJADTNdOVe3u2rzpKM5pJKFL0ZTwNVlzpBPAJpQwaVJXVeivb3I
	W24V3g20hKALIYnbMV1YkWq+VdM+i/CNl/FgogL+TD+adEirhvGPUhxJa87hjdB17FzHsUoaCfuou
	Ur+xO8orXLP76uC+zPN3pVbnl6EI4zmxqTbkMWm4JTfQ3Vikzu5aEYRYu9ax/T9bTJyyIPhRwpKcu
	MtrfC+KKVkpUAQw2DBkoxan+cdlidlFevIcaySlKdX0hPwibkGT6+tBa5vAR35HWBjxgw7YgeRung
	pGHhFr0Y2Po7rKPhV8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIOaH-001cnf-MQ; Tue, 24 Aug 2021 05:02:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIOaE-001cmY-0B; Tue, 24 Aug 2021 05:02:47 +0000
X-UUID: 95e69f07e13d4953ade338fa453c39fd-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0texKuvZteNxt9wEtesBFIUFqL8ARY8YyhEvugrvtV0=; 
 b=RhaQJSOw0AJ1agMDllI9i8YlrAfkRs8SDUwjbPgAaVSeFB5G4rCj04EdeVWh1HYuw7YtdnI29BtuDh5iP9cxt8gHUnM307mc94jWmmIA4bK3AR8Kp3q+A02N2A/SS6gNuXb4tceQJP5yzmE/EXi7BxIvKlj0SGMtbLH6N81NWz4=;
X-UUID: 95e69f07e13d4953ade338fa453c39fd-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 142538801; Mon, 23 Aug 2021 22:02:41 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 22:02:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 13:02:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 13:02:31 +0800
Message-ID: <1629781351.32243.3.camel@mtksdaap41>
Subject: Re: [PATCH v6 4/5] dts: arm64: mt8183: Add Mediatek MDP3 nodes
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
 <srv_heupstream@mediatek.com>, <hsinyi@google.com>
Date: Tue, 24 Aug 2021 13:02:31 +0800
In-Reply-To: <20210819070954.16679-5-moudy.ho@mediatek.com>
References: <20210819070954.16679-1-moudy.ho@mediatek.com>
 <20210819070954.16679-5-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_220246_080253_9B0B943C 
X-CRM114-Status: GOOD (  15.01  )
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

On Thu, 2021-08-19 at 15:09 +0800, Moudy Ho wrote:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 110 +++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index f90df6439c08..7cb1fcfeefb6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1232,6 +1232,108 @@
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>  		};
>  
> +		mdp3_rdma0: mdp3_rdma0@14001000 {
> +			compatible = "mediatek,mt8183-mdp3",
> +				     "mediatek,mt8183-mdp3-rdma";
> +			mediatek,scp = <&scp>;
> +			mediatek,mdp3-id = <0>;
> +			mdp3-comps = "mediatek,mt8183-mdp3-dl1", "mediatek,mt8183-mdp3-dl2",
> +				     "mediatek,mt8183-mdp3-path1", "mediatek,mt8183-mdp3-path2",
> +				     "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
> +			mdp3-comp-ids = <0 1 0 1 0 1>;
> +			reg = <0 0x14001000 0 0x1000>,
> +			      <0 0x14000000 0 0x1000>,
> +			      <0 0x14005000 0 0x1000>,
> +			      <0 0x14006000 0 0x1000>,
> +			      <0 0x15020000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +						  <&gce SUBSYS_1400XXXX 0 0x1000>,
> +						  <&gce SUBSYS_1400XXXX 0x5000 0x1000>,
> +						  <&gce SUBSYS_1400XXXX 0x6000 0x1000>,
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
> +			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +				     <&gce 0x14010000 SUBSYS_1401XXXX>,
> +				     <&gce 0x14020000 SUBSYS_1402XXXX>,
> +				     <&gce 0x15020000 SUBSYS_1502XXXX>;
> +			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> +					      <CMDQ_EVENT_MDP_RDMA0_EOF>,
> +					      <CMDQ_EVENT_MDP_RSZ0_SOF>,

CMDQ_EVENT_MDP_RSZ0_SOF is sent from rsz0 to gce, so move this event to
rsz0.

Regards,
CK

> +					      <CMDQ_EVENT_MDP_RSZ1_SOF>,
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
> @@ -1378,6 +1480,14 @@
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
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
