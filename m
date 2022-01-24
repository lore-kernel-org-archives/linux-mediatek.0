Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9506EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad3r7jrDjNedenz7TgD00SZVmMx1FRYrpQKbcSAWYks=; b=Pr+74nZbWSXEh0sspoczIGP/3/
	Qoy11kH3YKadP7oeRJzBfi7ee/V605CVG0A0bAR4/HMC6CnuBnebl4hvXpzgxgrz+FwgjgvVT1B3+
	Z0TTq01xaK2Zsg+grn6EYdRVNhQiUL0ulJX4whib4tFJurFUgWM+Ta5/JyEvPRdsVs+JW1ikC3QMd
	IWKXiXJ1E5q9Fl5mgO4x5XOXdpi5eB0etWT5qrYKf3ztV9CwDJXjXnj4J97Cdk1rgsJwR8/1rfJ+R
	/yjJvgIk4fwfi7Q6RVpcESyRbwWRXhIFl4hTmsQkS9AQEk94d2IhO4ERGSwWggq8N1Ks+Ym3FL30E
	XdxJgkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBzIg-003TXc-C3; Mon, 24 Jan 2022 13:22:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBzFO-003SCN-F1; Mon, 24 Jan 2022 13:19:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E51766125F;
 Mon, 24 Jan 2022 13:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B266C340E1;
 Mon, 24 Jan 2022 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643030341;
 bh=+MVWVjmHsnFdqdROLxwGRRRLpP1Y39im19Biy0aR7pY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P+5b48gFcOvXNA1kPuEgkWwiohSql6bvOlD4rcDMp1k0RgUBRwGF2R5h8hrbgw2Yj
 nWkq1CsdUA7gf3tEeHUtiDtKd1ZH/ERYW4cPVpy9YPXGEol6MdKwVNPcB/sK0DVot9
 C/M9xvOvyoUNTFipB6if0+s79oKaV5YuAYxOSqB2QTO0RRjnYUq7K9AYzNc1ER9aZc
 KOjxx9IBUruoUfm/XbKe1L/TTtEG+7e1gbyyhjm5dK3TSoSCcQXK5tV0/ErwDquH0U
 beQu+Em2O21CVew9Ps2Sj3p6klvoKU0FnJfNvcJMQUkj6jXgUyyit9/PrrkV3vwtfv
 akzESg1XC7vdg==
Date: Mon, 24 Jan 2022 13:18:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V3 1/2] dt-bindings: spi: Convert spi-mt65xx to json-schema
Message-ID: <Ye6nQIVoti5TKh+k@sirena.org.uk>
References: <20220124061238.7854-1-leilk.liu@mediatek.com>
 <20220124061238.7854-2-leilk.liu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220124061238.7854-2-leilk.liu@mediatek.com>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_051902_588877_559DE5FD 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: multipart/mixed; boundary="===============4939593787701546137=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4939593787701546137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v2cofXUm2ThNHvf8"
Content-Disposition: inline


--v2cofXUm2ThNHvf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24, 2022 at 02:12:37PM +0800, Leilk Liu wrote:
> Convert Mediatek ARM SOC's SPI Master controller binding
> to json-schema format.

Please make any YAML conversion patches the last patches in a series -
there's frequently a backlog in reviewing them so having the DT binding
patches first blocks any progress on everything else in the series.

--v2cofXUm2ThNHvf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHupz8ACgkQJNaLcl1U
h9B8ZAf5AZ25SlrujmxJNnJRmptUEyQU9a2j8mJ0o6DR8eQGjMHE3n1/ppct/BEv
LwNcF2C7W0lNKIILFQ+oa0hdHcj74wVsvvKECMD/CqgJxG93v1KlD+KRVQHbAiTJ
g8kXyvqwsN+YiUkqhbZ1tiHOUVNeB2sLu70wQHXPCLZ2UTz8QAY9Qi5eZ+3XxVDf
RysYKB8Gfvi3nXwN4UA6ygBWc6W8Ax0r5I1K+GPUqsFjWwatfgVZwIxW2N1+5JHL
eaQrA5Rg6kg+NINBAtWjhQU+C/QmR2fHj35qJbkjWfY0Yr5P7f02NSl4epEI3FHd
JuKzOkcS7o8XB29ERzpWfkskxIfbXA==
=k9qL
-----END PGP SIGNATURE-----

--v2cofXUm2ThNHvf8--


--===============4939593787701546137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4939593787701546137==--

