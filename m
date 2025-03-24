Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A30C36001
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y17ZL3We+j0Um9q8f67tlcHCzUzcIfQ03LepCBYfNfQ=; b=O/cVBIrmYR3N8wDAMST7WK8lRk
	rFSHelOnehEzaSLxUnZvFfXzIgycU7En0Sx8AY8eItdwozd4CSdTg6TRgTz+eU8Plu1ewY6JxSA4u
	AhL+9Ij7Lb81MSCGOaTD14JTQJNG3MbOETPuyOs4g/d5WCOQsXgIDfBOWywT/fttljArD5ZBoNAda
	etC+mwhkqsNXkd1U7u9ZGaXUCtoXR3WI4DAXWtcFRii3u+Yhuwr1gBkluwj3Ut/VcW1ptIJBg8Un2
	BBiaQatI74g/QHOtp3UcZNlQWRO4MRU928jcDjor4Uc/7yf/oLWCcY7SFNQwCpNl/id0EvLsMYh5Z
	vgRdODvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twahx-00000002GrN-2N0r;
	Mon, 24 Mar 2025 05:50:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twahu-00000002Gqd-3HeN
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 05:50:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso17239425e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Mar 2025 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795441; x=1743400241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y17ZL3We+j0Um9q8f67tlcHCzUzcIfQ03LepCBYfNfQ=;
        b=lNo7Pdqv+aqweJ1WAzq/01Y9Ee4zzogJ6k8jP1zpfhrQK4FG+gBp7N7UnKe5cgOnSS
         Fp+xutyJ5R11pBH7BoVV12Ef70VmIVzXCXzIM1KBIMtWbq3te8ZGUukkkCZ35nFbBEou
         2pCYcvFd2Jj6e4wvuUMKZtjV1R1nmkKsp7/Q99ar6jRAWtZAw/dawyhdQ0VIbb5Ca6uI
         Ug+kwUhMeGwst6QihWmP2txg1127RqJDJqSFz6M7JdljwA9hG00uhd6IiFmGacaOizvi
         uJ4A4ZZTEOJEtnFd9mBPjnjgfioViGFuXKU/ULmAbOLYthFrjiqztqk8mQA6QEax3VWS
         oTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795441; x=1743400241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y17ZL3We+j0Um9q8f67tlcHCzUzcIfQ03LepCBYfNfQ=;
        b=R0AJBnTlYeaHA5N8G56XB1zSNk06Lctxc9tVfJpP0PAqefERnUG7ximJ4OvcQT+sx6
         qzCD9zYvqRc+OWU5MzdjjkhIoiNw/my2o//a3n9rJkhQSMhB491wjQVj0GLDnFjalr5O
         6+GdtbHZbI9sevWwhTQduFSm1FRpmHOlm24aJnaMR+vNyCuVjTCoh1SQAFy6wugov0hN
         cjvNoo1tyKUEBWz58dadBrU9OtbdtjMshbSDXLdMb4vqyxJaNrW02B9zSsSLqIC23g8p
         wa5C8z6I/pcJ6TZZniN4ZuSE+O8OD+4IofbpZFVS8EQNA8uO5AeP7zJEswyNPP72Jtwu
         NXVw==
X-Forwarded-Encrypted: i=1; AJvYcCV6zf7APkySCLDil4d/nnJwxSzGhD635Q/ulRSLlZVIPIe+KvBmwLM0g79Ql89DjmhVyd9jV+RiaGVUPLmF3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIVdBExvaLe58VQg/N0OjBMOPVTzlk+IgysCFLAF5q3DKvX6HP
	izgGf4eaohyakTmWDMdyjXIn8Xnlxq2rFYZrJ30KDKZkUAvoxUHNNhQ7RIg9Bac=
X-Gm-Gg: ASbGncsX2Jr9AubYWc+q87hgJag2XftDbEaZV57gMTkG3+JHiJam2kWF2TvRjt+PmR9
	1yUqU2/yp3EwzHySw0PZv/mrT3j0GYvFVTybpZnmxwjcDfPrJpY31HYazfIAH4aY8cUg4CZcfU8
	yd5vqehnvN9lmt9eXALC6PnQ3+X18/1IBhK/b3Qi1yczEKrUZppTQrfMZ3nehe4miQ9L6cXM0Hf
	RrZiQVf30qd2JNw+KNyNq127ahWXTLvleWGz+RfvKOkuofnyHatjYFaE9rHeLXkr6UK1Q0Vn0ZF
	/VymJ8Hhk4rR2dmB35ID09ugF0R9eTm7Ug9VMHjNEuXalnbVxg==
X-Google-Smtp-Source: AGHT+IHmTYmhdJOC8tWd9mJoKjnOkYwl7qqf/27G1AO/Qiuynr43p01EUz4e7kx3RkIBljch7G1LIg==
X-Received: by 2002:a05:600c:c8a:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43d509ec4ebmr103517695e9.12.1742795440557;
        Sun, 23 Mar 2025 22:50:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f332cfsm161996995e9.6.2025.03.23.22.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:50:40 -0700 (PDT)
Date: Mon, 24 Mar 2025 08:50:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Dutton <james.dutton@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Markus Elfring <Markus.Elfring@web.de>,
	Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid potential null deref in
 mt7996_get_et_stats()
Message-ID: <223c7280-443d-49b4-96b2-90472339dcd4@stanley.mountain>
References: <20250322141910.4461-1-qasdev00@gmail.com>
 <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
 <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
 <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_225042_835457_22ED8A1F 
X-CRM114-Status: GOOD (  21.16  )
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

On Sun, Mar 23, 2025 at 11:59:45AM +0000, James Dutton wrote:
> As a security side note in relation to the following patch:
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> index 66575698aef1..88e013577c0d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -68,11 +68,13 @@ static int mt7996_start(struct ieee80211_hw *hw)
> 
>  static void mt7996_stop_phy(struct mt7996_phy *phy)
>  {
> -       struct mt7996_dev *dev = phy->dev;
> +       struct mt7996_dev *dev;
> 
>         if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
>                 return;
> 
> +       dev = phy->dev;
> +
>         cancel_delayed_work_sync(&phy->mt76->mac_work);
> 
>         mutex_lock(&dev->mt76.mutex);
> 
> 
> 
> Prior to that patch, the code looks like this:
> static void mt7996_stop_phy(struct mt7996_phy *phy)
>  {
>        struct mt7996_dev *dev = phy->dev;
> 
>         if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
>                 return;
> 
> 
> The compiler will completely remove the !phy check entirely because of
> the use above it, so it being present in the source code is completely
> bogus.

No, in the kernel we use the -fno-delete-null-pointer-checks so the
NULL check will always be there.

Also the "phy" point will never be NULL so the check should be removed.

regards,
dan carpenter

> If one actually needs a !phy check to be present in the compiled code,
> one must arrange it as per the patch above.
> 
> The fact that the !phy check is in the source code, implies to me that
> someone, in the past, thought it was necessary, but I think an opinion
> could be taken that it is there to obfuscate a security vulnerability.
> 
> Kind Regards
> 
> James

