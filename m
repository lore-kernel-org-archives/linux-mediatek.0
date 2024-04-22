Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC39C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 18:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyTf+77ruK7BvGSvOrX1IkMmnxlAoNb9r3mQW4KSoSQ=; b=tcMNQXqmLlOYCOXns45bdKtjhi
	Ii2ec85BhBsmXSeUf7t054vMkey41NPocU7HBVYFb0iYGsXx/IDNG4bnyeSyj4aOYLfLYIXiruSzP
	JzrEFwmxGnEUPBez8vR2wV+wN/eBiU5evOkbMOA0p2fkd1pl6I20sFfPBAC4go20MjA5G25RKZJgk
	8J0eSTnsBWFYmFEyHSd7REdnT3fMaNTxx02VqPlElmrZAS58d2ffrXWlxYbLJy2hr3Eg196tr6jyl
	npaq+zKpare9b17ZGWcsf4bb377oqNA9nDQeeiA9YroAxs5S/pW70mwy7hlbdYQWyBinxJV5646TL
	DFRIphIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryynW-0000000EhRz-12op;
	Mon, 22 Apr 2024 18:53:50 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryynT-0000000EhQs-1OA0;
	Mon, 22 Apr 2024 18:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713812027; x=1745348027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KdeYjdGtcF1JNqWj59Djb+4HReLocTqors5w6qaChgk=;
  b=mpqmbbhR3lFDyyDS2qIq1jyfaAZbvwecEJxE0TzvA3Yf/9Jminaxor5S
   Hy6lZfwO7GHkUZ4ctApwPVHg8+D1p7w3fzdT/ifEwiP6unBai5GmK9VKX
   +KZadNo5x15sk5SOrte3IKkt4UfUPQnKS979Itn96oQb8d9kyk7SdqtYD
   g+IEXwQZtuZjt0niiApwIjHCq0lByezri+oA9QK3vW++Xr81ryFrsdhv3
   EzROG4fsk+eL/1+9G6Mm2IbM/71wgBYtojqc/Kghz/gsCVYraCKtLPy0+
   FKsO2VgPd83yBJlcLRVYy9OTwTeQP8PXLQaFolsUHXnaPLPclPlW4S6gv
   Q==;
X-CSE-ConnectionGUID: SbObFI70Szqira6shuh4mA==
X-CSE-MsgGUID: 6JifqlY0Q2en3KTkACRUYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19977730"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="19977730"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 11:53:45 -0700
X-CSE-ConnectionGUID: tFsgZtNdQGydqYsVjb23aA==
X-CSE-MsgGUID: /jA5vIZxQ96OJPcbpGXLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24621373"
Received: from leozhang-mobl.amr.corp.intel.com (HELO [10.212.37.174]) ([10.212.37.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 11:53:44 -0700
Message-ID: <d046d195-6fa3-4c52-bc5f-3e5e763bc692@linux.intel.com>
Date: Mon, 22 Apr 2024 10:52:17 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9d1eda85-32a0-4e53-86ca-ce3137439bd7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_115347_448828_783AB391 
X-CRM114-Status: GOOD (  25.79  )
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



On 4/22/24 00:43, Krzysztof Kozlowski wrote:
> On 15/04/2024 16:19, Pierre-Louis Bossart wrote:
>>
>>> The core code does not modify the 'struct snd_sof_dsp_ops' passed via
>>> pointer in various places, so this can be made pointer to const.
>>
>> The structure itself is NOT always const - the initialization itself
>> does have platform-specific changes, so what do we really gain from all
>> this?
> 
> In the context of these patches, the structure is *always* const. In
> other drivers, it is not, but they are not really relevant here.
> 
>>
>> some commit messages say the code is "a bit safer", but I personally
>> find the 'const' more confusing since the information that the structure
>> can be modified during initialization is lost.
> 
> Functions which take some data and do not modify it are easier to read
> if the pointed data is marked as const. Then it is obvious that
> functions for example is re-entrant. Or that it does not affect the
> state of other devices/core structures.
> 
> Additionally, the static data is safer when is const, because it cannot
> be used in some attacks.

agree, but here you are marking as 'const' non-static data.

> I really do not understand which information you lost here? Core does
> not change the ops, so the data should be passed as const as often as
> possible. If anyone wants to write a driver which does not use static
> ops, but somehow dynamically allocated and changed, nothing stops him.
> This patch did not make it less readable/doable.
> 
> The point is that these ops do not differ from other ops or some other
> driver-passed structures, which we have around 100 already in checkpatch.

I am so old that I remember times where we had to put things in ROM.
That's what 'const' means to me: a dedicated memory space for immutable
values.

that's a different interpretation to the 'software' view you're
describing. "this structure will not modified by this function" is not
the same thing as "this structure CANNOT be modified".

I am not going to lay on the tracks, if Mark wants to apply the patches
that's fine. I just wanted to highlight that the reason we did not use
'const' was that the data is dynamically allocated/modified and not
constant at all.

