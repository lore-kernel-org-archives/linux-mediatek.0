Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0912EC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGPqJrvnThf2mG968n+KNP3y1zAJ7zJqs9zWqYFuPsk=; b=h7WqeObG19L8y7sDooWfik1uT9
	Tg2PuEoEFEzvxjCHmUXo8xc+gwxYu1Ni2qjxi2eh2n41Pl8Pmcskp+HY4N9tMs2XBnB01sf8f5E/7
	kCpb5fBvT+bjukSn1tVRlQV3FfTskjRYaIpHHErJbk1H+AkAKkjRPfPK87StpZXnAnWzSOPFdUykw
	9NIYKgnnWIzMpQ6exFyH6FYXHHZxxyPOz3gg3Y29/9fP2DMrBMFfSDUw492KzokdWnpWRQCQptK+q
	lW0NMcOxkidZsZkTPqYFUdPeh/yPc6aa2rSb4mMtOnm6umNq1FvItgulVA/k2oKpHjYVOMy+xwV6F
	c2boi6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oiU-004q2s-22;
	Thu, 01 Jun 2023 20:16:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oiR-004q1z-0Z;
	Thu, 01 Jun 2023 20:16:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 888C860B5F;
	Thu,  1 Jun 2023 20:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F1CC433EF;
	Thu,  1 Jun 2023 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685650570;
	bh=wGPqJrvnThf2mG968n+KNP3y1zAJ7zJqs9zWqYFuPsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVPNfgg0tmc/Hg74YF1KHv0xBe7isHo/YFggxip+dCk8ewu3DFZpETA9JK4uG/jZU
	 i8A04VJbhCzl00dhGSDlVW2O4TQmkyBSvs+HAaEylFKyddMxyVZTsP2SM6WCflMRcg
	 cG4rs6oyzLpSXrj38X7D3+8OZ3mc9DdAMHfI45TOzA411/3X6nadMDhvl56oc2osHG
	 QLvlj1piJfw1VWKZdZxiVfu8Q2kbCd/ixrWL8umSU4q+pyLpffoF+6Kr0P50flLpTT
	 3J2UleCccULReH9OmReyIpikC/4TkinQdLXclbta2W+0HjUcj0nPmhqHb+dPnCBYcV
	 0TU3n8DuGhUkQ==
Date: Thu, 1 Jun 2023 21:16:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Qii Wang <qii.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	=?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Message-ID: <20230601-exception-dodgy-97f2101d8a0e@spud>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
 <ZHjtExYIdVFo3HnB@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7maM1k8I9uCkvnld"
Content-Disposition: inline
In-Reply-To: <ZHjtExYIdVFo3HnB@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_131611_274651_D6A3F1A2 
X-CRM114-Status: GOOD (  14.40  )
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


--7maM1k8I9uCkvnld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 01, 2023 at 08:10:11PM +0100, Daniel Golle wrote:

> Adding the clocks is done in patch 2/2 which just wasn't sent to
> devicetree@ and dt maintainers, but to the relevant mailing lists
> instead. Was that wrong and should I always send the complete series
> also to devicetree@ as well as dt maintainers?

Everyone is different, but getting both patches of a 2 patch series
really should not annoy anyone and avoiding reviewers having to go
hunting on lore etc is always a positive :)

--7maM1k8I9uCkvnld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHj8hAAKCRB4tDGHoIJi
0gCxAPwJluO3r1kS32M0uweKJEPBXY4qvnAqMUrRvS0VRe6FegEAwEfuZCOXUdWI
wW51d5BeoLvyIEciuumYzFvE7tKmtg4=
=5SNU
-----END PGP SIGNATURE-----

--7maM1k8I9uCkvnld--

