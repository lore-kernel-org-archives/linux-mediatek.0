Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73269E7E654
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqCnKovqYNIj8DxAuxi3A8OvLmIv66iPRLv7SkxKqmw=; b=3FBl1Io88Jdh8qMTGRFwmZjDfn
	Hs6uBqoF5CpNljQ0KhElWab5w4ffd+dYNB89UGg7UtMHADJT7R9TyUb5VSOwex8/TvijJ92stSrHu
	jlZrnqIPWIR6Dx+8jjMDKGmJmy4A0M+cS5wDgF0iO7baSEnNFQjFxmwEwqqUaTPib3Dg9p2t7YA3H
	0EpfmpScmNU7ls+17dVKGg8Sskmmm3Q3iUsQ8sdjK1gOBnL9/fWh1f3GdnP8yj3+aefTajODwOceX
	7JNrlbreZVlNsfjhomPop+oYI6Ug5QLacf9e/wOieO73oYvd9ftvMztZfAXFYzRJHYEUkDuNKy/3f
	LqfI2M/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlCoT-00Gqmq-16;
	Tue, 26 Sep 2023 18:29:37 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlCoQ-00GqmT-2M
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 18:29:35 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c5ff5f858dso41327465ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 11:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695752973; x=1696357773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqCnKovqYNIj8DxAuxi3A8OvLmIv66iPRLv7SkxKqmw=;
        b=o6PrLoeCxx3ippdT1Ccn3f6qXShh7tTNMywVBZFBKwch2HnpTgJlUlhNsXwVJMfCum
         w3WU8sbqRiaYmonAulgFni4sCS5DLk9MjjFHhHZn2GYP9WyTrY0Qf3dYCKH0unOxs75e
         f9szSv8/vrWg3t5CvNulpNoHF015VGRC8Fi9wplNA6BVU/oR3qvYv8bc36h+TiVQlVJa
         SOgaKtX2iwB69J9PVKefoTvAxUr5eaHiTEQh1hXoLfsu8KLiDL6Bd1zK1spUrle6gmwZ
         hA6n/B3p28njExoGioBd8z58KpyVxmPkl0ta2D6pVh80xtRjDrjVTnCD9LexiNY8tN50
         qWrg==
X-Gm-Message-State: AOJu0Yy1Cv69QW5du0HlZ0PuqxjT40COw6AA0elacKfxfSkR2zSv6Bas
	uN1OamwDihGf9b5k6pGoP78=
X-Google-Smtp-Source: AGHT+IHMqjzi7c5raBEJ21qHqYKV/IIXP9BNuusQNOPnQ8IVTL/LruBVyInOe/dyW6slLLnR4GuA8g==
X-Received: by 2002:a17:902:c10c:b0:1c5:741d:f388 with SMTP id 12-20020a170902c10c00b001c5741df388mr8372368pli.9.1695752973263;
        Tue, 26 Sep 2023 11:29:33 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:a80d:6f65:53d4:d1bf? ([2620:15c:211:201:a80d:6f65:53d4:d1bf])
        by smtp.gmail.com with ESMTPSA id je20-20020a170903265400b001c5fc291f02sm7458673plb.216.2023.09.26.11.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 11:29:32 -0700 (PDT)
Message-ID: <f10fff07-8a7d-473e-b793-95c2796e63f2@acm.org>
Date: Tue, 26 Sep 2023 11:29:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ufs: core: wlun send SSU timeout recovery
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230922090925.16339-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230922090925.16339-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_112934_774869_F16C5E48 
X-CRM114-Status: GOOD (  10.41  )
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

On 9/22/23 02:09, peter.wang@mediatek.com wrote:
> +	/*
> +	 * If runtime pm send SSU and got timeout, scsi_error_handler
> +	 * stuck at this function to wait flush_work(&hba->eh_work).
> +	 * And ufshcd_err_handler(eh_work) stuck at wait runtime pm active.
> +	 * Do ufshcd_link_recovery instead shedule eh_work can prevent
> +	 * dead lock happen.
> +	 */

The above comment is hard to understand because of grammatical issues.
Please try to improve this comment. A few examples: I think that "wait"
should be changed into "wait for" and also that "happen" should be changed
into "to happen".

> +	dev = &hba->ufs_device_wlun->sdev_gendev;
> +	if ((dev->power.runtime_status == RPM_RESUMING) ||
> +		(dev->power.runtime_status == RPM_SUSPENDING)) {
> +		err = ufshcd_link_recovery(hba);
> +		if (err) {
> +			dev_err(hba->dev, "WL Device PM: status:%d, err:%d\n",
> +				dev->power.runtime_status,
> +				dev->power.runtime_error);
> +		}
> +		return err;
> +	}

ufshcd_link_recovery() returns a Unix error code (e.g. -ETIMEDOUT) while
ufshcd_eh_host_reset_handler() should return one of the following values:
SUCCESS or FAILED. Please fix this.

Thanks,

Bart.

