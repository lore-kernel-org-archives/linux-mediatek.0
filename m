Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CECCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzi2+8gyQnmVeXGPw2d1vq+UT4Hx0O167OOibhqCi/Y=; b=3+sITLcHC1+57mgGRWOndDGvzH
	JtbitrO4M/dGxD6zEMBjjaspwWUl4PuwfAAnX/P6ZEo6e94RDa3iHhxfA5bjuCLQTdDVnHMkX2fQO
	fQ772BdAP3i8XBRZUdI3gzi/SDNmLrxn2L+Bu4GZePfldSx3RNOW+jDZhDf5Klvtl9pbnjJ3B7qR1
	LYTREjVmOH3c0LY03pWT0Er3dg7JwfX7Bkw8tN0Ozv/C1suhywFWiC5rZX5anBOZeB7OtFumMTNYm
	YqEdx93BlsioGj8mVKzCqYUGOwgUptaseKmuMnlXXRJPJSzciO5Hiv0g0oRmGKALHZTFtNEUsOroU
	hndYZisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvZ4-0013lo-1J;
	Thu, 12 Oct 2023 13:17:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvZ1-0013kQ-0l
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 13:17:20 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B50A8C2;
	Thu, 12 Oct 2023 15:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697116634;
	bh=SHqSTjMJAKJCUyMA7YjRflobJpz3Ueijw67vwsmyHKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJYeT28laRlwHOq2Gl0MeegcFMAPno6rI+8MlWZT98H97AhxQd18e+f/GE+bl8mev
	 Fy3aqlTmHVlf4SoVjen3WqcTxNhqAiomYnH9eeYzZ9QkgE1ZQMf12Q44TKWL1NQqyF
	 j2ue6dUzYNULtwINE54DXkIksYXJZTd7xUWWhcSc=
Date: Thu, 12 Oct 2023 16:17:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231012131724.GA23177@pendragon.ideasonboard.com>
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
 <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
 <b214e763-2175-4de1-af54-43961ff94afb@linaro.org>
 <20231012130544.GA31878@pendragon.ideasonboard.com>
 <0aeaa158-d56a-4d3b-a0c4-25b25f031a51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0aeaa158-d56a-4d3b-a0c4-25b25f031a51@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_061719_420821_90493B94 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, Oct 12, 2023 at 03:16:02PM +0200, Krzysztof Kozlowski wrote:
> On 12/10/2023 15:05, Laurent Pinchart wrote:
> 
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +    description: CLKI clock input
> >>> +
> >>> +  thine,boot-mode:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description:
> >>> +      Boot mode of the THP7312. 0 is for standard streaming mode, for the
> >>> +      THP7312 to be used as an ISP. 1 is for firmware flashing mode.
> >>
> >> Why, for a given board, would you always boot device in one specific
> >> mode but not the other? This does not look like property of DT.
> > 
> > The device has two boot mode pins, and it operates differently depending
> > on its boot mode. The pins are typically hardwired, on development
> > boards you commonly have DIP switches, and on production systems test
> > pads that allow modifying the boot mode on the production line. The
> > driver needs to know the boot mode to interact with the device
> > appropriately. I haven't found a good way to interogate the device at
> > runtime to figure out the boot mode, but I'm still trying. If that
> > doesn't succeed, we need to convey it through the device tree.
> 
> Hm, that's okay then, but please describe that it is expected
> bootstrapped boot mode of a device, because now it sounds like
> configuring some boot mode in the device.

OK, I'll improve the description.

-- 
Regards,

Laurent Pinchart

