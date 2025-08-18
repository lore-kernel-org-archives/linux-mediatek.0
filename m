Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040AFCA0EE4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 18:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BN6viO9AroiZhanXax87FmrnbfeDUQFyRKlFlPLrw0g=; b=iuYmKzXH9oG1tf8lvY8oHL8nl8
	P+hX0gr4uY7jpBv+rAgnkQZCghicNzyloVR39c+fsWDPOS44QUCIeVxCNFUYPAqJixIz3e87HgpBz
	HFI+SA8/oxJ2iAxaCVoTMQDnSX1gkRvhjwYVzLIafnHzKe9G3lu1+NTDeYA/Imy1e9t4fbGZNspAU
	Xs4EAksHH1beJEqnVyF1yelG5QP7mwkI8dhW5UJSmmMx0oD7cemF7kS/hHJfYogUZw31eHQJl/BDd
	7OK87njSYTpAl3Fb155e+gggvJbWAw8ozH1zVGBCKV/o76as7lUkIRVaoKYknD2uTgXh0y/ziBwJ3
	MBB7JJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4ci-00000008LJr-1HAD;
	Mon, 18 Aug 2025 18:30:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3pq-00000008EPE-0rrs;
	Mon, 18 Aug 2025 17:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD1944DCA;
	Mon, 18 Aug 2025 17:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9F8C4CEEB;
	Mon, 18 Aug 2025 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755538793;
	bh=8QD47a7++31VLJAfDRpwGB9If1CqGaTD17f/6FYz41Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6yxmlbdC2RlSs2jljtekiKsQM5jIWqZJ+Ku7aZvynEbE/xmQPM6pzL4AHVbkmtX6
	 WpuaP5/BWQ5lVKSNyon1Z6LudDlLO2Pt4aaFeE95plzAB3vR1jQH8uEVMpmcKC3Y0n
	 UP4W3DM14xC0UUFmMefhjWckaXTyiIw5jGReRuuzTEvvyaqFt7ZeW/KZ/HKfd5QtRD
	 wb92NzcXPg4NtebYqv4MAwso+RaPedkvBm6TMWw9vkF/87c8uGK8KdBjfKS833je9o
	 OwiN1xQ+OkS1huVmYCYis4+uS/t8am83zztULl5bJr3hrn6mKmWIDZPPMGBIxd0Nv2
	 y45pD4a22zJhQ==
Date: Mon, 18 Aug 2025 18:39:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: angelogioacchino.delregno@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com
Subject: Re: [PATCH 0/4] Add support for Grinn GenioSBC-510/700 boards
Message-ID: <20250818-paddle-grief-9f74d59d1b89@spud>
References: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QNL9t9AvLv0U/IlF"
Content-Disposition: inline
In-Reply-To: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_103954_269362_3B1EEB9F 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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


--QNL9t9AvLv0U/IlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 15, 2025 at 06:08:33PM +0200, Mateusz Koza wrote:
>   arch: dts: mediatek: mt8390: add Grinn GenioSBC-700

s/arch/arm64/ in this patch.

>   dt-bindings: arm: mediatek: Add grinn,genio-700-sbc as a valid
>     platform
>   dt-bindings: arm: mediatek: Add grinn,genio-510-sbc as a valid
>     platform

These two are
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--QNL9t9AvLv0U/IlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNlZAAKCRB4tDGHoIJi
0rFUAQCieJA2LUW0GoG6nElADTuacveifnWDgRu5M1KHYSHLzAEA13WqioahHbk6
zMMp9bCk4IrCTNMBEKF69re78v7WsAM=
=UkIe
-----END PGP SIGNATURE-----

--QNL9t9AvLv0U/IlF--

