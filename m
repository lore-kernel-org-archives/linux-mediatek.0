Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EEC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 21:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5Lvd5Mvxqck3fJBa5/+a5U8omDaF2GvQNzIqnYVLL0=; b=aAqgQ3sPIgSgf2AJWHmvE7qq7X
	pPu3qKsF6zpr2gs/OzHZhmRR1rXY/VuM3LrCNXCiqnvadXGvyhIFT8ykUzCsOyV/buQ57FWtYyk5D
	cGTmMZ5qSfWcblZRduHCeKNc7bMR4XythfQ7b5BTDsaeiPWxUozuhXTuhe6Bl5cG+cxHQsvm1DuQ3
	D7DwcwSplHfG6IgrqafFINK6oX7gn4MQ/sn9Fv0uY5mJiCrBqjsUFmiFcFr0vWuirbpL/E/7x1h1R
	UlU/y/YxANE2izCvSyj6D7PB9XRjLrM+d9IuOlkNOC/FOnrg9xgFXfI4tiTWohAn6jYwIWgRgURTB
	vCXi9WDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGTI-002oQA-1z; Wed, 18 Jan 2023 21:59:52 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGT8-002oOH-0i; Wed, 18 Jan 2023 21:59:43 +0000
Received: by mail-pl1-f180.google.com with SMTP id d3so438360plr.10;
        Wed, 18 Jan 2023 13:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5Lvd5Mvxqck3fJBa5/+a5U8omDaF2GvQNzIqnYVLL0=;
        b=HuILgWOt7Dovr2H4AmxsfU71TrHnETyAO805MATOgyzkVhEP+AJQEWPVPaNuPi0GI8
         Kp5fvRyiQ/1zs+PH2W7RmFujiF1b0GMVoIEvn34wHsssA9y1WsESNgONtpCnyhpvvHlu
         lDMPQBIy+YDlNo4OIGaeg8bL8FFuJumVSBqVZI7EKZsO5y5PbNb4awErs59rFgb8tqAj
         caMBXZ+AofeE6SQkmK/fyA0v4Rky/oIn5kUJAbN4iE1dtWaJ4terV7wdqthFI5J+H+BQ
         JofERLh1/B5EYtBSYsrNRbDJ64lHKd99sfmZBNXrNAE/JqOiKd3insadVbjL5FsBlmbv
         Xr/Q==
X-Gm-Message-State: AFqh2kqQgRxt+exl89u9VYbog0YoSqOx5qp3erqu2XmoyORkrlj4REtQ
	0spx35Kan8vfSeY29+kx8rQ=
X-Google-Smtp-Source: AMrXdXuAQfX7bnbd32O521ddbozFMQNiGD8+kGTXJCZGdTXWHS48iW72QMEKxv6bCZZI5ND3GbUz/g==
X-Received: by 2002:a17:902:bd83:b0:193:2bc9:eb25 with SMTP id q3-20020a170902bd8300b001932bc9eb25mr8807142pls.20.1674079179442;
        Wed, 18 Jan 2023 13:59:39 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:22ae:3ae3:fde6:2308? ([2620:15c:211:201:22ae:3ae3:fde6:2308])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709027e4700b00192740bb02dsm22260907pln.45.2023.01.18.13.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:59:38 -0800 (PST)
Message-ID: <4bedb8bf-241f-03d8-9f84-1e070ab4c3d8@acm.org>
Date: Wed, 18 Jan 2023 13:59:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: fix device management cmd timeout
 flow
Content-Language: en-US
To: Mason Zhang <mason.zhang@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Jinyoung Choi <j-young.choi@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Peter Wang <peter.wang@mediatek.com>, Peng Zhou <peng.zhou@mediatek.com>,
 wsd_upstream@mediatek.com
References: <20221216032532.1280-1-mason.zhang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221216032532.1280-1-mason.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_135942_105540_3AEC9E8D 
X-CRM114-Status: GOOD (  14.24  )
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

On 12/15/22 19:25, Mason Zhang wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..fa86ce80f350 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -3008,6 +3008,22 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
>   		} else {
>   			dev_err(hba->dev, "%s: failed to clear tag %d\n",
>   				__func__, lrbp->task_tag);
> +
> +			spin_lock_irqsave(&hba->outstanding_lock, flags);
> +			pending = test_bit(lrbp->task_tag,
> +					   &hba->outstanding_reqs);
> +			if (pending)
> +				hba->dev_cmd.complete = NULL;
> +			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
> +
> +			if (!pending) {
> +				/*
> +				 * The completion handler ran while we tried to
> +				 * clear the command.
> +				 */
> +				time_left = 1;
> +				goto retry;
> +			}
>   		}
>   	}

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

