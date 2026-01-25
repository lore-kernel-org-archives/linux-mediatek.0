Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58719E63CA4
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 22:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2umcnwEupH/jiJ8gD8E4VSgSAY8v1C2B2I4eeqRnGkg=; b=nrZuFzQkL6YOa2zUZLfT9QAw6+
	h7qFR2zL3eoU2rnVDN6jBg8/zihk6yajPHTz95n4lNnGfZZ3Ar8cu6fLBwheScoDS0yY+UC2uRKXY
	9+S+FRzsC0tFwT7dzpsbh3VC2T358fuvFcXUMCQ186QpwBF0bYjy68ks1drfvACDlLOcGwl1dK6TL
	Boe71wbx3RjjR6s4LSwjzh3NCfAOLxJlyxPt8VvPa3U6OfM43XOoz8crcYaL11Pd8PS2WdxZZlmK6
	eVkN6RkVBj4/ngRhOkD/htNONoZ0EZkhZP2zjEfJ6xpoJmin8YbsilBjL3tghwk/QM/4D2BOvszl7
	fgTW9H7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8kM-0000000BahD-1etY;
	Sun, 25 Jan 2026 22:38:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8kK-0000000BagU-0DXH
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Jan 2026 22:38:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso18460035e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Jan 2026 14:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769380694; x=1769985494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2umcnwEupH/jiJ8gD8E4VSgSAY8v1C2B2I4eeqRnGkg=;
        b=SHEZPSWtJLgPBPiMhcMi1U8qwp3NhinU5FSBwU8gmOnBgCUfOqRxUHPLy7G5Dcbkdo
         zq91ukIlsHCFC4p+wPQwDMzgJIMaEkjI44+ZCTpoxGz366a3tydEEksu1qhVZfQedMpJ
         0pg1wAKEdJmej0OFDNFjNFjLUx5TPHX6P/3lzglbAdJRSiyfwCdPfgmHKF39vAI/pWhV
         huvf6UlvX9lVjOg5rSEnQwCw4k0BpXfG34LboknRUiT6WylH+3C0L/hAMVsvFVzuJE2W
         aP1oPjgkMoQGut6xxH9wmfJtluSCmsLO7y6GtLGRdEyXWWHApPlb0M0dVsW3CBL0F8Zf
         qMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769380694; x=1769985494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2umcnwEupH/jiJ8gD8E4VSgSAY8v1C2B2I4eeqRnGkg=;
        b=Oqthyx4izjguaMnryQJV+4Aean41kKvBE6A8vdq+q105EfXTsbEKlzDhiEEjFP1yQf
         +o19Ay4UV2gaHT8mBU91PpVI0xxiT900Q1pdNd6Mtq/uHddXeRTHQdmHk8/2k5nnM1x2
         XK/CgO25a1yiaRG7RM9EN3WmY6Wot6N0wV9PZPLW360k30+wQ+RtX1SvblcdEn0eO/tX
         4OF1kBhbnw9NnLo/UfaMmDwQD9fZlr7na7GeMTNTdDNKkkYc6Z5qdpjhERk/fxWHw24o
         rC23LbrsjPDJgqgJ2/bGWeAAH3y9NuTUaSVzx59iSmdak9RHiRjIPJtLeRBRtTZ0Sonp
         79QA==
X-Forwarded-Encrypted: i=1; AJvYcCXnlJVwLypT+GPqNDRNQJMN5ux03UNk/97inQG4Z5sLRsdAanZs4LBGhLkPwhL2KchHPbx8sQy0isjW0C+QnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YysYXqEWSeP5F1Supwf9o0FQtVa46W4e+86C4Q4NzeUn2QqFUzO
	jiHRhYXA6/5PT/ZJ0TOd8ck1K43wVxDCQRT9LcFtLntkDbruK713R9B3
X-Gm-Gg: AZuq6aL0jlOeL+RGoKz5DMxXPbe3eiSLgczFgivi72umXOsGACMWLVbKeHmTTvcLC0C
	D+jDukvi1jC/n5sq/bOZ9Me/ZLVDh1vKJ22Xemv00Ki1ZaKQ2RGqiwfSk2XSGqk86lzk08lFBTr
	/QYwHXHWNi/1wsfVzxLzwKInVyzwJNhWpU+OvgWAq9IfUIAOV3m7hdlrxQR9/YvNHfat4G2XTDf
	BWBYvalmEM5rZdl9kYHNFJBrc0CyTZOGiQ+Xm+7KC/J+wd0g8NxbHuM8NUksfYMmFeo/ncg22mA
	kM2Op7DenOvaNuc/TGqeLN6sfpylKyVUbOOFyDjcGXUpMFuVyC7T6RoXAM8GFqg0GbTKaonCuJa
	x16S4mCC0Yk7LyRHvAUaxPLCFzVatsb4W7nMc+XnhC2T5pNnZpirkmXyWwFGG6G+4dmzgUKxa/X
	U2utSRl/2O0W13b3FBfTCJtGUxk2IhBvfh0kVF5DUyQv1Ax15u9fKF
X-Received: by 2002:a05:600c:4684:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-4805cd44c41mr49205745e9.7.1769380694028;
        Sun, 25 Jan 2026 14:38:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm24336005f8f.17.2026.01.25.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:38:13 -0800 (PST)
Date: Sun, 25 Jan 2026 22:38:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] u64_stats: Allow u64_stats_add() to
 accept s64
Message-ID: <20260125223812.3a2ae148@pumpkin>
In-Reply-To: <20260125220753.3984326-2-mmyangfl@gmail.com>
References: <20260125220753.3984326-1-mmyangfl@gmail.com>
	<20260125220753.3984326-2-mmyangfl@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_143816_160590_6A4E83DE 
X-CRM114-Status: GOOD (  17.66  )
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

On Mon, 26 Jan 2026 06:07:49 +0800
David Yang <mmyangfl@gmail.com> wrote:

> The current u64_stats_add() accepts only unsigned long, which makes no
> sense as u64_stats_set() accepts u64 already, and causes unnecessary
> narrowing on 32-bit architectures.

Isn't is a chicken/egg?
A value over 2^31 could just be a very large value that needs to be added.
Where the add is being done 'just in time' so avoid overflow.

	David

> 
> Moreover, since there's no u64_stats_sub(), users may be tempted to
> reuse it for decrements, which already happened on nft_counter_reset()
> in net/netfilter/nft_counter.c .
> 
> Change to s64 to allow both positive and negative values.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  include/linux/u64_stats_sync.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/u64_stats_sync.h b/include/linux/u64_stats_sync.h
> index 457879938fc1..e77f2b30bac7 100644
> --- a/include/linux/u64_stats_sync.h
> +++ b/include/linux/u64_stats_sync.h
> @@ -84,7 +84,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
>  	local64_set(&p->v, val);
>  }
>  
> -static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
> +static inline void u64_stats_add(u64_stats_t *p, s64 val)
>  {
>  	local64_add(val, &p->v);
>  }
> @@ -125,7 +125,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
>  	p->v = val;
>  }
>  
> -static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
> +static inline void u64_stats_add(u64_stats_t *p, s64 val)
>  {
>  	p->v += val;
>  }


