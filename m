Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891F3C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYW0BJ5hkbSQOg6rc7tWvbFzTNx8YU6FPv0jbpd/xmA=; b=EkH9QBvGmGItU5KHrkMEEW+fjE
	sMvFSuSk3Mn9lPLy70XmKg/9hG9TqUqelw/jo/jf7VntXC3aM165PEdNXA88FLQSlBOcCFr9/16Lc
	xXQPBfVSSshS9HI5LdPD2iSRB/PMJrAQpMmqEBqzcjuKMLgA6TcRX1Nwit2keHezweILf8FKa6K0R
	ZE43AGo0/KX9FCTOeJn7g32cmbyco/Er93OgE7aVvtR6yfXNKUuyblu7vBq6dTKhzHnLqqABBYg+5
	CcUxRChe1WkDQqL8MkxoBrN7yeQD0DFEYl+Z+FU9Yozg7ivUydNFIAGefRnLZ+3hlZx8g+hT0aIRt
	rs2esGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7EWm-009HAD-26;
	Thu, 08 Jun 2023 12:14:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7EWj-009H9X-0I;
	Thu, 08 Jun 2023 12:14:06 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63A0E6606EF9;
	Thu,  8 Jun 2023 13:14:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686226443;
	bh=ngSvI4aezt9aOvaiq1z7uwbLyB+T//8r6HBFM3EABh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jlqNziZ+Uk43sIsUE1CUWBbr3v3utLbiMF3K3RbR7RmyJ8nyiOqEBq04/GHeHunSE
	 2W26TlABa+BsTAbVdqgrh/xcNwCt8h736g3QW66HehbzgRsXiJNz40up/ydF/KY9be
	 gFtxJfwN4NjDiNF6s+C32j/DN1BQp+V6lmFeNhUvNg8KMo9QfAL+r/unueg+OzEgXq
	 u3Pm33hxCmn3ZHinMoPeNraM4j7c62kGUDrTyBnMMwKQNgO/ViHTZtcEUaosi7D7p4
	 X5FSxOUAJ+TibDRnyyF8K4QFbMDS7ADwQF8l6xiTNeBaLVsa4iBIEDJwTl+0P3Z0vo
	 gBkwts/PPdgcw==
Message-ID: <b61c7d8c-85e7-2248-d386-ffec8c275aa4@collabora.com>
Date: Thu, 8 Jun 2023 14:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8186: Wire up GPU
 voltage/frequency scaling
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
 <20230607090653.2468317-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607090653.2468317-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_051405_300923_43FAA38E 
X-CRM114-Status: GOOD (  19.46  )
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

Il 07/06/23 11:06, Chen-Yu Tsai ha scritto:
> Add the GPU's OPP table. This is from the downstream ChromeOS kernel,
> adapted to the new upstream opp-supported-hw binning format. Also add
> dynamic-power-coefficient for the GPU.
> 
> Also add label for mfg1 power domain. This is to be used at the board
> level to add a regulator supply for the power domain.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 140 ++++++++++++++++++++++-
>   1 file changed, 139 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c58d7eb87b1d..a34489e27cd4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -695,6 +695,142 @@ clk32k: oscillator-32k {
>   		clock-output-names = "clk32k";
>   	};
>   
> +	gpu_opp_table: opp-table-gpu {
> +		compatible = "operating-points-v2";
> +
> +		opp-299000000 {
> +			opp-hz = /bits/ 64 <299000000>;
> +			opp-microvolt = <612500>;
> +			opp-supported-hw = <0x38>;

For all of the OPPs that are supposed to be supported by all speed-bins, you don't
need to restrict them to all "known" bins.

Please change opp-supported-hw from <0x38> to <0xff>, which literally means
just "applies to all revisions".

> +		};


..snip...

> +
> +		opp-900000000-3 {

What about calling those like "opp-900000000-bin3"?
Makes it clear that it's tied to what MediaTek calls a speedbin "3" (as we're
interpreting the values in the nvmem driver to make them compatible with the
opp-supported-hw's expectations).

Cheers,
Angelo

