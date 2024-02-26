Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA8DC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDzCUGUParppw3zjkX5sSJU2pD+QJRLVWATxFEVY+QA=; b=2BG5UUTG+Z8bQDReOw6xEa+LDo
	sZ39CTmnjwneKYlkJYvl0oje9VLFAOXtfcFlcciFhPDaOxX4l0vBIVv8G0OKEcbl0E+/qzFvrQ08G
	A3gn90ETe7vndE408uuNASUhiNddZLJZ/B5HUENEfHqgYxUhBhEFApBG04j8/wW0J698DgCFWx1KB
	1iTjV8PKMB83B5HayQribGOfTTkqdbxJv16HbP6RVy+I4x7dZXfuzKsvB1RGB7URIwPJ6WL4/ifxa
	p25fek8nL4RatEXZNuRNx8IA4FJ/lsbrBXqzcvxHlr8vLN1xWC1yY4gzhIby92qHFO0S3RnOaaBa/
	cKiZJZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWaA-0000000H4vY-3YyQ;
	Mon, 26 Feb 2024 08:43:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWa4-0000000H4sP-2PcU
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 08:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708937001;
	bh=7tWk0zhZOW2AyHeE8JN2hmS9AUeGcPyEShuN2Nk8GSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cjNQTnUGWeXLKtjG32spXHpy9A7jLY9HdhXy6zZARpW+f90xV0zkxfsHgC8Ix5Ygv
	 xZ0/fSF5kOpWfz3INhZO/yKEHjP93N8jl6/lTRvhO0Ki16AnsNdZHpXlfvH7Foktb8
	 JYHFVTkUb0DW/KLDf3eoMGDpnM6/h1iC/b+rnbZjL2UuGr1iUoPf+GWVD3M4ncsHkI
	 9r9BQdpIS8oPDAWZs12IANBFXuX2HsCFMMsreXBZQxmvMmgo3cU29/KrmoIgVxKZiy
	 Y+gV/tAYmmbZ41iy9r/bnffpLKroJ21Hrzw6gOEM+DEH1WFUC+rGKBokwzPw8SyVkE
	 gSyrzBdrBMCVQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A97523781183;
	Mon, 26 Feb 2024 08:43:20 +0000 (UTC)
Message-ID: <c4814e25-42c9-4604-b86a-8ef0bd634f78@collabora.com>
Date: Mon, 26 Feb 2024 09:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: Fei Shao <fshao@chromium.org>
Cc: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 chunkuang.hu@kernel.org
References: <20240221165643.1679073-1-greenjustin@chromium.org>
 <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
 <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_004324_791776_C9134257 
X-CRM114-Status: GOOD (  12.21  )
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

Il 26/02/24 09:21, Fei Shao ha scritto:
> On Thu, Feb 22, 2024 at 4:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 21/02/24 17:56, Justin Green ha scritto:
>>> Add MT8188 overlay driver configuration data. This change consequently
>>> enables 10-bit overlay support on MT8188 devices.
>>>
>>> Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
>>> BA30 overlays are confirmed to work from modetest.
>>>
>>> Signed-off-by: Justin Green <greenjustin@chromium.org>
>>> Tested-by: Justin Green <greenjustin@chromium.org>
>>
>> Hello Justin,
>>
>> I'm 99.9% sure that you don't need this, you can just use compatibles
>>
>> compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>>
>> as they *are* indeed compatible, and MT8188 does support AFBC as well.
> 
> Hi,
> 
> I confirmed that I can lit up the MT8188 display with that plus a
> follow-up patch [1].
> Otherwise a compatible sequence of mt8188, mt8195 and mt8192 would be
> needed, but that would be somewhat redundant.
> 

Actually, that wouldn't be MT8192, but MT8183 - following MT8195's devicetree,

so it would be

compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl",
              "mediatek,mt8183-disp-ovl";

And yes that could be redundant, but I'm not sure that adding a compatible
string to the mtk_drm_drv matches is a good idea.

I'd be more for using the triple compatible strings in there instead, as it'd
be like that for only *one* node and not more than that - IMO, that is totally
acceptable and it's also the best (and lightest) solution.

Cheers,
Angelo

> [1]: https://lore.kernel.org/all/20240226080721.3331649-1-fshao@chromium.org/
> 
> Regards,
> Fei
> 


