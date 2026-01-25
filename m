Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB8D7237C
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5wfJAo9SBLVU6wNmnYh+V5LIeGoq+TArwEbDi1cTkk=; b=wL7FA5FiSyGLMipIsGDWG+Fqvz
	LSPsIU66uBixta6f5T3AKIXUfy0B09CK18meAxNMNojVBFNL9MUotAzLcLEk6oAwUepZGB8ZXOfJA
	oGQ9U9f1XyYa+g/OC+HPV91U7+I1QYBt6cP06GA9wQuWeTqQoqWWRs4oUSyHewollAxW0rHgFUcxV
	zimZS3z6EkVlAkSrYu3sk0OTQdmIO0pAPjiMhA0IJ94LZvwHCTTtyiWX03I2+2O6kb24ODT/6DfPn
	BVb1VXD1KmYlNLxqYN4GzrIx87ksYtFm+4MlfLQxNXABrARkGxCAyQ1NyShqYTjgI9AZMzebUk5er
	sWGXm6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8hF-0000000BaXS-3ZZG;
	Sun, 25 Jan 2026 22:35:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8hC-0000000BaWG-3kkO
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Jan 2026 22:35:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so22222755e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Jan 2026 14:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769380500; x=1769985300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5wfJAo9SBLVU6wNmnYh+V5LIeGoq+TArwEbDi1cTkk=;
        b=JXwOwYZgNt5JAht6kTKg6ZM05mf+YuGuFH4Lkn8x92DB2duFShE1u+a2K2U0AtNfEm
         hxmJIjMNH1t36WmEz2/7iWjBwX8VQVvtILQ8p4htibG/0ND9Jj5yVYqjPoee8ct8jRsl
         jIS6uAKil4h6tKb8EemdlyfEABh5i77ZQfWSEwL4u2nK4iPXS4nZcXUDvxKqinKmObYX
         iucccX/ezJaARLCEbWmwF57nhXhA9njAXziFyi4BOe0CUIA4V3TH6p8tMgh8SKgr0VmH
         ayBUpnTwJrk/mbDxJK7+xFLXzxWi2kOxgTKkRWMYYfKasCchxNCzSdHcwCIHyGzn/sch
         ug6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769380500; x=1769985300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5wfJAo9SBLVU6wNmnYh+V5LIeGoq+TArwEbDi1cTkk=;
        b=M1lTouJYzM8KjuFH6+DPlwGS2bYFRtQTKbblhUAkG7p1+AbnvHyloiXvfyq74IhfVx
         BkwELwv+5J9ebDx6V1+X7LZ4rm6CndfiKCpkNodU7TAwPQNhMyO3CFpxrYhtrsa4UWsU
         W9vxxp/+hCkazURLtjOLe2RPg4ANvr7bhHtHug2BvGnHtcRcZvRnZu+07zG16YNNjO0j
         cQesy0BlLOhjnzqJoGFEQmISbWTm7GZvD7wstvnI6fR3EfErrYo/HozWkQzhHe1iWM3x
         4zuwvHSx2vTHd1abEb+eSU/8GwbgOr2dL6TpDyihbx9FVwJNwM2mDcxFaiUTmMFVb2G2
         QKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQvU1St4wKUxIiSrS3pJa0X5t2KYg9nTEe+uJBLWsXd3xuXkxj4gCHg26XiDhuig2A7/D6dtwCGtFRklmIaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/OWflF3H+HLgPdVmZXMjdAO4/kjj+EMX+EBfAAR7T6wrOGSy
	oohjVvrDByNVUoj+ndxMkeli3R/lS00n3FLUIysDD/sKTzdgNI+N7zWz
X-Gm-Gg: AZuq6aIKIdz/NBlX+26UXW2nXpYhCatuh7KLdz0fFDUlqu1NoCySIIo4jsO8IkofHMu
	RHFrnqVxXlPlku3ql9o4SXifYqKrjC0Ur/bssTvIwIfHr0yGf2F0boibb1FP9q5wpgaXASpo5uJ
	vuraCOqJylMnASwlADVCpqOO9oUNfQ4o4ctoot5AndZTVqDLR+VVYj2HONPgJ9G7k8FYi2qr3hK
	clpMvsiUXaYPVvKjk376n+3z4EJ3x+RRBbSTbYkzXSHS5Ei+MU7MZ7Nz2xoXw7jkOKPO3xUccDZ
	1TPP8KYIsWcZ6J7B4hKtYFYRCZMeXjmJ8DgEzKfoShO0W7h6Un4X1eKcLM7a+6q8CHGRtqH9Hod
	JSdw6PYJ5aA5qGhNb9HyONL51kjtEqCF8QGNodHGtg1Jaw/8WvYDG78/l6bhInlQMcgQRwHyWV1
	qEoaH/l+rvQAtV6nQJ1Se1OF2EfL40nSvHe6SF1xoaAXD1Sali6lj3
X-Received: by 2002:a05:600c:4e4a:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-4805cd40fcfmr49219325e9.6.1769380500182;
        Sun, 25 Jan 2026 14:35:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm277706295e9.11.2026.01.25.14.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:34:59 -0800 (PST)
Date: Sun, 25 Jan 2026 22:34:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Use u64_stats_t with
 u64_stats_sync properly
Message-ID: <20260125223455.31fd7a93@pumpkin>
In-Reply-To: <20260122185255.2761568-1-mmyangfl@gmail.com>
References: <20260122185255.2761568-1-mmyangfl@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_143503_004583_7A99BF49 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, 23 Jan 2026 02:52:51 +0800
David Yang <mmyangfl@gmail.com> wrote:

> On 64bit arches, struct u64_stats_sync is empty and provides no help
> against load/store tearing. Convert to u64_stats_t to ensure atomic
> operations.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 136 +++++++++++------------
>  drivers/net/ethernet/airoha/airoha_eth.h |  34 +++---
>  2 files changed, 85 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 62bcbbbe2a95..6ed220e5a094 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
>  
>  	/* TX */
>  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> -	port->stats.tx_ok_pkts += ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);
>  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> -	port->stats.tx_ok_pkts += val;
> +	u64_stats_add(&port->stats.tx_ok_pkts, val);

Wouldn't that be better written as:
	u64 val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
	val = val << 32 + airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
	port->stats.tx_ok_pkts += val;
(Assuming there something has stopped the hardware increment the register
between the two accesses, and there is an associated atomic zero.)

Otherwise you are generating 'tearing' on 64bit systems by adding the high
and low halves separately - regardless of how the stats are read.
I think that works for 32bit as well.

Making the code completely unreadable with 'special' types and 'special'
copy routines really doesn't seem worth while.
The compiler won't generate code that does 'data tearing' for aligned word
accesses, and even if it did nothing would really break.
The most you want is a memcpy_in_words() function that guarantees to use
'word' size tranfsers for aligned buffers - and is probably an alias for
normal memcpy() on all current systems.

OTOH data tearing can be seen for 64 bit adds on 32bit systems.

It is worth nothing that on 32bits the 'packet count' and 'byte count'
increments get seen as a pair, this doesn't happen on 64bit - one happens
before the other.

	David




