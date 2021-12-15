Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 05:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SJ9/cidD38RyPCnECx+LuS2In5YFt3qOBVWEhG70Ug=; b=LxbANgkmzK9Ywt
	dOUFZqkANf7hI06VqbXNfgCSsQdDhBB4ROI1hKv2o4io7he7OAhznFzupe4JLNVr4QCH6NCnpoTy/
	o+zPvoZHV55oBeL1kztf1du5o0C+d+Gr1TAqO+LNk6FicmxxZEXAoNTpiRM6tqPXCQjGd0dUt/oeo
	gfMjUNMfWh33eC9Ybw9exUR5h9jQJmlU2blkKiz/YiEj2c5h4gYm4bvWdDkU43Dx+sqIhNR5d/1jn
	0VFk2qZVhay4hs1D06lGT2qVMgZfIE5/epB4oVucKvQE0LAQ7r+q9E4nFa4a7UNv7yIJpcQbaFC49
	vCCa8mBpLQl9Ykyjbc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxMSg-00GgpT-2P; Wed, 15 Dec 2021 05:04:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxMSS-00Ggnl-97
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 05:04:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id v23so16267302pjr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Dec 2021 21:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w3h1z2ZUOQdtw/Q+MQwqondvwrvk1h3D7alR26F4HjY=;
 b=Z3HmU0nMagUkYdu7+VontPj2taLCzQVuwNR7mgX1hry0t+7A4B/NjfOch2/CxqJUPs
 5zvv3pQh+y7muyHCN+/ZbmODnJwRMQO/ukzjIeGrN11jyOHUFBFhDhxPdcD6VpoTEiYE
 +s0RzEv+kICOe1SNMwJd1kXt7TNLBHc4T5HzuhQJnsoKF5o+0NQazp+EOIXlIQstmTAP
 v0I9R01wuidyII1CJ6yRKSf1Z7sVB6HDoE96ruAFt5l/bxdLRCXpDDoP9uwccQDjCz3U
 IJbg+B5gOIRoiQmCdzUiD4nMxMMfdvelJxq75WEC3wK/60lDlrqUZU0KnslT7Zjb+XNT
 U/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w3h1z2ZUOQdtw/Q+MQwqondvwrvk1h3D7alR26F4HjY=;
 b=fjXXpJuPsnqG9oK/ovcjfYQ5PWmsl0bDwh6AqcmWwXB6FIqbUf75SMYmFH7XurfL5W
 AlVOhqVVJcoNgV/xc7D480cfGITvL9xP4DHgQaEALZ/bm7aJ4BogKMbuPPnvJKewrES+
 ec4kxhK2Dqyg7Ub4qELJioaRbO7p2pPomKKxEZWdNWQ6haIbf2I5QK55ReBjYmBOMw22
 YW7V12aVRq7cFrT0pSToQa8dbL8mxeJGh7q0BHag3vW5AqRtcxpC+J5acwTbZYGfxSjk
 92W+dnFeT+ZcSnm3+nXJrP46toV0P36zgJ8LuYdBHDp9nrYByn93oquawyq/i2iEnH9J
 pETA==
X-Gm-Message-State: AOAM532oTYE8DyT+sKih1Ly44G2oAZ//sdb8zDmffVgLMC+Kb+cpqQKS
 LxbDwR0LfxFwMMJMOZcWBLe4pA==
X-Google-Smtp-Source: ABdhPJxucs3HR7YPsggkXj8v5xfCFbiTw9ADpgsT2tJCAtMOSuydrWDEDRG0g1K6R+1XTXzFr1LTaw==
X-Received: by 2002:a17:90a:46c9:: with SMTP id
 x9mr10047607pjg.183.1639544643091; 
 Tue, 14 Dec 2021 21:04:03 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:754d:1c44:62a9:6d30])
 by smtp.gmail.com with ESMTPSA id lp12sm624066pjb.24.2021.12.14.21.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 21:04:02 -0800 (PST)
Date: Wed, 15 Dec 2021 13:03:59 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mtk-vcodec: potential dereference of null pointer
Message-ID: <Ybl3PwH5CLBp8ZHz@google.com>
References: <20211215032834.94111-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215032834.94111-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_210404_363350_0D3B1597 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 15, 2021 at 11:28:34AM +0800, Jiasheng Jiang wrote:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> index cd27f637dbe7..769228093e48 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> @@ -102,6 +102,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
>  	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
>  
>  	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return ERR_PTR(-EINVAL);

It should return -ENOMEM for the case.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
