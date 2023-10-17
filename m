Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDE9CDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yRkvg/BC5iPAbuClQNPELXEuB2hUBZzgja5G8q2UHQ=; b=kJy97BwsissWepydD99q/dSYtO
	tRx9C3D46fj3jUWgrooSZErRjHiQPFfdx9UfAa/1PM1q0/usD0YSfdEHBJz/gy9ZW+9QSij+IfPH0
	m/6HbPaoXTK+CCjMrSqENWzp2kSToGN17sDLFTUyCRpYheg2+d1vp7D/Vge92ui2AuwpylpL/JS8A
	R9hENgTV6QvI+y70IDlIavsh7kU0OM0cVa7pMu9XSIMyuYLmoE9RdQyCKDUMWmu6cy2WxzRrJ6DE/
	sj+rWOouc8eRxamTq84lMxj6AEixnH0GLjIaYNaNYGaKBg7htWOGr7HNOEM8uNSB7lGLuRffH1rku
	qZ679t0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfft-00Biih-2C;
	Tue, 17 Oct 2023 08:43:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsffr-00Bihh-0m
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 08:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D37061321;
	Tue, 17 Oct 2023 08:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB809C433C7;
	Tue, 17 Oct 2023 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697532214;
	bh=CuMFUN7SSAJyB5Hs2Sw1yPemkO2qhqwV3uarBTFnFsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jfo+B2I8RflD38I2fr0TkxwP3YiH8ldKGiaD0Z7y9lFawxu7zg4RgBVu5yw5fdi0a
	 wRurigC6+9sehsxN+piW9AtmgeYw10xAWKekLmrWXHk++KAd2oSzhe72EKB1dZbXzi
	 +zdDrALYdprbZQcIy6svl+6eO1RYch7MjjLo+MU+S6K0jLcxCSs+JOMhYkpa+XqrS+
	 +5QhkyBeH9cu0Is691po8zR4M0BrSbRNoPBbuiFqfg2PVNx29hMkRTgdn2BsaSvvHY
	 1izyoBWnc7YjCDQiINlYya1B1WKot/Riwkxrc56t/jPSut8pv3IF5oIddNWhMYPiHh
	 0VBKbCyyB/YPw==
Message-ID: <82958ea9-cc1c-44af-9144-53cf2bd5c23b@kernel.org>
Date: Tue, 17 Oct 2023 17:43:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PM / devfreq: mediatek: unlock on error in
 mtk_ccifreq_target()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <1bada9b2-d276-4123-bfdf-03d165569543@moroto.mountain>
From: Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <1bada9b2-d276-4123-bfdf-03d165569543@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_014335_319555_7BE3B5F0 
X-CRM114-Status: GOOD (  14.83  )
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

On 23. 10. 12. 18:41, Dan Carpenter wrote:
> Call mutex_unlock(&drv->reg_lock) before returning the error code.
> 
> Fixes: d2805601988f ("PM / devfreq: mediatek: protect oop in critical session")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> index b0ed25e33f2b..11bc3d03494c 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -146,7 +146,8 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
>  	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
>  	if (IS_ERR(opp)) {
>  		dev_err(dev, "failed to find opp for freq: %ld\n", opp_rate);
> -		return PTR_ERR(opp);
> +		ret = PTR_ERR(opp);
> +		goto out_unlock;
>  	}
>  
>  	voltage = dev_pm_opp_get_voltage(opp);

Applied it. Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi


