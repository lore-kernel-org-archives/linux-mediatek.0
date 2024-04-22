Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00425C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NX2ejD6gwXnqgiSg0Tlos+riWTvWQV81zFunbmPbNM=; b=XBs1WzGBb95nUsIM4Aj7bp9rYO
	qbceio8DKJam3xak1dML4vypfpdREnhFu3qmm+LS2DRgH5+BlZgY0fmWizFtVI9yJhn/E+345gDGh
	gjtJvnMgBXkO8Q2jl8UL8+ELW4vh+YX1eVrBidfirXB4q5M3ZsU3jfGQpklTIz4oBMXeKn4Dn0COb
	g6SN4Gdbngw5xaRrs2ENvMjq1IuOnqRqFAMbmuM91gtcce2pSH/o+TUYzY+/ktrty8SPgDH8Eh9Pr
	RthUJh70zf+yyjeoezh+ztFnuAymPR8wZwUzsD+9oPn0Oi6Ajz1uR/bT/dCyVr3nVeCtEuRr6Oq3R
	Yy9evxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz19a-0000000F5v2-1hUG;
	Mon, 22 Apr 2024 21:24:46 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz19W-0000000F5uM-2SPV;
	Mon, 22 Apr 2024 21:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713821082; x=1745357082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KeQhQEZ8pRcakTBQ9PKDBftDt52xxSsucNhl6xG9XeA=;
  b=C3nEjsGyah/59r5xnUSGtYhRhJQI7GdZwS+yYB7S/gBaF18f0xULRymF
   ay4CVqDAeJhj0bi76KZFYN99OGnWfob9zN8TNKxpwHI3TdRt4gu1ojvbX
   tzBdBqkfSTSydDAB80uUjiYlIv3zYlYfSaalEtjs1jLHErbAbA1HnhsR5
   IMTy4kIlskLLH0MFhn3qasvl6FVx+ZbG5I+VNX/83QlPOtBWpMomc92nT
   iIHX1fckN2hWN2vO+knOI9cyuoru7h+5iUjRkTWJthmhM6gmFmSLmYgm6
   q94+JRgmBhNMGmmJhji0QpIIUW5d2cSzDUBqnMH9vzjSBVERpUro7xOyj
   A==;
X-CSE-ConnectionGUID: 0F9KPmlMS72LSQJy4ucIUg==
X-CSE-MsgGUID: 5e/FkopoQymf/LnkNSc50A==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9491470"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9491470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 14:24:39 -0700
X-CSE-ConnectionGUID: wTTDihldRN6BR80zwReOvg==
X-CSE-MsgGUID: fSmU2ufDRNW71eOumkykEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24764444"
Received: from leozhang-mobl.amr.corp.intel.com (HELO [10.212.37.174]) ([10.212.37.174])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 14:24:37 -0700
Message-ID: <eaa0c99a-3b41-4444-906c-d2f005d326b9@linux.intel.com>
Date: Mon, 22 Apr 2024 16:24:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] ASoC: Constify local snd_sof_dsp_ops
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
 <89f8f0be-2534-46c8-9058-cabea4f68568@linux.intel.com>
 <9d1eda85-32a0-4e53-86ca-ce3137439bd7@kernel.org>
 <d046d195-6fa3-4c52-bc5f-3e5e763bc692@linux.intel.com>
 <138ac465-1576-4e86-a05d-63f8acc6fb70@kernel.org>
 <3acfbe3c-8b83-4c40-83c2-437f963fd25a@linux.intel.com>
 <7490bce3-3bd6-4beb-b8be-d47a6b0a30f0@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <7490bce3-3bd6-4beb-b8be-d47a6b0a30f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_142442_706101_04C55C5D 
X-CRM114-Status: GOOD (  19.54  )
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



>>> There are multiple reasons and benefits for const, like compiler
>>> optimization, code readability (meaning) up to security improvements,
>>> e.g. by some GCC plugins or marking rodata as really non-writeable, so
>>> closing some ways of exploits. There are many opportunities here, even
>>> if they are not yet enabled.
>>
>> Possibly, but the SOF core does not know if the structure it uses is
>> rodata or not. Using the 'const' identifier would be misleading.
> 
> How so? If core does not modify structure, it should take it via ops,
> just like 100 other widely known structures (see checkpatch). Why is
> this different?

I don't understand "it should take it via ops"

We are already fetching the structure with private_data.

>>>> that's a different interpretation to the 'software' view you're
>>>> describing. "this structure will not modified by this function" is not
>>>> the same thing as "this structure CANNOT be modified".
>>>
>>> Yes, but can we please discuss specific patchset then? Patches which
>>> change pointers to const have one "interpretation". Patches which modify
>>> static or global data have another.
>>
>> Just look at sound/soc/sof/intel/mtl.c... The core will sometimes use a
> 
> That's a driver (or specific implementation), not core.

You are making an assumption on what the SOF core is. The core is used
by ACPI or PCI drivers as a library. The structures are all allocated in
ACPI/PCI drivers and passed to the core library.

>> constant structure and sometimes not, depending on the PCI ID reported
>> by hardware. This was intentional to override common defaults and make
>> the differences limited in scope between hardware generations.
> 
> 
>>
>> int sof_mtl_ops_init(struct snd_sof_dev *sdev)
>> {
>> 	struct sof_ipc4_fw_data *ipc4_data;
>>
>> 	/* common defaults */
>> 	memcpy(&sof_mtl_ops, &sof_hda_common_ops, sizeof(struct
>> snd_sof_dsp_ops)); <<<< THE BASELINE IS CONSTANT
> 
> Yes, I saw it and such users are not changed. They won't receive any
> safety. But all others are getting safer.


Maybe there's a misunderstanding on what the 'SOF core' is. This is just
a helper library that are used by the PCI drivers. The core has zero
knowledge on anything really.

> I really do not understand what is the problem here. In entire Linux all
> of such changes are welcomed with open arms. So what is different here?
Adding 'const' at the SOF core level does not mean that we can treat
structures as rodata. It only means that the structure is not modified
by the core library. Not the same thing.




