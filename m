Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6193CF0449
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQyfvEKJnNVbNwqyuwk3NoSJj9e4BcAjW83hC8o4cZU=; b=wWIGcgeQV4xN9Ty75hj3YuK8LA
	iYBa3c77eyn8BAl1Qi6sJlbHcJTE9YAkM9bOSyEPpQhK7dKW0w5JmjnKiFH2dIdVqi4wqkgZ6J/I/
	apx+DQB6pJSiU9eli47Lz3p/EB3lijdUsImo+zVEjCIpf5p/4ev+gtCwi6DzYrMFIBO9Iggd4e1ID
	3EE/UPyrEBt/EFSfBPhJCkQR6gVrtfjEs40gi4hA0GPBwIiN/YfXp0iiE1aAFg4GoFqO2Z6N/odXN
	3DcQuquXPIvlPkmKBz5MbxvJ+uWs8uGedA2TjHw9u5oI5WQweABoYtT7qfe26fEnARyQn9GP6bfu/
	5dyzmwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUBu-00000008vgc-2NJw;
	Wed, 09 Oct 2024 10:45:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syU4o-00000008uNx-1OZC;
	Wed, 09 Oct 2024 10:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A1845C5E26;
	Wed,  9 Oct 2024 10:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF789C4CEC5;
	Wed,  9 Oct 2024 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728470273;
	bh=bIc8VvXZyLnIE4IeFbmtymfSO2Qf0U2SpOHn3wtP1D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JiFVNfKZVOe38oZcaIn/39E6h79GHIUPjPRd3ro0vuPGJWnV3TKtVk06uao7Owfjs
	 muFhSmU0M4RZaUqEdEadZXw1abGDFuyQ6e6jqk+iZTbILlTpHLw/En9jZJBqWTPDpo
	 oHd4fFqZN442BcUBPebqJ53UFItkRQl7PEwHoVqwOqVu7TRbO1RySikoqjkcWfdV3p
	 paV5lguqLE/I3wujrgST6Hig2Xn35LeUKkk09P2OkpOh2yrJ8KG6nvRVOqmKqOPiyd
	 HkuEcrULwmEQpipt5RdxJYd7Cxkgnr4ZMxglmgqFePdBLmYBIixj6PRF6+73gdD3Qm
	 E/OdUSnT2elKw==
Date: Wed, 9 Oct 2024 11:37:46 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com, macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20241009103746.GE276481@google.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
 <20241009103307.GD276481@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009103307.GD276481@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_033754_437115_2F24B06E 
X-CRM114-Status: GOOD (  14.17  )
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

On Wed, 09 Oct 2024, Lee Jones wrote:

> On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:
> 
> > Il 09/10/24 12:15, Lee Jones ha scritto:
> > > On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
> > > 
> > > > Enable evaluating the start-year property to allow shifting the
> > > > RTC's HW range.
> > > > 
> > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > ---
> > > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
> > > 
> > > No such file.
> > > 
> > 
> > In the cover letter, I wrote:
> > 
> > 
> > For the bindings commit, this series goes on top of the MT6397 schema
> > conversion from Macpaul Lin [1].
> > 
> > This series was tested on a MT8195 Cherry Tomato Chromebook.
> > 
> > [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
> > 
> > 
> > So, that's why. :-)
> 
> Nope, try again. :)

I guess you actually mean:

  https://lore.kernel.org/all/20240918064955.6518-2-macpaul.lin@mediatek.com/

It's on my list.  I'll place yours behind it and see how we go.

-- 
Lee Jones [李琼斯]

