Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE6AC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 09:14:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B082073C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 09:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/jG/JwN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs3k1SZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B082073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G3n95lWJCWvC45ftC3rcsbgSbut+A1jKKZG1gyST6/I=; b=T/jG/JwNqxYa2oC3RVm87IUkU
	vMzVtVOn9gGf69TOjr8ogrx/IGtuqWBQtv95W6QzCEn/ScYxDXcxUhMkITMWvB98tPoN8mEoZbOVj
	JaLWeNDEmHB77ycGjFZyDfS9Q4rFRWh6e1NUPPe3OkZhmp7kTrt255kJTVI/OUHIS35piJbpQySpG
	7Vp/bSqs4/D8AiqdiqbMVf6eB73aqHyAeoe5OiGuQAMcA1FNceiDMXAksxodX2oVrHgIOnkGictEP
	vS3esrJG6rHQrBLLwo6fK4XiJbO8stVW1rWln1slekNEr2XJ5IC6EX88eFd67DHxg4a+4ZJanc7Hx
	PnJTD2dAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khUOZ-0002VO-Iz; Tue, 24 Nov 2020 09:13:55 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khUOX-0002UB-Fn; Tue, 24 Nov 2020 09:13:54 +0000
Received: by mail-lf1-x144.google.com with SMTP id u19so27862213lfr.7;
 Tue, 24 Nov 2020 01:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fIukb1V/mzn93MU1dQnXMsPLeNbtxaANkhBLdUp3br0=;
 b=Cs3k1SZ7ifHsNVz0CZW36NkPQFd0rGwgER9f8cZGQQko1ikOKhr4QWnWr7eWc7Yzfc
 MDtohI4WKe5AtxCJOwRVbfnbEqWzt6iwZKRcsWl6Zntdve4L6np4Ltdc8UA1Ybq4Vx+f
 jkTbfww4FtxD1tOa71zcmihcXFm1DoAyCkty0gzyYBGMpTbPJHxtlmGYgnyZCvOg7WwG
 /OEiGh7E4T52ddQQ33opkEjHCbtbasseciyiYlm9rrkUzHsQog+59kJpgL/e/JVl9bZ2
 Q9bgzkKdhB0y23+hR20ySeSipeqIN5ffi6/V9lvozoC6G/epREtERZS8gD3NrAhsfq5E
 gy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fIukb1V/mzn93MU1dQnXMsPLeNbtxaANkhBLdUp3br0=;
 b=DeN0Lz8PIEou04fAjHclzeZ5/R+XyV6V8ZEnewh3JUWo7GgYZ34+VGvm9tMApEjpio
 fdRqNyco9jpT67j5BxZAkknBv0J0OKvdX7R5MgRCHeE6p4E80q20o0A4lrRvqNU+gy73
 oe0ysCXSj5FPptbDTkNI3Xju1wI0Ja47gD7Zld+v5txM5z3FayXHVqTqk7d8jIZPTpId
 z4H50dDr5W8l7oZ+0orOb0tc3zt5TxHWsPw6NMyAqZdYsaF0ZwZm/0hhLwMiuXoGtvgc
 DOP3qVoR2Z1asGlHOFDJHBSy6d40Ee9KhUabRoA/csI0iZn3T5jWO7FFb/IWAqTPWqXb
 O8kg==
X-Gm-Message-State: AOAM532kvqeeKe7hskxU9izeUrnRXHSrsVlv2zJPkWmfG/175A44tNB9
 htmE3lAHYemHOB0410xDeySdWfFsZeijvg==
X-Google-Smtp-Source: ABdhPJxbyG0352c86lWvNDZnJDqhA2YOWXcRsyfKquJjBhPyD4Ni9BJBwtvNNPtm+8dxHSAwjj+CPw==
X-Received: by 2002:a19:7b06:: with SMTP id w6mr1484289lfc.260.1606209230293; 
 Tue, 24 Nov 2020 01:13:50 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:42b3:ccad:a982:d97f:90ed:ada1?
 ([2a00:1fa0:42b3:ccad:a982:d97f:90ed:ada1])
 by smtp.gmail.com with ESMTPSA id 6sm253081ljr.127.2020.11.24.01.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 01:13:49 -0800 (PST)
Subject: Re: [PATCH v3] usb: musb: remove unused variable 'devctl'
To: min.guo@mediatek.com, Bin Liu <b-liu@ti.com>
References: <20201124084955.30270-1-min.guo@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <c2f3f643-8514-5c4a-dd52-7abc8a6dc501@gmail.com>
Date: Tue, 24 Nov 2020 12:13:42 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124084955.30270-1-min.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_041353_550884_2D6E54BD 
X-CRM114-Status: GOOD (  20.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
 Alan Stern <stern@rowland.harvard.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 24.11.2020 11:49, min.guo@mediatek.com wrote:

> From: Min Guo <min.guo@mediatek.com>
> 
> Remove unused 'devctl' variable to fix compile warnings:
> 
>      drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
>      drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
>      but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> ---
> changes in v3
> suggested by Greg Kroah-Hartman:
> Add a comment.
> 
> changes in v2
> suggested by Alan Stern:
> Add void before musb_read to indicate that the register MUSB_DEVCTL
> was intended to be read and discarded.
> ---
>   drivers/usb/musb/musbhsdma.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> index 0aacfc8be5a1..2a345b4ad015 100644
> --- a/drivers/usb/musb/musbhsdma.c
> +++ b/drivers/usb/musb/musbhsdma.c
[...]
> @@ -336,7 +334,11 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>   						< musb_channel->len) ?
>   					"=> reconfig 0" : "=> complete");
>   
> -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> +				/*
> +				 * Some hardware may need to read the
> +				 * MUSB_DEVCTL register once to take effect.
> +				 */
> +				(void)musb_readb(mbase, MUSB_DEVCTL);

    Hm, forcibly reading DevCtl in the DMA driver... sounds quite 
nonsensically. Lemme take a look...

[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
