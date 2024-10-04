Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15830CFA753
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQwPC/jDW5YcmakoKXZwCSqi7tPdpTIysw/I/EzXieA=; b=oDlgPQGDwwRrIU2StVMghjE4m1
	ZHznkbIflNDh9zzMN0x+5O+B5dmSKGzBioCHxRnxGyKmmTLIBahNM1zU7tTUArUNs4axW1QTxyC8b
	cJz+EFR+nqwusJGB7nIdc5LVWmknyQ1mzSwySO07FOGO/lqItdW4hF+Ajj6EG0r8bYVH3eoZjZgU3
	Glv8sSKUTbszBnx2tj2wyAS3Zon6LgAJtBuw+6ZS1CcdPncg0sxvVASCel/alfeeILrSFlMOpRQcw
	YrSKd3Qg+7UXYQOnTNI0+QPv94RLmZzGvoVdg2VpSiRcOi88C3cSdGHhOzmfio4mn9VABpi6O6n+F
	rMdJo34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sweij-0000000Befo-1jeI;
	Fri, 04 Oct 2024 09:35:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swegn-0000000BeHs-1PNt;
	Fri, 04 Oct 2024 09:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728034409;
	bh=lYH7i3scXm5wsbzJSm6pT1NMbSAV+hb2CZmSFlix9O8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l0j2Sq28nEGkc3kbl2+ymSu1dWRJRUaI7SQjjUIv4zVsDu9n5BSeb6Waf2XnQEpVu
	 MGFHJjEtOHr6AzzAMshKfzTVbkp1MoWmwzugnOE3krEP+qQDgVdTWQ+EPkTHYtAFwA
	 6KEL4X+pHawTQc5BPEFGFOi0EgZSvbgQtNT1aduKFhh1w8WurPUH0xXj0LDy5AljwG
	 atLMS1VBgwBO7QTzeZ2Ftn/pAbO6deZh54O9b/1RARLlSBRSpL672jk7vbTkZAovbC
	 xx45WXl9T6rJ++94fYT3zx44rlLWx/NJrPiw56bxDKw7JJan4ZhVJjQxhnICuxxzho
	 BJRvI5q8VFc8g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8995817E1147;
	Fri,  4 Oct 2024 11:33:29 +0200 (CEST)
Message-ID: <1432ee2c-ef74-41ba-a9ea-6a70943a929c@collabora.com>
Date: Fri, 4 Oct 2024 11:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Add platform supports to MediaTek MT8188 SoC (part
 2)
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241004081218.55962-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_023333_561155_10E4324F 
X-CRM114-Status: GOOD (  16.35  )
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

Il 04/10/24 10:11, Fei Shao ha scritto:
> Hi all,
> 
> This series is based on top of my previous "Add platform supports to
> MediaTek MT8188 SoC" v3 series[*].
> 
> There's nothing to change or address in that series at the point of
> writing, so I decided not to resend it and start this new "part 2"
> series instead.
> (if I need to update both series next time I might consider merging them
> into one)
> 
> Specifically, this continues to introduce the following platform supports
> in MediaTek MT8188 SoC to lay the groundwork for the board device trees:
> - PCIe
> - MIPI DSI
> - video decoder and encoder
> - JPEG decoder and encoder
> - vdosys0 and vdosys1 display pipelines
> - DP-INTF
> - eDP and DP TX
> - aliases
> 
> Please have a look and feedback are welcome, thanks.
> 
> [*]: https://lore.kernel.org/all/20240911143429.850071-1-fshao@chromium.org/
> [v1]: https://lore.kernel.org/all/20241002114614.847553-1-fshao@chromium.org/
> [v2]: https://lore.kernel.org/all/20241003070139.1461472-1-fshao@chromium.org/
> 
> Regards,
> Fei
> 
> Changes in v3:
> - add the secondary MIPI DSI
> 
> Changes in v2:
> - add linux,pci-domain to PCIe node
> - add power domain to PCIe PHY node
> 
> Fei Shao (9):
>    arm64: dts: mediatek: mt8188: Assign GCE aliases
>    arm64: dts: mediatek: mt8188: Add PCIe nodes
>    arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
>    arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
>    arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
>    arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
>    arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
>    arm64: dts: mediatek: mt8188: Add DP-INTF nodes
>    arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 668 +++++++++++++++++++++++
>   1 file changed, 668 insertions(+)
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

