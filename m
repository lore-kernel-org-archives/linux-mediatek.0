Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E2AC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbIvBsCSlYgtn5DLR8rTXm12Kw/IThYqgc9Nl0uCpoo=; b=yZoXQd1vt02noWhljkqoYohQxN
	12cwT4XYk8yU8m2JFIAXpqfwL4a+iyzJbfFRUv9RyUQHAAR0ujGUMa49r2GhH4vshuq7W+znMlRmy
	Kts2hWN2gk974NG0xRwlGTZVdohZ5/+CroOZEtlv6GFDISQQLlMAWQfcLshN85mt9dt5X9TI5F1Z+
	HywQqEC2ZZmA9NHaAC16zMxJm2GnIxrik8T2jo0m+3Tkko8iRSnxohfe6e2uqB/8n0OE0P/hmRE0S
	Em0zCP7J31Tg4owhXTB1z7CnoVVbAu8aMLJjERzXcjcS5v3UUVKWaEhSPZiAa/haLkWbBotA4a8D4
	kawHeHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01iD-00000009JQx-2c0u;
	Thu, 25 Apr 2024 16:12:41 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01i9-00000009JQK-2EjY;
	Thu, 25 Apr 2024 16:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714061557; x=1745597557;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=5NE/lyOaUfLlW/OASHe3DgI9W5o4P0QFA65CKeaSAiM=;
  b=g5/K6bIRKrGeq7LymE/tnim8X81Rp7a8IYeaNsldawIEWaiHj256paxo
   dByl3UATZowu1RcoaosdbzsPNrRuMSWPP0RvxAkOs4W0PFjHNn+coT36y
   995gkT52hH84oMdTxa+3oBaDA/Fl1i7Y7ORjxDtxqQI7590LlMPVA8XF7
   laCTYY9uAIjMy23Sf/iV5PMuFRiy2r7Tg2j1C46a7SoZQjJfI/TNXja3w
   RmOgxo1PzTTPgOVaxaU7ORFcx3sasypAG6SIWcPBbcNPdlFXDYXXjwFOg
   7AFQJrqU3VVzmBeLtIlOnhSTF5TelebnZtmJru1kfwaaNLdfiJib5k1Vp
   g==;
X-CSE-ConnectionGUID: mpCMrZrERza5tizAWw3wag==
X-CSE-MsgGUID: G0oCYDGpQl6UbmcVMVqZCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20376424"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="20376424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 09:12:36 -0700
X-CSE-ConnectionGUID: 55tzMgBXTLCWFo6GfzAnFw==
X-CSE-MsgGUID: 1uyU9cEuQeOv5TAheGc1BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="62607732"
Received: from mhillikx-mobl.amr.corp.intel.com (HELO [10.212.81.51]) ([10.212.81.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 09:12:34 -0700
Message-ID: <2f7f0dd1-14de-428f-94ce-fa03cce313fd@linux.intel.com>
Date: Thu, 25 Apr 2024 11:12:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
 <eaa0c99a-3b41-4444-906c-d2f005d326b9@linux.intel.com>
 <aef907ab-1087-4f49-bea4-d43ee6cebb73@kernel.org>
 <735d6dbc-86e4-4747-9bd9-2574ead7d039@linux.intel.com>
 <65a5837d-36b3-41bd-b03f-d4f93b30d5c8@kernel.org>
Content-Language: en-US
In-Reply-To: <65a5837d-36b3-41bd-b03f-d4f93b30d5c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_091237_625326_68E41F73 
X-CRM114-Status: GOOD (  11.70  )
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



On 4/23/24 11:06, Krzysztof Kozlowski wrote:
> On 23/04/2024 17:57, Pierre-Louis Bossart wrote:
>>
>>> Are we talking about basic C now? Of course it does not mean that and I
>>> already explained what is the goal of this - the static or global memory
>>> in the driver can be moved to rodata.
>>
>> the dsp_ops used by the Intel drivers cannot be moved to rodata in all
>> cases. the baseline is constant, all extensions for TGL+ are dynamically
>> allocated and modified.
> 
> Yes and these drivers will not benefit. Did I changed them here? I think
> I didn't, because then it would not compile.

So we do agree that's there's no benefit on any Intel platform released
in the last 4 years...

The CI tests [1] don't show any regression, nothing was broken on our
devices so I guess there's no further objection.

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[1] https://github.com/thesofproject/linux/pull/4949

