Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA5606A323
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z0NGmNOM;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=L+/347sM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YAdamMR8GtstdFSlMhrRzbOBWBG4qIbe0wTjGGjDiwA=; b=Z0NGmNOMZKDhlP97OZwPfHA+3D
	BFtzvyIXq+lq4L8DQZuGWbCIVAuqeb7Cv541SQ8x28aIAeyARcDfXLotR2HxvoGtpcaQX1+2LoiXw
	EU1dfG1K2oPBAegv0OnVj1Q0yQrkzSTdKZ2K9qlIQBmj/ixcx5gdUcugNTv7U0E+n4NOaNO0xfZ0w
	FKrTzp/4kBr8PT9omjOvVIS+fQQPQhbTV7G8xxYp2khAQXxyWX2o+m22NJK78NGNOnhOzxMNtNwlo
	YBqToCot2x2wXxp9Vqj4qLtWeDNcoXve+GD4cG+9BYYfsX5aH3pKr+l/6IRMUfViIVphTk9q0mL+a
	a+S92htA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy6c-0000000ET6c-0c8P;
	Fri, 13 Nov 2026 20:42:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy6Z-0000000ET5U-3vdl;
	Fri, 13 Nov 2026 20:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YAdamMR8GtstdFSlMhrRzbOBWBG4qIbe0wTjGGjDiwA=; b=L+/347sMtegLNHELLY7zT/q+Pm
	5TB2i1mEmMSSFoaCdgHLQxsIqVR6KvDa9xynuBb369HFBNfHLmT78nh8sY4m5mgTzR7fxEPydbq7z
	WaP3ADlq8anyST6nFH4pIL08mptZNcCI9c3+o6VbEXjgatNh8RTzh9Dkx8B9jOVp5NMG8HJQ+tWVn
	5yoDlXzESHbetaSid7t0LNPlpQ3ucb7gSsk6Z5ChMjnUj8+Xpwkl6F91x2IEnu23yzsZU1/szk63u
	tnVvx7WRGUOrYbIcA4t0g6nmP7y1ZOFAmLBMmhtkwxb/wHlE/+CpibnAAiYkLe6ObSOdjtKjXRc5l
	cIZMQ88A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Use DP AltMode defines
Date: Fri, 13 Nov 2026 21:42:34 +0100
Message-ID: <6TUX_NmlTWq-Z5zuCxQLsQ@sntech.de>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_124239_995001_557FDB00 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Samstag, 17. Oktober 2026, 21:59:31 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Sebastian Reichel:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)


Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Could go together with the binding contstants or then one release after
patch1 gets merged.



