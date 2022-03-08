Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmfwM4E1E4KRQHYvufQhfRACSY03WewhnChroDDLWL0=; b=KBnvQO6FOF9PhZ
	+PrQFdPjeqdNTdrrtgY1SFThEdFkn8dhGqfZ6xhvWDFLIhNf3ta+ouZOzaHmhBTJz9c7s8zAAi1xs
	PWqCcewxmLRTQ3ewhsK3SxZxHYNLzr5Q6PrI5+7HMs91vxUWnkegtHrQjm525vkQ98/P3W8dLrbf7
	IXvCbxOKGJsaugfnZrMCXZ6X+PQJLf4omQzP4Erx7xDmoXSaK1gTXbI3YzoO4qAT+AWXVi04s0Hc9
	GLp9CjFp4F5qQtq8u0uI97HWEOKoOvf5t+/gI39cBlx0mnYpDlno93d0n1/Mk5/uO+YTLgY+uNU1B
	UwVZ3/f/43eMRkJBPJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRTYO-002uyX-Nh; Tue, 08 Mar 2022 06:42:40 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRTNc-002pP7-46; Tue, 08 Mar 2022 06:31:33 +0000
Received: by mail-ed1-f46.google.com with SMTP id y22so4023208eds.2;
 Mon, 07 Mar 2022 22:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ExA2winC/bnMZ2JkgE+r6xBTL0yncJAqBVQpnJpaDj8=;
 b=wq1Vwb8+trl99UNgt1SEaOjtRnZ6RqDyGSt/FhywUM3es3P21LPkIzdAhx/LtCKpwD
 Y+9hIuidpVtTp16M+FnEWnEEF2udLoRkGaB0PdfzLOaeT8W0CgERR+T9aJ3jooMB4ms2
 cw8JuA/SBoLBr+6GHWg+ZgcsfF5LytGWuupRIVavcgllmvSfvhauQxZwWysV3IDmCwDd
 u736+slvAqghWVTDnNaqt7Jd9IAOvN61GnNlZIWHCjkiRrRYHO1Foh5NUKTgOpukWD3m
 B27x03Zwd0cX9iTRMcdw0R05Qp79Y/SF3wrUGyRvsE1ClDQ93Vy778bENq+glObNd5sJ
 RPtg==
X-Gm-Message-State: AOAM5333M6OuFmhaGvWlgMr1DqWFcNLCcchwk0Aga93+HaCHR7ngRDEF
 s/Sbg/o3zUvrpf8Q5pZuKyY=
X-Google-Smtp-Source: ABdhPJzNzVQZgW80pNg0y9KL0gbSYgXIJIIH824sOsoUVfDF1ii/M9Z4dMNbQ3K8tQNuqIg8h+IvWA==
X-Received: by 2002:a50:d711:0:b0:410:a51a:77c5 with SMTP id
 t17-20020a50d711000000b00410a51a77c5mr14667857edi.154.1646721089642; 
 Mon, 07 Mar 2022 22:31:29 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id
 y41-20020a50bb2c000000b0041622779c50sm4374661ede.37.2022.03.07.22.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 22:31:29 -0800 (PST)
Message-ID: <0eff632e-4a9d-f593-72de-243ff4c7733f@kernel.org>
Date: Tue, 8 Mar 2022 07:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] serial: 8250_mtk: make two read-only arrays static const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220307230055.168241-1-colin.i.king@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220307230055.168241-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_223132_253482_41C8BE95 
X-CRM114-Status: GOOD (  15.46  )
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

On 08. 03. 22, 0:00, Colin Ian King wrote:
> Don't populate the read-only arrays fraction_L_mapping and
> fraction_M_mapping on the stack but instead make them static
> const. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/tty/serial/8250/8250_mtk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index fb65dc601b23..f4a0caa56f84 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -289,10 +289,10 @@ static void
>   mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
>   			struct ktermios *old)
>   {
> -	unsigned short fraction_L_mapping[] = {
> +	static const unsigned short fraction_L_mapping[] = {
>   		0, 1, 0x5, 0x15, 0x55, 0x57, 0x57, 0x77, 0x7F, 0xFF, 0xFF
>   	};
> -	unsigned short fraction_M_mapping[] = {
> +	static const unsigned short fraction_M_mapping[] = {
>   		0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3
>   	};

And perhaps make them both unsigned char?

thanks,
-- 
js
suse labs

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
