Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDEFC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ao7OtFR6Y/gnMao2EDCJiWEcU30WgANyFzpo/uxrtFM=; b=JebXWFA5hgKOG4PRUO2cF6wBFZ
	PK4HnaWzYXOEizK1YGbybKhr6QEMjulpOGYaCjoBQ7GQ5YfMIY72l4k45Skq1+Fdt6qsljCikyyJf
	CjAsfs1Wx0ObqmAJeHWduIvIaEOOTpXQk9B/6ZGtmhaEKlvqnd+R88+I3i0NdYnMVX1X+Djy7HKYt
	THnoQHbqt5t7p6pQdDx/JypYS3Bf6P0RWMR3PxthT4a5/FCxqVoYbgg7W1tP0gHADbq/CQh2Z3cB9
	KvBHoFceklxNJvTeUjOXvgesIha7EqvHUYPVHm+SgZyRm5dgg2ZlhOttFtbntjyKcT86FlCpTvU0c
	Mu7O+hAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIWD-00000000cwG-18hT;
	Tue, 23 Apr 2024 15:57:17 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIW7-00000000csa-01Mz;
	Tue, 23 Apr 2024 15:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713887830; x=1745423830;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ao7OtFR6Y/gnMao2EDCJiWEcU30WgANyFzpo/uxrtFM=;
  b=iK1lL2VGTRQd1TcKZjdR59PPw3TUmZdA7CKRzFjKoVQ5H8eGn3AmzRFH
   B26RqTf/DrF1udEmLMr7pUyTwdGH2iSCCGiAGtY4bHXZqSg1AOcwEgQVd
   DBevFhPY0IU4iBiWH8rMy41unemq7hvFH6mKt5sUM9TDaXhcfX9cZAPWm
   PnDnGCEuHG3WUJaUYa+Mw6cfrbWWG6lp5zBzBranilnFEBWdyjWRbAduN
   4BGQLbJd2c/E+N2n8E6qqhUzf21G2qimSYZK6QWo5DO5nVYC9FH7F1M00
   uR/THGP4oNE0oXuOLvgD2RT9spHcjXF5aBSY+d19N9kmvnOCxMllVXOT9
   Q==;
X-CSE-ConnectionGUID: +x9MM1hKTS2eueuavK+Evw==
X-CSE-MsgGUID: qplJQPo4Rd+ZguKuSZ0erA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="12415290"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="12415290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 08:57:03 -0700
X-CSE-ConnectionGUID: vO5xSsY6RmKdl51eWK21mg==
X-CSE-MsgGUID: en4GCTrdSViTMNvF3cDOIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28865302"
Received: from alexkiru-mobl.amr.corp.intel.com (HELO [10.212.38.129]) ([10.212.38.129])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 08:57:03 -0700
Message-ID: <735d6dbc-86e4-4747-9bd9-2574ead7d039@linux.intel.com>
Date: Tue, 23 Apr 2024 10:57:01 -0500
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
 <eaa0c99a-3b41-4444-906c-d2f005d326b9@linux.intel.com>
 <aef907ab-1087-4f49-bea4-d43ee6cebb73@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <aef907ab-1087-4f49-bea4-d43ee6cebb73@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_085712_091029_3E2568DE 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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


> Are we talking about basic C now? Of course it does not mean that and I
> already explained what is the goal of this - the static or global memory
> in the driver can be moved to rodata.

the dsp_ops used by the Intel drivers cannot be moved to rodata in all
cases. the baseline is constant, all extensions for TGL+ are dynamically
allocated and modified.



