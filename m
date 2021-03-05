Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA35C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:15:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB8264F53
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB8264F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U9dJyx4d32AWnd5MhQ6WP330iJKI4uP6RkD6RdawemQ=; b=Wlb+liEs74r/mpfkRsjMr01kd
	1z96V8UFWnmXZMBD7OQgieLAJ8xwq0Fy4kfXEgDO2mY6Q6lWBfQLZ7rgLLnzVT6zOWcg3iN0NNq1w
	nASodKwMsNKOmEzMDbOSv+aGYZOJix4I+rCGxuWPFx5R6R0ZHYZHZVIIp+XZtsJWF58r/i8UNoJ6k
	nAOGzio5bw5CKsBZuJW7K/EPCUi6XOZMrSFIXNXYdocCFuKjKIejpzrJ4O16ZYAqRF1yyRdlYuHBZ
	5Mz3IO6THLnDpJosYNl7qpmpJ3KTOwtDQ+YCwTAdHY87qGMf9BXM/b5gn0dgXbFBDBOTTuxaWT2Rj
	iDDOVGmLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6YI-00ECjt-T0; Fri, 05 Mar 2021 09:15:19 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Wu-00EBpC-U6; Fri, 05 Mar 2021 09:13:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id b1so2414000lfb.7;
 Fri, 05 Mar 2021 01:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PhTwnS6e+dOXGQrScOlJarhrtWGlmLJkLdp9O5h0GHo=;
 b=htvFEAqGTv25B8HwXBqP2E6mw7giIUxxPvkoiUz8Pbbvi4STBfDdPIAlTPYWb+KTgs
 HA6DpvsXUtdE4S14QU4RX7L7jz5BnWlGvjTcSFZgsXRRWTCYVH7xKkOkdZkWDpndyjoC
 8i8dZP1y0s814qk+REf/9JVuH/Cr6h1Qe0MfDefyHTgAjxbbvQnDn+oRkBAyuh/mzLnI
 G3fiNaLLAR4tLwjvcrlIMQbIYfrDDIH+5iwFpjs8Tx9I2llNFnOziqrs0+XEOcbA+X9C
 BC6oqyLtKk0IrsWhIHCxFJ8yh7UZ7I6pkofCLiRke7XCn1FL+gRh/g6zq9JEJyPmVZOd
 977Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PhTwnS6e+dOXGQrScOlJarhrtWGlmLJkLdp9O5h0GHo=;
 b=l0D4V6USNWusWq4j20YF8Dcw+x06FzC4OA78lLolV461auEnPwDXJfmIYsdU8p8UKL
 ih5rZNYFYHt+60y4uct0zOlovx7Ju4AbPM8I4+Nnrm/Xfjg7cogqmhz/9vYRIV5DhYHZ
 4JNQvS0uX7YiTn3xxfo6PU4Uu8r2Q8VnbG9AgEiY+EjnwrIk47EV06fQNZxkFyzTHkZj
 plnQmkFjUWAyHBQfALhYHqjJLX15WAE3pez9Ij0RHXIT98h0wYecMmg2eLlI2V5sSydV
 BjAcBI01t/rr6cCRuvDbjnuZ61JGhVNx2/LGnQKPpSxH6k+Ock2fyMb2HSt5YjxTBOZV
 UdZw==
X-Gm-Message-State: AOAM533YgQcg86DRMwfIQM+bUu7B+Q9+k92JvWCv/7u3XmqUW7neKTlN
 9itUjII79LCLmvyN+so1cgE=
X-Google-Smtp-Source: ABdhPJxwB5rP6t2SaOLsLjt2imgfZdWI9yHY2brcos7S3qzCK9X6wTcwXLCa2C7+/xlVZHElmFYxbw==
X-Received: by 2002:a05:6512:11e3:: with SMTP id
 p3mr4937581lfs.137.1614935631505; 
 Fri, 05 Mar 2021 01:13:51 -0800 (PST)
Received: from [192.168.1.100] ([31.173.85.142])
 by smtp.gmail.com with ESMTPSA id p10sm233695ljg.99.2021.03.05.01.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:13:51 -0800 (PST)
Subject: Re: [PATCH 03/17] usb: xhci-mtk: get the microframe boundary for ESIT
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-3-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <cfa6dccb-d784-06fd-e5bc-0b53d105b7f6@gmail.com>
Date: Fri, 5 Mar 2021 12:13:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614934975-15188-3-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091353_219394_62A2E134 
X-CRM114-Status: GOOD (  16.75  )
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

Hello!

On 05.03.2021 12:02, Chunfeng Yun wrote:

> Tune the boundary for FS/LS ESIT due to CS:
> For ISOC out-ep, the controller starts transfer data after
> the first SS; for others, the data is already transfered

    Transferred.

> before the last CS.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk-sch.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index 8950d1f10a7f..e3b18dfca874 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -513,22 +513,35 @@ static void update_sch_tt(struct usb_device *udev,
>   		list_del(&sch_ep->tt_endpoint);
>   }
>   
> +static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
> +{
> +	u32 boundary = sch_ep->esit;
> +
> +	if (sch_ep->sch_tt) { /* LS/FS with TT */
> +		/* tune for CS */
> +		if (sch_ep->ep_type != ISOC_OUT_EP)
> +			boundary += 1;

    Why not:

			boundary++;

> +		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
> +			boundary -= 1;

			boundary--;

[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
