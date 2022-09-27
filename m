Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F85C6FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu4oSMMGqA3iJwUi42kCvp3gQEajsNmIJ/Zg4JP7oTA=; b=r4+J2Lp5+blTMh/EWIDSO3NLFI
	OYoSOl7w4XsLdWWoXf0dADaX//YgB27167KA7t6oIS71PjvuKkroMSa2AL5P8qlURH4uuks4hJwRK
	R4vA7KrQsAqkt2h7Zm2txNHzrUrCDrTdy2hcG06xChFSe1+Jl90sW3tBI9kmsqGKEySJzo3bJXKaD
	FUubxXzADO7fNLgWkV3J0x4vLzDJxQeMDIQyQP5VM3mMN9vuFOmdNYcYiAB46lNWELrx8AHep3AKh
	DQVUNADaGyLc9lJAJcmtsE46Itk0hycgAZbJPLPTb7OIHxWwBx/OKjcN9rKHQ9khLapXeGEtbkzxq
	LlZMwMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7ib-009ojZ-MW; Tue, 27 Sep 2022 10:21:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7es-009nxQ-6u; Tue, 27 Sep 2022 10:17:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24306660205F;
	Tue, 27 Sep 2022 11:17:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664273864;
	bh=7wR4aKFBkGMCvGamAc8HpHgnpBEoOFulzIiiRlcUJk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ECbaEJmsym739P2zjraRuvwhHYHrEbx0C87wEcCgFWlUXFFFTf06BTHk0EuEd+3YR
	 sXMNhuXS0mKiSAemPTxBlWuXHfqNtzT7bXGXouAk8nXazsleff4pEhtjRNxuE7ZDEq
	 UILb/v7ZIBRNKvZsS8SHbU2eWOvU1gtMt76fHekd2WzOPv2hz4NeT+AqxGSdnrI11+
	 7vX8LDqKgqMoALFIYTh9oB/vIUHy4qd2WfPbSLm2nqSB+bxP+gtTd6ArVA5HiEKd4b
	 aiSz6iUoaEYRw95pCYDBbFUWJjwIDOeI5IS0qRHRjDRU/45WmqGlh2FS0nrbDdmner
	 bGmBrp0yEBtsg==
Message-ID: <05ed341b-2db3-620f-7a70-dcebfaa66f1a@collabora.com>
Date: Tue, 27 Sep 2022 12:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] arm64: dts: mt8192: Add vcodec lat and core nodes
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220926105047.19419-1-allen-kh.cheng@mediatek.com>
 <4d1e8600-f73d-8d2b-2e7a-1b75be7624bd@collabora.com>
 <d71334b63427df73d01ff1b9fa4d2dec94ad9c95.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d71334b63427df73d01ff1b9fa4d2dec94ad9c95.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_031746_398239_B49525C6 
X-CRM114-Status: GOOD (  18.98  )
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

Il 27/09/22 04:19, Allen-KH Cheng (程冠勳) ha scritto:
> Hi Angelo,
> 
> On Mon, 2022-09-26 at 17:29 +0200, AngeloGioacchino Del Regno wrote:
>> Il 26/09/22 12:50, Allen-KH Cheng ha scritto:
>>> Add vcodec lat and core nodes for mt8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>> Change in v1:
>>>     * Replace node names with video-codec
>>>       [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
>>> ---
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60
>>> ++++++++++++++++++++++++
>>>    1 file changed, 60 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index 6b20376191a7..214dfc6b0ed1 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -1449,6 +1449,66 @@
>>>    			power-domains = <&spm
>>> MT8192_POWER_DOMAIN_ISP2>;
>>>    		};
>>>    
>>> +		vcodec_dec: video-codec@16000000 {
>>> +			compatible = "mediatek,mt8192-vcodec-dec";
>>> +			reg = <0 0x16000000 0 0x1000>;
>>> +			mediatek,scp = <&scp>;
>>> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>>> +			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0
>>> 0xfff00000>;
>>> +			#address-cells = <2>;
>>> +			#size-cells = <2>;
>>> +			ranges = <0 0 0 0x16000000 0 0x26000>;
>>> +
>>> +			vcodec_lat: video-codec@10000 {
>>
>> Allen, this won't work :-(
>> Check Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>> decoder.yaml
>> ...the schema requires vcodec-lat@[0-9a-f] and vcodec-core@[0-9a-f].
>>
>> If you want to call them all video-codec@addr, you have to also fix
>> the schema.
>>
>> P.S.: Did you try to run `make dtbs_check`?
>>
>> Regards,
>> Angelo
>>
> 
> Sorry, my bad. I alsways run `make dtbs_check` to confirm dtb with
> bindings. I just think we didn't limit node names in mtk-vodec
> bindings. I will pay attention next time.
> 
> 
> Since currently the vcodec lat and core nodes are absent from the mtk
> dts, do you think the child node name should be changed to something
> more general (ex: video-codec) in mediatek,vcodec-subdev-decoder
> bindings?

The video codec is mt8192-vcodec-dec, while the other nodes are describing
the VPU instances (and/or vpu cores)... I'm not sure.

Krzysztof, please, can you give your opinion on that?

Regards,
Angelo

> 
> Thanks,
> Allen
> 
> 
> 
> 
> 


