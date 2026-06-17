Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F7CD98E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 03:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gix0nvCYK1OhR2Kcuql53IhC6b91d4kE/6Woyx2T6JY=; b=cIeBIUrkwokyfXpUrEhg70eveO
	G1y71iyKbmztIeQ/bK3Nb20drPxwmfN6hxUW6SU7q34kodwid22UX1BYQ7MIwKs4elZD6hoI+TSrD
	hcubBIdcbPDfsI8WfmrO2voNTItpWxy1sBZN1yekjaIZdVxUnCa8xhZRF4vRhnu4CmWWg90hjdjYf
	CE2rbL7e/Kj/hDpRNl0lfQT9lBY4RmTmOBvDkj1w5yahA4tyXM/H6+4o6UMiOPozliYDloeSjYJDI
	4CK9DFooaSBBSwiMlomf0SpM2w6eqUU26mfcHf5BXri2mYAovCocCjoZuPes9qrfHLYfkyGBI9VBU
	wAPAYC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh9X-0000000GZEp-1QNa;
	Wed, 17 Jun 2026 03:41:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh9V-0000000GZE2-1xZL
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 03:41:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37cae11ba85so236952a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 20:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781667680; x=1782272480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gix0nvCYK1OhR2Kcuql53IhC6b91d4kE/6Woyx2T6JY=;
        b=Tn4xATAJYmWCqB/nue4djO2i/1PzNtL3I7IUdRJxZ1LjR2gKHcSfQAIwc51vzkuO0N
         2zqPyLJ/WB6ViIlHZMac2g6SsKP5c4sirPu82ISWi7JBhL+2u1qFjF5zK9GWnfspDeq9
         8EsRO4v/H9MNSjUNdpN0Vfk3MfhJw92XQC1cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781667680; x=1782272480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gix0nvCYK1OhR2Kcuql53IhC6b91d4kE/6Woyx2T6JY=;
        b=XQDEQKWRFJLWhEyQrUhV8Q9Mmv+HT3/QPDyuRyQNo2cWfN+2Tw0khpYjlsKh5gb7WT
         LmRfPg5aEUIB9Yix5tA3sWNcPATnVLD23wA4gOTJlj/MhBIh9QgVS0Lp/BTMoCSle2jI
         mHcZlR91+8RfclsmfMCsixAf3N5ZObixo1BGLrx2TDXDSq258rj0fCkba6jwynjgCmug
         fCQyYzpQtzjoLAl8Xs8cL8pCq8osQbKcsyVkAEeRMBRCNvGvPVrfOUOwTyenWtmfgNTI
         5iXc5wJrAuhHUluIIOwhrSDqJLEgB2/SxJh3L+HqewbVixbBxzompr9Zu5v9z+CeJp89
         4kew==
X-Forwarded-Encrypted: i=1; AFNElJ9HaEltNbwik4to1vf1V0rb3MYs7wMemDm+WYUrrqMwWtp8gLpAOO4U2q3LM/zX6E2kpRO5Y+du4ZcluVPp1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj5nPt8/sNVVeJvcRHuJH6LKMHD7oKch34ePjqWtBRSPVKNRrJ
	d6umjHBJ9Ps/T7qw7DntRZRZWfBuF5rECKLRBdumKpSaW7OhHzea3UOUfylEBO6qVA==
X-Gm-Gg: AfdE7cmGtOfawVEYeBgwqwZ8bCUiHsDmeaRUSXZKFvC0msrv5RrrKtIAiDCT+pgrJ+E
	fLcqJc8rECtrJx/F9GojQhHCAB+S3x9tfh+VKPgmgOkrVGyisJUfvtZPLvEbYT0/LLNWSzdTFB6
	GkTmz5e7UX52zTGNl4HRjAiPrh9KoU7n3GSCQtk6iJeUwTLSb3/VbjzRcJJWA4m0xM7RWf0hTth
	aBum0TuOeygcZ2Feo+8DsBeWyXqrWHaxnftW7ufLjzsPksYjoli8uUD9+RgDSHRVrl4j9rmf5ku
	md1lULCl6addGk+FRgf6GF1KPuAZCs25zY15Evcd+C5jKEhyJU14Ucs0t2VIIe1/py9WzAmTvSJ
	/j8gc1qLeAaajim07+vaCyWNLY1c+mXEQUrFoyJl6zWy3BBqU8DCQm6IGep5jSHkHNHJjTc00dv
	qchQQ6dXn+myRf/9+fdcEgMlOiWQvQXKamW5HtYw+OF7qFNffq7M4=
X-Received: by 2002:a17:90b:5107:b0:36a:a16b:5f65 with SMTP id 98e67ed59e1d1-37c9372863cmr2233719a91.11.1781667680584;
        Tue, 16 Jun 2026 20:41:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm4513705a91.5.2026.06.16.20.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 20:41:20 -0700 (PDT)
Date: Wed, 17 Jun 2026 12:41:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Bluetooth: btmtksdio: call cancel_work_sync()
 outside of host lock scope
Message-ID: <ajIWAC9b_l6Id_6A@google.com>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
 <20260616111224.152140-4-senozhatsky@chromium.org>
 <CAGp9LzqT4knwk9hONu43cGDr005Phs3xw6T+YexXa3X6JEBOpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp9LzqT4knwk9hONu43cGDr005Phs3xw6T+YexXa3X6JEBOpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_204121_513508_F453DA95 
X-CRM114-Status: GOOD (  14.93  )
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

On (26/06/16 19:56), Sean Wang wrote:
> The patch looks good to me. Inspired by your patch,
> do you think should we add another patch to keep txrx_work out of the
> reset window by rejecting TX during reset,
> ignoring reset-time interrupts, and making queued workers exit early?

I honestly don't know, it's hard for to me judge as I'm not all that
familiar with the code.  To make things more complex, I don't think we
see any crashes on reset path.  My personal preference maybe would be
to keep things the way they are?

> Some code like:
> 
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -567,6 +567,8 @@ static void btmtksdio_txrx_work(struct work_struct *work)
>         pm_runtime_get_sync(bdev->dev);
> 
>         sdio_claim_host(bdev->func);
> +       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
> +               goto out;

A nit: I think you can test_bit() outside of host lock scope.
Other than that I'm afraid I cannot be of much help here.

>         /* Disable interrupt */
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
> @@ -628,6 +630,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
>             !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
>                 sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
> 
> +out:
>         sdio_release_host(bdev->func);
> 
>         pm_runtime_put_autosuspend(bdev->dev);
> @@ -646,6 +649,9 @@ static void btmtksdio_interrupt(struct sdio_func *func)
>         /* Disable interrupt */
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
> 
> +       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
> +               return;
> +
>         schedule_work(&bdev->txrx_work);
>  }
> 
> @@ -1250,6 +1256,9 @@ static int btmtksdio_send_frame(struct hci_dev
> *hdev, struct sk_buff *skb)
>  {
>         struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
> 
> +       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
> +               return -EBUSY;
> +
>         switch (hci_skb_pkt_type(skb)) {
>         case HCI_COMMAND_PKT:
>                 hdev->stat.cmd_tx++;

