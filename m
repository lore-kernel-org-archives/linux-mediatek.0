Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E090CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjQIpSFSR3PQyE2DX/H48b8ashMK9NObO3H/w20NOoM=; b=GgbHb91htZnxuF
	UBVARGjUUVAk8V7gcRURENcjsdmLe6aMaTM63CNCdmxUZIDm8xrMTG4H1IjZKTeoiJtseUyKidhw3
	ZlFOuZiqAehOfn1GKPsP4TCxhJp+GWGqGhDY9jwziJ4WCDMueCH4HF/5MrFFu48si6ttIiZUWOKPl
	IFarLY9EawMoy8D4dlQsg7ufAr3xAEOgjV55+9/PuD6uha7XZF/XL58mSi0znyUTMB4VJX4gzAM74
	83WrPoExaZ/sHDNcJKLY1xx1nrsyINl7HSMnZqF3gnT+5zKIStG4iHbxmMcVpQZ9e0dB6UKdUBkNZ
	HxOMw3tbxshkxoTtxjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3F3-008T7P-Fg; Tue, 15 Mar 2022 09:13:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3E8-008Sar-2I; Tue, 15 Mar 2022 09:12:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7638E1F4362D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647335542;
 bh=u28Nk0sHB5aIGD6kSuL/VfMjcGeiLg2nPpRYF0PqaGg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iITRw8Vuy/qMAbPzWuq075nN3Ch63cOrUwA2Dsc1f1WngMnmZucnunqX9VlSNtU6G
 83gCw7N/NLj2aH/vG3++zjZ0OAnlou3eMuUmg5xRvJuRAAfx400wc5uYFADc5wsCo5
 4WdBPzQ0j+8RnmszoPzHPTMiuc+wgxFO3tZohusTMTzIZXpcaXm8D0EfzsLcFEBPu9
 rxspCF6uIBQpSjD8UqmvS67lLQP6aVS2G2pzse+zEU06P1BESySK94ldm30U6BtgMn
 Vb7oL3stBwt1qwcuL1UtbG5zE1JYvYymi63EIhnt9RFFQdjITCz7JTjwzQMTziKDPy
 Cy6y/BZucDoJQ==
Message-ID: <713555d9-753b-2480-9597-99dfc54a8f40@collabora.com>
Date: Tue, 15 Mar 2022 10:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v13 5/6] dts: arm64: mt8183: add GCE client property for
 Mediatek MUTEX
Content-Language: en-US
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
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315061031.21642-6-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_021224_290299_A1AB420D 
X-CRM114-Status: GOOD (  13.04  )
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

Il 15/03/22 07:10, Moudy Ho ha scritto:
> In order to allow modules with latency requirements such as MDP3
> to set registers through CMDQ, add the relevant dts property.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 4b08691ed39e..fc6ac2a46324 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1514,6 +1514,7 @@
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
>   					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
>   		};
>   
>   		larb0: larb@14017000 {



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
