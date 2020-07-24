Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92528C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:22:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A3020737
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qioZF1lo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y/wjC9A/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A3020737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VUyRdFc1muT1+1IswCN7zyajp/ehmzXu92bvil58Lfw=; b=qioZF1loWsMGU56JKePBwg8CJ
	NOqjsHWFg/z0poESXCQad9Nx8qgWcmMRpzuLKjEfbZd7hB1wZvPVMh4XhZhmZXQApKljRgcMOZ294
	6R6wCiDhX648wcMtnQZ0FYkMPsJcWuMYoJ9VLTVlWyzv48JAGPkxZJ8uByxVlVFk+K3AZOYpjzgsP
	hrUKdf67kJJQzhBl3CpzfuSkVyHLtMG6ybh0vvqZvX381DXzuBpaVZnwtYC7XyJKJBnx6A5suzjgk
	ezbVWQuLv/In9gXuOavS4unvphAhyAVb9SoO8Czz0nIZ92LB+boiBNUxDobsr4f2K9rtKQQlvOkWL
	1eVQl3Qpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jywiT-0001XL-6S; Fri, 24 Jul 2020 12:22:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jywiN-0001Vp-R7; Fri, 24 Jul 2020 12:22:16 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A59CC2074B;
 Fri, 24 Jul 2020 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595593335;
 bh=8PXCx60bJOB2VVd2llmJy4lMgQ91giqE48nQabhYHIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y/wjC9A/oDApgq731MtfIyCOZrYiKVWbu6UV9mKKddRCYmUwAp4KPKzXQ87WkGdi0
 dFemXfYLVI7DxFBNUtnopYEV8e4mkNKhWBWL9y0Na4rmj/iFTqcs68ztCcnidGhS5J
 E/hMuWYUqksr3ogD2pICcfNMTQOwnaJzO74vsbnk=
Date: Fri, 24 Jul 2020 13:22:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 6/8] regulator: mt6359: Set the enable time for LDOs
Message-ID: <20200724122200.GE5664@sirena.org.uk>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-7-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1595509133-5358-7-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_082215_961245_ED172591 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4478575050354350236=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4478575050354350236==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2020 at 08:58:51PM +0800, Hsin-Hsiung Wang wrote:
> Add the enable time for LDOs.
> This patch is preparing for adding mt6359p regulator support.

Acked-by: Mark Brown <broonie@kernel.org>

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8a0mcACgkQJNaLcl1U
h9ClHgf+Iv+wHsCGXF3YvUuwEgURaO7JIQ3MmUBIbBA9ydPNLInosIv5pzsEfzKU
ksXKf6YrYRWtvGKZ/RI+yQy50doSXIsjpVdGtaSthXlkCtU3O85UmnYH2/XbgQWU
39glGYpINamDCNkrNc7DqdtxXEwoymcfRktME+Hb/jhiunoGNi/nXXhi1lsgA2KE
kLufn7w7rvstpsbmxgRjlbwN9bPQNLe4N/hMMLaI1vClZiYdlKPEsvL5eUZiMSUi
9yQqKDVFzYFMsDsrdAwnqEP04OKIqgJ3WHoy5S8lZB23r6slnMddqXSSsPRNy9K8
Q00IJm9y5cHVZ6Z5sWNDrNfJy9D4MA==
=ZtYc
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--


--===============4478575050354350236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4478575050354350236==--

