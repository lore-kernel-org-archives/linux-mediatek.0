Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CB7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 01:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWwfWgOHC52NXqc7ka8cE8dq+XUBNrqekli5EaplpgA=; b=DcXkYQaefwqgk+
	MaghlSb5M6LFSUFf1KgOZ00bci9jfMEcJtgcvb/rsNkS9YHNfAHc8szDjXhWZ9yWINms8yPySVKB1
	n5C84QLHbXSqrmOf8bh4ocxD7mKhtZrWuYiIKBV6X95nY8o3W5p+ubPWEdqCctwN2mRK/OGk34/9g
	2UmxO6HRRR1BGIJvBywXniHEJ030/b8Ejz+es9iqss1evfRobbLKcg9/BCSybhJYsGDxRG/xd+iyY
	KrLKwoRWe7J00AVfGa7gPEY/Tggn3CmbKe5T5T82oO5oeB3cvcnHy0jjUMkJSIuR8FDPykORGiu/9
	EbeByjLVQRV9YHwDGWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPDi6-000yhF-LF; Wed, 02 Mar 2022 01:23:22 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPDhv-000ydu-57
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 01:23:12 +0000
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2dbc48104beso1095687b3.5
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 17:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZafyWrCRm6FANBOmjYAs3BX8tOsbMPnovvLplgzFND4=;
 b=cK/CT4+cjNdaqB/bq6onYRvRuaBZiEQDxJZG3nZzbEWSoC22iV0dPOwDBcGV9HX56D
 ND6Dj+1FAVJ3cyJqxC6tzp37/UegCdsU6f3uc8/xmd7dASF2LgPnKUagTPDKHP/8NHNt
 3BARM+d3uKUnKHohwayXHbVwzBTXlm1BpUQrQt3KRLGma2vsLHEwWwMc85X7sJMUZ7T1
 V94yzxg+1k1xKAlHHYEtYsLFkXDyZTJIaESXgLOgP0zOsJPOttKrGFC1hJafHCDD+vB1
 TbO/XqsMj+UevbYicLmvXG93/GnrSdajRVKMNZ2RI/vhaedDbO3UM1TeVmiVun/eh8fs
 RnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZafyWrCRm6FANBOmjYAs3BX8tOsbMPnovvLplgzFND4=;
 b=1sM+shLOW31yijcGM6f+XCII/Gl4vPaWIbKfNps+2nwbCn4UZLvavIX8SNx1kaPKmd
 aD1u/OoqKd2pWtP0VCIT9W+Gz0SqkEN4cObdpbOr/EqRLrYYGjeCccLrLwUPnkp2tbkB
 xSojLDwaPR26bUjGfO1lXgvQ901OACphZRyBTkPah9EZzfCUCPpdpWRYxaLIFIrrsmBf
 +cexAWY5ImOFK2bqlR2gYZx6IaIv8VmRol3kdVwvEV92XEtSUwCssUKoM2Etfj09s3Kh
 kLL5WybfQKb0hmaatpE/lST68RzylLIa0KTYqgR9lySfWGd88y8/Ct7uTYQrIc97Jzkf
 TA5g==
X-Gm-Message-State: AOAM531oL5kuFmykcAT0bWoRMCKc5MFORlqyAr93cywediwPx62QcPnL
 UPBp2CE9ISCzRLA9SISN3lwo4sCmAJ8bgs7uubxORg==
X-Google-Smtp-Source: ABdhPJwu8VhHKIziIJ82Xtt68TP37xWYiasNx7hKoh62sy8WoW2FuyExQ5/AfbTQOYpOaJf6aCN7/8GJjrix3c7mR9Q=
X-Received: by 2002:a81:6a0a:0:b0:2d0:c144:4be4 with SMTP id
 f10-20020a816a0a000000b002d0c1444be4mr28608461ywc.332.1646184185795; Tue, 01
 Mar 2022 17:23:05 -0800 (PST)
MIME-Version: 1.0
References: <1646133431-8948-1-git-send-email-lena.wang@mediatek.com>
In-Reply-To: <1646133431-8948-1-git-send-email-lena.wang@mediatek.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 1 Mar 2022 17:22:54 -0800
Message-ID: <CANn89iLZUWpFC-kAfEbNwh4GDKM+975e_VugmWWT2DNK5K2mAQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: fix up skbs delta_truesize in UDP GRO
 frag_list
To: lena wang <lena.wang@mediatek.com>
Cc: Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
 Dongseok Yi <dseok.yi@samsung.com>, wsd_upstream@mediatek.com, 
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_172311_220616_442D3AE0 
X-CRM114-Status: GOOD (  12.99  )
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

On Tue, Mar 1, 2022 at 3:23 AM lena wang <lena.wang@mediatek.com> wrote:
>
> The truesize for a UDP GRO packet is added by main skb and skbs in main
> skb's frag_list:
> skb_gro_receive_list
>         p->truesize += skb->truesize;
>
>
>
> Fixes: 53475c5dd856 ("net: fix use-after-free when UDP GRO with shared fraglist")
> Signed-off-by: lena wang <lena.wang@mediatek.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---
> change since v1:
> 1) add the fix tag.
> 2) add net subtree to the subject
> ---
> ---
>  net/core/skbuff.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
