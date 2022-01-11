Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145FDC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcLm6oljWqLQt7dj5h1fyUVGSszWZ5pDUOabgZBFqFo=; b=zI2YR4n3L3M7Cd
	406fx02J2zf52C4WvSU7zEG6hB9pb/K+EDxarYFGlxJW717+AwkjcILzUFXtnFTeZBBy4a7ORU/2b
	/4ggUux4EqH8kzgcd7yjATcNeV150DjdiczKwGfZ7DhYbf+B7LXO2AyiR1SFukf+JWLxJ0+4F9u5p
	lsDEfzUaD2clRU1YGVUEkOyWAZfL41JW7eVWfRkWn+cTzY8jWxp0rR9NLYqTWnk3XyLNbySKAU2x/
	l9sJ/VwWPe6+GDP9kNJy3fUlYWO3PtKy3dpsknZtfIElQ9nr1lwyMiv4A2wOUglPeIK8+WVEl2eKH
	fgflI96lYeUywrQZunbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7CPJ-00FHje-AQ; Tue, 11 Jan 2022 08:21:29 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7CPG-00FHhs-2b
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 08:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74LppIN78kWsgtYa9gWatruyKUpD9I2goC0oUvXXRvA=; b=r7eusmroYUe3aNo4VJF4cwmt5Q
 HnZzRlBvCmVZI7RBnlXXgpz5F6Jz1tzM5oYA63oUwYlBLFaRPevntm4Jltlm+otpKTPy5PlJI/9lO
 AjuNorPk2ybGupFB7pwCpv48Hg7uoPoMlltHNHOPzRdI3/900wFSfUgFPEtlOEu+3GWk=;
Received: from p54ae97a7.dip0.t-ipconnect.de ([84.174.151.167] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1n7CP5-0000TK-MI; Tue, 11 Jan 2022 09:21:15 +0100
Message-ID: <87571e0b-bbd2-f0e7-51c6-8bb94350c152@nbd.name>
Date: Tue, 11 Jan 2022 09:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 2/5] mt76: rework dma.c to adapt mt7986 changes
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <351271a274dc236f027c58487df6b21c7dbf9fd0.1641886298.git.Bo.Jiao@mediatek.com>
 <73fb8a688cfa53e030492f344f72ef64b4167a36.1641886298.git.Bo.Jiao@mediatek.com>
Content-Language: en-US
In-Reply-To: <73fb8a688cfa53e030492f344f72ef64b4167a36.1641886298.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_002126_391702_A53A82D4 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-01-11 08:51, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> Check ndesc of q_rx to avoid potential hole in iteration.
> This is an intermediate patch to add mt7986 support.
> 
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/dma.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
> index fd4c51b..83f045a 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -660,10 +660,12 @@ mt76_dma_init(struct mt76_dev *dev,
>   		 wiphy_name(dev->hw->wiphy));
>   	dev->napi_dev.threaded = 1;
>   
> -	mt76_for_each_q_rx(dev, i) {
> -		netif_napi_add(&dev->napi_dev, &dev->napi[i], poll, 64);
> -		mt76_dma_rx_fill(dev, &dev->q_rx[i]);
> -		napi_enable(&dev->napi[i]);
> +	for (i = 0; i < ARRAY_SIZE(dev->q_rx); i++) {
> +		if (dev->q_rx[i].ndesc) {
Please fix mt76_for_each_q_rx instead. You can simply define it to

for (i = 0; i < ARRAY_SIZE((dev)->q_rx); i++)		\
	if ((dev)->q_rx[i].ndesc)

Thanks,

- Felix


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
