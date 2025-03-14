Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9F6C282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhGL/5dP+r7ugB7Q7VSeJZ/+Dft2bf2TUcqfmLnrLYA=; b=w/n1ytzlQMDCDPcv8tp1dZ04Db
	5LMUREs/X0/+KJuTUFw5dHIG7FHaGQ/aIo0nVnOe5IFTunGrkwvikgKxUkIo4SlWOxvsU7J8K1oil
	MqmxgpogMQTHqfQMNBDDzl90LivWkM8njw/JDcO91Sun3yAzLuEKBgKTu0Jr/ve4E3dXFwzFYH5Vh
	u7vPbTuugVZW16cTFbwzmb68GSuslOGoENevFEY9/Bxjhemr5C7+HBdRm3gr3QwnX2VYmftS9XP5N
	2JOljZYARctCv6vEkJ76LdX+Y8mcDhZRB3fN8IlNGPD/qrMuoEgzn8Go76bkJ/IyJAHfai/rNMM4F
	eS5BqIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAKB-0000000F5G6-1smH;
	Fri, 14 Mar 2025 19:04:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAIV-0000000F51R-0fQ2;
	Fri, 14 Mar 2025 19:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EA865C4341;
	Fri, 14 Mar 2025 19:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355A6C4CEE3;
	Fri, 14 Mar 2025 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741978937;
	bh=6FXnnEH09QAZ8cazzLfIiksMA3P3FtrJqIeAvTlUtZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug4sIOBCu/atbRHws0kDAWy+P5JRCWkjk10Zl3FLpFAtgKe9A5Uem7BJTId/TGUOU
	 j7vwrcb4rZJcwex9/ELOavYmCYBdGo5p0vvWxXrM0E1G4siGrk+myBlWzNZy5umxmq
	 PEBcZtM8OxpuaFmiPPVS10CjJFTLgFWfMofJK86xa31Ki67vsNJDHlZtIrVCx04EjD
	 0fGaMIt3VpbtboLeO/oQzxgqVc+vf9FAsjOLzCZcdgiHpF/YYFofa1zJQhV4gU3Cn/
	 dRqzB5ucYs9eEA2Ohfxd5/tzmh5ky4yShDRLraFXOHwAY8JSO7Hm5x8US02JVWHtEM
	 bN+S6ZWSr8APg==
Date: Fri, 14 Mar 2025 20:02:15 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: airoha: fix CONFIG_DEBUG_FS check
Message-ID: <Z9R9NxIsMAyUZFYf@lore-desk>
References: <20250314155009.4114308-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZYNFFCFDJf0hCka"
Content-Disposition: inline
In-Reply-To: <20250314155009.4114308-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_120219_253125_42DDF2CC 
X-CRM114-Status: GOOD (  16.08  )
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


--FZYNFFCFDJf0hCka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The #if check causes a build failure when CONFIG_DEBUG_FS is turned
> off:
>=20
> In file included from drivers/net/ethernet/airoha/airoha_eth.c:17:
> drivers/net/ethernet/airoha/airoha_eth.h:543:5: error: "CONFIG_DEBUG_FS" =
is not defined, evaluates to 0 [-Werror=3Dundef]
>   543 | #if CONFIG_DEBUG_FS
>       |     ^~~~~~~~~~~~~~~
>=20
> Replace it with the correct #ifdef.
>=20
> Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index f66b9b736b94..60690b685710 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -540,7 +540,7 @@ void airoha_ppe_deinit(struct airoha_eth *eth);
>  struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
>  						  u32 hash);
> =20
> -#if CONFIG_DEBUG_FS
> +#ifdef CONFIG_DEBUG_FS
>  int airoha_ppe_debugfs_init(struct airoha_ppe *ppe);
>  #else
>  static inline int airoha_ppe_debugfs_init(struct airoha_ppe *ppe)
> --=20
> 2.39.5
>=20

--FZYNFFCFDJf0hCka
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9R9NgAKCRA6cBh0uS2t
rEjOAP9PNYodICfGjmIM6RqqwfDUTqlRvi1GK0wpap1X8ufqJgEAl2iP+EBO7tAb
SxEklWiXoPTNumH+pUYGDB1aGt621wE=
=8zdq
-----END PGP SIGNATURE-----

--FZYNFFCFDJf0hCka--

