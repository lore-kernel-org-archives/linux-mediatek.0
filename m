Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F255DC00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU5KDltuTt9aQCPYXF9+eq8jRI7Tg8SGbP0xqq6dmYs=; b=iwSqKvw+g8hzXFDoBChLuBFzKf
	m5HdZSwvq8LgNEhyRxzurFsJfVunttE+T6tEjs1c1Vox6PndQj0IK+1VkTfQihycXKa/D2cqkUs1+
	w+Q2wHZDLf3JF5Tc2I6TtFwp8FYf1lxGk5ALEglmdOpf3qpPKFGBL6sMbqxSQ8Cu7RVHyS3QnwzP9
	d8C8rWYtQ1oa3KF/u5v2kEaDyXPEitdxLdRkgF7w2oNVoYg/o66/BdKwITN03tOWlzu617rBfU70z
	8r9mugz+GFeBy9AwyQjvxA7KAJXQkpKiQ1kO7BiazZ+GrN4g91V6XHipQQ8CnWscGdMfvQQdFuchJ
	LwBg6scQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNBC-00000008f1T-4Blh;
	Mon, 15 Apr 2024 14:19:31 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNB5-00000008eys-3q9M;
	Mon, 15 Apr 2024 14:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713190764; x=1744726764;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=WU5KDltuTt9aQCPYXF9+eq8jRI7Tg8SGbP0xqq6dmYs=;
  b=UPyvIXQv2uyO0JtWYH+26IxxIcf4Ctq7gYkDCF1/iJQs9TLoCKZKLeqP
   i1PPgExp/ZEXDY8sXOBqzKa2ZlfLfTrBykhqYZZzxDINBB+/txIhxIDx1
   3lKwvl8I1FmlGQuk5nSIJ8eW5odQ14H/sqIxR7ZdnUKMczLSnEJn3VPw2
   H/AVnGn8yV9c+6uwrMUJkbSgJZysLKrE6UVFNfWApHAOL9HfHejqmwMTU
   LCYCjkuiRzo86NncDuobJDbI8T4yVxRwt6Ewn4C5AnnoDVsMZ5DjHziPH
   SYKWy6JiAdNLaiXQyrVg2Ar19B+M5JUHBQHGYZ0sZnFyGj9HrMqk+XF6r
   Q==;
X-CSE-ConnectionGUID: o/M9Q08FTEqtrGOBh8aQ6A==
X-CSE-MsgGUID: z+DJc8ZJQUOHirQwjGSE2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8443595"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8443595"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:19:23 -0700
X-CSE-ConnectionGUID: 1TdWzhgfSOmUQ40OtUKQlA==
X-CSE-MsgGUID: dlzDrL9kQtGH1m7YQEahRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26347149"
Received: from sadhupha-mobl.amr.corp.intel.com (HELO [10.212.11.252]) ([10.212.11.252])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:19:22 -0700
Message-ID: <89f8f0be-2534-46c8-9058-cabea4f68568@linux.intel.com>
Date: Mon, 15 Apr 2024 09:19:21 -0500
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
Content-Language: en-US
In-Reply-To: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_071924_004297_64DEED82 
X-CRM114-Status: UNSURE (   8.46  )
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


> The core code does not modify the 'struct snd_sof_dsp_ops' passed via
> pointer in various places, so this can be made pointer to const.

The structure itself is NOT always const - the initialization itself
does have platform-specific changes, so what do we really gain from all
this?

some commit messages say the code is "a bit safer", but I personally
find the 'const' more confusing since the information that the structure
can be modified during initialization is lost.


