Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41A6C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgCpYyezhHVr5BXyPJO0Ha+60w1xPwjoSHXr+Jg7eyw=; b=yb2YtFz7+NAHr6Xu7z3WygjmnI
	v9v9eUE1hktYSXGjdbxQQF8f/J0KjJEXpKdmvdZMSTeUx9W6pHlu4uKNyVroTx7FYsOQsO+WTrT7q
	td/o1jNYqEVe5P1gGunfxfbJf7p1cTzForVkCwIDiYwHL3y/ZQaxsmxZeXhani4cJD3TYqx4R+Wtp
	ErRiv3yAWrXco8qZ4XTM7XKtjypUeacFNoKc3BOnvpu134kWHfu3gav5O60iDz+EwOPK7L1QB9813
	gzQSioCd+2rUhW61KzGwJGgCeZdvdKeGjvHRFySsfYP1Zn+y3jABtvKCMkLZ9mvP7xFPkugyKgyCY
	ek8IHMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SJs-000r6v-2y;
	Tue, 06 Jun 2023 08:45:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RJO-000ZjH-1N;
	Tue, 06 Jun 2023 07:41:08 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E8BA96606E97;
	Tue,  6 Jun 2023 08:40:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686037260;
	bh=T6bPfT4kWKXeLuDb4qVwp6rN6eB3ntz2Arg+fo8McNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AVPap7ZRIELTPbnrDMY6r4kM4eo1m72aDqA0OAzzeGCCWy4aG0N+YMyEE4vm/l71s
	 bGUqJjuyXZTpbg19sQNhTjcVt4/2JlxsMXN99ySVv9PsT2zkNhPyKVCZ0fy4EqTr6J
	 TUl0/qem9xv5yP6fNK1lnmvqnxdmP6vkjhtOE8m1ZfB8/Fvmy1kHof1iGOa99HP0Gr
	 IZ1i+xYcSn/9jPtnOdrLVhU79hzqSf8UYxiEbrUN8c964UOSJAr3/SPtWJvt23azhD
	 zPbf7JeEqDOUAUOzilaj3JT/SmMGjpaQEmR8PyzEJ0/EHB45KgzU44c9tfFKcT6qgY
	 wJZ4rF0AMsbcA==
Message-ID: <e1c6d01b-2911-eeda-373c-59dd2bb1ca19@collabora.com>
Date: Tue, 6 Jun 2023 09:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8183: Add decoder
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Yunfei Dong <yunfei.dong@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230605162030.274395-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_004102_611956_0857AA6A 
X-CRM114-Status: GOOD (  14.42  )
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

Il 05/06/23 18:20, Nícolas F. R. A. Prado ha scritto:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Add node for the hardware decoder present on the MT8183 SoC.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Qianqian Yan <qianqian.yan@mediatek.com>
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5169779d01df..8bb10ed67e87 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -2019,6 +2019,45 @@ vdecsys: syscon@16000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		vcodec_dec: video-codec@16020000 {
> +			compatible = "mediatek,mt8183-vcodec-dec";
> +			reg = <0 0x16020000 0 0x1000>,		/* VDEC_MISC */
> +			      <0 0x16021000 0 0x800>,		/* VDEC_VLD */
> +			      <0 0x16021800 0 0x800>,		/* VDEC_TOP */
> +			      <0 0x16022000 0 0x1000>,		/* VDEC_MC */
> +			      <0 0x16023000 0 0x1000>,		/* VDEC_AVCVLD */
> +			      <0 0x16024000 0 0x1000>,		/* VDEC_AVCMV */
> +			      <0 0x16025000 0 0x1000>,		/* VDEC_PP */
> +			      <0 0x16026800 0 0x800>,		/* VP8_VD */
> +			      <0 0x16027000 0 0x800>,		/* VP6_VD */
> +			      <0 0x16027800 0 0x800>,		/* VP8_VL */
> +			      <0 0x16028400 0 0x400>;		/* VP9_VD */
> +			reg-names = "misc",
> +				    "ld",
> +				    "top",
> +				    "cm",
> +				    "ad",
> +				    "av",
> +				    "pp",
> +				    "hwd",
> +				    "hwq",
> +				    "hwb",
> +				    "hwg";

Do we really need one line for each 2/3 characters reg name? :-P

Regards,
Angelo


