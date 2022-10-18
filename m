Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BD0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IP4Mqv1mf2EHTe5OP3Y2p1QOGFNrw7hLjDrbWnECBlI=; b=QiV/SeivoKb74bXDhmkmzqnQDQ
	oFIbpSInZVHPv6v+QhbzgW60XXqcdh4RCvTsmMkGbj1h1ZeNcWWk0M+FcvxGwm4VqkPqT+fAz6+DF
	14XumjftDNJYU1mk381tGuB0Uh8QhrOPGQPbRr117PqcmtS5awvCOd5Id4NgRRV7ysein9CH5SsX3
	9oefwDEDpmzE6LKVCCJnrolKYpwQZwZ8cVwaOPWfC3e7IQSrbSh8DOaBMJ79+9zCUZJOE9sJ7nEs7
	B9ya+ocQZxG+ENRWfyNFOnaI+DdqMmO4pRS1Z9laEWM0dq2yg/NUQ29dVOgBRc0t2xpshKyfO+9EF
	cgPj6FTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okitu-00512c-Rp; Tue, 18 Oct 2022 09:28:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okitj-0050iW-VA; Tue, 18 Oct 2022 09:28:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9083D614E4;
	Tue, 18 Oct 2022 09:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95968C433D6;
	Tue, 18 Oct 2022 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666085310;
	bh=FNvybaaMSsU92LM//vA2J3d3Vos299Q6dH/tB2HZSFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoMPy1FAOHq5BZA2CnEyws5/nBk29uNnj7pXHtFvQmOdEpi6SEsgzOrizDu+lJdiU
	 s6PEmpn4evaWY+VO1JHdctD1qpmgc2AG3rXYwhMbY9a1QB1UcmiwgE6QOkJ/Yn9+xe
	 CvU2UAgk/Yg0CPuFjJFicRyODN+e48aB4oDn1K6sR3we7H8h6PsqrfFeW8BHhWerl4
	 oxYxdfIHQIiQgCFoQXFU64r0ENhw1xxy+TAm8/G3XrfKPeCsSFfYarQDh0wzQD4PsP
	 mZ/k7OB6nOD/inO41U8TiEH4W0TEMFJerIrbcWF7KScIXwpNDAVlneIu9yyCHUK0Z7
	 ofC29dlwbBrwg==
Date: Tue, 18 Oct 2022 10:28:23 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, chiaen_wu@richtek.com,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	krzysztof.kozlowski+dt@linaro.org, cy_huang@richtek.com,
	sre@kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
Message-ID: <Y05xt+r2tPmfJbcq@google.com>
References: <fcf4e7e7594070a8698dc0d4b96e031bcaa9b3a3.1665585952.git.chiaen_wu@richtek.com>
 <166558333754.1988433.10175192101178879616.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166558333754.1988433.10175192101178879616.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_022832_085949_DE88E758 
X-CRM114-Status: GOOD (  18.60  )
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

On Wed, 12 Oct 2022, Rob Herring wrote:

> On Wed, 12 Oct 2022 15:08:14 +0800, ChiaEn Wu wrote:
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > 
> > Fix the interrupt order of the charger in the binding example.
> > 
> > Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> > v3
> > - Add a 'Reviewed-by' tag.
> > 
> > v2
> > - Revise the commit syntax.
> > 
> > v1
> > - Due to this patch modifiacation
> >   (https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),
> >   there will get some warnings in linux-next when compiling the dts.
> > ---
> >  Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> Applying to go into rc1 along with the other mt6370 fix, thanks!

Fine by me, but please change the subject line to start with an
upper-case char.

-- 
Lee Jones [李琼斯]

