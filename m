Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72B2C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT1Z8C/Nq7yAUjQBMMVoqDcy1rv539mBOFhzoEdfaZM=; b=btYn1Va0c9csAivd6IMyTPUVps
	SjrC2/s3noI7DPnYrhwuuGiK8W/nzNxLXzpLt+bR6IuG2dur7rOz++B70vNEzFt0KsoUJQ/hu/wVi
	MlItpqGrOLtVHMExDp1viTmwdM7/aqMsdYAKAGcCUEls/lsH/ESRcYsj8/krMlStlao8UoSwLgYYI
	9hzJQovK2x31d7gpMwpNpdMWmZx11RA2cWPBbhxQ/0HNKPj79HkCYIJUzYz6/JEd54e42+Ju/YSgf
	6yWx9QJQzvAzio0gIrqIImfZ4rUL10libCRWl8kAjD81FYY/UR2RATLJ31IJ0b8qBHaoWDhtBQbY4
	X8dbLH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6gtJ-00ENcL-Vn; Wed, 29 Jun 2022 23:14:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6gt8-00ENZp-QP; Wed, 29 Jun 2022 23:14:28 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E204660191F;
	Thu, 30 Jun 2022 00:14:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656544463;
	bh=nmzsVUux1m9g6XxD7KnJZV3F8xIZnxP4CbM5iyeqeiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tk6LjNlHKFiwNrFi8LFTIPHSY2plMOmvlwxjt1A+roeA4w3oBH8059dHAz7GkJDfM
	 SfZlbvvsd5DzAuh5fvnT+is9SO3drCk+9cybWBddu4CfOjUAyw9c2e0tHLoPKJt5q6
	 NdZGIeqJzjtHZzOGvDFOZ/fz3jadlb4l5JFt5e8yEZQuDT+CWq4AAbMgqAUlb/9zQO
	 lIEQXjcXBBorWwDWcCdi4eRIEb93NxH63/cbqBDSTo9bWcgfdAJRoohocWmP9r2Hva
	 iDn31RJr4xbrI3ZisjgJLdkMtFOzlzQkcKh8OE+bKD4jB0M9VTUd9RtQh+tsHp3wCi
	 MVhZBpA46EKVQ==
Date: Wed, 29 Jun 2022 19:14:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/5] arm64: dts: mt8192: Add mipi_tx node
Message-ID: <20220629231417.or4s554u3u7wtbo3@notapiano>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629121358.19458-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_161427_027353_1EFE8297 
X-CRM114-Status: GOOD (  13.18  )
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

On Wed, Jun 29, 2022 at 08:13:55PM +0800, Allen-KH Cheng wrote:
> Add mipi_tx node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 731bdc665b94..a07edc82d403 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1095,6 +1095,16 @@
>  			};
>  		};
>  
> +		mipi_tx0: dsi-dphy@11e50000 {

Node name should be 'dsi-phy'.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

