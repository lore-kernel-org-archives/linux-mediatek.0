Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5CFC25B47
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtjJN2v2IlRgjr2CSbemGBy1a2c5zb3n0c0gdEv0B28=; b=IEUSDDkN2Bg5CgLyK9oeNPaDVQ
	3yaLAZbpNyIPIg3vCuTETzBqoDcgJQs3shUjGtY0CaSlabQE8FFTt0xcqlW9LT3QmUCInJK5MJroM
	1Q3X0izuCoSFy/YxN/jfJpvhn1IoBn8XQXBTaQR9QRnPt0uDwAUB4mDhWPOn/std0Hwa8xQrpWkg3
	3ZX4sA02IAnq+fgSchlwc0O6Auh2oYYnXsUiCE6S3XE+iQjmtYhmDpD4rXjH1iRE5y4ZrVqWX3MGz
	Z85yF1cQP8DHDiI2L/4P6cFzWVIAwSZiZHoxtLNGsnZvJ4W9QZfB5e6Jb8ZmQ/unDCrY4bVc1i6Xp
	ovwVA1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMe0-00AiAn-2W;
	Tue, 24 Oct 2023 19:00:48 +0000
Received: from mail-pg1-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMdx-00Ai8p-1t;
	Tue, 24 Oct 2023 19:00:46 +0000
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5a1d89ff4b9so2757934a12.0;
        Tue, 24 Oct 2023 12:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698174042; x=1698778842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtjJN2v2IlRgjr2CSbemGBy1a2c5zb3n0c0gdEv0B28=;
        b=RA1Z8xSDzlDChNwzDuK1N+uCN6jDh/isSr67Ymo5lDKwOnoRhDoKgbYIEbpaG0Cpgi
         pmzYiPfuMqZnyiZEbcTwTu3N+VIX2Na7PgX6D6lM6rz6V0nVyR4MGLrwUna/ZKc6AdyS
         I2L/709XAjHgD4sVjcWLwNI+rIkeFZFX5rylaNi/nzSSzmH+p8Pi4c8zyavZeOMKR9xS
         DpLbvvzrpcSiQQ/EaQ4RSkJfUROrBbxZNycYWiPPvEhJqy8r+UGDF732UBHxxn+ENsPb
         LjVJr8X5pQTTqP9LUqMDb8cFBFdaaXheTRVFUvyPSpmRUXFbOE07SvqgupTAKpPowuky
         /KRA==
X-Gm-Message-State: AOJu0YwxtEPFSIOcLpGP1N2P9LxsxJMCDqtX6XxdDEEu4cXhqFvhmWYa
	C8uH3MyBtbhd/++AtLawG1Q=
X-Google-Smtp-Source: AGHT+IHsv5pOf8N3VUIytVRyVB9Ag28Vf17S2OMnOiTsoiNnHHFSV+7JY3DQK15yqjmDVmK91Ns3tg==
X-Received: by 2002:a17:90a:1a10:b0:269:c7d:aac5 with SMTP id 16-20020a17090a1a1000b002690c7daac5mr9609930pjk.3.1698174042065;
        Tue, 24 Oct 2023 12:00:42 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:30e1:c9d3:6b41:493d? ([2620:15c:211:201:30e1:c9d3:6b41:493d])
        by smtp.gmail.com with ESMTPSA id az7-20020a17090b028700b0027d157e686asm7177565pjb.49.2023.10.24.12.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 12:00:41 -0700 (PDT)
Message-ID: <6a89fb45-b940-4db8-9025-944ccd2d4628@acm.org>
Date: Tue, 24 Oct 2023 12:00:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] core: ufs: fix racing issue between force complete
 and isr
Content-Language: en-US
To: alice.chao@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 peter.wang@mediatek.com, powen.kao@mediatek.com, naomi.chu@mediatek.com,
 cc.chou@mediatek.com, tun-yu.yu@mediatek.com, chun-hung.wu@mediatek.com,
 casper.li@mediatek.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231024084324.12197-1-alice.chao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231024084324.12197-1-alice.chao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_120045_625344_6A68F462 
X-CRM114-Status: GOOD (  11.89  )
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

On 10/24/23 01:43, alice.chao@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 8382e8cfa414..ef6bd146a767 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5518,13 +5518,13 @@ static void ufshcd_mcq_compl_pending_transfer(struct ufs_hba *hba,
>   			 * For those cmds of which the cqes are not present
>   			 * in the cq, complete them explicitly.
>   			 */
> +			spin_lock_irqsave(&hwq->cq_lock, flags);
>   			if (cmd && !test_bit(SCMD_STATE_COMPLETE, &cmd->state)) {
> -				spin_lock_irqsave(&hwq->cq_lock, flags);
>   				set_host_byte(cmd, DID_REQUEUE);
>   				ufshcd_release_scsi_cmd(hba, lrbp);
>   				scsi_done(cmd);
> -				spin_unlock_irqrestore(&hwq->cq_lock, flags);
>   			}
> +			spin_unlock_irqrestore(&hwq->cq_lock, flags);
>   		} else {
>   			ufshcd_mcq_poll_cqe_lock(hba, hwq);
>   		}

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


