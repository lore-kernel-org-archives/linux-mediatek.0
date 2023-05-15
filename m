Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E32C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSaKq006SknPoRzWKUR6yEfq4+uomOGU0fh6xmYh5Ag=; b=hagNuN/IYXJ2CAIFxrp2pskFYc
	tp6/s4OIucz13JsFuqFP3m5R/hVtOg4yk1IghA9PVWmhgNoi89WtMItuoVpzZJO83lXJxuJ0omDae
	m7ivpvKdTVfNnNZ+lhFOL5DM0irAVvWXifjav1Np/RCgoDFWUw5VtzCXQSSL+t2sQeygdovlsd7iA
	7Eq/bCFYrcLaqQprw2c3WHhr4uYy4KNbNPHb57JGSuTKgEP6MLtF8xg5ttIol+du//cXnuT+ynrT5
	G99byXUwwJhrIKbhZkR250kperbz0lx4VbZ6i8PvfA6S4LT9K074/x2nBKcVGeqz5fhY8ulCOg7yO
	05wHhiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pycG6-002zWN-2P;
	Mon, 15 May 2023 17:45:18 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pya7J-002ZbM-3D;
	Mon, 15 May 2023 15:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684164485; x=1715700485;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o4d3wchS2hGWpfF31kHfxYcLQGLrdY5jEIsaF69ZRNA=;
  b=INnIydkWARUOd5cu1RTE0sidt1hoztv0fzoAj0EWd9EnB3IxbWlPnFvZ
   841PtJnCg5Yq5/nSIxrjZiqfNAJjPJ37gW+r9M1QeNGHjFJCspGIU/Nai
   XCy/QqFMr7EnOFxET84KIdTkSBZNwNtteJoLasUeFJCJ7/kAZbHayDqkv
   bk5eurbzU5Ak7nR8dmFXmMnnxH8m96c129O/0dcWjx5C//3s89EYTd9EF
   h0pjtV9T9wP5vkpD4gh8LbkmlN4T9iZmFmKIxeXvfZWzB0CUQzijKonJh
   e35MpqBsFK9vEEgzYRRPNc/l9SG4+63Od3FiQsFE8zTXcKftS6+GNrqAI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340583192"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="340583192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 08:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947452467"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="947452467"
Received: from molivas-mobl.amr.corp.intel.com (HELO [10.251.17.233]) ([10.251.17.233])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 08:28:01 -0700
Message-ID: <8f57c62f-c427-f5df-d517-d4025fe7c65d@linux.intel.com>
Date: Mon, 15 May 2023 10:28:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Trevor Wu <trevor.wu@mediatek.com>, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 yc.hung@mediatek.com, tinghan.shen@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
 <20230515052540.9037-2-trevor.wu@mediatek.com>
 <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
 <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_082806_104710_27189586 
X-CRM114-Status: GOOD (  17.76  )
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



On 5/15/23 10:05, Mark Brown wrote:
> On Mon, May 15, 2023 at 01:25:44PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/05/23 07:25, Trevor Wu ha scritto:
> 
>>> +{
>>> +	/* common defaults */
>>> +	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_ops));
> 
>> Never use sizeof(type), always use destination var size! Anyway, there's more.
>>
>> I don't think we need to perform this memcpy: we'll never see an instance of
>> both mt8186 and mt8188 drivers on the same machine, so you can safely just use
>> sof_mt8186_ops for mt8188...
> 
>>> +	sof_mt8188_ops.drv = mt8188_dai;
> 
>> ...which obviously means that this becomes
> 
>> 	sof_mt8186_ops.drv = mt8188_dai;
> 
> This does have the issue that it then means the ops struct isn't const
> which isn't ideal.  It's also not the end of the world though so I don't
> have super strong feelings.

We do the same for Intel devices, we have a common structure which is
copied and only the members that differ in specific SOCs are updated.
You're right that it's not constant, but it avoids copy-paste of a
rather large structure just to change a couple of lines.

