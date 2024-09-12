Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F98FEED617
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4jm8rgRW5TZXKbM1nBFbput87XWCMLCT4BoR4FcvGA=; b=Z0IOey4vCSwwg3bswiYktiNfwO
	Ai1oX9NlN9wt+7U81JGXKfhZio4qxVX45YFRG+0OxKwGWthbnbyBFxK9NZJC8A1943aCl+LFcjPgH
	o4qz4m+IFvIGjCmhUBJ4jHAsZ871wYehc9IQUdlI1LjKhzFoR2xI40QSBbhzyBPJDNE0fP3K6POoV
	6QHMe5hXt0doMxlS8G8MWss+y+v7RoSlTRR1z6PubNwZ2wSepzwG2RUawb1/V/Dd4PRd+geLpkvkj
	VFLj2mu8bxrZV6WYfNp7T/H2zIWvslks+eMyJRetQfjzu5G7/HK8/tgARsCNrXjNOrAhEJtKhtF4z
	L1SDf4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1son6H-0000000Dm2M-0HSJ;
	Thu, 12 Sep 2024 16:55:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1son5C-0000000DlwF-0NrC;
	Thu, 12 Sep 2024 16:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A97CA45756;
	Thu, 12 Sep 2024 16:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42B2C4CEC3;
	Thu, 12 Sep 2024 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726160052;
	bh=EvuQRTOvCygv4JttyYOrIYG2JZuDMwbgBuOgkBJTeAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSkpgXj+jtRgdtCiTXLvwsUHUdoe4J25kmlMfVfb1/cYDHZ39VIPLu0B+EVQYrWEg
	 eXasDGChp/IqEDddBOUc/14D0P3rUbJEy8ojr8kmWAWhcEzxIidEsLruIsiveCeT/7
	 BlQTgenMOoQZz0A1+zCRv5EXrG4ipcfqagMuMEj9+sGrXYxlBljX5jv/saUVLWc63C
	 tcH1VSgSzk7SiVByhan7p8/+K8io2ALVDTPqrE6CHWBJxDwKKo++qPawPEqMRdrpOn
	 qYlXGo0kJqpyKlp5jnHne3PZ/qwgUGIbicMDDSaRVjD5Tv0fhuY5O5667XleL8Nm6P
	 g8cY44G2Vnw+A==
Date: Thu, 12 Sep 2024 17:54:04 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <20240912165404.GG24460@google.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240912145100.GE24460@google.com>
 <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_095414_212479_EA975707 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, 12 Sep 2024, Mark Brown wrote:

> On Thu, Sep 12, 2024 at 03:51:00PM +0100, Lee Jones wrote:
> > On Wed, 04 Sep 2024, Mark Brown wrote:
> 
> > > [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
> > >         commit: 761cab667898d86c04867948f1b7aec1090be796
> 
> > Did you mean to hoover this up?
> 
> It seemed to go along with the series and had a DT review so it looked
> like you'd just left it to the DT people to review, there wasn't any
> other MFD content in the series.

I applied it from this set 6 weeks ago! :)


-- 
Lee Jones [李琼斯]

