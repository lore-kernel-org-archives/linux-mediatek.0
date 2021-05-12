Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BECC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:30:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C115261285
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C115261285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2eqMXp+K7qHxbUlbZpS1AfMaLnLuexI+baULNRsuUJs=; b=QaWMj+gwyoqr4x3R8LznlYC00
	XyKJlRGBowypchJTf4dPsISZRKAWIMqvs623sigqvrOHVZ+b083bwZAS3zBSsk0o7eAbyy2Bmx22a
	vItlChshowZ0HZx44Z47zI6sUYMBXC5oCkShDH/Z664I5JpRZFskgBLoZUUpH21DwfKZJz/G5DUV9
	8Ys5Wok2JqpTdT6ZYqj+EhQ0CCSHAeMxG9VgQpC4v/PHz4wDkpsQcibgLXnYoQMC2T5T8hcoyn8Lu
	QFD5fVme3+Prt1flifgKkC6T5ibVIjf4xwuxO19S9HLQ3f2/rOzOZF3X1rDFDoC08LOgNypHf5U2W
	84HvunBcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgrki-003Kr2-Ej; Wed, 12 May 2021 16:30:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrkg-003Kql-KS; Wed, 12 May 2021 16:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=5hXKeS5OhmnmZTHSHZROuYQB/mQTrakWYc6A59BUOp8=; b=JkaPebWvcMs/R3O/Lq2UNExOeL
 YBYqYLbyiJM5Qw8TJWYlJzr/p48ACrxbVNmOmo717cuG0tcHgx/CRXd18YCv6hn7D2gCzQCaXMaOO
 1qzPNaBB7i5RmlktbpoiD4/Q6InDCezcpz0zohXFTkEWfh8cHLqevyc3czpCZLAlDqjNanrGjMmNf
 yhMuP/NDTh5FbUq5lAOeuCvj89wx/VHwL2de7OGmGDCY0hB4wVt9nYa9ypEEgYebKNIgvYZuQNb1r
 ZuZGGqDbpNDiZkJyNhcsex14o1aXLYz8+gWe8okjEBbmGgzYsVLJBwThqKjv5WLbs05RAsUqV6FLG
 ds/PrumA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrkd-00AayN-Sq; Wed, 12 May 2021 16:30:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id a4so24272064wrr.2;
 Wed, 12 May 2021 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hXKeS5OhmnmZTHSHZROuYQB/mQTrakWYc6A59BUOp8=;
 b=YX5csET7uK4OTwfsn9+uWVUPv7uQ3h1aN1mAwR6RqT7OaEeAj0LQdHsXsAHWF+DxGG
 0XzKRxKUrkdZcFdqKeyc99RijzscjefdsusUSinzkelNNfq7Js6xP5L/qYMCn2YWqTVR
 2rmjgRkKjLSwYdbuQv5iBx3RHV/LtNTi6yZZyDcBAyF+3OwlNQtejmLbkeGYaC11435n
 sphYKaycHj/cLlMm1A2nwFpZ5RK2DllEMJC9yWADQBoSJs6icvfVHuUchJ/SADT3IAdq
 jpcWCcEF6E4DgU5/RQAx5ztkxUkgZoxs7udoRAfWU2+8tvYutv1ahpnkKGs657+7Dn/Q
 ZxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hXKeS5OhmnmZTHSHZROuYQB/mQTrakWYc6A59BUOp8=;
 b=gDDW/ziFqROeYkM/FNfS1bY3/gCctXdjA53/1d/+uGE7ruHQGxEYIfBo7BAtjmlCXL
 MIxCmWVmSG5mBM4vQ8wR80aQfbyWJY2PNBdrW0wNiY7ZCy00LcfwgicqET+QeMORQlvz
 YWfsNDf81vP14P7gOF74FaBcGXjU3htWC4ZQ4PDS3C6BZYLmNbFLC+SbZnBfgATgWx0I
 NKVAOWiV3T3DWgOC2jqP/TNNo+jPGCslwzCW0p8dNBPTlGFsj91nFWZ2d2DFKK8ropaU
 q44Kg5NnK6FT/q6hgh0QMB7kL1BC3AKsNP80XNgk0xPIJpg+r7zX1vlEprQH0qKgAAHL
 1+YQ==
X-Gm-Message-State: AOAM5336kruoATGxfKruE7Oj/RzPIUpLE1cz9BTSATeoALL/yP9ZMI5C
 926gWR6mmpIRZ+0ewZhBT5E=
X-Google-Smtp-Source: ABdhPJwyZun0CfXDHzD4lchN/yDs0NwNZ7wTZ7T+4EcPqfflRr0OZfSVj2FugRXxzS8evt5EUP+uPA==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr45833334wry.155.1620837022555; 
 Wed, 12 May 2021 09:30:22 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id n22sm6257999wmo.12.2021.05.12.09.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:30:22 -0700 (PDT)
Subject: Re: [PATCH -next] soc: mediatek: add missing MODULE_DEVICE_TABLE
To: Zou Wei <zou_wei@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <1620705350-104687-1-git-send-email-zou_wei@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <88837f36-e285-a8b4-4e03-ea8c9c1adbf8@gmail.com>
Date: Wed, 12 May 2021 18:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1620705350-104687-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_093023_982673_5F9E0C66 
X-CRM114-Status: GOOD (  18.75  )
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



On 11/05/2021 05:55, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Applied to v5.13-next/soc

Thanks

> ---
>  drivers/soc/mediatek/mtk-devapc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index f1cea04..7c65ad3 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -234,6 +234,7 @@ static const struct of_device_id mtk_devapc_dt_match[] = {
>  	}, {
>  	},
>  };
> +MODULE_DEVICE_TABLE(of, mtk_devapc_dt_match);
>  
>  static int mtk_devapc_probe(struct platform_device *pdev)
>  {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
