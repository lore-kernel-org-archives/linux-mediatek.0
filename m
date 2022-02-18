Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF450C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqS0m6mzo0A8oBFAlO78kTBhsu6JhS8DWFb6eDCwusA=; b=tUAenFUgHLSrsl
	apKL27TBndY7C0vHADukMxJprBqpNJbR/9fBRPKMIWt69JikHAIpR8W5kr6qhhcwtKg/jycF7bYvC
	lrMJJaMR+dElYKfcVgsCh3xqiVgTfik0nGryxyilPzcqFjIpLA5gWBTzIZR1+uZ+3E6ewzTMB08k3
	GbF7HubAG+aUcT4cjRN5WGwgAlsjUo4HU3l4KBFnzaapKqHpiJRfJIb6rs18zLa0ZTZEYHKyMpecD
	t8B/hL3ScRTRzVch6jKbqEMxifG22wDXzoxU2RRl75+ISIAbGFTNTI3GH7XxnjuOPOoXFZO5CmiQr
	LnMbOkXbKGBj0Tlcyv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Hv-00EZ61-8T; Fri, 18 Feb 2022 13:27:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nf-00ELUA-PX; Fri, 18 Feb 2022 12:55:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D34331F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188950;
 bh=AlyTnLmhORNwZ1RUlUCeby9qHWIa7NQ/vAwxJ0QHz5E=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=BqAzjeSe61Vw4kn+wAhUjkIctXCWmc8zNa78w/6pWVOlSRg57PZuC9PiQE1/uruD6
 mPVgkUN2rRpWhRjdmaSC+Z6XAw8pVw1opgV2HQXeInyRaqu78MWDxOjxZufaeWbByC
 8nJGw0blViFg0UBl7yYBPmVkkXEIZ35Evil+zFfNhzYnzTUYVx7QigxHleTMj5wHzw
 JQ29Gg0rUqUUa6VzokLYdri93J+kPsdij1Jkt2OJ4nDCRuaTV85fBDVCyYd6ip3eRi
 x4ibXuz84X5rAVZMsnn8e9BT14tGmwcV6qOoqvYoaw7niW+tTdxQMBqRyy3hwn+XBF
 R45cBzMKFEhcA==
Message-ID: <6bcad8b0-7836-77f0-5040-e76b20c04a4e@collabora.com>
Date: Fri, 18 Feb 2022 13:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 11/23] arm64: dts: mt8192: Correct nor_flash status of
 mt8192
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-12-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-12-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045552_052742_1939AFEE 
X-CRM114-Status: GOOD (  13.82  )
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
> Correct nor_flash status of mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

The commit message should be:
arm64: dts: mt8192: Fix nor_flash status disable typo

...and it should also have a Fixes: tag.

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 4533c794effc..f51fd0f6c356 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -936,7 +936,7 @@
>   			assigned-clock-parents = <&clk26m>;
>   			#address-cells = <1>;
>   			#size-cells = <0>;
> -			status = "disable";
> +			status = "disabled";
>   		};
>   
>   		i2c3: i2c@11cb0000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
