Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960D6EF4EDE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2026 12:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SQW2Ad2NOvoVZWhstp8kFvex9rmv3LN2nziLtVN7gw=; b=x9L1arIjJV433BHbBkvLszGDwx
	soyIRKglWlwx4kh4c4fZ2fm4ai3B0wh4FxbV4veBVQlanQdgreBnIFvWdlZb2eAP5akHgb8hmkAWO
	hloUOcR0kXJoh6zEP234xWH4UpGhvUUd7n/33mbXDqHQZn5sXKqaKQV3FBkTruD1pT6dmrtkSHVnM
	YuZN31KmCnwPkrniQWM17VoZT45gWyIgwoR7WI8UDUhfirOp7uVDQuoEU5b42nooZrv0rf6Z/Ypcy
	sGy3NcwzIs2UPp/V6pxD+Fporq3Dj0C+5UYSc6OAjeYXP6vTXGJJ5iTRQBtYt61vzSyC/zznEpTvE
	HsNu4wjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jSS-000000057rP-1PQf;
	Mon, 06 Apr 2026 12:53:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jSP-000000057r2-3j9i
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Apr 2026 12:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A64D541A33;
	Mon,  6 Apr 2026 12:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8918BC4CEF7;
	Mon,  6 Apr 2026 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775480012;
	bh=mPQ/xpAlrlk9I52Qbng8ToGDsSDNUZmp0x8Cnhd0ATE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3YjwtEPumdHKYP8BhJyBZ7e5j2rMTrTy+lKEUU/fSMZAvVID7O4njhoOE+81Rkc0
	 0hceYT+yhYIquW1BZdaHh3Q0xHEzsg4OSV1DWv2xLOPrgVxKkdBQwDhk96VUcfcyKa
	 ylDkOPptHY1xdFYPjwHjABomyl6zITUX2t4OVWsOpLjD959ax7tgRJzJvud7ZF9zVM
	 VHlURaovf24lOkqvEL5duA6ONCm+dOdvlOpAOOpG7eVQx8SJNuBdSaOH6Y0y3463t+
	 EdFdkeiuSTG3BWCLBhKc9rEs+48HAjnSDhuN5qYAv6FnayhFaeULPdZkMQ2po2eNCJ
	 QKFwz4oF09x0w==
Date: Mon, 6 Apr 2026 13:53:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: gch981213@gmail.com, linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] spi: mtk-snfi: unregister ECC engine on probe
 failure and remove() callback
Message-ID: <d4871bdf-15bf-4491-be5c-5b38a065d810@sirena.org.uk>
References: <cover.1775273351.git.xiaopei01@kylinos.cn>
 <09ac1024a0f1626efaa47ceefc5cfb8ee5dd9418.1775273351.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bcY2f4OxCKNUI0TS"
Content-Disposition: inline
In-Reply-To: <09ac1024a0f1626efaa47ceefc5cfb8ee5dd9418.1775273351.git.xiaopei01@kylinos.cn>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_055333_968397_97E24B10 
X-CRM114-Status: GOOD (  11.82  )
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


--bcY2f4OxCKNUI0TS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 04, 2026 at 11:44:58AM +0800, Pei Xiao wrote:

> +	ret = devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
> +				       &ms->ecc_eng);
> +	if (ret) {
> +		dev_err(&pdev->dev, ret, "failed to add ECC unregister action\n");
> +		goto release_ecc;
> +	}

This should either be dev_err(), in which case ret is not a format
string and this is buggy (I'm surprised it compiles without warnings...)
or it should be dev_err_probe() in which case the arguments are correct.
The latter is a little better, though it's unlikely to make a practical
difference here.

--bcY2f4OxCKNUI0TS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTrMcACgkQJNaLcl1U
h9Bn3gf/Tw/3QaY8d26oeHjBwK7iRpKZDFeEWD14GaAFJjqvItlGkc4O/inmsmL4
+ajauW6rgAK6VdnS7CPbuLbaO1G0BS+ipl1hNiEjeEM5C8L7kAbVNXBl7FEmPL6g
8txAv5ScD12FqhKA+QM58asD2s1jjeFVxHMnzY1Hvk9sF9b5M6z/6Rj0HGlDT8Af
zvO58eJeQ0z7dOjyP1q/cmdZ3uDpMClQsCnmVG8w5GgO1UfhaLTf1stSIfEIjcG+
pfsJsj0TXaDZKDP2iuYPZBMi9ih4vL/m3LS7L7KBuHLlFnUOQo/V6oLXQ5BoHXpo
UJbMneAI729UBtl5jo498yD26wk3Ow==
=Skbd
-----END PGP SIGNATURE-----

--bcY2f4OxCKNUI0TS--

