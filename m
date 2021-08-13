Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5C2C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A9B610CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56A9B610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j93Kf2bCiIAuPFWnQXdR7aLzO7fvTBHwoh3jr3VDaMI=; b=r73GNJC2qWg17dsW+b+qxyQlnC
	0p6ju+FzCElqV82jtw6n6WNuq/JKVBhEYp45pLz86SQ9LYG5TSrrWMgwlsxvuLhpG/udnDUxeLdbs
	TH76I13v12xrwU7l/GZx4WbqGXLyo5zTmMlvFQgqkzSProvpvH5irNLtSQaFfWgiTG0PUk1eDE7B8
	Lj59gawAGB2iBp6W/m/Y3mP8jGuJB+UCBBrVaxY+BLoFsLESQWoKPPIAh9q99LHTzgxl+zFcs3JBh
	NkVCKYy7pdHhw/tuXrwBpNWUQzv1ePvLZTJORLkSQ/pFaBayvHy0Gp1zmhup3pl2hfV1dsD2uCaw9
	nF0/wPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEUnN-00CUwD-6A; Fri, 13 Aug 2021 10:52:13 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUnI-00CUvr-HK
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 10:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2nGS+ijdQIDpgRg9ZkkZPkHb1ACLUfXfWxSReLJkR2Y=; b=pKk47s/qxvtcQQNvNIM67fp5mX
 DHXUh9pmjzt//CGoguWjomRDnZbouGlECAri8nqGRnYMKyFn4BSug9xt4slWEjrGbHDbAgh1Ltl+u
 m2m+9pGeCtQE/KFaLM0qAF3I/BPI4vz/wCbWqY5xS72MklaSiax51Ojv8Skfg/ilRHaY=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mEUnC-0008Er-SC; Fri, 13 Aug 2021 12:52:02 +0200
Subject: Re: [PATCH] mt76: mt7915: add LED support
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Money Wang <money.wang@mediatek.com>
References: <20210621141430.17577-1-MeiChia.Chiu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <670252a9-636c-9d3d-5d6e-acfcabfff4c0@nbd.name>
Date: Fri, 13 Aug 2021 12:52:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210621141430.17577-1-MeiChia.Chiu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_035208_792052_E4594257 
X-CRM114-Status: GOOD (  14.97  )
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


On 2021-06-21 16:14, MeiChia Chiu wrote:
> From: MeiChia Chiu <meichia.chiu@mediatek.com>
> 
> Initialize brightness_set and blink_set callbacks to enable LED support.
> 
> Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Money Wang <money.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/init.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7915/mmio.c |  6 +++--
>  .../net/wireless/mediatek/mt76/mt7915/regs.h | 19 ++++++++++++++
>  3 files changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index e027273..defb0ec 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -151,6 +151,64 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
>  	return 0;
>  }
>  
> +static void mt7915_led_set_config(struct led_classdev *led_cdev,
> +				  u8 delay_on, u8 delay_off)
> +{
> +	struct mt7915_dev *dev;
> +	struct mt76_dev *mt76;
> +	u32 val;
> +
> +	mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
> +	dev = container_of(mt76, struct mt7915_dev, mt76);
> +
> +	/* select TX blink mode, 2: only data frames */
> +	mt76_rmw_field(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TX_BLINK, 2);
Does that mean the hw triggers the LED with the configured on/off delay
on TX? I think blinking should be controlled entirely by software.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
