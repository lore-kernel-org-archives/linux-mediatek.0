Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 22:31:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBADF60F45
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBADF60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmV1ijsyHqL5FAA5AW477jMZu6lWKHi803Y8lTjdNtY=; b=LS0JL7lt+TIWVPdRmmjQiJPGC3
	reMZ2q/vl7p/8VOZ0vLu3j+qBJ+/mmfMpAU0NJlVY+7Y3XRBFAoOrN6HWbYl46EFP8A+3en6hnbYH
	rjqxIVuWZ/KvE7mLXuC3cmGPPucHa42jwVNOAK9R3ckDwe40YEO6Ol77hGX8E73K1d2JEt36MIBV1
	RZbtmQvtHu2Jt8lgHB0Tjp3KRv4FHV0QUm4A7N1BZNDcjll2Tf4YEGqb37n0Wgf6vbYXmbYE0mRZE
	xxWaWb4heksREIt8klzoZ1AEq3vSYIXojHmXq+v36Yz1DIK9f+CeRU2sEdFHMFiGKHfDi1CQn6a27
	llDgdECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlf4h-00BiWQ-5x; Fri, 12 Nov 2021 22:31:11 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlf4c-00BiW2-Hg
 for linux-mediatek@lists.infradead.org; Fri, 12 Nov 2021 22:31:09 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.167])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 940DA2A006D;
 Fri, 12 Nov 2021 22:31:03 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 B988F24008F; Fri, 12 Nov 2021 22:31:02 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id CC64913C2B0;
 Fri, 12 Nov 2021 14:30:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com CC64913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1636756259;
 bh=jBbg+iMiSVZjUwiEZqkgQP0UDjrFJdBZbCEwAvNK2IA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lC43gbTb+JrOpE7tGidib/3kgLw7tMulZZCzbiFcZnsF79Ne3qwipkowaJ5gQ352n
 OxfUtTNMhdCjy1jUakHucwahI4eTdWAIGqCyv4HofdB4d/FVg2AimRUMRanzURfm4x
 f8T1R91gKRCpwU6nS4xp/JJL0cEDlkh0QriksBiQ=
Subject: Re: [PATCH v2 04/11] mt76: mt7915: add firmware support for mt7916
To: Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <cover.1636105953.git.Bo.Jiao@mediatek.com>
 <694291893593fce99a3ba485fe691e49bd7cf4a7.1636105953.git.Bo.Jiao@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <78e7e6ba-6e70-872f-89e9-2d3d095b145f@candelatech.com>
Date: Fri, 12 Nov 2021 14:30:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <694291893593fce99a3ba485fe691e49bd7cf4a7.1636105953.git.Bo.Jiao@mediatek.com>
Content-Language: en-US
X-MDID: 1636756264-Xc2U65JSvLt5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_143106_760690_A6533489 
X-CRM114-Status: GOOD (  22.80  )
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

On 11/5/21 3:02 AM, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> Update firmware initialization for mt7916.
> This is an intermediate patch to add mt7916 support.
> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7915/init.c  |  6 --
>   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 78 +++++++++++++++----
>   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
>   .../net/wireless/mediatek/mt76/mt7915/pci.c   |  3 +
>   .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 +-
>   5 files changed, 72 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index f455c12..a4e2d85 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -567,12 +567,6 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
>   
>   	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
>   
> -	/*
> -	 * force firmware operation mode into normal state,
> -	 * which should be set before firmware download stage.
> -	 */
> -	mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
> -
>   	ret = mt7915_mcu_init(dev);
>   	if (ret) {
>   		/* Reset and try again */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index ee9952d..43ddbc1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -2713,16 +2713,20 @@ static int mt7915_mcu_start_patch(struct mt7915_dev *dev)
>   				 sizeof(req), true);
>   }
>   
> -static int mt7915_driver_own(struct mt7915_dev *dev)
> +static int mt7915_driver_own(struct mt7915_dev *dev, u8 band)
>   {
> -	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND0, MT_TOP_LPCR_HOST_DRV_OWN);
> -	if (!mt76_poll_msec(dev, MT_TOP_LPCR_HOST_BAND0,
> +	mt76_wr(dev, MT_TOP_LPCR_HOST_BAND(band), MT_TOP_LPCR_HOST_DRV_OWN);
> +	if (!mt76_poll_msec(dev, MT_TOP_LPCR_HOST_BAND(band),
>   			    MT_TOP_LPCR_HOST_FW_OWN_STAT,

I think that MT_TOP_LPCR_HOST_FW_OWN_STAT is not defined in the upstream kernel...

Maybe a patch from owrt was not added to upstream yet?

Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
