Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00E3C624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni8LvFSJr+XgYvhSP5Cdjh+BAaWLohkeApHNkr1D8gg=; b=UaoNoVwckFAouInj6Z6wSdAnF7
	DnXd5eeAPs9qfr+JeMean2FudsudJUnDhhJPR23V6UX3EEcxGmCZDtvWl5Oc4FfnCKs/abDu9i1Al
	N4gN29SDpjfeaW0sXknfNCas70urbH0GF/hoDX0wPySEXIbi/M8JKPopL3BqlLFDqCelZg1t5xhb2
	YhDLAecWcsOZx49ApDIoFaa3Jwni59nDLow/vLZiT/NjIRDoePWxUDnepY+9PwwcJrEYHjUmSU8Pv
	idzBMplsUR6fkkdWUFcBkhmvnHBHwuszCM3UZPhAS7suRKaSrnPCzaJ/brPM35Edl3/EbTzxvicyp
	1gb1RDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PKv-00000001NZ3-2fMA;
	Fri, 04 Sep 2026 08:31:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PKs-00000001NYE-0ZUA;
	Fri, 04 Sep 2026 08:31:47 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788510701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ni8LvFSJr+XgYvhSP5Cdjh+BAaWLohkeApHNkr1D8gg=;
	b=gttbMfVVlEFz0vwmhyl2UM7QFWXHhN7dt7R+1bsEHeKIgAH8sOFUAljmU5Slq8DnBldN/L
	PbBgAYX5a4HSVVnDtM1YppRAxGVoaGu2rK+qxoXKDYgIWDjMJFj8SHeRufakemijRthssk
	9l17gITZVrV9eaKKbjNnqO0FkoVBfV2VfrZhGYRZO4l4N+QEwy3MdwUU5w4Uhay1ZfNj53
	S5jhuW5tSItcx99d9W6hLYaZfQr/KfrQqA30hw5bZhNcTEc4wqfy5upmo5hCqEWiJwX5rF
	KdRHrK1OWEoXK5hEXJXutHiubCFb8QCfynLbPmFhrPYEdbaiZjmazFu1KNmKRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788510701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ni8LvFSJr+XgYvhSP5Cdjh+BAaWLohkeApHNkr1D8gg=;
	b=zstC7P9hAO4OqH4XqbNAIJmdq79e8/C2mtXgbCCc+HkMZ99jOLLbrwhGA5OlrpZ5Mt4Mew
	XxHSfG2uSXSQ5+BQ==
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
 dario.binacchi@amarulasolutions.com, mkl@pengutronix.de,
 mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com,
 jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, hauke@hauke-m.de, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com,
 clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org,
 rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com,
 andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, amadeus@jmu.edu.cn,
 kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, daniel.zahka@gmail.com,
 nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com,
 haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com,
 lgs201920130244@gmail.com
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-omap@vger.kernel.org, s-vadapalli@ti.com
Subject: Re: [PATCH net-next 11/33] net: dsa: hellcreek: Remove comma after
 sentinel-entry in match-table
In-Reply-To: <20260904043724.2955444-12-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-12-s-vadapalli@ti.com>
Date: Fri, 04 Sep 2026 10:31:38 +0200
Message-ID: <877bl14dud.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_013146_325188_65E93348 
X-CRM114-Status: GOOD (  14.15  )
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

--=-=-=
Content-Type: text/plain

On Fri Sep 04 2026, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

> ---
>  drivers/net/dsa/hirschmann/hellcreek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
> index 2c6cabf61143..aec50414986e 100644
> --- a/drivers/net/dsa/hirschmann/hellcreek.c
> +++ b/drivers/net/dsa/hirschmann/hellcreek.c
> @@ -2093,7 +2093,7 @@ static const struct of_device_id hellcreek_of_match[] = {
>  		.compatible = "hirschmann,hellcreek-de1soc-r1",
>  		.data	    = &de1soc_r1_pdata,
>  	},
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, hellcreek_of_match);

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmqageoTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgmpcD/0ZDNE5OcjIaORENBAJWFAfQ8t8cbUh
WxjiC8fuzfyKdtApGPQhshKlZofeGLdoAehqDcWBUJDl0J3RcQ9Ctr0P8l3MZdsd
y9/sT1oyBhsd95NPT96hkZILmwnEvQaSsCZSKbGVgNRbbZt/xNkpYuOjIPX8S2hl
r27yN9gFoVJsLAHISO8qhZo7t5BDC0qS/Qzyz9qht0XQIfv3SFiw4NO8orcRg0KA
T2fwrgVYmo7Qof2xOvtJ6feG6VrptC8hESQlQlFZJ6n6ceeWwy9lzGE6XsYqIFaN
23gkwiMHTfhrmFSGbGCZS5XL8xVWhmi52cNCUPfnUIQesxmVjUCiQbccli6qUJac
HDXlcN61mtTozJ36MTplagiLTRd6E7VemrUOCS8zL102tpoWBBjK/B0q/A7lHP3Q
eGlbD2OX6pdggFhilV6Ig6w+aggtjQ2aUhY2tQj9uQ/RXRUJcjd+6JVV+ESi4Gw8
oK6+a1yTbPAccgeRsKfKH33xOOyRLlaLStYp7TsNSTa2tLu5mOv0K+YC1uchFd82
a3xDgTDaT6l35FoPZZawkcShojIkr1doEiQfbKeg7AbOjUvUI+OYoYnRdpIR81pc
BhVu/HDfLVb3r8MXb6z8f0pulfgjpvxVAJJatZgmEJxPSkzOeBZvSY8cm+PN5H6k
WTJGMjW9Vm8MMg==
=3DPy
-----END PGP SIGNATURE-----
--=-=-=--

