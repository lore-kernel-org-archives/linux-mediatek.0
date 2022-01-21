Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D72C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUsGYFyg5sbgzlcpdYPtji/xTduVkXG1/2BJTSYhLfY=; b=kiXDHYAM6b3L2UuZydcxDMkSY9
	lf0XXU4t2LgRvJFmHLJNDEQl2ot+hmOnfz68bfkFwFfWSzRPKdVwj9xGsL1q89fPT5epoY8CbuFC/
	bNy0PzaNBW/sNDewN+WYNjKbZUu3yTSj5DMjCbYFUxTvm8WU3XTlwixWX32k5NS9Rk2VLVJ4VDYts
	OQdwK5Prwld8vNG9gH2prpuS9BuGn1b1l+DiADvHAwDFQIHklGzNdrUGUOwqSAG25sZ2fYc+lVCxw
	yFiZ7qnb2JFwUVyBGwjBV481i4pLK1WsnUp9KOjOm0uh1oLuqzEqQg2rVX9Gg16n1g+ek2monkJiZ
	p9tKCVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAsZ1-00ErgA-N8; Fri, 21 Jan 2022 11:58:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAsYk-00Erbl-Fy; Fri, 21 Jan 2022 11:58:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C608D1F452FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642766305;
 bh=sve0CVVBkT42bUYJR3+ftznqAKSkXJa/FBYt+PZbAAw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=J+sk2ZTFVI1EG9Pgo8xj/GoOcEC+Zk981jYXrwz0V4a8/PPTgCVdBUw1bzubErSo8
 Xfh+zOWj4NsU6sb/XWAi0q/tFkWul03sOgHfl7WUGd39TXyzIz8ZHShWy09iyK+0a/
 xiiNaHIfpx7dgd2NvJ1wZZj4niROw1byWj5TbvQHk2Fy6RzjbF7C3raUcH1TZqIcKf
 yLZVyWgLQzMoZhdX4hZTA+H6mRdPoUFWZdT6njhP/Ao3YW63dfoWnMPUj05DU3v22V
 7/f2sDyDraE0b1+II1nfHrWMe/ZKiNpz0aruAxOK391XNUxbzQQy/nWNWTNhb1ZEDl
 ZCDx5f3Ov8V0A==
Subject: Re: [PATCH v11 2/3] dts: arm64: mt8183: add Mediatek MDP3 nodes
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20220105093758.6850-1-moudy.ho@mediatek.com>
 <20220105093758.6850-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d61ec481-8059-a897-504a-0125f88fad61@collabora.com>
Date: Fri, 21 Jan 2022 12:58:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220105093758.6850-3-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_035826_717343_3C223D2A 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/01/22 10:37, Moudy Ho ha scritto:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 108 ++++++++++++++++++++++-
>   1 file changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index ba4584faca5a..b872ef1ff6b3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1325,6 +1325,79 @@
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>   		};
>   
> +		mdp3_rdma0: mdp3_rdma0@14001000 {
> +			compatible = "mediatek,mt8183-mdp3",
> +				     "mediatek,mt8183-mdp3-rdma0";
> +			mediatek,scp = <&scp>;
> +			mediatek,mdp3-comps = "mediatek,mt8183-mdp3-dl1",
> +					      "mediatek,mt8183-mdp3-dl2",
> +					      "mediatek,mt8183-mdp3-path1",
> +					      "mediatek,mt8183-mdp3-path2",
> +					      "mediatek,mt8183-mdp3-imgi",
> +					      "mediatek,mt8183-mdp3-exto";
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
> +				 <&gce 21 CMDQ_THR_PRIO_LOWEST>,
> +				 <&gce 22 CMDQ_THR_PRIO_LOWEST>,
> +				 <&gce 23 CMDQ_THR_PRIO_LOWEST>;

Hello Moudy,
the mboxes for gce 21, 22, 23 are missing the third cell. Please fix.

Regards,
Angelo

> +			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +				     <&gce 0x14010000 SUBSYS_1401XXXX>,
> +				     <&gce 0x14020000 SUBSYS_1402XXXX>,
> +				     <&gce 0x15020000 SUBSYS_1502XXXX>;
> +		};
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
