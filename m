Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4310EC54E41
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Mar 2024 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw2VS+QsVfGXZiZF1IkS/2FHF2jIkdONTN9aFBFDJco=; b=oF4rtIe3jCwRnjU30IOnBus+If
	fstP5AiZPCB6onBs/Ej0AII4/CJFhXIAj2XGxFeBhVkvY0OvMtQxP562G1d7g+PTifVI3M+DT928a
	GYuBD0L/cK/9tknZJLFh06JQ7C5LXKKTkBxjYAp88adFfcGp36ArmE9NnX8jkqPE+ELnB8OyndsQ/
	hC6qnkZzydlcRqzbJWKcxt8jYtzlWlwAlisjOThM73cI4uOBzKTinNcH/TtqK12Wv7Op8bgYxbK0x
	nLeTT4MOGXg4iwOOM+0WepVKHPVGU4AD2Vr4RgmPU9lgHIEV8DkH7dNIGNX6KIg0OYyRgdNe3xtOG
	UhCwFlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rixLh-0000000DUhB-1QEq;
	Sat, 09 Mar 2024 14:06:53 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rixLe-0000000DUgO-1A6L;
	Sat, 09 Mar 2024 14:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Tw2VS+QsVfGXZiZF1IkS/2FHF2jIkdONTN9aFBFDJco=; t=1709993210;
	x=1710425210; b=VQ7a4utDW7lYAlCfjI0NUFECGAcqhgC/auFFH8JQWBOt7a25SfxRHJqkeyIA1
	pSUOATr3nNp38lzBkwyj+PHZdpCL6ctAsPE5nE9l6ECxO5rkKgVJRsesNGmL8wAdBUC3hsqWwaX/I
	oLk1mTWNY62hrmbgzWLQBf90wzX+fevMmCdj5+0cfJGinlQLC80I+QN84Y3w2JTZ9XBtmIOA95Nld
	YCFvpsgUiyqXMHsvwljk1fszCbuDxiUEafUxrTL+Jj9ylwTjSSEZtsF+tgzGTUTNvkzirl0FmOWEB
	SfjGfBb3hjU62AUtJXcMmnwZ9qDgn5UZChwV2ODFOdbmvwlCjg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rixLT-0007yp-Dn; Sat, 09 Mar 2024 15:06:39 +0100
Message-ID: <b888cbe2-6071-4445-91cd-8ce7cc9cc8f4@leemhuis.info>
Date: Sat, 9 Mar 2024 15:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Probe regression of efuse@11f10000 on
 mt8183-kukui-jacuzzi-juniper-sku16 running next-20240202
Content-Language: en-US, de-DE
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: regressions@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <47cdeac1-121d-4b1a-a3ac-e2affc7a2fc3@notapiano>
 <c4416256-eedc-4c9b-b968-3a02490c4c09@notapiano>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <c4416256-eedc-4c9b-b968-3a02490c4c09@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709993210;990b76bd;
X-HE-SMSGID: 1rixLT-0007yp-Dn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_060650_503573_450975DB 
X-CRM114-Status: GOOD (  14.68  )
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

On 08.03.24 15:31, Nícolas F. R. A. Prado wrote:
> On Tue, Feb 06, 2024 at 11:11:00AM -0500, Nícolas F. R. A. Prado wrote:
>>
>> KernelCI has identified a regression [1] on the
>> mt8183-kukui-jacuzzi-juniper-sku16 machine running on next-20240202 compared to
>> next-20240118:
>>
>> #regzbot introduced next-20240118..next-20240202
> 
> Not sure why this got filed by regzbot under the mainline tab rather than next.
> Maybe it was the missing collon? 

No, I guess that is a bug in regzbot: the support for -next is there,
but not much tested. Will need to take a closer look, will do so in the
next few days.

> In any case, the fix has already made it to linux-next, so this should close the
> regression:
>
> #regzbot fix: nvmem: mtk-efuse: Drop NVMEM device name

Out of interest: Is involving regzbot worth it in case the fix is
already in -next? Or is that primarily to keep track of "we found a
regression and a fix was already available in next". I don't mind if
it's the latter, just curious.

Ciao, Thorsten

