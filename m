Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv2C7ByF+J6IwPd5M4Pw66XXVikpfcfDPMnCfu3yzCg=; b=l+zFS9d96JCjTP
	BSciIXJPEe01Oflu9MmvmAICY1IU32ADvive8dyucUM8HJhSY8w2JTEmH+EPaISJzoziVScXAzDNT
	XArYyBFoqz4Q1DeSQkWddRUL1FsxVvi12XWD5PPO6zVyEz9fTXbFOzq6zrKX2h2RKghQd6o7S60p/
	hpxnBQu4qdV9o5AC1x987+Tisxg03oc07UCyrTfsD7O69OCAGzdENjbvuvJ+pxMrk9GGCXLpemOfV
	Udei4Emk+2vWOYEQN63E2G6H+3+parK8phBOleE5qKFZOnsyTYQMW04sz0MMuA1gPTRgJiUhuRepD
	sUCDCGA5PNYXLNiKqiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbLxH-00Etpq-Mw; Mon, 04 Apr 2022 12:37:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbLx6-00Etlc-83; Mon, 04 Apr 2022 12:37:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2DBFA1F44659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649075818;
 bh=XbLfwMKXJkz6MxHKBidnhRWo+AyuXXqSQNzQrjCWxQE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OxtjPaso8uKDX+NcM3s+he+mbywxsV8V4QNBBSrU+y0eaQF07rfRdtzEoBBwUHQR/
 hwcrdSDvcZZxLicA5/ywh+baAjGkhoIJqS7fbG1ZEqB9OH5V0jSBzP5oLWjFPWRacP
 bQ3sQY8eitB+hP7BgRvCkl8WNWhCC4dMm7xHBWmsqVpqHY4Er4+o2gxI5i1HcXZ8Hi
 umO5qQrXWtvbQmroc6dV7rJDNvnS6IZR6vbmXdJ1G7wDlMehCiBFX0IDERiI9Vg/+j
 UU+5ndHU7p6yDhvqXyNScGyKiJnVfVHnWyQ1ofWJvx8IN9EyJUgSraMuVjpvUmR7iW
 5AHqsGzY8IICA==
Message-ID: <329bed03-770d-106c-29b4-eb1d6037bf65@collabora.com>
Date: Mon, 4 Apr 2022 14:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220401053052.2160-1-allen-kh.cheng@mediatek.com>
 <20220401053052.2160-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220401053052.2160-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_053700_442471_42D6189C 
X-CRM114-Status: GOOD (  14.00  )
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

Il 01/04/22 07:30, Allen-KH Cheng ha scritto:
> Add mmc nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 33 ++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index a6da7b04b9d4..23eb92057cb9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -989,6 +989,39 @@
>   			compatible = "mediatek,mt8192-msdc";
>   			reg = <0 0x11f60000 0 0x1000>;
>   			#clock-cells = <1>;
> +			status = "disabled";
> +		};
> +

Hello!
Please explain the reason (in the commit message) why you're disabling the
mediatek,mt8192-msdc node, which was enabled before this change.

Also, introducing the mtk-sd controller at the same address as the mt8192-msdc
clock controller will produce a warning...

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
