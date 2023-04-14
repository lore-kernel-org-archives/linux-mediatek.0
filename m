Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E65C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1mRBvmkKWpgvM1gONebrVKM3TA+ePdq5Jwjyb83ndI=; b=cR+aLLes0FwmByeVd9Q04oPVPR
	9EORdR3dqCiksdaaucaD/SFA6sauzdXfz9rn/fawJpUpaeaedMRosY6d2BgbaQjRzGUnywFYd/4Hm
	8BUuYbEuq+DEBE/HV+EHelAAZMbahqiP0VGkbyqU2G9Bc3jKfJrSGCh8ruvqIBMoWqaiWZWfca/QO
	OuJagsDsQ46u3Tbx6Ns7U2ozIY4O+9HtzyD9nGRP7aIfjiDBsMkHMEIyYn2umYLr2BdWLNYNyVG8D
	swHVd7zqEhVsLdX2nFVfwY8yHucaYotlqm7Pz14Ylz1WIqoS5du4oMoRsZ4/pLft1ShLg7RQ+78EF
	60AkRiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnIvM-009ZKm-1K;
	Fri, 14 Apr 2023 12:53:08 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnIvG-009ZIM-0x
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 12:53:05 +0000
Received: by mail-qv1-xf32.google.com with SMTP id dl14so28711qvb.6
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681476779; x=1684068779;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1mRBvmkKWpgvM1gONebrVKM3TA+ePdq5Jwjyb83ndI=;
        b=VpQRy4va372KFFJdHvLJvrJAZYVUGwIMDqJdUBHiZm+SlWgRrvUXbZ5x4mYafTmtLe
         YCw23P4CRpv4yX6g3vnmkbz1PGSUgj0NxigrzPiYTWz7OznRggKt4XWzI4M9wk7OHK+L
         kDUq56pwCoPgEb63CYUdmcpSKvda0vtu7wd2LXWHdcdFHsAlEVZXSidG+P5F8jlPzI3l
         RksZL1fBCAgLTgaiaNpqFl/9Ux78OH8OayE5Wg4yto1m33qUt9J757Hl3BObiqjzwmxh
         oPxOC0Cbo/siv+/ih3tQEKSCUlFE5IH0/zzDG42FAElxZSQoq1VamBYAIEYmJejmwy87
         Orsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681476779; x=1684068779;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1mRBvmkKWpgvM1gONebrVKM3TA+ePdq5Jwjyb83ndI=;
        b=h6aAADgTf7Bt6OB1iZFyFSrSXPKlWCDFgaJI2CDZAwVUi507zAU8K5+pFDkHpGctaG
         Bba6TcIW79eILfEi6dP/uR8+9iNSYzBiIl0SwfxKEnPRhkjPnjP7RlZ7ho2mZtPPHQmY
         mnroiZvoU3Tnp/k6drgupN0PViiXh5DORNh/sHnZyPQAiijXeon1FI6XbQCt5UxW7YKb
         FTQbhwwT+eXUETJ++mOZmStfevJtSL41ZHFcmwwsrHMVx2JJpGinx++CJbVNLi7RXGR8
         kFJ+tyvGlcivHE3sv7h94Yc575BRDa/FoyAdTjbP9nBtKARC8PXyx9FOFqQnh6rIBXel
         YCNA==
X-Gm-Message-State: AAQBX9ebcTQMaRyjwk0dt9SKjbtZg7r6JaA/F5PaE1sDA8qjNsygYyhu
	H/rlkfbyHaOz+We97o1PbRLCNgU4DWcgTkNRTTBPtw==
X-Google-Smtp-Source: AKy350bwrlQ1k6Id6taPs74WKZ2MYVEoCM7n+Fk3n2G+lg7Txm3HQS1LILK4QlW1vfVH9uPVwc8hFNllM10fhh8EPyk=
X-Received: by 2002:a05:6214:2504:b0:56f:728:19d4 with SMTP id
 gf4-20020a056214250400b0056f072819d4mr3900460qvb.26.1681476777521; Fri, 14
 Apr 2023 05:52:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Apr 2023 05:52:57 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v1-1-b8482458df0d@baylibre.com> <ada769e0-0141-634f-3753-eb3a50f0eee3@collabora.com>
In-Reply-To: <ada769e0-0141-634f-3753-eb3a50f0eee3@collabora.com>
MIME-Version: 1.0
Date: Fri, 14 Apr 2023 05:52:57 -0700
Message-ID: <CABnWg9v+DXatKqUkwDZBRxivtg869SocPGtHibtFNr7tnyVggg@mail.gmail.com>
Subject: Re: [PATCH 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_055302_336028_93C7EAAD 
X-CRM114-Status: GOOD (  15.20  )
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

On Fri, 14 Apr 2023 12:31, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 13/04/23 14:46, Guillaume Ranquet ha scritto:
>> The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
>> by the kernel test robot.
>>
>> Fix the issue by removing the variable altogether and testing out the
>> return value of mtk_hdmi_pll_set_hw()
>>
>> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> index abfc077fb0a8..e10da6c4147e 100644
>> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>>   	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
>>   	u8 txpredivs[4] = { 2, 4, 6, 12 };
>>   	u32 fbkdiv_low;
>> -	int i, ret;
>> +	int i;
>>
>>   	pixel_clk = rate;
>>   	tmds_clk = pixel_clk;
>> @@ -292,10 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>>   	if (!(digital_div <= 32 && digital_div >= 1))
>>   		return -EINVAL;
>>
>> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> +	if (mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>>   			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> -			    txposdiv, digital_div);
>> -	if (ret)
>> +			    txposdiv, digital_div))
>>   		return -EINVAL;
>>
>
>I don't get why we're returning -EINVAL unconditionally in the first place, here.
>
>Function mtk_hdmi_pll_set_hw() should return zero or a negative error number: in
>that case, the previous *intention* was fine, so this should be
>

Hi Angelo,
I was maybe a bit too quick on fixing this that way.
Anyway it doesn't change a thing as mtk_hdmi_pll_set_hw() eitheir
returns 0 or -EINVAL.
But I agree that the logic is dubious and propagating the return value
is the right thing
to do.

I see that Arnd and Tom posted versions that you might prefer:

https://lore.kernel.org/linux-phy/20230414075842.4006164-1-arnd@kernel.org/
https://lore.kernel.org/linux-phy/20230414122253.3171524-1-trix@redhat.com/

Thx,
Guillaume.

>	ret = mtk_hdmi_pll_set_hw(....)
>	if (ret)
>		return ret;
>
>	return 0;
>
>
>Regards,
>Angelo

