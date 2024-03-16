Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C51C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWfDrMxlKAAHdXQoz1wKJ6soUSFbO+NXsn6wGPuTqeg=; b=pZA1uPCflOh3XEJs70dUx84glA
	zBn7PuINOAmV+qbWDdl0A7+QI3/kkHP9yYtgGQ42nanZ6SKY7E1otZ9oxaE1ppnRFgg0Y+FgPqVLp
	lbbUgQOrH8t/n5nj+/sm+mz/FC6vSpf7caSMbxby5gj59S9HxF5r+EeqVVslEe1QUur4sLi1qVDu1
	eYengz02CnBuJVL41YrUmN61n5Thbrok9QrBin03FMpwKSXuz6tQiGDcShzUUPt+Zwz9uf34QHzmj
	AH67HoD3KBMih/UEewEm9cl+PcNnWxyUITPeGI/gBk65rNvoaMkb64s/EbPaAjit7vcg+cfb3yK+O
	fpoXhKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlWlb-00000003REZ-04fV;
	Sat, 16 Mar 2024 16:20:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlWlX-00000003RDL-47BP;
	Sat, 16 Mar 2024 16:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ACE2602E8;
	Sat, 16 Mar 2024 16:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5136C433F1;
	Sat, 16 Mar 2024 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710606009;
	bh=wWfDrMxlKAAHdXQoz1wKJ6soUSFbO+NXsn6wGPuTqeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXNM6JFWMvnjo24oeEsdu6XQL44YKNfYOZgAr/fIZzRh/Z/Yszq1ltqqeGNHx4ZUR
	 AOsBUQ4TQf04amRNE+iFRbl118k/paSNZaMFSL+41+8zdvWSVNMcVEcDTkZ3F3lWFr
	 po6tQKcq67y0LDRY1pWITvAISJ/AmuZmvWmPmuyB6UCdNRMVFQZBmNlOPmqmm8JfwP
	 h8MxSegPgTf1EYKTeHgxpC/f6SaNI/ALXn9QEKadLOEw/nfBwiLI//+yitKD/IeAiN
	 TFq8O0tN3nzdG+jF/+KahMmY3CiTyW6Gqmwr1bV2CY6vlO0Y8Jo1b0lzIi2dQa8nhL
	 sirzoeVrGBSUQ==
Date: Sat, 16 Mar 2024 16:20:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
	peter.griffin@linaro.org, linux-riscv@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for
 multiple DT
Message-ID: <20240316-germinate-browsing-6865db3a44d7@spud>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tCduvHh9wXhEP0el"
Content-Disposition: inline
In-Reply-To: <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_092012_168259_66BD866C 
X-CRM114-Status: GOOD (  10.79  )
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


--tCduvHh9wXhEP0el
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> On 14/03/2024 12:11, Amrit Anand wrote:
> 2. A top level board-id property that isn't namespaced implies that it
> isn't vendor specific, but the proposed implementation doesn't even
> pretend to be vendor agnostic.

I pointed out previously that the Chromebook guys had some similar
issues with dtb selection when the OEM varies parts but there does not
seem to be any of them on CC here.
There's definitely a generic problem to be solved here but I don't see
an effort made to involve the other people known to have the same
problems and this is all highly vendor specific.

--tCduvHh9wXhEP0el
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfXGswAKCRB4tDGHoIJi
0i8QAP933DDPKZ34gelBNiCnSveXI+wd4DrofTe+JiVItAGQngEA38mvngcysQke
6ZrKo1u7YDvXAH0bmMFJAWV6LKzeWg0=
=F4VS
-----END PGP SIGNATURE-----

--tCduvHh9wXhEP0el--

