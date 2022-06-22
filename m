Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2GTDbUmRu18NwC+1WvY5Rsf+dw1KVd96phhm5UWgsA=; b=u41hj6C83y9K//KW0B/Z/dWTu9
	Pe4R/YYb6IYagP3gnRuOEB+T8FHcctv8GVfxQXthFB7kVizPOpILkPrdkULl+ZCK+fFcbTWUUUJyw
	vnyw1TN91PeZIhrRE71uKncT5rIj69Oe+PHNAnzCpm/AeuvazeJx0cO/D8+XCp6cKahEPaCPL7yfK
	jjc2dbgq3REDucnWoeHBbn2hVoH2bxT50dO/q9jAaLrpiD+yVMIQRlhRgD/y/zGYLjzZd7lh+ubow
	wXNfkJ63439AlCqSnATvVR3NvsfK9hnFRgiwY3mGV7s9Rg9Uje+kB65CXM1UNEGhYpLvxbGCTjGpG
	AsUy8/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40x1-00AmH4-5m; Wed, 22 Jun 2022 14:03:23 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40wg-00Am8W-Mm; Wed, 22 Jun 2022 14:03:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i10so19807278wrc.0;
        Wed, 22 Jun 2022 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e2GTDbUmRu18NwC+1WvY5Rsf+dw1KVd96phhm5UWgsA=;
        b=Gr5BDyX/k/r9/SHskmWky1cirIzDw/jMRmY8Mm+hStke7+GZxDU+zP++m+NIpp64fq
         owApReBr3/VwoZEacCr8KgHf7dmyG3ubOUgchqqWY3DrPrlUi4Fzd5veVO6gX9neaa5f
         EZR7sOgX9iU4ixgoFfZtFh/pK/pOTnUX+2DLjujRiWRS363uoiAAFhTrm9bIJ2tRPZI8
         LVExA8AwtXEIUNro1vp1hcvwPR1qyAIx5x2pQozXhCpGBzhfPs8v9Qh7k2lfftDQIFrO
         5DJJ9Apvp69AJ+eiVxcwsxREaA/o19sqcdYz2sM3OroOkg+Uk8JEPVD2iQa0Q/mfIqm4
         Ov3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e2GTDbUmRu18NwC+1WvY5Rsf+dw1KVd96phhm5UWgsA=;
        b=HYhhA/uxcgDNOZZkDGwt2ekJre5pq39oEceegtjbvJ50xO+x9ay7KAqO09ub14yEjS
         ySZ/jj4YBNA53doGYr6zl/UuKkSzSPDFD7xrGH2xV4XLyLhBaFEjOwOP5SW157kDm6c9
         F2J25qaS4Q+Jw554ZQCNqFBDRW6U0sKJx1+xvN4z8+1+vaj2BkTIjm313oRZ//x5uBa1
         ZtsjCLMjW7T/hVYc2P2GrgCXT4Vpn3/+n/VTmqx9EMoNqtz+KAautvYLgIDdOHUHOiJt
         1RYuB/H0w21r9b7MHv+wMeNl9JchSkgwes0hjqncr0401B9Rfr0Fe3LlEtuWpoHxwcIy
         xikA==
X-Gm-Message-State: AJIora96H7ySt187UrR/sN8UvLdym8mbK4jkNz0J5/2/DbiNskjkTjEz
	wYfZZarw4rm7Sl4SuH7VpNpGH+9yoTH+tg==
X-Google-Smtp-Source: AGRyM1veyrLsvSIgFm2G1Nn8pqcbhMb1D+Cmbvb6GGNrC03EewmSkf80cEfjccnmNy2HiPly6p7Mag==
X-Received: by 2002:a5d:48c8:0:b0:21b:826a:6f86 with SMTP id p8-20020a5d48c8000000b0021b826a6f86mr3531919wrs.220.1655906578348;
        Wed, 22 Jun 2022 07:02:58 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id f27-20020a5d58fb000000b0021b9e8d4c22sm2300195wrd.61.2022.06.22.07.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:02:57 -0700 (PDT)
Message-ID: <f48e0cca-644a-bad7-282b-28e3e0d5d437@gmail.com>
Date: Wed, 22 Jun 2022 16:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] soc: mediatek: fix missing clk_disable_unprepare() on err
 in svs_resume()
Content-Language: en-US
To: Peng Wu <wupeng58@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, liwei391@huawei.com
References: <20220621114658.10054-1-wupeng58@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220621114658.10054-1-wupeng58@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_070302_808972_D35CCE6D 
X-CRM114-Status: GOOD (  13.89  )
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



On 21/06/2022 13:46, Peng Wu wrote:
> Fix the missing clk_disable_unprepare() before return
> from svs_resume() in the error handling case.
> 
> Signed-off-by: Peng Wu <wupeng58@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 606a00a2e57d..1b5c297aaec5 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1525,6 +1525,7 @@ static int svs_resume(struct device *dev)
>   
>   	ret = reset_control_deassert(svsp->rst);
>   	if (ret) {
> +		clk_disable_unprepare(svsp->main_clk);

Same holds for the error path of svs_init02(), correct?

Regards,
Matthias

>   		dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
>   		return ret;
>   	}

