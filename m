Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E2DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nppynM5Z8Ar1AVvCi2YPZPdM/07vAJ7n6SJpobggLps=; b=24fAW/G+lWueb5x+Ub3OI0bQQo
	PT7/lCkp+bk54NuRAjhCH2cmDo1vpzblDRzOD5bnpXaMsfA0i6P6ZEq14GjrUmc7Jqc5pPpNx0C4R
	ndjpauM2chBBw3QAmRTBG0rlccHURKoiR/v5DzDzyOhlaCpoELcUqt3RfcKoOPuDV0sUW6BhCMecT
	W4FbMZMXY3Ny2VDx3Y6u/2M4QlGY1zLZF2P5dBgBsChmV2NeKbsl3toobIvRS++oBE9YpP2RX3mNi
	48YVcBQc7C+aU9o+dIMozo2oBMgTEAgtNCd34cFsaEiCV7tnA1u8rQs5GpyD2sVXm0gThv5TyQ9g6
	w403FWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIz6-004N40-Mp; Wed, 16 Nov 2022 14:01:48 +0000
Received: from relay06.th.seeweb.it ([5.144.164.167])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIz3-004N03-QY
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 14:01:47 +0000
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1627C3F308;
	Wed, 16 Nov 2022 15:01:41 +0100 (CET)
Date: Wed, 16 Nov 2022 15:01:39 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] docs: dt: writing-schema: Document usage of CHECK_DTBS
 make flag
Message-ID: <20221116140139.gjfsgekz4t4pxekz@SoMainline.org>
References: <20221102214300.309347-1-nfraprado@collabora.com>
 <20221116135504.mdmgm6ce2cynt5yt@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221116135504.mdmgm6ce2cynt5yt@SoMainline.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_060146_040458_161F3EBF 
X-CRM114-Status: GOOD (  32.93  )
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

+CC Konrad and Dmitry whom I discussed this with before.

On 2022-11-16 14:55:04, Marijn Suijten wrote:
> Hi Nícolas,
> 
> On 2022-11-02 17:43:00, Nícolas F. R. A. Prado wrote:
> > It is possible to run checks on a Devicetree by passing the CHECK_DTBS
> > flag when building. This is a useful shortcut to the dtbs_check make
> > target since it avoids checking unrelated Devicetrees, which can take
> > some time and is unnecessary if no bindings were modified. Document it.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> >  Documentation/devicetree/bindings/writing-schema.rst | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
> > index 4a381d20f2b4..55ad556472b4 100644
> > --- a/Documentation/devicetree/bindings/writing-schema.rst
> > +++ b/Documentation/devicetree/bindings/writing-schema.rst
> > @@ -167,6 +167,13 @@ setting the ``DT_SCHEMA_FILES`` variable to a specific schema file or pattern.
> >      make dt_binding_check DT_SCHEMA_FILES=/gpio/
> >      make dtbs_check DT_SCHEMA_FILES=trivial-devices.yaml
> >  
> > +Note that ``make dtbs_check`` will validate every DT source file that is
> > +enabled. When making changes to a DT but not to the bindings, a possible
> > +shortcut to validate only the DT in question is to explicitly build it with
> > +the ``CHECK_DTBS`` flag enabled. For example::
> > +
> > +    make CHECK_DTBS=y mediatek/mt8192-evb.dtb
> 
> I have a bit of trouble getting this to work on a _clean_ out directory
> (perhaps this should have been reported at the original patch, I had
> always been using Dmitry's version [1] which didn't suffer from this
> problem).
> 
> Consider running with the following:
> 
>     rm out -r
>     make ARCH=arm64 O=out defconfig
>     make ARCH=arm64 O=out CHECK_DTBS=y qcom/sm8450-sony-xperia-nagara-pdx223.dtb
> 
> After compiling preliminaries, it exits with:
> 
>     make[3]: *** No rule to make target 'arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb'.  Stop.
>     make[2]: *** [../scripts/Makefile.build:500: arch/arm64/boot/dts/qcom] Error 2
>     make[1]: *** [/kernel/Makefile:1460: qcom/sm8450-sony-xperia-nagara-pdx223.dtb] Error 2
>     make[1]: Leaving directory '/kernel/out'
>     make: *** [Makefile:231: __sub-make] Error 2
> 
> However, if I lint all DTBs first by running `dtbs_check`, it seems the
> schema preliminaries are built:
> 
>       LINT    Documentation/devicetree/bindings
>       CHKDT   Documentation/devicetree/bindings/processed-schema.json
>     ... bunch of warnings
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> 
> And here I ctrl+c the build so that it doesn't run DTC_CHK over every
> dts.  If I now re-run the original command on my .dtb of choice, it
> completes successfully with the warnings that I expect.  Is the logic
> behind `CHECK_DTBS=y` simply missing a step to make sure SCHEMA is built
> and up-to-date?
> 
> Aside from not working in a clean output directly, could this imply
> schema changes (edits in Documentation/devicetree/bindings) _are not_
> propagated when running with `CHECK_DTBS=y?
> 
> At the same time running this command twice results in no output the
> second time around, supposedly because the dtb has "already been built".
> Is that also something we can improve?
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20220623144357.297252-1-dmitry.baryshkov@linaro.org/
> 
> Thanks!
> - Marijn
> 

