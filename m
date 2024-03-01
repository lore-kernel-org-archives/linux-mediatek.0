Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72421C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVU5TBBuvXaA/GKkeGvNB9RMdnsg1B5l3lZdDd8/v3M=; b=J6a+noVfp6+LnB4u1dBXeYesKg
	bsxFKvyZHzpvdQgMFQMCQSwrt+q0mOoTzqKnmDHhzNHrxemAdozfsOyUC8YKC+G4IYzg2BwZDGlIg
	YVHTMQ0dui9hM5tROZWGvQRMyBtS5sfRL2ZTQWvMeX3tRvQCkxU/OVIisZbxdTheXBAJ4AEhrvzDl
	dSJKwI47kqbHKD89gi3QEFNHq3so9+P0ndzLbaf8MHGsPlaO+A4P0jMq3HdfjTrMmlgh3hXoX55KG
	kYPaALl1IoSQ/FLpZs/KVphNcz9VhoFFg3yTa/Vipg1uPmNvkd82f5O5udYDId5dZlDnzD+Zu2L6j
	qIyGkd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg3tP-00000000iNB-2QDm;
	Fri, 01 Mar 2024 14:29:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg3tM-00000000iLb-3Cr0;
	Fri, 01 Mar 2024 14:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709303376;
	bh=nvJnYNYyucBPeQr/nVGXVi1XuD8qdFqM2n7ZyMnuH2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wUo3hmm2q3+B1Uo6imzzhxD0/dknlOteIL3PKRiEDs6phs4YxTT94I9OikTFIYiAg
	 zxnEAnBzipMkhh7lpBZivCrdb8RPiuYBuApDBzp6oMIGYwhDdWyZaTKCqfIyBB8GS3
	 6bJ4w9L+f2h1WGp+ijiepRUkzDbLim+gXSG6rE5IRu0KoOIqzIOtOOGx0YhgiPENxJ
	 J8KDugMpceDKF4jCHJ3WRmP6C77TOwsfX7e0PK9qfFk89fr3iY0b/ASPmDM+1IhsHr
	 coUZteLM2TEZlPROEHJWCKmcSB5kN7f6vcg8xfQ3PN/pjHP7izjlEPzXdfVhZiSi/D
	 gpFDmzJxaVDGA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BC4553782076;
	Fri,  1 Mar 2024 14:29:33 +0000 (UTC)
Date: Fri, 1 Mar 2024 09:29:20 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: cherry: Describe CPU
 supplies
Message-ID: <d18d9397-37d1-45b0-ad1e-239d64360e38@notapiano>
References: <20240110142305.755367-1-nfraprado@collabora.com>
 <20240110142305.755367-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110142305.755367-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_062940_957645_F5BC47EC 
X-CRM114-Status: GOOD (  13.42  )
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

+CC Nicolas Dufresne <nicolas.dufresne@collabora.com>

As he told me he was experiencing the hangs fixed in this series too.

On Wed, Jan 10, 2024 at 11:23:01AM -0300, Nícolas F. R. A. Prado wrote:
> Describe in each CPU node the regulator supplying it.
> 
> Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Moved supplies to CPU nodes
> - Added fixes tag
> 
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 3c6079edda19..1f3a6755f155 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -264,6 +264,38 @@ &auxadc {
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&mt6359_vcore_buck_reg>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&mt6359_vcore_buck_reg>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&mt6359_vcore_buck_reg>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&mt6359_vcore_buck_reg>;
> +};
> +
> +&cpu4 {
> +	cpu-supply = <&mt6315_6_vbuck1>;
> +};
> +
> +&cpu5 {
> +	cpu-supply = <&mt6315_6_vbuck1>;
> +};
> +
> +&cpu6 {
> +	cpu-supply = <&mt6315_6_vbuck1>;
> +};
> +
> +&cpu7 {
> +	cpu-supply = <&mt6315_6_vbuck1>;
> +};
> +
>  &dp_intf0 {
>  	status = "okay";
>  
> -- 
> 2.43.0
> 

