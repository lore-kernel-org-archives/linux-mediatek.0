Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB15C25B06
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXEB9BGMhotIAT1sCB2xLv2Sv4CG5HwMrB+b76+KusQ=; b=usJ4X42s0G+Plfut0vd8UPtGow
	Eda+9kA33vA6qjb86AwIUg0pqqUEvYfTcKChZ30Z6NqG9A0VCXTBV3ND1kkq9nyY/0VpOpQsnc8g/
	Yc5NPQLTNZceS1n4mjGYBIlFxZUfgCZXZiF8f6KTISVnIj/ZtvDi4/fjmxS1jE6SKO6DZPABwQLgd
	ME+zWN4LNNFt9Brgk7KJ+URGYYFw3yX9kA5o9NiIQgvfMz74Y2qWIizXELPSjwOYiPAbnu6/3M0wl
	9jIc7xvrq8Os53MkNgwDZ7lWyaFlITA9YMN6JeyZ2p3iE0E2++0i6bP6AUvK0SYd/6jGDopMaL4Js
	7K2Dyvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJk8n-00A08N-Qo; Thu, 04 Aug 2022 23:20:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJk8c-00A05A-DE; Thu, 04 Aug 2022 23:20:23 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8887A6601B8B;
	Fri,  5 Aug 2022 00:20:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659655220;
	bh=T0qa+MBJicKTTAZecGrlpW67BsO3JhfQBcWJNXRa4zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hH1TgnyvKoh2vVAqSo9D86sEPyQp9coth65EX7I5eUQx1zM2/dicl2FTfdJNQkBvz
	 KspkfArJl68MM4tj//R3mx7eW/CtBz4mI4gHGSGG5+uG5cRKXeglv9/eh05xzedmgr
	 JaWDG3SAxSgKH+1d0PsF2WmRgKqPce6H535Wx2LfoWCQjSMwwLcPvkCOO2FvoBvT2/
	 bipN9umw3NmBsHaIQVOugavHQ+tnhuE05FMe5rX60Y8VSfX7HE37VyasHD9nGbhh+A
	 Fil0Mc38682UP0nno7MpyiPESI3P3ShO669oOE7bSswoeY3tTVh4+Yv1ZKS4gGsi+I
	 2NnqbtkScB3ng==
Date: Thu, 4 Aug 2022 19:20:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8.1, 3/7] arm64: dts: mt8192: Add thermal zone
Message-ID: <20220804232015.wz23cjuh73zceoa5@notapiano>
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-4-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804130912.676043-4-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_162022_610258_6677E076 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, Aug 04, 2022 at 03:09:08PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> This adds the thermal zone for the mt8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 113 ++++++++++++++++++++++-
>  1 file changed, 112 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cbae5a5ee4a0..3320b5c14ee3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
[..]
> +		vdec-thermal {

		infra-thermal

> +			polling-delay = <0>;
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&lvts_ap 4>;
> +		};
> +		img-thermal {

		cam-thermal

> +			polling-delay = <0>;
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&lvts_ap 5>;
> +		};
> +		infra-thermal {

		md1-thermal

> +			polling-delay = <0>;
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&lvts_ap 6>;
> +		};
> +		cam1-thermal {

		md2-thermal

> +			polling-delay = <0>;
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&lvts_ap 7>;
> +		};
> +		cam2-thermal {

		md3-thermal

Thanks,
Nícolas

> +			polling-delay = <0>;
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&lvts_ap 8>;
> +		};
> +	};
>  };
> -- 
> 2.34.1
> 
> 

