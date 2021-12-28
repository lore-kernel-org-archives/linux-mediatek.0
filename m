Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D71C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Zuy84+KP2L5rtMzspsG5p5ySWoHCGZC9I07kAVt7UU=; b=tJerpIsWFTx19b
	hKFm92uVQe+fTidMh0ISDRR0NlaK6/o3/RNcRnM0GeCv9QYs1ZY2bmxBL06MOiRcm0M0CGX9zssHc
	/3NhPb3tbkDtqPo3ZFaBskJf+B2jgflcvtytEoN1ekQ+0lvIvlBF7ALC0Vz+vayp9DqkUH9pTbebe
	yrRykytCLAQijBFVmLW01JKfiCkQwZln+3iCVeMfs1eEeIVxKOKbf71tb8XpYAdNGvBUfT3Q0P4sl
	RIYO34ZZpcvn3Sc06k72CDEQKHVM1SauaHqWoohkiFg6rnavKOPODTn5SCLdgLm3F9TsOldC0x8uW
	IGc1+lA6pQELUYI72GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2E8p-001NBx-K0; Tue, 28 Dec 2021 15:11:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Dvp-001HfU-Pf; Tue, 28 Dec 2021 14:58:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id w20so29879343wra.9;
 Tue, 28 Dec 2021 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0EKkFOMfBMhnj4gE/wIselffM6hh1xaDY0vBPskTeK8=;
 b=eXsUiD+XAMAE366M0Wq6CbF2W26uA1pXycMjbBq7X+U66zEEo+SoA+P4y3ntdUVGlr
 jm6UekdgB/CgC66w/KPa1+ShM4A812w9EoG0xqo2lop2qbE9muOduFLnj5JlsUygP/06
 OKZMxLeR2K1JnmrChdxuhbdi3XvKkjidwaC5bUHQUFiyFaTYYtAOLgRlZxSu0gCPmdPf
 lGmgbBBICPdCOQIYEV4rjGh6VOwjYOWaYd+fiZFeZhoz33zPlONZuHoGRyw3EaiAwEQe
 Zhs4b20PfFnA8NVZ8wKS/E/9u33C3jG8PlTq0mDip2v+djyFuDcmJUFMgV8ZxFOE8G84
 jxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0EKkFOMfBMhnj4gE/wIselffM6hh1xaDY0vBPskTeK8=;
 b=p/O9hSBh77KT3jlMyNm6rab0fKFgg+96/V5zLyWWhYC/08TQexIkARmUx1AIijNJWN
 U2ymrqPHnWH3QgU830DhjZ2TAuPEiy6zSuFy8+O3tYP0ZffUGnKycQWElUohGuR8UriI
 GYZtqJQwPsYq8KQkESDqYjAvX+32YmZGsYurozM5ru0nfCTmx2n7yAFwuWtKw/Tey41X
 HRIWQEosiP8Rm24zhtZFFY53UL6ZblTPeOi66FGXXYejl5nqn2R4VFi6776VS2gAvWes
 VIbSD/Kg+DLJek0BJGBG/p63Wo3fsdso3iSXkm+0VmY00KgUEdAix/UDoHvxyQfDF0nA
 VaEQ==
X-Gm-Message-State: AOAM530h6CKgkqLKV9b6cGqt8d/bb0OPbUjXaDzR9vi83F19jP/d5FXS
 a8OsCo+nevZiaN8ERuE+umU=
X-Google-Smtp-Source: ABdhPJzKqa0L9wwBoXeKIwPS6rl8ONnmr/bs6OUl8sS5RxFlF7/bBldlKueEtJCsTu+6NI81czaDiw==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr17239895wri.277.1640703507827; 
 Tue, 28 Dec 2021 06:58:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id b6sm16320534wri.56.2021.12.28.06.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 06:58:27 -0800 (PST)
Message-ID: <0eab31b6-2b8a-b9e1-a738-232cc8f86379@gmail.com>
Date: Tue, 28 Dec 2021 15:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] mailbox: fix gce_num of mt8192 driver data
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, tzungbi@google.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nancy.lin@mediatek.com, singo.chang@mediatek.com
References: <20211223145155.25704-1-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211223145155.25704-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_065829_915536_D52F7941 
X-CRM114-Status: GOOD (  16.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/12/2021 15:51, jason-jh.lin wrote:
> Because mt8192 only have 1 gce, the gce_num should be 1.
> 
> Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for mt8195")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Change in v2:
> - fix tilte tag from cmdq to mailbox
> - rebase on kernel-5.16
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 1faf35e8aff0..2895484f8349 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -650,7 +650,7 @@ static const struct gce_plat gce_plat_v5 = {
>   	.thread_nr = 24,
>   	.shift = 3,
>   	.control_by_sw = true,
> -	.gce_num = 2
> +	.gce_num = 1
>   };
>   
>   static const struct gce_plat gce_plat_v6 = {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
