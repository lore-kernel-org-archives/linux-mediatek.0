Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195C6CCD190
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDpPd5UzOQn8zDPGA7FYXf9y+izfyQBl4gvsqPled8k=; b=eLVeDTVG8l+iEtnceYyqw+CXAV
	jqWytL1wGuBNoFeeaGVP0+RBbcHxUcFseyLLVXG+OgGawoGo4/iPhbImiesUpiPaBGsCXjndyrsbR
	amDXnYbKMZ3hvk7Hsudf8A5R9IowgFcHDwY3EpWzt37Tc4cC7o0f8VRTLMVSU1LfTgrY1rkKwP6sn
	GqdZU+HO5Zngfx5OJOXMOM3ZVrphRkOAtPSedaUw2Mxne8FMmXXKDza+VperL1FnwdubigF0QCAcz
	Hv1E1nVG7dqv23kXK/6j0lga5mCKqUE/R5ZKkuca1W3SMaFtDHBtf0X8Im+5isg9N+X6BrVaPNqfK
	TwtGRkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ioc-0000000DFjO-2cpW;
	Mon, 13 Oct 2025 13:42:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoX-0000000DFcO-3I3Z;
	Mon, 13 Oct 2025 13:42:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760362921; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XIXkd09YTcHrxyEMy3Q47jCyFRdZdGg7DG/PawiO9mFO9t3j+QNvOECuDBMMf8OY8ZecH6Aig5NBab5wViVuE0Xn4ifoDV6O7Ax6Nva+yk0jiGWzm3gj/Fm8UclkzUuOPXIUskYCj4TPy913l7BWPkcwu8Ubxc2+qm9woMBl+CU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760362921; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gDpPd5UzOQn8zDPGA7FYXf9y+izfyQBl4gvsqPled8k=; 
	b=KZLBIJiEBTseT5PnJagP7TnThgzIguQKMRE+d5O1+q+QCFVGTiwXQ7MKaj5tBtz/rPPAieZ32iPp0WxsefkdUqLbzruXbNT/nkWwufQh6jE8OZB7ca0gBgoHL1q2vCZ8f4kBi7PAAhNztBrYalYB0i3yGtgms1G8fqfan5tO1jQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760362921;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=gDpPd5UzOQn8zDPGA7FYXf9y+izfyQBl4gvsqPled8k=;
	b=hjT4mlMZjMIWKVYikSKVmQYnNeZ5wGoair2n5QNpespSgO7wN5w1rrNzg0r9x4xs
	s9GP8XPPyEtfMZnBIE7gL6+eaSd5d1nOCTwK4OXYRh/mwjSu8vtFZXHtK/w2sqfmsAF
	BBJD9gPU7RSQCmYYPl7sa9/uXQrEsTMpEfG/k36M=
Received: by mx.zohomail.com with SMTPS id 1760362918105978.3996948303734;
	Mon, 13 Oct 2025 06:41:58 -0700 (PDT)
Message-ID: <a2eae87efe46ebf397bcec3580eb9bc152b80846.camel@collabora.com>
Subject: Re: [PATCH v3 04/10] pmdomain: mediatek: Refactor bus protection
 regmaps retrieval
From: Sjoerd Simons <sjoerd@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, 
	y.oudjana@protonmail.com, =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"	
 <nfraprado@collabora.com>, linux-pm@vger.kernel.org,
 ulf.hansson@linaro.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 	mandyjh.liu@mediatek.com,
 lihongbo22@huawei.com, wenst@chromium.org, 	matthias.bgg@gmail.com,
 krzk+dt@kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Oct 2025 15:41:49 +0200
In-Reply-To: <20250805074746.29457-5-angelogioacchino.delregno@collabora.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
	 <20250805074746.29457-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064213_916421_A2CF6476 
X-CRM114-Status: GOOD (  11.35  )
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

Hey,

On Tue, 2025-08-05 at 09:47 +0200, AngeloGioacchino Del Regno wrote:
> In preparation to add support for new generation SoCs like MT8196,
> MT6991 and other variants, which require to set bus protection on
> different busses than the ones found on legacy chips, and to also
> simplify and reduce memory footprint of this driver, refactor the
> mechanism to retrieve and use the bus protection regmaps.
>=20
> This is done by removing the three pointers to struct regmap from
> struct scpsys_domain (allocated for each power domain) and moving
> them to the main struct scpsys (allocated per driver instance) as
> an array of pointers to regmap named **bus_prot.

Trying to boot v6.18.0-rc1 on a Genio 700 EVK using the arm64 defconfig,
ends up hanging at boot (seemingly when probing MTU3 and/or mmc, but that=
=C2=A0
might be a red herring).=C2=A0

Either reverting this patch *or* having CONFIG_MTK_MMSYS builtin rather
then a module seems to solve that.=20

--=20
Sjoerd Simons <sjoerd@collabora.com>

