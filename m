Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A727C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 03:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adLZ+hFzOFHt2ehEVGdWFwYoZL3029zv1IubnPhrNWk=; b=yX7yDEw7GsrqOcj3Vtga0HrKfT
	zwvNV/YawiWSUA7z3dsVmv2tbEeNWkPuGRRVRfmLcElcZ+sokLe19voZu//DYVkoHxKWyZ0xEXi5a
	W2hnUu4FOs30PFDKFe4xhtrn1i0RZdMNpDELIRVJUrbh72B/FyujYg4oIAoBp3Nvyy9n+akRH5A87
	nx35CvgKvCItcP94GDD807DqDbYjeqsNA5SMam+TP01u3Mrprk6yYe2f2/WVGGMTAH+W68tHxJLxs
	133xpejbJ0Cq/Dgdi5w3Hg26Y/HHaH40+Heb0EGbAk3AATv/jvXBaIyEtDhkV0c2lC74HHcNdZt9h
	bFZc+ghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phM9x-00GQOe-0e;
	Wed, 29 Mar 2023 03:07:37 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phM9t-00GQNy-1U;
	Wed, 29 Mar 2023 03:07:34 +0000
Received: by mail-pl1-f176.google.com with SMTP id ja10so13629210plb.5;
        Tue, 28 Mar 2023 20:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680059250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adLZ+hFzOFHt2ehEVGdWFwYoZL3029zv1IubnPhrNWk=;
        b=YSrwMyTA87XvJ+td0+jfERWqZ4ymxfhZComRc6Rlki04zmFTnRzdDgoXniHRuItIbu
         GkzdyioPzppJfzc+WKr9GHc/57D6fYmOG9yja3PzzdASayHS/J35KasG8IMRY+GlN3YP
         lsdE/0/+RpmwOrSReVfz3msCiVQSQreap7so1Mbl+TZTYnoxpRHbD61yW57YvVx4EPkk
         IubkdOaVKt8xWiCG1hobyinfoYaQVfT/nl2rPJK/rrzlvW+I3Lv6IlryIHwomwaal5dE
         9VMe6TN/9RXLWxK6MPu+mlQ/ZmHI69cTEpMK2U+BAJsr+IJUFkiyafRN3NvVUmGhEXN9
         I+TQ==
X-Gm-Message-State: AO0yUKVL2NxRIDybMlN//QsiyIsYnkZNR+7VvSRzr5r4QwO2ZLCnLDL6
	rECSVYJ3NnrDIU6bK/DrHjc=
X-Google-Smtp-Source: AK7set/xqxAZrj+4KgMElymUiMjNGOVkKCU5KvXbtM7U3NOrVD9z4Gj2ye80yVWac/x0Mb2Saw98LA==
X-Received: by 2002:a05:6a20:c50f:b0:dd:bf6a:4609 with SMTP id gm15-20020a056a20c50f00b000ddbf6a4609mr15757410pzb.49.1680059249872;
        Tue, 28 Mar 2023 20:07:29 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id v7-20020a62a507000000b005e5b11335b3sm21750075pfm.57.2023.03.28.20.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 20:07:29 -0700 (PDT)
Message-ID: <b66e0433-040d-34b8-05f1-a6741861c684@acm.org>
Date: Tue, 28 Mar 2023 20:07:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] scsi: ufs: core: Add host quirk
 UFSHCD_QUIRK_MCQ_BROKEN_INTR
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230328103801.11198-1-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230328103801.11198-1-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_200733_525658_6DFF2B64 
X-CRM114-Status: GOOD (  16.44  )
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

On 3/28/23 03:37, Po-Wen Kao wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index acae4e194ec4..1e1271aca1f2 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8493,11 +8493,15 @@ static int ufshcd_alloc_mcq(struct ufs_hba *hba)
>   static void ufshcd_config_mcq(struct ufs_hba *hba)
>   {
>   	int ret;
> -
> +	u32 intrs;
>   	ret = ufshcd_mcq_vops_config_esi(hba);
> +
>   	dev_info(hba->dev, "ESI %sconfigured\n", ret ? "is not " : "");

The use of blank lines in the above code is weird. Please make sure 
there is no blank line inside the declaration block and also that there 
is a blank line between declarations and statements as required by the 
kernel coding style.

> -	ufshcd_enable_intr(hba, UFSHCD_ENABLE_MCQ_INTRS);
> +	intrs = (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_INTR) ?
> +		(UFSHCD_ENABLE_MCQ_INTRS & ~MCQ_CQ_EVENT_STATUS) : UFSHCD_ENABLE_MCQ_INTRS;

All parentheses in the above expression are superfluous. Please leave 
these out. Or even better, rewrite the above code as follows:

	intrs = UFSHCD_ENABLE_MCQ_INTRS;
	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_INTR)
		intrs &= ~MCQ_CQ_EVENT_STATUS;

> +
> +	/*
> +	 * Some platform raises interrupt (per queue) in addition to
> +	 * CQES (traditional) when ESI is disabled.
> +	 * Enable this quirk will disable CQES and use per queue interrupt.
> +	 */
> +	UFSHCD_QUIRK_MCQ_BROKEN_INTR			= 1 << 20,

Isn't this an UFS controller behavior instead of a platform behavior? 
Please consider changing "platform raises" into "controllers raise".

Thanks,

Bart.


