Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AB6C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 19:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0b9BGHZ+0fqcPoBLkOuMvaWbZ8jYUEWg62PU8+vYRY=; b=hSaioTbg6TdAEecOb6dlK5t4zo
	qi4UQg411OHQOA6FtjVhJ7BnhNsDrFUFZ8cKTr5hlUMEcMRoSRPdvKeKZYR9R0SFt+bq0O7dUkgFa
	s5GfBcDqHS98k05sHG5IlySXAMj55dUYVZrDfoYoQTIGByVEdSa59w8Nrx8kVds6BcoCvmoYfsuVg
	4sLcP6LQmVZN970JB7TWmcWLbKNv9HMRUdn/XDN9pa57tdTJd6mQXxv39EYW+2S5jaLb88LLeIr+2
	OlKQ2HfJVLJoAWEOOYFSj9qodNtUkvqNIPa6ZdZ087p5VoofZRPt+gG1GRjUJLtIUNfJHYjwtxzZw
	RisP04hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBH8-008XhC-2J;
	Thu, 10 Aug 2023 19:24:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBH5-008Xg4-2D;
	Thu, 10 Aug 2023 19:24:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4CFB611B6;
	Thu, 10 Aug 2023 19:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CFEC433C8;
	Thu, 10 Aug 2023 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691695486;
	bh=dGlwEVlRQLY6hzisurfToivtweKkIfYIl1RZciNjZeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pS7Le/b+BETgEgjMi5DwVwX9zUha9IA2Ii0pAZZ/8fNp8Obdiwm1iJTC9YArxTd8f
	 U6JItPzkD7A8JXV7X0GoCSwEmCPmkfqSxEGl4mZu6tBaY/OqjxSFA7T+frh/o21uEf
	 +yP3vgsYTBTxQ/3fi6I+bGB582+wjo8h0KWmYBVozHqF5I0NvA5bIDTckrVjCfLeqv
	 2jLuQiG4qbm7ZRbFoDSwuHPjEQOxZ0Abr1enWqBfaQncqH8I69ZCtv2NB2rNGV9VsM
	 lWFt4a7P+2JfRAWuY59tN9WDo7Xx3FLbVGwSK1s3+QlvOAJQRh6kjnqh/jLmN0uZMn
	 9T8xy0SKvFlEw==
Date: Thu, 10 Aug 2023 20:24:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: arm: mediatek: convert audsys to yaml
Message-ID: <20230810-syrup-matador-f00ec8ad381d@spud>
References: <20230810133602.48024-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zCt4crqknTtCVQPA"
Content-Disposition: inline
In-Reply-To: <20230810133602.48024-1-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_122447_768244_F6E4C751 
X-CRM114-Status: GOOD (  11.53  )
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


--zCt4crqknTtCVQPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 04:36:02PM +0300, Eugen Hristev wrote:
> +  audio-controller:
> +    #  $ref: /schemas/sound/mt2701-afe-pcm.yaml#
> +    type: object

Other than this "informative" reference, which really feels like it
should be a second patch in a series with this one, this looks good to
me. You can add a
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
when the reference is a real one.

--zCt4crqknTtCVQPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNU5eQAKCRB4tDGHoIJi
0hv9AQCC01iB3MpLxF2VvSb3yCD+YUvH4FOmYYci0+sUCQPOBgD+LuVu0B9lwAQf
cljg0lUR7zfuDA7YBdpltZMtFjvr7gk=
=CcPp
-----END PGP SIGNATURE-----

--zCt4crqknTtCVQPA--

