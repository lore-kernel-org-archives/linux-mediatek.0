Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0CDCCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn/i3Rs0xkI8Xb79tZJqUhTZtrKG9UQVJnW4wyHYOys=; b=IfRSThB89hDKbsd2z6f00xioDc
	Xqi45M7lVO5QC4FeHtXY1hgvpb5WhQpat6xFAIKQAjDlbyaNz63we1+QtkIPZitCoNiCt8IeLw43Y
	FMAH9SKPRfANcwrVdl1rn8yLrp9AVIKK36qCv3aBU/HyU+iTZXiWbqbvwhcNPJXMS+jAOOsWJy2XU
	tz877uQlrB6199WV4wK2Y/MUMIUdaDyaA49GvyqDiaDFVSfQzLBbCF9evlDA0BVj5ypVM5Qw5DAnI
	IPAHyXxWDl/AkonLLGdIe+snjTZ6SZIAtayOp7EVmKjwcFHg1k+WmQrYN1m7Xb4howmrEPFMiwdtg
	zSyg5Y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoyx-00000005EVV-13n2;
	Thu, 23 Oct 2025 06:39:31 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoyt-00000005EV6-309N
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 06:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761201568; x=1792737568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IjoIJ46m5G2Srg/5nswfnJndfZbxt7ecWzpQzMbgZhE=;
  b=FN+QP+0PB9yxc6qReh4G8jLyAu3AIuyT3duDNKckPs2TLdTE/LxRDDmr
   JggDsAPjlulO1ACNiUaP9viRxZa0JTj5wlvrsME1HjGo37FyII2X1ZT02
   Ko4+pfSpRd48P369gv4kVpawnmTj+ISEdRGAPtIZglsFBLE3I4XrBOrKG
   kefahukNqqqgKmK1SPmS76sC7dDpcu5y5FZ9q99kIedu7p5iLuizWgwGd
   F45ZgfmKmdz49S5fNEnHbX1uGlAJ54uhRURsxNNO0c4wwWoD0HToAeMIY
   lNTFuyZrUGAbSBTjskuFZDlKEoPO4IijrmP1XS4q+tqLegTP1a/+4lEoa
   Q==;
X-CSE-ConnectionGUID: MJZAEj0WQJqRWNrWgQBoKg==
X-CSE-MsgGUID: L+QG1cN9RAaSTFOex+4blg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85985737"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="85985737"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:39:26 -0700
X-CSE-ConnectionGUID: eWAiBujDR8uX1nRj9EuO5A==
X-CSE-MsgGUID: Y3Ll4AUfSEu+xoBLv0ZhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184849576"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.145]) ([10.245.246.145])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:39:22 -0700
Message-ID: <a464eb64-4c07-41d0-989a-bdc9eaae9acf@linux.intel.com>
Date: Thu, 23 Oct 2025 09:39:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Fix function topology name check in profile
 info output
To: Chen-Yu Tsai <wenst@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20251023061226.1127345-1-wenst@chromium.org>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251023061226.1127345-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_233927_965331_82D48AE2 
X-CRM114-Status: GOOD (  16.94  )
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



On 23/10/2025 09:12, Chen-Yu Tsai wrote:
> The function topology feature, and the plat_data->machine field that
> specifies this feature, is ACPI specific. The check didn't take this
> into consideration, which causes a NULL pointer dereference splat on
> OF platforms:
> 
>     BUG: KASAN: null-ptr-deref in sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
>     Read of size 8 at addr 00000000000000c8 by task (udev-worker)/247
> 
>     CPU: 7 UID: 0 PID: 247 Comm: (udev-worker) Not tainted 6.18.0-rc2-next-20251023-03804-g93b191bc0c26-dirty #747 PREEMPT  ba3c303a11d89508de4087cb5b4f8985b6d87b6f
>     Hardware name: Google Ciri sku2 board (DT)
>     Call trace:
>     [KASAN stuff]
>     sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
>     snd_sof_device_probe (sound/soc/sof/core.c:304 sound/soc/sof/core.c:388 sound/soc/sof/core.c:460 sound/soc/sof/core.c:719) snd_sof
>     sof_of_probe (sound/soc/sof/sof-of-dev.c:84) snd_sof_of
>      platform_probe (drivers/base/platform.c:1405)
>     [...]
> 
> Check that the ACPI specific field is actually valid before accessing
> it.
> 
> This was seen on a MediaTek based Chromebook.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> 
> Fixes: 2b92b98cc476 ("ASoC: SOF: Don't print the monolithic topology name if function topology may be used")
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  sound/soc/sof/fw-file-profile.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
> index 4a2afc04f338..76bde2e0be1d 100644
> --- a/sound/soc/sof/fw-file-profile.c
> +++ b/sound/soc/sof/fw-file-profile.c
> @@ -288,7 +288,8 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
>  	if (profile->fw_lib_path)
>  		dev_info(dev, " Firmware lib path: %s\n", profile->fw_lib_path);
>  
> -	if (plat_data->machine->get_function_tplg_files && !plat_data->disable_function_topology)
> +	if (plat_data->machine && plat_data->machine->get_function_tplg_files &&
> +	    !plat_data->disable_function_topology)
>  		dev_info(dev, " Topology file:     function topologies\n");
>  	else
>  		dev_info(dev, " Topology file:     %s/%s\n",

-- 
Péter


