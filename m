Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jr174DbO6MrWeKZhl/VmbQABXQ2l7jK4izj8hjM2EZs=; b=4WEnV4CVfXtWz+
	/EWuLCP7w9uheozCKpmzKq20rywCPSJYSw1WoZtDU7jt1pWCcmx7NnNJCEtC069vY8hMEuDZfZXj9
	Jx+df6knVNSkY8BeXYpqfZs0nsMysE1Fn+lBdr6angaUOYgfbfrRgnU171C7A9nOZxHSZhYBJUDSO
	dsGVghqMcXTs/lYf428c9CqcveBQyUCjqkk5gk3M5iivw2Yp3HEebfHtm77wOm3mM4H8d2JH4KldA
	yG5fu80dcE+cA/A0JCm35qLNMFbt0ikXu9L7dB9fZf2HxrmHf4CNYoatBkm41XIsnCgbuyuHrlNPQ
	X1DvH8kUHBJz2fwi13sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ1gc-00Aknv-Sw; Tue, 29 Mar 2022 02:34:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ1gQ-00Akjy-IT; Tue, 29 Mar 2022 02:34:12 +0000
X-UUID: 5c5d604f6618461b872ead2bd56ddcc9-20220328
X-UUID: 5c5d604f6618461b872ead2bd56ddcc9-20220328
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 297857457; Mon, 28 Mar 2022 19:34:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 19:34:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 10:33:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 10:33:58 +0800
Message-ID: <eef98cc24f75f9712acd3fe5e597d49140cbc943.camel@mediatek.com>
Subject: Re: [PATCH] mediatek: mt8195: fix a missing check on list iterator
From: Trevor Wu <trevor.wu@mediatek.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>
CC: <tzungbi@google.com>, <dan.carpenter@oracle.com>,
 <jiaxin.yu@mediatek.com>, <rikard.falkeborn@gmail.com>,
 <yc.hung@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Tue, 29 Mar 2022 10:33:58 +0800
In-Reply-To: <20220327081712.13341-1-xiam0nd.tong@gmail.com>
References: <20220327081712.13341-1-xiam0nd.tong@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_193410_655417_872A4A9D 
X-CRM114-Status: GOOD (  24.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2022-03-27 at 16:17 +0800, Xiaomeng Tong wrote:
> The bug is here:
>  mt8195_etdm_hw_params_fixup(runtime, params);
> 
> For the for_each_card_rtds(), just like list_for_each_entry(),
> the list iterator 'runtime' will point to a bogus position
> containing HEAD if the list is empty or no element is found.
> This case must be checked before any use of the iterator,
> otherwise it will lead to a invalid memory access.
> 
> To fix the bug, use a new variable 'iter' as the list iterator,
> while use the original variable 'runtime' as a dedicated poin
> ter
> to point to the found element.

Hi Xiaomeng,

About this bug, I think it won't happen anymore.

mt8195_dai_link_fixup() is only assigned when the corresponding
snd_soc_pcm_runtime is found
in mt8195_mt6359_rt1019_rt5682_late_probe().

On the other hand, runtime is not used in the body of
mt8195_etdm_hw_params_fixup().

That's why I think the problem doesn't exist.
If I misunderstood the problem you pointed out, please correct me.

Thanks,
Trevor
> 
> Cc: stable@vger.kernel.org
> Fixes: 3d00d2c07f04f ("ASoC: mediatek: mt8195: add sof support on
> mt8195-mt6359-rt1019-rt5682")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  | 14 ++++++++--
> ----
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> index 29c2d3407cc7..dc91877e4c3c 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> @@ -814,7 +814,7 @@ static int mt8195_dai_link_fixup(struct
> snd_soc_pcm_runtime *rtd,
>  {
>  	struct snd_soc_card *card = rtd->card;
>  	struct snd_soc_dai_link *sof_dai_link = NULL;
> -	struct snd_soc_pcm_runtime *runtime;
> +	struct snd_soc_pcm_runtime *runtime = NULL, *iter;
>  	struct snd_soc_dai *cpu_dai;
>  	int i, j, ret = 0;
>  
> @@ -824,16 +824,17 @@ static int mt8195_dai_link_fixup(struct
> snd_soc_pcm_runtime *rtd,
>  		if (strcmp(rtd->dai_link->name, conn->normal_link))
>  			continue;
>  
> -		for_each_card_rtds(card, runtime) {
> -			if (strcmp(runtime->dai_link->name, conn-
> >sof_link))
> +		for_each_card_rtds(card, iter) {
> +			if (strcmp(iter->dai_link->name, conn-
> >sof_link))
>  				continue;
>  
> -			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
> +			for_each_rtd_cpu_dais(iter, j, cpu_dai) {
>  				if (cpu_dai->stream_active[conn-
> >stream_dir] > 0) {
> -					sof_dai_link = runtime-
> >dai_link;
> +					sof_dai_link = iter->dai_link;
>  					break;
>  				}
>  			}
> +			runtime = iter;
>  			break;
>  		}
>  
> @@ -845,7 +846,8 @@ static int mt8195_dai_link_fixup(struct
> snd_soc_pcm_runtime *rtd,
>  
>  	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
>  	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
> -		mt8195_etdm_hw_params_fixup(runtime, params);
> +		if (runtime)
> +			mt8195_etdm_hw_params_fixup(runtime, params);
>  	}
>  
>  	return ret;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
