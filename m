Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C8BC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieLKQNCZWgOskIK9sS2Uch3dze7yMHmKEkWDggGEKUc=; b=W+6JscHTH91Kcw1nuY5VVOtbdw
	TZTpfh/ru14xbfJ1sY4ci07hMCHgzYph3UNQ8JEqt0wbxdWHjxkGaDenzSbS+M+Y66a2+qhmHHgiy
	Hwi3xB2Dt7iLnysh+wTgPy8jIW1VrzmdeRyTGeSMdTsCVUlEsNkaFR6DQZr+9/nrASxCLiCe+A0Hx
	HgPWoknxi6c63bHaMa/wxWfxxsvU3C0Gzdj34JoyDT4o9URX7O3SFbac6XXsRbAbSIj4syoduoahy
	KR8A98jRFLC/Zp5KDtXaIlQRMyhuLIzOaVSOUpAhu58IxCbKSxbHU3uRwbVXYECGMlrqAjH/zyXFd
	tRJm8FLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfybG-0000000GzW6-0N5f;
	Fri, 01 Mar 2024 08:50:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfybC-0000000GzUE-3zqC;
	Fri, 01 Mar 2024 08:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709283033;
	bh=p0+gL2pGtqtFlpqt0S3w2xlnVMGKK7Z0m4Og3mVvC2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uo/WGCtA6Dqs1bk7v68YrMs+VoVpdYlx5GyjyYpIoL6TALzcXa9P5nppoKgA2l9L4
	 ChPQ+9u1IWbw0s/aIJUIrkuLSD8peA7zPMMp9kz+iTVtO94i4PBppkXQSlvYFDPJ3/
	 UBh//ttvR5FMLF+RuMFyBO5aFR/7so6atM5lhlaRe1AQTSHLlOnCVd8M67pM72jqLe
	 7aGNRg8p7tC3XD3Y2DxOqSqf+AykymBmRy8wl70w7Vn4oJtASLzHMRb7taee6yuj2Q
	 oCvnflAu+hvSt/AoWX/fU+GY69bhUIJv4I6bLBeUJti1odttt1BdC2F39YvHDEsCTE
	 XTSym6OW6jL+w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9AC9837814A4;
	Fri,  1 Mar 2024 08:50:32 +0000 (UTC)
Message-ID: <22e2cf1b-9560-4f4b-b08b-a112e8e272a8@collabora.com>
Date: Fri, 1 Mar 2024 09:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8195: Add missing
 gce-client-reg to vpp/vdosys
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
 <20240229-gce-client-reg-add-missing-mt8192-95-v1-2-b12c233a8a33@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229-gce-client-reg-add-missing-mt8192-95-v1-2-b12c233a8a33@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_005035_163692_FD938171 
X-CRM114-Status: GOOD (  15.62  )
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

Il 29/02/24 20:44, Nícolas F. R. A. Prado ha scritto:
> Add the missing mediatek,gce-client-reg property to the vppsys and
> vdosys nodes to allow them to use the GCE. This prevents the "can't
> parse gce-client-reg property" error from being printed and should
> result in better performance.
> 
> Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Can you please squash patches 2,3,4 in a single one?

It doesn't make a lot of sense to have them separated in this case, only
generates commit noise for no practical reason imo.

arm64: dts: mediatek: mt8195: Add missing gce-client-reg to vpp/vdo/mutex

Thanks,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index ea6dc220e1cc..f2912e1a0e49 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2028,6 +2028,7 @@ vppsys0: syscon@14000000 {
>   			compatible = "mediatek,mt8195-vppsys0", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
>   			#clock-cells = <1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0 0x1000>;
>   		};
>   
>   		dma-controller@14001000 {
> @@ -2251,6 +2252,7 @@ vppsys1: syscon@14f00000 {
>   			compatible = "mediatek,mt8195-vppsys1", "syscon";
>   			reg = <0 0x14f00000 0 0x1000>;
>   			#clock-cells = <1>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0 0x1000>;
>   		};
>   
>   		mutex@14f01000 {
> @@ -3080,6 +3082,7 @@ vdosys0: syscon@1c01a000 {
>   			reg = <0 0x1c01a000 0 0x1000>;
>   			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
>   			#clock-cells = <1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xa000 0x1000>;
>   		};
>   
>   
> 



