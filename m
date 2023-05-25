Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BEBC7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 17:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUIjFqzcrpeBqmah2FyGx6V9JaYtCRb2xK3mZSonWRQ=; b=jergWXxQfcMsskRZ7C/lO4DNng
	SNpfVxQ+G63hDLz6th9rdvx7naS7vQ+vQWk8vCrocO2E/CyNiPkA3F+Szw2xyrtBTGzU2E6rQfVyR
	SZItDg50Qptpgo7JNdbs2K0xbVqW4DQTmBjD40y730tyIrJIvEEs6gftNO99v4hW04DqJMAHk3Emq
	qlcf0C0iZDQwsB0retUXPkrRAoityDsclMlgGUto7S4f+uid7xp5XIr5tITDWrKTz7uyJ2V8F8TBP
	yynbXmGyoepbBbKNuGwmA4QIbgeJQrwMZMaLltrQq6MAlHxhN6aygSYhoL5HesnIkxWD9KhINcc3L
	Q4iTXzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2F7k-00HILw-0G;
	Thu, 25 May 2023 17:51:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2F7h-00HIKy-0g;
	Thu, 25 May 2023 17:51:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9846464804;
	Thu, 25 May 2023 17:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167E6C433EF;
	Thu, 25 May 2023 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685037095;
	bh=mHitxRuzsrCDz6wDtNkPxZg0+Qj9SmhuC0cgq49LxIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tR70UQHUyQLmkKcT9W7ECQblM2idV7tY1F7GXcQ5RJr1FKLYiTgrQaByckJxSrQTy
	 X7P7eBJ+koJyFqxOyogc2FfJjWHlhKHt55A1gy8Rucz+95H7x21E0xbXhRQQWcdOH5
	 0NJB3uG/wDQfBtj7kFZd3ShcFc5X1kfJemTTM7a5Xselgi3D8kWGRatL1rS2ZCTSCK
	 lOV50B8onXaN4Wuz6ew/EoCAk22YPm65z5lKBFjqDalaQaxo4IhWvRmUCL0e+nZP2Z
	 2EcBNnoELEmnWC6Ff3ebzBgllFLua2s9uZmZyM/YlixCxciD82eSPZaOu/xQBunjFO
	 jAYpjylzuIrgQ==
Date: Thu, 25 May 2023 18:51:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
Message-ID: <20230525-snuggle-twine-ed1bfc2aee51@spud>
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gOHHGwI3MUXVEdah"
Content-Disposition: inline
In-Reply-To: <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_105137_294862_B25F0C48 
X-CRM114-Status: GOOD (  22.71  )
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


--gOHHGwI3MUXVEdah
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 04:50:27PM +0200, Alexandre Mergnat wrote:
> The =E2=80=9Cmcu_pm_bclk_ck_cg=E2=80=9D clock is used by co-processors an=
d should not be
> added to the kernel driver, otherwise the CPU just halt and the board is
> rebooted by the wathdog.
>=20
> Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
> re-shuffling index and then preserve the ABI.

How does this preserve the ABI exactly? Please describe exactly what you
mean by that.
Also, what about any other users of these definitions, outside of Linux?

Cheers,
Conor

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8365-clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt=
-bindings/clock/mediatek,mt8365-clk.h
> index f9aff1775810..0a841e7cc1c3 100644
> --- a/include/dt-bindings/clock/mediatek,mt8365-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> @@ -199,7 +199,7 @@
>  #define CLK_IFR_PWRAP_TMR		46
>  #define CLK_IFR_PWRAP_SPI		47
>  #define CLK_IFR_PWRAP_SYS		48
> -#define CLK_IFR_MCU_PM_BK		49
> +#define CLK_IFR_AES_TOP0_BK		49
>  #define CLK_IFR_IRRX_26M		50
>  #define CLK_IFR_IRRX_32K		51
>  #define CLK_IFR_I2C0_AXI		52
>=20
> --=20
> 2.25.1
>=20

--gOHHGwI3MUXVEdah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG+gIQAKCRB4tDGHoIJi
0gjeAP9v0bdBygFs8MHWwrW4JshVYCnje5trYdbmwkeisP5Q7wEAjon3h1OrMg3d
GI0plInpgzPg0QIkgLGH6LFkO/vw/Qk=
=p2Bs
-----END PGP SIGNATURE-----

--gOHHGwI3MUXVEdah--

