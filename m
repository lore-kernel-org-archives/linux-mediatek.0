Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQPnk5aDzYM0RMJuLMFibD7eR6AKQ8fdg2TTkMfGufk=; b=L8LDVb+x0bdmZI
	oDSpneY71o4s64DjcsqaeGGjya01aOZ0GPtlq7E/noQjgJibS+NHtfC7HCLWeSZ67gRLf8qtN1Qsm
	umeRJsXwh+7QdP+BH0/n6iw/kdgZButKpeZ88tuTVt6WN45l8ctOxNK3xd4wxaHDIoh34kWI4RVKi
	J6hxjFEQx5oWemKjKK7fLeaCiuUaLAByEvn2AxoCCe7Bb7cIt3gVKFrELRw+QjseGdDLzSQUci+K0
	ALjE8XO7hxirrIlHqXniZ1ME826NKiPU+lmuALElAzn6/1FnRUwV8EyumY+6lX3xvm5iNZMrP/ze1
	zFo5T44jjPI7/kR9SWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqTAf-0060it-3O; Mon, 16 May 2022 05:21:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqTAc-0060i3-QG; Mon, 16 May 2022 05:21:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id s14so13419419plk.8;
 Sun, 15 May 2022 22:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RZKcm7OXMK/DUfXVXFdg1TDoHC6E/6MUQpSVukf18d8=;
 b=Q+fxLMKLfrZV2A5DmZD2Jt6jBFF2zhZxMWkvN51gq23a3kF1WSkJZl32EALy83N3sm
 qablH9zzKIgHDFYJpT//lKMX5QEpCCxhRaMelVQt2VHu9+sVX7uxZpOv+3YXbN3fEYHN
 ZuUTj+AjIpVprMDXB+w7eC8+20geYkP3Qj3b9PT+EZeNN8r0KsH0OBMTCUq/LYWK1eGi
 4LgLCqzRgdB1ze7MImSxLnPqd2w+99yObgDzt1dpNX/q62NPWNI3A88+cNl//jDArS4n
 XN7ooWHwLmfXNoO6/+LkXPS70zEkCQIc1/pYzFGzDwFZNRj7PstrhdvunTDC8CwCLB1u
 OD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RZKcm7OXMK/DUfXVXFdg1TDoHC6E/6MUQpSVukf18d8=;
 b=HDn6gZV3NY8CFn8evGqM5cbogFALGKochKhxPejTq7uslXEEU8Kb9HxLD3nQRwO8Hn
 qLhr3xWi4JCGXclqN9pRc99+rFsShP15EMqt1aOInTZ0FGv3yxwCh0K5EACrig1eZYeM
 uG189yjzslyjvwWiZanGue9xmxxv01Ek4RHEB8kqyuFUM1ZgcTWrrbOJcsgdlajzjsnx
 NZFpy6qiyHsFZE+j/gCLFbnD1LjNFOMsZNGxuDjrAPt1h/8LY6SP1VdhM6opOrP3Z6mY
 Zl3vkfVpEbBiyCeIENhsff1KqWC7t1usCkT55b18TQkNaQ+PLuJPJmWutosRgpFJwtnM
 1hhA==
X-Gm-Message-State: AOAM532FiEbp3Tz2zTROz88C8wSxn7ao/sUEWAFuYbMe+bxieLAX/M4o
 MCOZuWqgZrhzr7I637AaXrU=
X-Google-Smtp-Source: ABdhPJzDC8La40pR4pmE4LwNuOh4evKrSMQ9DPjq+jdqnhRgBrHgmGu+ocQPVJQvg1N0VNkVwugaGw==
X-Received: by 2002:a17:903:2cb:b0:14f:4fb6:2fb0 with SMTP id
 s11-20020a17090302cb00b0014f4fb62fb0mr15598252plk.172.1652678484937; 
 Sun, 15 May 2022 22:21:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:586d:4807:54a6:b6a0])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b0015e8d4eb1ffsm6039999plk.73.2022.05.15.22.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 22:21:24 -0700 (PDT)
Date: Sun, 15 May 2022 22:21:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] Input: mt6779-keypad - implement row/column
 selection
Message-ID: <YoHfUYmq49V5Bygd@google.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-3-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513151845.2802795-3-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_222126_905600_EF3DF35A 
X-CRM114-Status: GOOD (  18.62  )
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

On Fri, May 13, 2022 at 05:18:45PM +0200, Mattijs Korpershoek wrote:
> The MediaTek keypad has a total of 6 input rows and 6 input columns.
> By default, rows/columns 0-2 are enabled.
> 
> This is controlled by the KP_SEL register:
> - bits[9:4]   control row selection
> - bits[15:10] control column selection
> 
> Each bit enables the corresponding row/column number (e.g KP_SEL[4]
> enables ROW0)
> 
> Depending on how the keypad is wired, this may result in wrong readings
> of the keypad state.
> 
> Program the KP_SEL register to limit the key detection to n_rows,
> n_cols we retrieve from the device tree.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mt6779-keypad.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 23360de20da5..653dfc619696 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -17,6 +17,11 @@
>  #define MTK_KPD_DEBOUNCE	0x0018
>  #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
>  #define MTK_KPD_DEBOUNCE_MAX_MS	256
> +#define MTK_KPD_SEL		0x0020
> +#define MTK_KPD_SEL_COL	GENMASK(15, 10)
> +#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
> +#define MTK_KPD_SEL_COLMASK(c)	(MTK_KPD_SEL_COL >> (6 - (c)))

Would it be clearer to say

#define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 3, 4)

?

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
