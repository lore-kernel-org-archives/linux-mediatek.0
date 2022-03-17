Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4226FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nd7exFMt8r6PEt6uyvfndJUVeRcqxKUrhRJeEQ0nWKM=; b=tyA8Dxgl3aGayV
	pJpLuYO+4tlUUyyw3arocAtVEIeehFj3N8U+qSEoWKQpqOUxJhU2/mm00mEe+2bP8AHFgPsJA2Wzm
	7fIResTiuRjlfadOyTMT5dD85xAc0JlP9kn/M0w79VOLU4dQcoh3G5wXkyZjaowWWzi3GcUV6Megp
	hd/RagZEaHhv+upRRyOBFkxYKMiBvS2G3H4kiaGSpltfL6HT+SxO98np1bq69w94qC6NPFLkU7RfT
	+r4Dq30BhjklluDT5yflTKTbhxIWW25VoSPAGrJmMoG+issZoqbEBVz76UJ2cem6LwKvOtomwH3F4
	CHBuMs4lnXIJPLzwXB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUs1b-00GcyO-6p; Thu, 17 Mar 2022 15:26:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUs1O-00Gcwe-KF; Thu, 17 Mar 2022 15:26:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B64971F456E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647530793;
 bh=N6sXIB4tZHSfu8sioVrrbQ2OzG4ay+Ac+T6fW/1wOmU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ck7jNYDoW55MF0tjfj7BuIKgrrmpqUFpDYY1QcPjVGl4/oVildblK97n/EmMonvhb
 lY+u5o/+FEmYPE3wi7xLB7rP9WjMmD6dxJXWELrcKYRC/zcNJafijuydRAL4HRplr8
 0FEPbainA9LPc25cFFtwHbEpJ2zy9iMTbA4Lq4oQny3gqjHBcIQ9sWd5kUw/sCr4qn
 dhTWO1vKV+glkPZpWTEAceMoj4CuzDucRVAyAm7usmdL4y5+2QWQ7y3iVAUXbyW289
 Q3iST7QADd2x3be9BERrRUM39Mlrk0T8YrvMotACcW/7YxgnOIlEWsuRRJXVZxnA3X
 KVyZreAtIlgbA==
Message-ID: <7e898858-510a-dae6-2ef4-1cb8b1a42b21@collabora.com>
Date: Thu, 17 Mar 2022 16:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 2/3] dts: arm64: mt8183: add Mediatek MDP3 nodes
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
References: <20220317145605.25782-1-moudy.ho@mediatek.com>
 <20220317145605.25782-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220317145605.25782-3-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_082638_893043_272EB934 
X-CRM114-Status: GOOD (  15.16  )
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

Il 17/03/22 15:56, Moudy Ho ha scritto:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 108 ++++++++++++++++++++++-
>   1 file changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index fc6ac2a46324..eaa6dac7768b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1389,6 +1389,79 @@
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>   		};
>   
> +		mdp3_rdma0: mdp3_rdma0@14001000 {

Hello Moudy,

I know, this is already at v12 and I'm truly sorry for noticing this only now,
but that's a bit critical to solve: you can't use underscores in node names (but
you can do it in phandles).

Example:

mdp3_rdma0: mdp3_rdma0@14001000 <-- THIS IS WRONG

mdp3_rdma0: mdp3-rdma0@14001000 <--- THIS IS OK

of course, that's the same also for mdp3-rsz0@..... and the others.

Please fix this both here and in the yaml bindings in patch 1/3!

Sorry again,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
