Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F4FC64ED6
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djzqrtOMQJZwFBUw6nLjGzlqHj5X2tklbzG5twEnCXY=; b=2DZfmAgMZyJ/oJQMWMkf486tyZ
	g5kYi8h8cik5Z5mgnKUonxV6FlnU5YQMTRbmw+Z+47Q8PEqa7B+zJqW323hWFTWfWjaIobuzEpyAp
	LlzoHsoO1lQ+lYBBhIxh8xxNUsO0loGcZ56zg/38IvaGlbuk5/3IlSm16czd59XtTEiyWEvGXfyhQ
	3Vviz7ehhE5Og2XOFoTpPpq/ZCR5LwLE0EMttJPhhU7KoObrDlh3LW5Izy4KfwGJ92ZjuPKHhB0dy
	UcxHFvogJ96mYLKe3ML8LfwTS/1YzMS0n8SE2vf5L+VJpEZjw5k0YPxGhLeF0F5WI5zjpikS4SKY/
	lHHCdQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWJbx-007YIg-2H; Sun, 26 Feb 2023 16:10:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWJbm-007YH0-1R; Sun, 26 Feb 2023 16:10:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id bx12so687165wrb.11;
        Sun, 26 Feb 2023 08:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djzqrtOMQJZwFBUw6nLjGzlqHj5X2tklbzG5twEnCXY=;
        b=V8aTa5JRGEAaGQYU28XDRgLbIOzrbpfgnAUQvBsgxlcrgn2nyl/7rX7utupOM+ChEU
         +kt+lxiRF8bSptGggqdXDjozmaUYzX8BwPMS7cDRv9RZ6aND/l/DpX89HHuepK0871EZ
         9a4d+HsvmZ1YWlVSSxcGf8u1rFgJ7jIK6s5zfywv45rRXTnzCELuPG5w1Iq2HubxNbbl
         gYRBAPOexY6W3/w6OYbkW/Hg9ghw5lLfs0e9of4USw6OmlagQ+fhC3K9qEAnjOYDvPWI
         2o6xnOwRYiqt9/442cNwlQSi/igTNBG2uTIYlmqZB9beeBkIEDwEJo8d+NvKzruvy6PG
         OvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djzqrtOMQJZwFBUw6nLjGzlqHj5X2tklbzG5twEnCXY=;
        b=f1tJmruoqYz+E51yZb2us4XAxgXCiFJQq0bXdCRlHMYdb/U6LKL6Fsq8YEL9MrqBad
         CN025Vk0dZVXb8ZVUD4BH0QPCuwo71/4rg4Up9o1M2uL8JQtzLGxhrUhENfJcLlMakj9
         zrNEeUnPSeuCVtbN3HQHnTRLgW02cSFZo2B08qZLCFBc6A+QSC4yuMO4dWqZE7rWfZ5m
         zizaDWsGVur9kN/P9zSonT1zJZBErm2z785MLZf1h3ufQ5xzFQm+x5rVLe0pXtcTge0w
         QkV/1rBTqx4kxRCPxWL5Egs/dPDwKuU+vz7PFPzNRHIjcx7BvHMv3e7Bdbo90rDe/F0M
         gkVg==
X-Gm-Message-State: AO0yUKUA95+uWtsjdHNl6709HkazHIpLhDyjma/XafhxSFF7Tw2HZqd3
	kwbicKxSB8gvNPJL5cfAXo8=
X-Google-Smtp-Source: AK7set+O6bbAbxN1Ua/kXrH9BrNj+8QqW48HQ41VeWnrZz80AzUBwi3iXQAPXrouWaLivdhHnhmNcA==
X-Received: by 2002:adf:f6c1:0:b0:2c9:5dd8:2978 with SMTP id y1-20020adff6c1000000b002c95dd82978mr3003862wrp.59.1677427839646;
        Sun, 26 Feb 2023 08:10:39 -0800 (PST)
Received: from ?IPV6:2003:c5:8708:4321:dcf1:ac0e:cc8d:62ca? (p200300c587084321dcf1ac0ecc8d62ca.dip0.t-ipconnect.de. [2003:c5:8708:4321:dcf1:ac0e:cc8d:62ca])
        by smtp.gmail.com with ESMTPSA id n7-20020adfe787000000b002c573778432sm4674775wrm.102.2023.02.26.08.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 08:10:36 -0800 (PST)
Message-ID: <d7dbf7e2-5cfe-d728-4ca6-51ab8a6ac60c@gmail.com>
Date: Sun, 26 Feb 2023 17:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/6] scsi: ufs: core: Fix mcq nr_hw_queues
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230223152757.13606-1-powen.kao@mediatek.com>
 <20230223152757.13606-4-powen.kao@mediatek.com>
From: Bean Huo <huobean@gmail.com>
In-Reply-To: <20230223152757.13606-4-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_081042_134327_FC538255 
X-CRM114-Status: GOOD (  14.29  )
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

On 23.02.23 4:27 PM, Po-Wen Kao wrote:
> Since MAXQ is 0 based value, add one to obtain number of hardware queue.

MAXQ in Multi-Circular Queue Capability Register is 0 based, hence ..

>
> Signed-off-by: Po-Wen Kao<powen.kao@mediatek.com>
> ---
>   drivers/ufs/core/ufs-mcq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index a39746b2a8be..f9af658b4ba2 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -150,7 +150,8 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>   	u32 hba_maxq, rem, tot_queues;
>   	struct Scsi_Host *host = hba->host;
>   
> -	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities);
> +	/* maxq is 0 based value */
> +	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities) + 1 ;

Reviewed-by: Bean Huo <beanhuo@micron.com>


