Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9834AEE57EC
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iygYu9mPSsiBh6iVU0L8fGSvKfvn0LU4DjGst0clnKE=; b=jug/iT1+v5ej+HMZ928EHZZ3qm
	LvEmkq9NDz/nB8dPovj6Fm1VFIstvJaR5z9Y7hurnERCC4oT3ljODwz7z4ZSNeszPPGd11MNyQSpM
	G+87s0PPAB3gWgz+BrOA/Raop5yAC4Mvyfzoh7zjWXtnYcSrRldT/R6M7KA5rwYJq1YWiJDglTaqo
	aOxFSPuTMUKG0hlH90b9v8S5gRJCM/yRMelSaWNfnGaDydzy5NoV6+Vumitx5yITI/x4JWmI0OobK
	zvr1nDJBKo7jrKhx+/ix/gkGiagOSMOI6Xc4IhmBXHxvATFtW2hmm7uNLBjS/9cqz/bWM9TWncWyF
	C1kqGwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYJW-00DRX6-1V;
	Fri, 08 Sep 2023 10:02:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYJR-00DRVh-2d;
	Fri, 08 Sep 2023 10:02:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A5566607286;
	Fri,  8 Sep 2023 11:02:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694167321;
	bh=CJX6Es8XVyYycbnz90Chqf3r+Q8Nrk3dqnQg+Fy6VtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a+htBuzs035plfZ7GT2pnM9VV2Pnz5NNYpc+o9kzZJSkdROU9a/nZRqxTiPCW4KeI
	 8KpEEPJHlTxyYC8Ky6RnNG/ObZoJYITr+cLtxJA+4oPKuoKrXmh7tyLS2HVjOO1w3k
	 +vdFJVoGhxG+4uGImhrmThl/OqhuVcIf3GALmitwL+wZNMBEzbcKKuDFg+8XqFmjeO
	 ImMpWkSOV2usXSHq3IGF6n7ehNb30XuvquSdTQrk4BLuGAKycTLPGWwJ4kxP/RogZW
	 bT5XrBHxGGt/ou/hEFsXYiBAhdX3wksZYaHyh5KqtMN2QHscOB5snXVUKgnimwiLyX
	 aD1jiY4pIlT+g==
Message-ID: <a13b0e48-103d-8e3d-6d40-994cbdca9b44@collabora.com>
Date: Fri, 8 Sep 2023 12:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] power: supply: mt6370: Fix missing error code in
 mt6370_chg_toggle_cfo()
To: ChiaEn Wu <chiaen_wu@richtek.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
References: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
 <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
 <1092ffb3-0238-4dc0-baf3-344a653fca3f@kadam.mountain>
 <20230908021913.GB3115@linuxcarl2.richtek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230908021913.GB3115@linuxcarl2.richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_030206_059362_0684402B 
X-CRM114-Status: GOOD (  18.94  )
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

Il 08/09/23 04:19, ChiaEn Wu ha scritto:
> On Thu, Sep 07, 2023 at 02:08:17PM +0300, Dan Carpenter wrote:
> 
> [...]
> 
>>>> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
>>>> index f27dae5043f5..a9641bd3d8cf 100644
>>>> --- a/drivers/power/supply/mt6370-charger.c
>>>> +++ b/drivers/power/supply/mt6370-charger.c
>>>> @@ -324,7 +324,7 @@ static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
>>>>    	if (fl_strobe) {
>>>>    		dev_err(priv->dev, "Flash led is still in strobe mode\n");
>>>> -		return ret;
>>>> +		return -EINVAL;
>>>
>>> I think that returning 0 here was intentional, but I agree on a return ret
>>> here being both confusing and wrong.
>>
>> If it's a success path then probably we should remove the dev_err().
>>
> 
> Hi all,
> Sorry for the late reply!
> 
> I agree with the first half of Angelo's statement, I did make the
> mistake on this 'return ret'.
> What I was trying to say is that you should not to toggle cfo function
> when the FLED of MT6370 is still in "strobe mode".
> 
> Therefore, I think the change of Harshit's patch is correct.
> It should be 'return -EINVAL' or 'return -EPERM' here.
> 
> Thanks!
> 
> 
> Reviewed-by: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> 
> Best regards,
> ChiaEn Wu

Cool. In that case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

