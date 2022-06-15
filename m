Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0996C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq3BYXlY6Freva9RFSPxzRzmDvz22uJ6FiaZNUPSB3A=; b=YeTvtpD1uYHfQHX6uSctUMcDSf
	3kkIuB7DGbboUkB9fp2jYzcAzyTPCdAQ8v0P1cLAgjiedbZhvskVqnWTty0eXl8cstxWYZC07f5To
	Q0Ecltq8L0T9T19pGz2v3Hz57ohM+qUlt0I1hvV4bY+N1Yfnhf7A6+EpKWP2CqI1+jN9mBIc7MQRZ
	SebgLP6Vayz0D8W9X8uRLYsM7cjBI48h9Ub0Y5wxsbTO7oVYJ6rmyRjmuUlFJ3gYGAVVm6M3Ua7TX
	iaBzeNlJl5vHjbSdOfOQk1R/sGs9Lbw4vVVpLXtFNXTcOXTyt1AmYBZjFUQFAYRgzpiZ/2l17aNJ/
	HUYCgwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1QtV-00E5PG-5h; Wed, 15 Jun 2022 11:09:05 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1QnK-00E37t-2V
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 11:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655290962; x=1686826962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+eBod1AbuflrGZyETNkqQFJ/qRpCcnjD62eOthJoFJE=;
  b=WVe0Ygr9JY9LO55SmT6VCY7uO0cqg7ikCODu4Hr00ul15IDo+Qi22Y3R
   V+vIStVbYEH9pfwvQnhIIVrFvSexjCOTMs7TzM/jsoD/C/g0n4a3Nivs5
   EWTWQv6xlexZIiqOQSEMCGAVpFo4xbadXNDlBtp/6MnT76FfJx2wrtLrj
   YvHrKPASz7yB+y6SCVBuwUQdS4A18fBxMsODWKE9PJpFPcnbU3wkE5vVH
   Azh9pk8DZZRgpf2LOn4qqXOj5y8lc8g0V/xQI7MX3QLsBfifyyd/ZMQqp
   eJbAgcofJZxkjSz5UEb94X0t2DD3LH7Q8MYgALmLaQ4QQ/e9LFde7VL4v
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="365269971"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="365269971"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 04:02:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="830979055"
Received: from ldortadu-mobl1.amr.corp.intel.com (HELO [10.209.160.187]) ([10.209.160.187])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 04:02:37 -0700
Message-ID: <5e2f44f1-de41-ac02-9fa8-e26a849897ad@linux.intel.com>
Date: Wed, 15 Jun 2022 05:56:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
References: <YqmWIK8sTj578OJP@kili>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_040242_236211_746E09BC 
X-CRM114-Status: GOOD (  13.91  )
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



On 6/15/22 03:19, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().
> 
> Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch, thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
> index 3333a0634e29..e006532caf2f 100644
> --- a/sound/soc/sof/mediatek/mt8186/mt8186.c
> +++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
> @@ -392,7 +392,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
>  						      PLATFORM_DEVID_NONE,
>  						      pdev, sizeof(*pdev));
>  	if (IS_ERR(priv->ipc_dev)) {
> -		ret = IS_ERR(priv->ipc_dev);
> +		ret = PTR_ERR(priv->ipc_dev);
>  		dev_err(sdev->dev, "failed to create mtk-adsp-ipc device\n");
>  		goto err_adsp_off;
>  	}

