Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EA1CD6E76
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gpLjyqUi6wcjJjAwFjG693BPOH5KzH0g4x8Uy+z3TU=; b=ozMw+FlCWyRkSBUfkE4eylAw/K
	gnhzzQ2vvh4tqJ3jBya+gZkYP3UllaYTWVnh/Qpjo/Rd1mz0YRzEult5O4i5T6iUV7ug+tVeE6Xri
	uddBpn0dNwSf3PuLIt96zirzezj/uAeqaypTcsCdRjk8HUOBMl4b5UVnIHLgXhgoYQeBRcIIu76z9
	BwmrXBNdigbXFg7Mg/WHchd0X40vVly65hvBEZDkNlaHXBC9PpoGXckZcA8+w4gOKSgDJWyHnhQjp
	e1SSVQ23cIjJt2JTpCVw8JXIlJJL7Lq9qLI0JEUlc2AqGa0YRpMJJHLMyc6HJ9KV1KwOJRB10oqdr
	+PpoGVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqa5M-00G4tf-1o;
	Wed, 11 Oct 2023 14:21:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqa5J-00G4sE-2W;
	Wed, 11 Oct 2023 14:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 136ABCE1FA3;
	Wed, 11 Oct 2023 14:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DE4C433C7;
	Wed, 11 Oct 2023 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697034071;
	bh=2gpLjyqUi6wcjJjAwFjG693BPOH5KzH0g4x8Uy+z3TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWkuPTZWxq7VqSIH5U9qpBsgJvX1VZMMRSMMB2ruW/80qHsTSP/8yLlmPr9otIEfl
	 50GofoSBBobrbKfk9FChIXKZI7uU54+yXYNK7ujGNXaPNhwnTI+SKGVXqDzHlwhoMA
	 cJ/0x17C5B+oTd92yl+oQolj1YN9x+NJt/U+6wCgsGHG/znA3JVPVFGBflSmmBMnSE
	 /uw1M6puMBDLYPIc815P1UN2VGiyXNt+grmXMuTAJuqmKjBxXT26F5bo3vQT3uPh7p
	 R6s2z3dhNe3nzODxN43Ak8fFffsWsnOuyRKJiJ3MaT/JbHZAwURGNltmhJDUx+PeOq
	 KUrhAtp7Egd7g==
Date: Wed, 11 Oct 2023 15:21:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Roger Lu <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 3/3] dt-bindings: soc: mediatek: add mt8186 and mt8195
 svs dt-bindings
Message-ID: <20231011-motor-equator-db141b74726a@spud>
References: <20231011034307.24641-1-chun-jen.tseng@mediatek.com>
 <20231011034307.24641-4-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zBOX+bhAlTIL62fW"
Content-Disposition: inline
In-Reply-To: <20231011034307.24641-4-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_072114_000642_817E1A1A 
X-CRM114-Status: UNSURE (   9.26  )
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


--zBOX+bhAlTIL62fW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2023 at 11:43:07AM +0800, Mark Tseng wrote:
> Add mt8186 and mt8195 svs compatible in dt-bindings.

This commit message just repeats the contexts of the diff in prose.

> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--zBOX+bhAlTIL62fW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSavUgAKCRB4tDGHoIJi
0sqKAP9Z6J6MQ/uOMPuXIPe5q8SmKRkNtaXcVNBweiVeryHgeQD1F2xJdjmsESzy
iLjBjIDhUP9NvRUTQD/+6R2i+r1OBg==
=pNdI
-----END PGP SIGNATURE-----

--zBOX+bhAlTIL62fW--

