Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22750C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZZwcaBQvylp6P0xT13AIN/KUGzQaUKedeTmGi5HFPg=; b=Xz4RsbxMki7+EW
	uFPExboV+779o72v85EzzgfbDUKeOT5lbiOc7hD1Na42O0Z4m2xcgZNeoEm4HltrzZCHmgagQQbY9
	TcYB+k+h6ovRYT5UFdG3V0zmkPIsy+2awdTacdbn32khOPIESngMMrXbBxiY6cb3ZI9T2xJOPhbyN
	2kPOsXoWFuNIpLJG1+DVsU3B5xxuYhk3XUDfcB1V78W6bgousPTOAJMqROMRQOdLNyhfX9QsGyHRG
	vfbcE/lf7rlmTmaBdVDPj1Pwwz/1Wl/uPduQ8DjoCpQOhVGQVm3dkUPe5+KYPYWOW4bA4wX4Xssu1
	uzIY4uNeiSRvI7Oh/LjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkLjZ-00A5y0-QD; Fri, 29 Apr 2022 08:12:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkLjL-00A5uk-8C; Fri, 29 Apr 2022 08:12:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so6591625wmb.4; 
 Fri, 29 Apr 2022 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XqvrYci+95js6f4mZtp9h/yUnthzubPuS18nX3bTZPY=;
 b=Agh0hWfNWOLsgMtRQM7cd5+lULJfekaq2Bdh3j5NJrn8b77Zijoq0Lzu+L84ZM2LVz
 wt1r36bJC8X6sII7aa0Y1uCvfy4g0T+Wg9D0SorY0VU7U5eyo+kztqsvp/jueHRWzWzq
 Clcs/GPXTwguYJs/ySHdd4cVkPfhD7usB5qc1a4HNTnkYp8PYLFPtPSZ0K7NsQXyHsce
 TMHr7eRmKAKhHpRhZdf9P8Yc0fC+6ukgaRo55rChtq9CrWhXGHGrwvZl7oJXgq9/ekOV
 ejIe2PNvw6G5fOikA75aBhkkFGyeLnA85N/DohY9YkAcFI/QMcwRGVZXPcl/thf+D2TZ
 1wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XqvrYci+95js6f4mZtp9h/yUnthzubPuS18nX3bTZPY=;
 b=0fDSdtuz9GOl5mJu7Y/pNu0BnATM229uzI+ZUS+zyGruHr7VEF4NBdVxHYlGKJxJOF
 0p79XmVQjBCkFAMPwOW+NkTLaKuG7InBRRnCGOtrb4Fv9kiKseqAlNsIqMXpyCThjEUx
 MNp3kATCsOZEZOjwI63s5eje3YO5byl7d596CFJ0mZeReM4VOQbAxVAd+7OBjCNKHI7K
 LDrIHN5wOkntywhNdnJJhWo7/gFCEz6LWk/KRbn5RqUgumoErJCI9RswMcw/6RJ/qgcQ
 grvg2xcJBaF/AkzlHiE7fvUVJEd4YlAis5EmhJu+sBlQjPH9iYRNkE44R1TTn5RRIn5f
 g2BQ==
X-Gm-Message-State: AOAM531P7bnUv0egaxEyZyeeWAJ7eTiKFVPz3TKF/mswSKKaDW5laKnh
 7MhUUsywJcGlBhGt9nnLKoc=
X-Google-Smtp-Source: ABdhPJzYf70fG27iHwc3wFbKY4QIqsyyUy9X0QI973D1I4SxhcbTK5uGUHInLMnygbTBJgrDh3XA3g==
X-Received: by 2002:a7b:cbc2:0:b0:388:faec:2036 with SMTP id
 n2-20020a7bcbc2000000b00388faec2036mr2089539wmi.190.1651219916786; 
 Fri, 29 Apr 2022 01:11:56 -0700 (PDT)
Received: from [10.7.237.11] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a1ce910000000b0038eabd31749sm2222371wmc.32.2022.04.29.01.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:11:56 -0700 (PDT)
Message-ID: <c962f441-05b8-8aa1-5186-c85251f3e0ba@gmail.com>
Date: Fri, 29 Apr 2022 09:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v2 01/15] eth: remove copies of the
 NAPI_POLL_WEIGHT define
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, pabeni@redhat.com
Cc: edumazet@google.com, netdev@vger.kernel.org, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, mlindner@marvell.com, stephen@networkplumber.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com, grygorii.strashko@ti.com,
 wei.liu@kernel.org, paul@xen.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20220428212323.104417-1-kuba@kernel.org>
 <20220428212323.104417-2-kuba@kernel.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220428212323.104417-2-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_011159_356069_1DBB2D1F 
X-CRM114-Status: UNSURE (   9.16  )
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
Reply-To: paul@xen.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/04/2022 22:23, Jakub Kicinski wrote:
> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
> 
> Drop the special defines in a bunch of drivers where the
> removal is relatively simple so grouping into one patch
> does not impact reviewability.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: ulli.kroll@googlemail.com
> CC: linus.walleij@linaro.org
> CC: mlindner@marvell.com
> CC: stephen@networkplumber.org
> CC: nbd@nbd.name
> CC: john@phrozen.org
> CC: sean.wang@mediatek.com
> CC: Mark-MC.Lee@mediatek.com
> CC: matthias.bgg@gmail.com
> CC: grygorii.strashko@ti.com
> CC: wei.liu@kernel.org
> CC: paul@xen.org
> CC: prabhakar.mahadev-lad.rj@bp.renesas.com
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
> CC: linux-omap@vger.kernel.org
> CC: xen-devel@lists.xenproject.org
> ---
>   drivers/net/ethernet/cortina/gemini.c         | 4 +---
>   drivers/net/ethernet/marvell/skge.c           | 3 +--
>   drivers/net/ethernet/marvell/sky2.c           | 3 +--
>   drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
>   drivers/net/ethernet/ti/davinci_emac.c        | 3 +--
>   drivers/net/ethernet/ti/netcp_core.c          | 5 ++---
>   drivers/net/xen-netback/interface.c           | 3 +--
>   7 files changed, 8 insertions(+), 16 deletions(-)
> 

xen-netback patch...

Reviewed-by: Paul Durrant <paul@xen.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
