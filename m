Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4731C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:46:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C7C52078B
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5qZf6lx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiXurh7h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C7C52078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QHgGWYXoCHl9Y6AMlnwGjCKeRIEqja6l1lB5SJVQdo4=; b=g5qZf6lx04MXG+n36yvIi2hqB
	1Q0IXN5uHs4i7iN9atWPxuEZ4FeeiX37R8JaByUmusdxdRp/B2DoBhoSe32i5qjTIk0dSYwi+KKU/
	wkJCbgZhgqUugsZR39QJcWDqbG7APH1yrYDq0OJGH9A3+AQfagsBduv8hRS76urpKIVidm6psEXwW
	zYrfaHVtL+Tqk+XvJfuUBmnzcguZCFNif75CFQWi0Baa6568vyAPv/P/ocIhGSfzZt3FfSu2fnOmE
	EWEZO+xWH+YrTd5C1jKc5bD9zC+xOU1BKuPjyd+Wf00Ay2qNQY0BKNWM0RdGxilSS4CdIz46Jf/2N
	lvXPfqTmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8j18-0008Io-Eu; Thu, 20 Aug 2020 11:46:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8j14-0008HO-6A; Thu, 20 Aug 2020 11:45:58 +0000
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4CF12078B;
 Thu, 20 Aug 2020 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597923957;
 bh=EmpcpyWUq8w0WNjTx0pP0rrQmAkwNgLkN1Z/MnuebcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SiXurh7hS5kaPGz83qRaQPFIa3c10EcxMdG7VqJpmcAvQ1Kr2uVTFkz5T+BxZkuGc
 Qud9WfkBlOnTh1eiEAJ+5+R7ke09jeNewuXlamTAN4LdniF9WirwON/WrYfCYGezDu
 yuD0BvTXq5D151EW8HkiDvG8ChfiRGSL50q4s7+k=
Date: Thu, 20 Aug 2020 12:45:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 1/2] regulator: mt6360: Add support for MT6360 regulator
Message-ID: <20200820114524.GC5854@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1597910022-22617-2-git-send-email-gene.chen.richtek@gmail.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_074558_310542_8808683F 
X-CRM114-Status: GOOD (  14.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8649693067990090135=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8649693067990090135==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline


--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2020 at 03:53:41PM +0800, Gene Chen wrote:

> +	mrd->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!mrd->regmap) {
> +		dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}

> +static const struct of_device_id __maybe_unused mt6360_regulator_of_id[] = {
> +	{ .compatible = "mediatek,mt6360-regulator", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mt6360_regulator_of_id);

This device only exists in the context of a single parent device, there
should be no need for a compatible string here - this is just a detail
of how Linux does things.  The MFD should just instntiate the platform
device.

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8+YlMACgkQJNaLcl1U
h9DIKwf/ev1phumPNeX6i1SQql+DSte48x9dcwfsdVGdcUYYk9q6H6T5tUIKpzF7
htv0KnJWujWXk9eYft25GnJTOdpzdkihP+bqHsc86o+2wfuI/9NGr2z6Al6sFwjf
5neoBb9H3XMIHkkiAk/f8d4q5i9HDJA+5Gqe82/m7TV3qM7AYjeQH8X0BRnlGPTw
+H9wDCDmg/BkT4jq1spi0++fua58EtL58ex8OBPZpxFeG3ZPHZMLknJikpbEj3sG
L2I+4nITn7sB4zrTbIZDcdZYJCcubV/rZ0lO7+K6a1SGDxw98eOOfy21ht4qM6RV
R2n7uxfo+TjXqHqkdBGwQoqJdf2yJA==
=7oEp
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--


--===============8649693067990090135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8649693067990090135==--

