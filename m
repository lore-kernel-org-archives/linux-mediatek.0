Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwUYqCbLle08G9RqWAOKX8GjRcU4wUxvLOLUqd4qY9c=; b=oBdOE1CrPGWy1K
	xuPJeHfx416o748Y99ob6CikenL4zEz0yPgZVdMlqpMj3SQdzkvsna7Oib/30FVqgI4O1U+AOU0lw
	MJ7KYNptdnr5lYpShJHcPmD/OJbTmDZUO9wioD+/Kslu2TLd5kjSHvCpNWI4n9LFrVmXSBUGsjBse
	W7o09xqHTJ4GBqaVYS0iKiNgP9X12c2Ry8VC9J/Bb7+RZ7Wgx+N9UfOMSNSfPkZ6etHWLKD/jGPV7
	BbUXBe4RYFF862g/ip6NM71hCg5A5VbPtw/regBz/dsfrDUhIIZqxYMUtvcDVA3fZGz+W99KuHchl
	+zkqRfojOYGdgQkhBPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uZD-004MoV-Mh; Thu, 30 Dec 2021 12:29:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uZB-004MnO-R3; Thu, 30 Dec 2021 12:29:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d9so50249167wrb.0;
 Thu, 30 Dec 2021 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O0+J3hfYi+tJOX87FRscUIQ71ohxgIJHCX2HAI7b8Uk=;
 b=WMadPGKQYElHu5jMUqicwQrvbZw0wasy3D2dwh6uxHrjnJIKPJU2olLLJiUHlD3145
 plls98wtenzGF2fKfmdY+zgaoa+jfm1UcyH2wkz5HwMtk+9/Qh9TIqO85tG2dg+DB6lC
 +3e+sFx8vK+EaZzrlOQ4oMNMl7NxCcMoBoZJDv9wivx7eB6ftjYEV3iYCqcuggnraFTV
 AG6lYgy2JNYCSPoWhUz1P8FK3E5ws6ZBZTMb1uJZTczp3CiqAHm9U46gHeH3dcpnqQIH
 1tS9OsNRcHYpfa4tH+NupuN9/QJu3+dM2VWCPAjJH1oxL2Qu9yUuX6I/dXc6pxLQ1KOy
 0KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O0+J3hfYi+tJOX87FRscUIQ71ohxgIJHCX2HAI7b8Uk=;
 b=4BRo0mF7UTui86IkfMv5r5k6O1+PjOk/jijFblUAzvi2q/qr8OMxxuE9DaSO/H038u
 uqvBI0LkLNOajUNkYrQ0JFb36jtvxhQ+689Pbh18+ylMy6FWoo2twMFNbzH+s+Nv+VJH
 +P5qEr6RDM7+6zwoZM18+B5GFcwr2retRwaFvsAks/YtpHhCGerptnKLk6ffy+e4obyM
 kvAOtofBxcHXkKjLakQYtthZ2qdALADHTmgBC6DgXkrNPlQkiGWCfkqTyihDO5t/ApQS
 Y9mqj2THjTVnOwYYLGp6MIIB3xi6xqANZ4VZSB01Et+aePSZHgV+yoicSdYpfFGNP4UJ
 AfDw==
X-Gm-Message-State: AOAM532oOE9eJ9huPwDTK1r9o+e5lzDlUboSDWomwJK22yLijUJWQLZv
 3neNlUUZARmmPjyK/qddneE=
X-Google-Smtp-Source: ABdhPJyeMdqRs+cOsnbASw7H4TcBciKWFlGxLhfRAl5VE2g8s7FE8D4hxsDXVPloniZ7EO3XL58Fpg==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr24410955wrq.178.1640867396353; 
 Thu, 30 Dec 2021 04:29:56 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id o12sm23945584wrv.76.2021.12.30.04.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 04:29:55 -0800 (PST)
Message-ID: <d784e170-a115-bd0a-a87c-07aed0fb73fc@gmail.com>
Date: Thu, 30 Dec 2021 13:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Jie Qiu <jie.qiu@mediatek.com>,
 Junzhi Zhao <junzhi.zhao@mediatek.com>
Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20211230093610.28012-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211230093610.28012-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_042957_923656_D7B23DB3 
X-CRM114-Status: GOOD (  19.56  )
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



On 30/12/2021 10:36, Miles Chen wrote:
> clang reports a unused-but-set variable warning:
> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
> 
> In current implementation, mtk_cec_mask() writes val into target register
> and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
> should read a register, clean only mask bits, and update (val | mask) bits
> to the register.
> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 
> Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

I'm still not happy with the commit subject, I think it is misleading. Clang 
only helped to find the bug, but the we are fixing something else, that's not 
just a clang warning. But I don't want to nit-pick too much so:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> ---
> 
> Change since v1:
> add Fixes tag
> 
> Change since v2:
> add explanation of mtk_cec_mask()
> 
> Change-Id: Iec6402b0532942f4d0e8bc56817eb87b95c03fad
> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
>   	u32 tmp = readl(cec->regs + offset) & ~mask;
>   
>   	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>   }
>   
>   void mtk_cec_set_hpd_event(struct device *dev,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
