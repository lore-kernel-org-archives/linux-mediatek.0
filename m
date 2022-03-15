Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE14C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrxEBf2oe3h6hjtvxmxVjCBIiFzX8FHN6kMy6e5UB9k=; b=Jwi0dRX3/5wzZY
	2Wgx1SFnYhVCPtJjXSfr8TDvljHlvzr+nvjjJ3lQ1cwM8F98DKjXZk6UAuwBsNuP6RB7vOP2u5/qW
	jfoYhd7xlEQp+qdzwe0it+5Aqphsb4QafMvHmWB/SLgGBoFPKu4tChBNDPVhUx7YVAOs/p4h2/uRm
	xQOZILdK33qzZ6RmfMfuVHUV+j6o3VkZ7KzOyhjp4lY3ltFgs/uKzd1EnSwSn7/BNdsGbHiFshMak
	Q59Dn9tC1xGSlQj2rq/c3Ska0soj22vL66hW5LtFm048g3EtPoKPbH9vtDwMHv/pbxKkfkJ2t/spg
	Oeg3VcAOKoCPgKVKLEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Kh-009Uwf-R2; Tue, 15 Mar 2022 14:39:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8KP-009Uq7-Jc; Tue, 15 Mar 2022 14:39:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9773E1F44380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647355152;
 bh=+uXxnDg10Cf+ufXL862eCjkJ4f88NJ/VQyoGpWcd7Qs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y36doFKf4npPYWCd9y3nFrv1m4lo956dMyubnypYTjdWhPwrF4U7Mheu5Ig/7FYeS
 qwGI/sxoSpGD6NaPBiGBm7ZlLc1CGLl0/AdPYIZNrRCCkXdVrdvQTM8m63CmUDW6Xw
 A9rtJ1fVca+A/VCFehFtJHuD4wOFpWBcYPXzw6d0GoP50jiSYEBe0kSrbSAayYr/0F
 ZNnrPfdWFLqWzlEQSXmrE5Kglrol3lebiHpMMllda0Cl0szEptUyphr+x4tUdPZ0DR
 3zTXbtIOnMQ7VteODe1hpb+b5RlrnImlB/2iYNzm7oRe9tmLwLP8DQSHh4FZGfaaA3
 /HsfSKGZCtzgQ==
Message-ID: <c47d6a99-e59e-97cf-a803-af2b307ed1d1@collabora.com>
Date: Tue, 15 Mar 2022 15:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 16/21] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-17-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-17-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_073913_832783_A88A417D 
X-CRM114-Status: GOOD (  13.09  )
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

Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58 ++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index ac69033737bb..5fd1fed354d0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1285,6 +1285,64 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>   		};
>   
> +		vcodec_dec: vcodec-dec@16000000 {
> +			compatible = "mediatek,mt8192-vcodec-dec";
> +			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS */
> +			mediatek,scp = <&scp>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;

Hello Allen-KH,

please, use ranges whenever possible. Example:

			ranges = <0 0 0 0x16000000 0 0x26000>;

			vcodec-lat@1000 {
				reg = <0 0x1000 0 0x800>;
				.......

			};

			vcodec-core@25000 {
				reg = <0 0x25000 0 0x1000>;
				.......
			};

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
