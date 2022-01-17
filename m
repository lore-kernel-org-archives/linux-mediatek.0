Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzWYOGWonqKICOgtaOnbfdxlZ0lBsZuaaqSVOi8elm8=; b=3IBKt/w0+jJHug
	G8uZNTzGydQ65r12KSA6WTdrYBcFmcTD6N+UnzYDb0rw0yRSaaI/7hE2U/Ij4tkdAnj0y0abV2oN5
	6DVhDkGrKiXmubq0JikG81OweWxsDByddkJDJVPctUc66xt29bYfPgAfhI0XZybaoDHc7MqbijjK7
	BwFPsINdX9QUPM34DHglk//FRqsKBKlqStIu/nmTKayAtslA09UKZmvisQXYBiaQWlNFjzI4K7hmC
	vJvt37P7i0bv8DDgEjvIPkjgcKZuTv5bZlFoXZzDANnmoUIOVWc9yW1GcjAotm7Di/NWUrZHMIZ3O
	Fe7p9meb5ZyaWeDjlvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L3X-00DXrr-0u; Mon, 17 Jan 2022 05:59:51 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L3J-00DXn9-IM
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 05:59:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id s15so3507562pgs.1
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Jan 2022 21:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SEqaQCJKDxiFQ3pZ017weFeb+0dnjvIO+EowvolRqQo=;
 b=MStWzEQoU2/kESRCpGambaEvP2Cxi9hVDCklwBIuHO/nQ5lRbMccJUhxzRjZrvVsQR
 5AnAEAphxWtgj1HkV570g6Hp8zEORRxC7jlCANfq2t3lat/AegF7mL9w8OGfUPApbtXv
 6wsoshJHjDaE8zHkwM8NMN9tgaM3qZqcZQVPda7R2v7BCdvYZ/UVBuQF7AGQpj6G0uMQ
 r9sk45X4NuFyUXOXD/rV8u918PinANpazmUma4laOKuOfXtdzKh0+VaPa5Yqo2SDeKMY
 bqvE1w2LmC1ilPPxrdZavk1FCAzYpi2KLrk/HZVR00JRAfGpM/S2X4zKqUvwH6FojGfp
 dQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SEqaQCJKDxiFQ3pZ017weFeb+0dnjvIO+EowvolRqQo=;
 b=HjoqA15qtR8P9rx/IREyCZn6e5dDf/+FjiflOS1kjIgHbCJwsOiFLir4jLG8ojNFqe
 7M7SMrX8jWqkYNoGSUiGDHOduHamp593qN1/7UpnZ3mnpgMM1j2tjhTK/EA4yBsrEpks
 3IfCvcYbPJfY8f/mtO7evZUuDw6PNxCWdsWhYu+e2/et6T3kk4FzvrTVerBshW6atcT/
 ua6nm4B4AzwBJMvzFmHmYQUVrbF79xN/PrQNaAeNwle2LWJ6genxQtkmr/GCUZob21tx
 iBvSTTxCnTIDkdVACeMXbSbN5JodQJurfyQERoEVfxGJnrF85QEiKJfrsmMh2SBzrqeq
 gJcQ==
X-Gm-Message-State: AOAM533uMQw039BMixmPbm8bgeMEgKnGBVPosOiCzyUbV+b+uuWpm/07
 WCam1C39ObXKGR37q9fdLWgo8g==
X-Google-Smtp-Source: ABdhPJyPvEnUvSKO9RLm6mAtrfhvGGimgy8WJTS7FgOIsni8aTvBI9lhcnIJf29AgV+vQPoQEm6Xbg==
X-Received: by 2002:a63:2b02:: with SMTP id r2mr18084089pgr.530.1642399172344; 
 Sun, 16 Jan 2022 21:59:32 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:bc3b:819f:7751:ac96])
 by smtp.gmail.com with ESMTPSA id b2sm12991291pfl.138.2022.01.16.21.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:59:31 -0800 (PST)
Date: Mon, 17 Jan 2022 13:59:28 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 geert+renesas@glider.be, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fazilyildiran@gmail.com
Subject: Re: [PATCH] ASoC: mediatek: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Message-ID: <YeUFwPHyAfe2ex+0@google.com>
References: <20220117050324.68371-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117050324.68371-1-julianbraha@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_215937_620762_CF279BFD 
X-CRM114-Status: UNSURE (   9.34  )
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

On Mon, Jan 17, 2022 at 12:03:24AM -0500, Julian Braha wrote:
> This is because SND_SOC_MT8195_MT6359_RT1011_RT5682
> selects SND_SOC_DMIC without selecting or depending on
> GPIOLIB, depsite SND_SOC_DMIC depending on GPIOLIB.
> 
> This unmet dependency bug was detected by Kismet,
> a static analysis tool for Kconfig. Please advise
> if this is not the appropriate solution.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
