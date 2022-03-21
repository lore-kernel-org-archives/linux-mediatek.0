Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E3EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBP46qFwUioIgaYECS/7qjlBkvBamiczGGENFFSpiOo=; b=MowsJALATzuOGQ
	pt1Y2uRr/44vOOdSHrig/GyJoTA+kCwL8dcWhekL1aYLcu9taMj4KFTo/aUnmrKBRY3WIEXP1GNRf
	/rtyry9JkSjuMQ24r8F2ATLryuyNaViMC0W42CXjxNkufJznM4uzVOqQeb+3odFVifBaIb3ENOdrO
	RLl4PUmwyjpBzQ0OqDHF+vjhq9z2SurXBvNSRxzK9AiIDBcj7WDwVxW8CIqEqWqHF06paPLHFeURN
	pBYuC24pI+FIA5py8iE3eYlJCmTRshgXc8xjR32GavyrM0Udz5dqE+JrzBtz+IGhafrJN1cuY8iRM
	SW0nT1tj2Pae3Jq4O9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQXm-009FCP-Ry; Mon, 21 Mar 2022 22:30:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQXa-009FA5-IS; Mon, 21 Mar 2022 22:30:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EB1D81F42B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647901817;
 bh=dFAsJXFVHpj6L27TiVAj76slpePHnCZeJGPIhOfYCBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxvWJ72cpm4nlluTG0iCgd2ziG647YzSolB4dxZnRO85gg4mrgijbJeZL6LTxb1l2
 pbpmGP9/0UpQnCZ+qrHlR7fj7kB7qNuY0CRU4pyvzloXxtG7vKjEAamIWEH82W06X3
 R8m/KRlyY6iUk+AzQJaVFJOjWm0muPpMYznIttYtzFv8UzkN/ky0Mc0HZldN7ZM8HD
 UjHJfz5hNBJQ40v84w9v7VnMumX0upmZ2l+MuH4r8DJvKz36Q2ZMgQiJu3br1Eb6+7
 /SWphaLm19v4JzxXKGxvoFsDAWSUPn32iAj7bA3FaeX5u+djgv6/ZbwiUs9u3Zb6li
 nv/+Oxk8cgwtg==
Date: Mon, 21 Mar 2022 18:30:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 10/22] arm64: dts: mt8192: Fix nor_flash status
 disable typo
Message-ID: <20220321223012.4sbj63pywc4mjqvc@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-11-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-11-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_153018_763343_6BBBED9D 
X-CRM114-Status: GOOD (  14.37  )
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

On Fri, Mar 18, 2022 at 10:45:22PM +0800, Allen-KH Cheng wrote:
> Correct nor_flash status disable typo of mt8192 SoC.
> =

> Fixes: d0a197a0d064a ("arm64: dts: mt8192: add nor_flash device node")
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 3a7f93d8eeaa..75c21edccf85 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -934,7 +934,7 @@
>  			assigned-clock-parents =3D <&clk26m>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> -			status =3D "disable";
> +			status =3D "disabled";
>  		};
>  =

>  		i2c3: i2c@11cb0000 {
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
