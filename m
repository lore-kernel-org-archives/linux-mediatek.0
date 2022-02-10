Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87488C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7W8A6GVhCfBXAk9ecrtZiCN08/vt6PDe2iPjKuEAXc=; b=X7x96MOq+b74Rm
	1DQC5lFWGg8LONRaKQ6l9RV5A03zBKbW/koC6ybgWjghBdaxZkOkU4Z2X0cyCmaP8tN/QIl4AJO9Y
	6ZjREWVxP8qSYk7lZLxnAqkQGr90Zj9dD6Y5XjJk9zDYCMSJDzvpKl5kFugpLu5Bf+leQ2cxh4n4y
	SPTB2HhwIMr4tZWtad53xaoYMVNAyjG7sDoXClWAIW2Rjj63iYeQiMx6Jkbb9eQVyQ40HVW/AegyQ
	Y/dBAV2fkBauKdG5IvifH5bzhvqWilmyb+9CkyWI8dUh7c1o7J/I1As4H+i1D9ZP+K02us36y2rt1
	m9G5k7bzVyWSyjuC7T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAj7-0046t8-C2; Thu, 10 Feb 2022 14:47:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAiv-0046rO-Sk; Thu, 10 Feb 2022 14:47:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id CBF141F46613
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644504424;
 bh=x8ccJOGqkVLBNjHNDlPI53IHQzxajU+pV1qV+lQi9ow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwhCVrM/3Rjf1m4MrkoMf1cu7ibZKzx1dyzI7pVDIRijEvr9WtlojzgV0OTVmteGt
 fkC9T9r+HgL3KOa5Ez/4/B5EdJg/nGv5oxgb6mPGsH8ISHQ8mhpcqOGQzgb7NiVpq1
 bbJ0Lj8Iv09WkIWLqdG4dHsgC6dLq1jpOYiXrcnbsMR8r0A0k8jkOZunDbpKVjj7NP
 7PnJDquAgEKF1a7+OqGMdbO2JuK2WBLcKDoXhJfQZyAjKBuBc599SCHoiKd0TUFeQ0
 gNHE209dAZbXNxl/Jtg5A+3JEKdkZbHWwuj0oVdQm5bKuw9IRp5vl2tth2VSAHFjZM
 /D598G8jZW46A==
Date: Thu, 10 Feb 2022 09:46:59 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v2] arm64: dts: mediatek: Add Mediatek mt8192 cpufreq
 device nodes
Message-ID: <20220210144659.2vkuuh74xagic3ud@notapiano>
References: <1609223471-24325-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609223471-24325-1-git-send-email-andrew-sh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_064706_106848_B97A1C84 
X-CRM114-Status: GOOD (  18.13  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Tue, Dec 29, 2020 at 02:31:11PM +0800, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> =

> Correct dts node name in patch v1: performance-domain
> This patch depends on [1] and [2].
> =

> [1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/0193=
78.html
> [2]https://patchwork.kernel.org/project/linux-mediatek/patch/1607586516-6=
547-3-git-send-email-hector.yuan@mediatek.com/

Those two series are now merged, so no dependencies missing for this patch =
any
longer.

Please rebase this patch, as there are some conflicts. I've already verifie=
d it,
and after you rebase I can send a reviewed-by.

Thanks,
N=EDcolas

> =

> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 69d45c7b31f1..a907ee7e650a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -39,6 +39,7 @@
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x000>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 0>;
>  			clock-frequency =3D <1701000000>;
>  			next-level-cache =3D <&l2_0>;
>  			capacity-dmips-mhz =3D <530>;
> @@ -49,6 +50,7 @@
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x100>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 0>;
>  			clock-frequency =3D <1701000000>;
>  			next-level-cache =3D <&l2_0>;
>  			capacity-dmips-mhz =3D <530>;
> @@ -59,6 +61,7 @@
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x200>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 0>;
>  			clock-frequency =3D <1701000000>;
>  			next-level-cache =3D <&l2_0>;
>  			capacity-dmips-mhz =3D <530>;
> @@ -69,6 +72,7 @@
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x300>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 0>;
>  			clock-frequency =3D <1701000000>;
>  			next-level-cache =3D <&l2_0>;
>  			capacity-dmips-mhz =3D <530>;
> @@ -79,6 +83,7 @@
>  			compatible =3D "arm,cortex-a76";
>  			reg =3D <0x400>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 1>;
>  			clock-frequency =3D <2171000000>;
>  			next-level-cache =3D <&l2_1>;
>  			capacity-dmips-mhz =3D <1024>;
> @@ -89,6 +94,7 @@
>  			compatible =3D "arm,cortex-a76";
>  			reg =3D <0x500>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 1>;
>  			clock-frequency =3D <2171000000>;
>  			next-level-cache =3D <&l2_1>;
>  			capacity-dmips-mhz =3D <1024>;
> @@ -99,6 +105,7 @@
>  			compatible =3D "arm,cortex-a76";
>  			reg =3D <0x600>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 1>;
>  			clock-frequency =3D <2171000000>;
>  			next-level-cache =3D <&l2_1>;
>  			capacity-dmips-mhz =3D <1024>;
> @@ -109,6 +116,7 @@
>  			compatible =3D "arm,cortex-a76";
>  			reg =3D <0x700>;
>  			enable-method =3D "psci";
> +			performance-domains =3D <&performance 1>;
>  			clock-frequency =3D <2171000000>;
>  			next-level-cache =3D <&l2_1>;
>  			capacity-dmips-mhz =3D <1024>;
> @@ -194,6 +202,12 @@
>  		compatible =3D "simple-bus";
>  		ranges;
>  =

> +		performance: performance-controller@0011bc00 {
> +			compatible =3D "mediatek,cpufreq-hw";
> +			reg =3D <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
> +			#performance-domain-cells =3D <1>;
> +		};
> +
>  		gic: interrupt-controller@c000000 {
>  			compatible =3D "arm,gic-v3";
>  			#interrupt-cells =3D <4>;
> -- =

> 2.12.5
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
