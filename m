Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55hRcrpcGweTZNPgLNjSVUS+p9bWv5ADc27zzK0jGoA=; b=ekiBFIFYfGaGo+xGhTV9pF8ufo
	ItS0xmm91gBVVZx53OlzEzy8O8UufdujNoGdwBtgUA0DyD701SlOycAN0W2wx38jetoEj9AHdutnP
	uH4iRqP0g4qzAYEX4Y710+Kszyctmo3YP3QaDB7xcYEkh5Hqke3tlzoL8myBDF6mfqBZrP7mQ1F+c
	gYSjW33hpEFeDLqRb23P2E7QH0A/urEG+H3pRiL73+e/nKoR4TfO2MN9U0xqZCtMzhtic9md+v09v
	n7kE2pMMb+Gt2gKi+Ty42g5QyYRf8fuGW/4juz3f0BCytehtHHSmdZ/WCSu3g5G12/uME5Ww5zloj
	5pPVttBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Rj9-00ELyG-Sg; Wed, 15 Jun 2022 12:02:27 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Rhg-00ELHZ-10
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 12:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655294456; x=1686830456;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yCu340qMfg6oZcr5JvLYeZcBPp9Lyul8ahB/e4qnXUI=;
  b=JWgZKtzhWEWhq9mdp9mkwZyr9KsGe15+2MH3k1awkL1yzOqQgx9T9RzR
   k8eQhhwn/rYcsvy50mHox3Rb+ool7y/HCRgyDo347FDJmcH9lbrrXq2Mc
   9rZpLssPVshXdk+YdwLXQY38/soo7RQbjYQxTi9K18lVjMsnS4ru+e9M+
   DMmz2sJz9owNWhsVDPzdeDD47EKfiDcvsnHOzZDdudCDTOHnKy3YqVETU
   78lZ4oUktducOjwpDlbJhuoHUO4T2qoxAfcrXkmGBZVT278EglkCO8Ui4
   4pKdKYYxnZ8Mx5EKBBkMc6xI6Cdw4QZe6hOechifdqJZ2ZGaKsMXvs0Fz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261961763"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="261961763"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 05:00:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="674463081"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.173]) ([10.249.254.173])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 05:00:49 -0700
Message-ID: <416df4cf-5421-cbf3-bb47-b39c6129ff71@linux.intel.com>
Date: Wed, 15 Jun 2022 15:01:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
References: <YqmWIK8sTj578OJP@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_050056_172229_B8E0DB37 
X-CRM114-Status: GOOD (  15.40  )
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



On 15/06/2022 11:19, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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

-- 
Péter

