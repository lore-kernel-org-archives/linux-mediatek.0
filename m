Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC78C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnzDg44cuvVKZKGAaWGyomBpEoZHVUnG2pJJGTunptw=; b=ChYAhjLApxXPQRFgWKT35IOZWw
	OdqBaeqy4j2ADaJap97XimP0s7wpwk5DTZGijtuTolI69/P9j5zOExFbM67bXaaITt0yVaTz/WJY7
	dV2Fs3//RNnzFgrIRmv3GiGhptvs1aVtJ8mYCft8QuhW1P1ZatI4WqXkj4BGBiY1ocuHpsW651+LY
	CWoEKfECGQfuCZNR3j9B4s7W1gvyOX8PjRa/fa50JJv96KMAtkl4aGNDSt8Dv7MkX7vockXKR0Lla
	ipCBwFBWFtOfvfggA0RfMHSZDZQh0TtUBe8rHOEDRkHd09cFofLf4kqZMbs0xunfsa8Ydwsq+pc+c
	A+OkDaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsVo-000zoQ-IU; Tue, 14 Feb 2023 10:26:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsVb-000zkN-FA; Tue, 14 Feb 2023 10:26:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 50A7C6600013;
	Tue, 14 Feb 2023 10:25:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676370357;
	bh=mfv0qhnO8fr6EAdEvEBRF7gUJfNIE7MQAQr8S57P2A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cwsqP0Fsp92yfDqP4G+i6amfGYoUrxFRYZObLUBOmcT4VJ7CpeGSd1hDVoC5LDiP2
	 SdIYujjKTUzl7HdQkZ3g6dpOH5I1OfI1Mfvxybg1aIwrJgktV+7BgGflyXFSV/bdtu
	 mN3vvJpUSyaeYXjItSTh/+I+AbIjREn/gTyVLDuRqc7SgJR2CZzqX3wzONhhocbret
	 ftbdbPyuC/sbz55vPKPUtq9jth7IXOVcmyOrUk0yGTJOQplUQL9ecSc+/CExoiWLdT
	 2Ufow5R7EeONmDcomLSmYdHS8mdFqBLEIYrSRZUXFjjnnvMY0nXepaL+aQMsxSC1k3
	 n/sFFInxX1cFg==
Message-ID: <09401672-3d4b-ef49-83e2-75abdcfb84bb@collabora.com>
Date: Tue, 14 Feb 2023 11:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: Add dtsi files to use rt5682s
 on mt8192
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230211002626.454844-1-nfraprado@collabora.com>
 <20230211002626.454844-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230211002626.454844-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_022559_659234_793F40DD 
X-CRM114-Status: GOOD (  14.08  )
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

Il 11/02/23 01:26, Nícolas F. R. A. Prado ha scritto:
> Add a dtsi file for the rt5682s audio codec and another to wire it to be
> used by mt8192's sound card.
> 
> These dtsi files will be used by Spherion rev4 and Hayato rev5-sku2,
> which make use of the rt5682s codec instead of the rt5682 used in
> previous revisions.
> 

I think we're getting too many -audio-x devicetrees here... it's getting somehow
strange: imagine if we had 4 xxxx-audio-xxxx.dtsi for all of the supported
machines in dts/mediatek... that'd be at least *40* more files and would grow at
a quite fast pace. Too much IMO.

Check how I've done it in mt8195-cherry.dtsi, mt8195-cherry-tomato-r{1,2,3}.dts:
I didn't even have to add any mt8195-cherry-audio-xxxx.dtsi.

I understand your reasons for doing that - reducing duplication - but, in my
opinion, duplicating just 3 lines for 4 times is the way to go...
If those 4 files were used in *most MediaTek devicetrees* instead of one single
project, I'd agree with you though :-)

If you can come up with anything better than what I propose... I'd be even happier!

Cheers,
Angelo



