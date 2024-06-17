Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED529C27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmx3cnCwtQXeiShCw7F6r/kaXa8MRxFnKt7ro7xRAuo=; b=MFKyMONssxBqDPlkmYUArHVGMB
	VornkOfYf4pzdN26E9suF5ofVpn3wsUFlufl7mHqobPKl/3fsQ44zJJqhq0LnRbgRKiJk70Y5nDIH
	RrRyHXKNlCTJSSbMhFgXQzcytT7JfVButwGoRpeUM9JODOGkYfBv5TE6bdJjFQgdeqFHmUi4rFwus
	kXIbiEOpG7o27Q5APuqM92phQyo/EgpImWBe1x9Y05Bk0EikpBGz+xMbKZm7bqC57N2rgiwNe2uek
	2dI/dSdhfwRio3uz+E2TDrOfgKtiRWvlEqPwxsi6u+Q1LJdVYwVFnFpxTDvm9HjRYV71M3BruJm6m
	ZBOx7dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJC2E-0000000Akkf-1ntL;
	Mon, 17 Jun 2024 13:04:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJC2A-0000000AkiY-1v1E;
	Mon, 17 Jun 2024 13:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A868CE0EA6;
	Mon, 17 Jun 2024 13:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5320C2BD10;
	Mon, 17 Jun 2024 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718629467;
	bh=+Bdh8xsBP73fuzL9slThefp5PjOqE0EOsDAMNdMjWrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKTzCiKT+QV6KxO1ZBWUsNbIfI+kqTNyofkRSgtmvIFuez3DAOLPtixy2o0iYPG6s
	 ty15QnWiCQLtV0YFAvic2b3vwvRkyfjTDWFfcEXv7fq9pUGh5sZtzK5TIPup3m3BvH
	 g6OME/AoF1geOrk5OfP9Uyw4Qdp1xRZ8e3F133o27FIKB24bmCVAQTvdtTb/cshPHb
	 32WTDRv7IlMt+pEn5b5PScLJiOSBYtg0CoZ+QpY2X94PX61hpw/Z+kanpGYEmGV97E
	 1Fp0JIb5OWkfaOLPv6Sc1o8bTNHLORtHZhjX1DAkXl1IrR9Rrnbb7rxAb06ap+ATP8
	 fFrie1YXb5heQ==
Date: Mon, 17 Jun 2024 14:04:22 +0100
From: Lee Jones <lee@kernel.org>
To: Kartik Agarwala <agarwala.kartik@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Mediatek MT6358 dt-binding documentation
 conversion and fixes
Message-ID: <20240617130422.GS3029315@google.com>
References: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_060430_699824_B43C549D 
X-CRM114-Status: GOOD (  13.84  )
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

On Mon, 17 Jun 2024, Kartik Agarwala wrote:

> The primary purpose behind this series is to convert the Mediatek
> MT6358 Audio Codec dt-binding documentation from txt to dt-schema.
> Additionally, it fixes the dts for some mediatek boards which were using
> this dt-binding but were missing the required `Avdd-supply` property.
> 
> I have also updated the parent PMIC txt documentation to 
> reference this binding. I have not added any new examples as the older
> example already has a codec node.
> 
> I have tested my patches against `mt8186-corsola-steelix-sku131072.dts`,
> `mt8186-corsola-steelix-sku131073.dts`, `mt8183-evb.dts`, and 
> `mt8183-pumpkin.dts`.
> 
> To: Liam Girdwood <lgirdwood@gmail.com>
> To: Mark Brown <broonie@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Lee Jones <lee@kernel.org>
> Cc: linux-sound@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>

Please run your patches through scripts/checkpatch.pl.

-- 
Lee Jones [李琼斯]

