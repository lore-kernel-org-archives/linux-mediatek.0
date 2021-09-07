Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4893B61051
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4893B61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR9dA7YwU8pC/4HRntz3wftmpe7PoSGFny1yEvWiqXc=; b=fCLZ0ADKhfNVBp
	xtOEUXKvSOsiVRgjhTgJudVfBVXvjHPTkvlsch1jO9eb9lYOEHmsmfdlfgQlRDrPnKCwPJ16lw5S6
	HV588SPNJwCziQxQaBWNJKpvZYB3oQXJ8TTcsPhZc6bf4cnqWoxDyElKVZxaDxWwxRzVOGAUOBqDh
	pvm94/U8ZIv2qebxZSVcOUPD6pHkiHD9YSmpOdknmNSjq7lGbeauG5JnUgRNMoWXfhGpnR155WJPx
	mSGou31fSFJcg83Hlo0NfvLH5DwAl+T7QscVrw+wTgCgGz/ZwIvbLgi5ouX/tLRaMLJZuuPSMPZ7/
	g8hKLuWOAqgeIbxwA7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNW2N-002oOe-51; Tue, 07 Sep 2021 08:00:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNW28-002oNQ-8U; Tue, 07 Sep 2021 08:00:47 +0000
X-UUID: 1d10811026b24436a2383bc4ac050239-20210907
X-UUID: 1d10811026b24436a2383bc4ac050239-20210907
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1004632168; Tue, 07 Sep 2021 01:00:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Sep 2021 01:00:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 7 Sep 2021 16:00:37 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Sep 2021 16:00:37 +0800
Message-ID: <27ca1a1e99193b543102df03f7c256063468f693.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix unused initialization of
 pointer etdm_data
From: Trevor Wu <trevor.wu@mediatek.com>
To: Colin King <colin.king@canonical.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 7 Sep 2021 16:00:37 +0800
In-Reply-To: <20210903114928.11743-1-colin.king@canonical.com>
References: <20210903114928.11743-1-colin.king@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_010044_355048_5B5EEE4E 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, 2021-09-03 at 12:49 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer etdm_data is being inintialized with a value that is
> never
> read, it is later being re-assigned a new value. Remove the redundant
> initialization.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index 7378e42f2766..ac591d453e1e 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -2094,7 +2094,7 @@ static int mtk_dai_etdm_set_sysclk(struct
> snd_soc_dai *dai,
>  {
>  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
>  	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> -	struct mtk_dai_etdm_priv *etdm_data = afe_priv->dai_priv[dai-
> >id];
> +	struct mtk_dai_etdm_priv *etdm_data;
>  	int dai_id;
>  
>  	dev_dbg(dai->dev, "%s id %d freq %u, dir %d\n",

Acked-by: Trevor Wu <trevor.wu@mediatek.com>

Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
