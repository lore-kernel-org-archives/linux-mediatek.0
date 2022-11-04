Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C10BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YB3MvE56ZNxNDsUzXViv+pkoyCtjTTUbobj04d6fOMk=; b=oqP+zEbt6y8k9+qD3AH76SpUMq
	aae5HwFP39zR6OgYWPpLZ07eBl9ELGyNnUi80VMkmeDqXInqSk7QwtIimvonxT47KcFceu+kDlkIz
	iGT1npGDqYIOH2/jernn5jXidlQRYqiqdn5ZmqEpIClpVJz61miUtYsKwDdk4brHG2keFYxO+MJlO
	QqF/U9/X+U9BRa7SYskkI538WRmetVe4twOusMBA1mB5N6KFh38IM+f+XaZcSwNp3IaGUFJKSpkFO
	XtuwMjBex14wvBFxeyvnEcldlo9CxYne2gCLJDVDXxO8tid6dbVj6TTZZnXF+aLRH8gnZ1Qn0B6WB
	eChX4wmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxlK-0040o0-EK; Fri, 04 Nov 2022 14:33:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxkD-0040Hk-Jq; Fri, 04 Nov 2022 14:32:34 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27C756602966;
	Fri,  4 Nov 2022 14:32:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667572344;
	bh=E4RBBVSKwbPJ3/jKWf+eXG57O7vMDBSJ35AS7H0Ljbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeuVh2DVCbj48QLsyqPk0UlTG4g5jUtsZVTT7fIxGVydicFOoGlOPyrS5gnFT0nPo
	 LpBCTbhTj1LpaWTW2Ux4O65DBImV53rBsVD/RBwMtGWqx/0pzzklwZ7to9Cvpxj0Uu
	 PtypyCcUSER01jNIkvI8TsEnwJ5N5YIQPZFQg8dc7WpWlx+lS0iqBS3t5GyVzTYLIF
	 oa+sm0Mt8Up0nDQuGSQ76snc1jnKVRJZx4lX7We4Jb4eoptVOZbSR2j3o61DvZKSRR
	 e6M6xmncOl+xB5XV3/Ffe2bpqO3Yr2glsnZoRJ9jepVw+jH1uxAZ/+J6t9F+C31U1W
	 mG5rMI9OoRMGQ==
Date: Fri, 4 Nov 2022 10:32:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 4/7] arm64: dts: mediatek: mt8516: Fix the watchdog
 node name
Message-ID: <20221104143219.aiwfezso7r72yg7q@notapiano>
References: <20221104020701.24134-1-allen-kh.cheng@mediatek.com>
 <20221104020701.24134-5-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221104020701.24134-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_073229_826790_30D447E3 
X-CRM114-Status: GOOD (  15.35  )
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

On Fri, Nov 04, 2022 at 10:06:58AM +0800, Allen-KH Cheng wrote:
> The proper name is 'watchdog', not 'toprgu'.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index d1b67c82d761..fff59dc1b4d7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -202,7 +202,7 @@
>  			#clock-cells = <1>;
>  		};
>  
> -		toprgu: toprgu@10007000 {
> +		toprgu: watchdog@10007000 {

I think you missed my comment about renaming the label as well on the previous
version.

>  			compatible = "mediatek,mt8516-wdt",
>  				     "mediatek,mt6589-wdt";
>  			reg = <0 0x10007000 0 0x1000>;
> -- 
> 2.18.0
> 

