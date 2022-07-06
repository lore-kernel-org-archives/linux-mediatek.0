Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OH7/Pf8ZnlV+ovSZB0Bi/QMGpoif9D09NzhCz89pwyY=; b=31sIScSVO3j5JmGMpEkKwEiJtt
	dAxqr1aGCq248/BpPxjb2VxlNXgsSd6Xke8qg6SPeykGvjxwS53bmZfFAzqn6CzWA4YqVzT+ShFVI
	KDR2vyqSKTDSwnVQQEk8iDe3h1kOIbU78nCREG9tnqIRq0h5n0zw6eUeJpFWfJ2WLLdVuteuRWwxf
	oFzQKB2nfAUX+Gshl0qDUkRLFJED8bI30kGLW04bD0Yn5rTufTtyccR+HFerRmdJDQCmG3tJlEARc
	nQEl5b5om5D9hghDvyW3gZVqdFvmZ4BbAco/FSvJ18tLtsBfi0cSfyyozd+PT/TSvM3Yfksh4NKXo
	9tsGVCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95F4-00AJkS-2a; Wed, 06 Jul 2022 13:38:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Ep-00AJc5-54; Wed, 06 Jul 2022 13:38:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8A7466019A9;
	Wed,  6 Jul 2022 14:38:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657114717;
	bh=qOtVS41pFz0Cve8LG+rZ2GhjzM5M5kZoqRvDnnf0RBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmP6bXbo4NwE3MRbQ27Ib9ENErWkf3QTl7Z28jEeOLe1o/C29AscjQJhM4P5kWJRD
	 RfewV9nXGULjUsuoB08jqa1bJhqa9mJEZSXOWvvR0EcfC00hNO04eBfnqYeFvKW0MX
	 DYDlmYguGCfGcGeV0cXZfBe1ti7YDySZ+5ywsICO2ryDZ4uQjXE19SM8wgyK4i9ScQ
	 C3+p0Pk3IddEr/NCcs2JACVysqr6Xno1O/LDjEGwz1dWszeuvBIV83IAVrSEQ9Gapt
	 SOgHc5ECUR3inWCl/95IVAJU59iVWklvznwdlf2CnLxvhQdfWjXol/o1lx6acc81rc
	 c1iK12Jxu3Tgg==
Message-ID: <82736173-b3b8-1e1a-3e2e-25d9ca3287eb@collabora.com>
Date: Wed, 6 Jul 2022 15:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 RESEND 0/4] MediaTek Helio X10 MT6795 - MT6331/6332
 Regulators
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
 <YsV9IerWCoa/xtwM@sirena.org.uk>
 <57367b11-f2d4-476b-b92d-16c1726316c0@collabora.com>
 <YsWG0jfqAf4EqojE@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YsWG0jfqAf4EqojE@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_063843_375023_1CE5AC20 
X-CRM114-Status: GOOD (  13.35  )
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

Il 06/07/22 14:57, Mark Brown ha scritto:
> On Wed, Jul 06, 2022 at 02:49:56PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 06/07/22 14:16, Mark Brown ha scritto:
> 
>>> This previously got 0day failures due to missing dependencies which
>>> need would need a merge with IIRC MFD, I see no reference in the cover
>>> letter to dependencies?
> 
>> The only blocker for this series was the MFD patch, which got picked and
>> it's present in next-20220706 (as you suggested me to resend when things
>> were picked... I decided to wait until they actually landed on -next...)
> 
> Right, I also said I'd need a pull request - if I apply the patches
> without having the MFD bits they depend on in my tree then it will fail
> to build.

I remember writing that to Lee... how do we proceed in this case?
Should we add him to the Cc's of this patch to notify him or..?

P.S.: Sorry, this is the first time that I deal with MFD...

