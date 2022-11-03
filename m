Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvkQc3Xx60X8AGHWUGnSOGLeU20q6g1GG7DhMGNk3ps=; b=gvInzMVkLr9ncCATrGGUOxFCkL
	f6IwboO/1qqkFZcOdHeY41U9gfoqromDo5ZBR59RZ0GVGs4KwX39gRoMKHLy2fKRRTCVXp6jocm8i
	ZRZW7msCaalUi4/M62ir0aIcuxIgsm9KDyjrEHSYEneV4T8Cn+0dlyNFz+L2ny8/A/QRkNrms59mn
	ecduSlpMzqAb2VTHob2MTlpfCHAJeAUMam2/QSFWDSSsFQYyNP/dUcP4SGOYQU9dzj0034qVeP5VW
	B/c4pY/yXFNuv8HXD0VFj9SYEL9j14rYqwydBQdXW/dN7vWu+uDuZcVTxSKlZm8Py/YB9BXDO2drW
	4cgnQYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbig-000C5w-Gy; Thu, 03 Nov 2022 15:01:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbiU-000C2C-Je; Thu, 03 Nov 2022 15:01:16 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B43666015E4;
	Thu,  3 Nov 2022 15:01:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667487671;
	bh=7vKOiE8wMEV5ju2Qh06ih4W5UBAdst8hPFwPgPbs+Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSSFzAqsTQk1ylbCV+Ttj7valctGzE1nFG8epl/mDXTJvo/BrY5DGyTbM4liGPYiq
	 oTVtwl557jKYxegPcjzNCdSij8DZ3Ipunl1YHj8qMHuN8mfJKbQyxciN0pDwEev4Kc
	 WUU3ftqq9PZ5zdjTeSlRhB7ZSEObI4uG+QZtBvF+d8borG6xMXndtXd9o06E6x22K9
	 NnWMZD20fNV8q68NdQdpNyaIfShwEYlwuZFZOdephumWEmZazXmOdWUiswsRNcvQ4p
	 2F1FkouwOWNZor7D5HU27QDjeXAv7ejNb4CADLziBWNcjkjV3nQQn76wRdeTwTlkRo
	 p5zjlRmlu2nXA==
Date: Thu, 3 Nov 2022 11:01:06 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] docs: dt: writing-schema: Document usage of CHECK_DTBS
 make flag
Message-ID: <20221103150106.sjubfjs2xt33dvhu@notapiano>
References: <20221102214300.309347-1-nfraprado@collabora.com>
 <cbeb2bdc-4a36-1f9a-e28f-842773b6a161@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbeb2bdc-4a36-1f9a-e28f-842773b6a161@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_080114_840782_88824C28 
X-CRM114-Status: GOOD (  24.51  )
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

On Thu, Nov 03, 2022 at 10:19:15AM +0100, AngeloGioacchino Del Regno wrote:
> Il 02/11/22 22:43, Nícolas F. R. A. Prado ha scritto:
> > It is possible to run checks on a Devicetree by passing the CHECK_DTBS
> > flag when building. This is a useful shortcut to the dtbs_check make
> > target since it avoids checking unrelated Devicetrees, which can take
> > some time and is unnecessary if no bindings were modified. Document it.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> >  > ---
> > 
> >   Documentation/devicetree/bindings/writing-schema.rst | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
> > index 4a381d20f2b4..55ad556472b4 100644
> > --- a/Documentation/devicetree/bindings/writing-schema.rst
> > +++ b/Documentation/devicetree/bindings/writing-schema.rst
> > @@ -167,6 +167,13 @@ setting the ``DT_SCHEMA_FILES`` variable to a specific schema file or pattern.
> >       make dt_binding_check DT_SCHEMA_FILES=/gpio/
> >       make dtbs_check DT_SCHEMA_FILES=trivial-devices.yaml
> > +Note that ``make dtbs_check`` will validate every DT source file that is
> 
> "Note that xxxx" looks a bit repeated... read:
> 
> Note that ``dtbs_check`` will skip any binding schema files with errors.
> (etc etc)
> 
> Note that ``make dtbs_check`` will validate every DT source file ...
> (etc etc)
> 
> Perhaps we can change the first paragraph saying
> "In order to perform validation of DT source files, use..."
> to something like:
> 
> In order to perform validation of all DT source files, use the ``dtbs_check``
> target, or set the ``CHECK_DTBS`` variable to ``y`` when building specific DTs::
> 
> ::
> 
>     make dtbs_check
>     make CHECK_DTBS=y mediatek/mt8192-evb.dtb
> 
> Any opinion?

Something to keep in mind is that the purpose of this section is to describe how
to validate binding changes (both on the binding itself and in the DTs that use
them). For this, people really should be using dtbs_check since otherwise a new
warning might be missed. Using CHECK_DTBS is more suitable for a different use
case, which is to validate some dtbs without having changed the bindings, which
is why I added it at the end of the section more as a side note. For this
reason I think it's better to keep them separate.

About repeating the "Note that", that could just be changed for "It's worth
noting that" or something similar.

Thanks,
Nícolas

