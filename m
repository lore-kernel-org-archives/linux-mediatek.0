Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8p9Yl/PolA6danSCV37z3SzRBMONVxUs75XQMqRq8v4=; b=4pGIPav6lKmPt7
	bF5dqhxfJ4t1fwK6aJWyB8ZIku99iu6cFlP9pz2KMYZ+j5h8Hf8G261LN68QEJWfoimi47Lg8qn4M
	N0Csaiygf+4pcJ75ucngljkS1kYoKbkim2PSt5B8x7ckqduKnDefZCHKBb0leEPD8oZ+SwBHOCjiN
	WmABE6BHYkdr/v2dJpK4EnuadFm/jiq2YRWhPIiVtlfXD70xaiGRa14uIMcQkfwGQOXA7n2xQ070L
	TCb5Dj0f4LjOgRYWyXlYY2shbcJ12f0uK9YRefVWXPgqU3sJDjsQPQD3leV9ol04K3wtKtqfmzSwj
	LSdGvFygZKciAGaylg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3H4-00EYk7-LA; Fri, 18 Feb 2022 13:26:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nc-00ELSC-0y; Fri, 18 Feb 2022 12:55:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 36BB21F46724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188946;
 bh=gJeBHmxNUcShhM9B80s0rTYRD0AkGGRVSNN9sHVW228=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=nZVEQtNuhdxqtX/k3VDOxfsE8KyU+gqBGGFR9AuZaywEySAwrfK1XjW69cBFy/+FP
 DJi/qQQ5sNiFMyL0J1flBsGwIAjH+NHquG5GNN6zkkaDUdiG0inaKFUT2FqQulQoEC
 Lz0sURCnEvZbKNxDc0a72tFBqnNBnQqFMM40q2+82rSN7GkLK7jdLd4deDfI62aG1+
 NJgEhU0FBMt0niNPjhKyBzEqhwv2L8ELSrCN0bit/ErtfdQ7GhH9P3o06ArA3t+5Tc
 IZh7qR+pKgKUZYqNI2VSzIARTPUrQb3EjZZhZcR634njYq8UUitUoGOz3qBJMAJ0Up
 vv3hr6JQiPD8w==
Message-ID: <c84ec638-3134-fc1c-4761-7f1ec8381a39@collabora.com>
Date: Fri, 18 Feb 2022 13:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 09/23] arm64: dts: mt8192: Add infracfg_rst node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-10-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-10-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045548_258834_BA454C0A 
X-CRM114-Status: GOOD (  15.34  )
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

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> add infracfg_rst node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

For v3, please mention that you're adding simple-mfd to allow probing the
ti,syscon-reset node.

After the commit description fix:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index f93fe3779161..a935a22babbb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/ti-syscon.h>
>   
>   / {
>   	compatible = "mediatek,mt8192";
> @@ -267,10 +268,23 @@
>   			#clock-cells = <1>;
>   		};
>   
> -		infracfg: syscon@10001000 {
> -			compatible = "mediatek,mt8192-infracfg", "syscon";
> +		infracfg: infracfg@10001000 {
> +			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible = "ti,syscon-reset";
> +				#reset-cells = <1>;
> +
> +				ti,reset-bits = <
> +					0x120 0 0x124 0 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: lvts_ap */
> +					0x730 12 0x734 12 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 1: lvts_mcu */
> +					0x140 15 0x144 15 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 2: pcie phy */
> +					0x730 1 0x734 1 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 3: pcie top */
> +					0x150 5 0x154 5 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 4: svs */
> +				>;
> +			};
>   		};
>   
>   		pericfg: syscon@10003000 {




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
