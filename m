Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0B0CCFA15
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrWMo5J2L1fbt/STY7GrinBVezF/kFB3sTNBBFJ6U94=; b=SFnebNikPsviG92vR/XXSQNpTH
	bWGkKNNWsMLQ6ktyckvesHX8lX0sCFfC0q1UftNNPD+11hi0pGEQbTBcKDLj0TcNNW/KvEYUmN2tY
	0aTokh6DyEgo6nGR2hVj9B2imOXp43gUWIjmDAaa2XPj+Pl/OMi/4fUy0bHlY6g5bV4ZUR/Z3eUtw
	Y48/59X2qnq29eJxYTo3JjifI0TqcmaL5Ysm8wbCgv9NJHuxEX5l4jPSj2qE9MSUsgWRHUREKt7w5
	9Tsjp7bONCsLZEfM/Gab/gblqfWxOrLWc2rJ0aj8KalYJ62D/6kbTHE3atQcyIregPIJqUUAjyY0G
	St47gYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlAC-00000007xra-1mwS;
	Thu, 26 Sep 2024 09:51:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl2D-00000007voM-1ld5;
	Thu, 26 Sep 2024 09:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727343819;
	bh=vq1GUjXNsP5rX8yDh/hNAiZ3oslcwl01tLDsM6AY3wk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OK36qtJMUqVfqjq7kqlAHsrny4+RT5SkCf6eM/LJWJ5TYCJf1XAm1Tb7Bceq/8hOr
	 8RNIoRdduYHMI1R1Vuowx/iMbAXUjEyILwyR6iQodeXlWsgIupc0rd8odiEC09o2Js
	 edKIDL+G5h+ng7AfVIHj05qDDoNNzwsMvwcOvocEhzZkZQHBKTGwWe2F6C6//taULJ
	 fNVQiNSRLq9JDv9I4YkhE/FXwitT2orUDMEhQvE6Ynv3fjSOsLIyyzw5nB58yuSfxm
	 U1lfXIWlWzKnFB9Ul/2f3s9y64YUoDFlfRMeXxWB5f0usjg3P74TPymSzzEbjNfD2X
	 OqGzMyZGKqTww==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ADEE17E10B5;
	Thu, 26 Sep 2024 11:43:39 +0200 (CEST)
Message-ID: <2ad8c375-84b9-45ea-a27c-076021970d28@collabora.com>
Date: Thu, 26 Sep 2024 11:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
 <20240925101927.17042-3-jason-jh.lin@mediatek.com>
 <64b96ec0-1264-4a3c-a26d-f8a0c3375d79@collabora.com>
 <2c05e5d9684aac50dea22c2c0dfbf0f679e29434.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2c05e5d9684aac50dea22c2c0dfbf0f679e29434.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_024341_655832_A850DE64 
X-CRM114-Status: GOOD (  10.03  )
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

Il 26/09/24 11:42, Jason-JH Lin (林睿祥) ha scritto:
> On Thu, 2024-09-26 at 10:37 +0200, AngeloGioacchino Del Regno wrote:
>> Il 25/09/24 12:19, Jason-JH.Lin ha scritto:
>>> Since some SoCs support premultiplied pixel formats but some do
>>> not,
>>> the blend_modes parameter is added to mtk_plane_init(), which is
>>> obtained from the mtk_ddp_comp_get_blend_modes function implemented
>>> in different OVL components.
>>>
>>> The OVL component can use driver data to set the blend mode
>>> capabilities for different SoCs.
>>>
>>> Fixes: 4225d5d5e779 ("drm/mediatek: Support alpha blending in
>>> display driver")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>
>> Just perfect.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
> 
> Just to confirm. Do you mean reviewed-by? :)
> 

Oh, my brain needs coffee. Sorry about that, yes, I was meaning R-b.

Anyway, gave you the right tag on v6, so ignore that.... :-)

Cheers,
Angelo


