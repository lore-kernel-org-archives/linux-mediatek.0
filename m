Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7E0ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuWCEQrkq67hH5XIbvmOYYp78soeMvCFJK03dgG0hnU=; b=JCl5rRo0WRka6GScM4RiUGhKJl
	Sa3nJTteP/ZVZIXgOdF0ZsIjEfoNtN6TGSWUSpsvnNbeB8va3zA1LpHQXnkTV1bZtbN57qIf12FwE
	CB4x4Z3fmnNj8+ptTPAqSlpcpE+BX4eiXIrFM6lbaFIWgnKoSTGZqIiPGfGyubV47sy9eD3zA7EmU
	zWi3W5PilaUtmHlUurHgJFH69DEOsgSlNuQMkpqOO/jMikhBUcFbeNoyAZaWkCzH6vpI+S2pm6/cf
	WPCqZUDmM1z41x322CpWXBJDI1kFBj8Cn3h0x6p02DUptQSoUJ1E1v/NwVuz1C0ty46xwMe4TkQLb
	3Hk9XODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDsc-005oGA-VD; Mon, 05 Sep 2022 15:19:19 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVAWP-001WBH-DC
	for linux-mediatek@lists.infradead.org; Mon, 05 Sep 2022 11:44:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id gb36so16507724ejc.10
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Sep 2022 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FuWCEQrkq67hH5XIbvmOYYp78soeMvCFJK03dgG0hnU=;
        b=MUFymhzxKYlVlOPNYX8dVu6Mtzpf23C+FsQK5w6ZTavZerG6wjjtpWMrWr5ZK4DAje
         ozsMSl30+9NId+ecbgjNyYyglP6JoUVi28GIVE4APZ6Z2aaLKIAsLkIRLtmvNNZh34ZW
         S3RFhmNZja38AjKT5u5ymolzw2NP8XS04pUtt/LdzkAZsjUHQ/kC60yBJ8Zu7HEBAZLh
         NZX7OYylAlK3a9fnFO8WuoSslFDCXpJb3HsEfQv9FqdfMouhOBK9KqxQN9o+CBce3hWm
         vSJEk3VFzs8z7HdWi7Udvfo5+Ex4KIgLTZQk0K23Z4rSizF/FFCUZQeXXE36o+tlmRbf
         V4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FuWCEQrkq67hH5XIbvmOYYp78soeMvCFJK03dgG0hnU=;
        b=baBH4kKXICia89edq6gGY+HtV4WGnyg6lgvMaSgtzmXUdGEQuvMHvrVzkUorLRmrOC
         fCmL7dPU0EF4SfsnzzkUg0fXlu8y+hXkd/6HtbAGoQRnY35KBY3cKF1VM83h7BlnNCxw
         bFnSQB7kF+c5C8zDdzXr6RiwjzUDtr16HauAuBEbjd8zyN+Mdm46ub5nkkAkUjyR/2y3
         Up3dzz7nBhLmgP8orZsuxLRBpx6z2fEmIACnbGSYR4CwUugXZW8VriQwYYAq0AIGnnXj
         JKnv1aOi+8uqyI20J3tjblZV+bBABTHFav2l2KfiqLf8T43m56wbCr/OedlC/D7+2Jqc
         plEw==
X-Gm-Message-State: ACgBeo0B3+As3HfPZ1+ZRi0MrHKFI/urBLbGlV4I1i119IifZ7WkSq/G
	sWWbNL1yh8PsHhDZfkMev+Y=
X-Google-Smtp-Source: AA6agR4crvawfs6ErjZK3rzI+30+3kCDqoQqsAtSzu6Pnnl1xPCDOdlrdZA4EktV07KkEa8Ur/Rj+g==
X-Received: by 2002:a17:907:2cea:b0:741:6251:3a22 with SMTP id hz10-20020a1709072cea00b0074162513a22mr26754245ejc.6.1662378237788;
        Mon, 05 Sep 2022 04:43:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id kv12-20020a17090778cc00b0073dd0b0ba67sm4856017ejc.200.2022.09.05.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 04:43:56 -0700 (PDT)
Message-ID: <7b0ce06b-1e56-0db6-c07b-dd2946af6741@gmail.com>
Date: Mon, 5 Sep 2022 13:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix error code in
 mdp_vpu_dev_init()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <YxDGFMwyeNXFPaig@kili>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YxDGFMwyeNXFPaig@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_044411_925663_3749C0C9 
X-CRM114-Status: GOOD (  14.84  )
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



On 01/09/2022 16:47, Dan Carpenter wrote:
> Return a negative error code if mdp_vpu_shared_mem_alloc() fails.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> index 9f5844385c8f..a72bed927bb6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> @@ -173,7 +173,8 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
>   	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
>   
>   	mem_size = vpu_alloc_size;
> -	if (mdp_vpu_shared_mem_alloc(vpu)) {
> +	err = mdp_vpu_shared_mem_alloc(vpu);
> +	if (err) {
>   		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
>   		goto err_mem_alloc;
>   	}

