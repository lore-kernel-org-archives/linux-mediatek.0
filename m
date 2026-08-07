Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E7CC5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=; b=U6EdPAAcIqukLBE6QDxUCBT1wM
	JUKDzWgsXFYC8sm3/t1zoleVhHwqhGAKJFZYBpnpYWdUt4eyOEaC6Y24/ppmyyY0TVieze9epfy8s
	E0jdi8jREjXWwJBD2mu2TjuW4YXx6Lgn/LRPiC5PKafu8ix6ruZ6JOH68GEIwbjef5tw6s/bltddw
	AbIwvGZc5AQwrYZ8C0hdbKmJitFYig9VHubeG+A3JwnEkW47+/RB34Lz0sGNH8g0RymtOq3kKu1LU
	foE6SaEkyoJMuTxJYrNRBjYMD4+VMCYYunL1aDWjta1Gv124+JQ3WLWKQANpbSujIyicU6Nmxnbka
	xEYVsD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN9d-00000008Oxx-2Hj5;
	Fri, 07 Aug 2026 16:10:41 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN9a-00000008Owx-0pNY
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 16:10:39 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-80c5cb9a888so42797507b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 09:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786119036; cv=none;
        d=google.com; s=arc-20260327;
        b=hMrRDnglmr8upbfRW4nxwBBeuPRzTxDuj6pjEZ/ZtnhDneKR55EjCTaELPy7o1/uXW
         m39EapBcJZXfpQiJ8MKAhetYgLtHSJVocApwQpvcu4O6dd0MQEIxLaEOXpGOp1vZSNOv
         1aVqj6lhmEcwyPXccDZIXvu+KACoaMV5n9/ANKcMA+/jbGvjXyFYTwvjeiNX4Uw866Tk
         AcT96SDRfLiMvvqMw7X/fil1XAgW26PQO76SQChSckTVvkpRu95Cb4q4v2yVGlVViipL
         e2vEWPayQNLrmHPgZCfaeKccaja3fcvmI61XFrZBo+r0vJ9iUgDKTc4svbD9yiPmx+Rn
         rd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=;
        fh=fCEebuex7sZQyKYRr+8N85Q8mMbTr/7zCBPapNSHcT0=;
        b=dBYh652KHT9RuVJ0bEJBT9PsC2ZLjM8i+eG0KrMP4VaMGtFa6RQ7f13qAkR/dsmlLy
         CtS1pvnB3tUhspZEVy9T0IBoTh4Kl+QDdvgaIPQw5RtbztgK5nGygDxH4K8FXK6+q9ed
         b7huGx48/U+D9pZzJmioZ8Btz0xQ10XvrgvGLiR8nkYgeabPhEAlH8nfTZItZX9+RcdC
         B65skMD3IY22COljv6cDSbsactzuxu6So1z9bKS2Lb7yfxMsvEqGpXHCfeNUmEb5JBL8
         k5twipkku1XEEGXTIi1Dg/C87D2+zBD7kXrrmqToN5LKxIzLRdkwzrU0FiQqZ1mdz9uy
         iK6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786119036; x=1786723836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=;
        b=kGB8PAzRadVpyF+KRUAWQsiAaeSmtzMZrF9cJZvcotkTgdKwDb5Lf4t31cUuZwojXJ
         ysyQSnfP3HMSq/0HpM9HLYto8h52mB9nQJwUb7gRDVXPq6/zQPCYwruCgHEKAYELeVco
         dYkx+k/TN2OpEGx/wK8JnGnwCyf+Ou2zrtJtvW1vMtA3wrE25bIMWpQ/UepkzZ/0SDfz
         i0xEsJdgZEMRcWnYznUUlnemUn7VWCyWo8KHR139mZ36WH4Kze14ZUACeD/3s6ImcoDL
         SM14m9wJNLoaWXt/j5Z4y8u4MytmVNkPbUAZNUJxBAcD6V2F0GBUWLQMlLyoJAXnR7cF
         /KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786119036; x=1786723836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=;
        b=M/FOQxFKeqcF/ipBRYQjd390JUEztVHgj8hiP12E9tToOSaZv3+1CWXcAkq08/uIM5
         ez7YqHSfmLzQRVyUuuW9gb7bEy2pIcrQxcZ0V2VAtsXttHCtzXCro+fU4Bw2yForxn/v
         x814ZKU7yD1HyrgZB9wvfhdhy1Bhy+Aa+kzPnTYKXLViy08H0nanwAREvWCoDJZ2hosK
         NTGOGembN/xAu9hOazhgokADGxkc6iZdJbvSSkBv2JNYAXzdfjkMk7+tjxE0JCn7lv2b
         Z/8LUzQqeqTKXQd37ka5NdfFwd9kPM0pNHt3hSQqyQYOi7XnJlX2+fpBjPzy/G35/EVf
         fWrg==
X-Forwarded-Encrypted: i=1; AHgh+RrTQj0R2N9fmIVAJw+gS7O2gkf+unDBQpLnlOnoiVv2J75w8GaZPf1GTLghivSMasPrqkarNu7pwY5rRAVk1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbAajfPh1G3ww/RS7c3QTmMD+/yOkq6I6UNGXun9SR6HU91Xnk
	1pavLnnH+8ur+IxzNPus4th2tNxfB4tYqHV+afWiXIGpa2Gnxpp3Mx95g581u4KknmsykeRpCf3
	kEFai2fWGJF59zbfE3VH6REDWNCCwFwk=
X-Gm-Gg: AR+sD13b94lx/p/l8UFe8Za+RqN2j66C1ES43oQeMvvjXmgI2J6CWAjEkHLV5wXJIv+
	YAie0QPg0x14hoor74UZnGuHQ03IEhUFa7Q8/g80MIascMgFIFofAKNjihGJ3zfNEhtsYoYZ71W
	7AlLm6Clmx8xeJpBFhoiXJDYbCKSC96KxktU8BOhcgg3rqB0h9lHlmzXf7hDt5tG4MWchKKfbGb
	uPgUWqSqXLEl4hwkUOk4+jr6rWBUHgLW/0decb2gF+kih8PjTCBtOxyvOWDznP0AtFuyvohDdpb
	iFUFy9IDHC97uvbZJ9P0kTgLJx69kScX6xrX/hm2ztwhBYn1rll2EcnJT0Hn8jw4ir4668IhJmU
	PO71N0V+iRZAjxuZm4cZSJpLGi6MAq7o=
X-Received: by 2002:a05:690c:6512:b0:81e:deab:43af with SMTP id
 00721157ae682-8201f0c1456mr166289867b3.4.1786119035967; Fri, 07 Aug 2026
 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <FD5D03449312D17C+20260806-btmtksdio-deadlock-fix-v1-1-3a2d4392d117@uniontech.com>
In-Reply-To: <FD5D03449312D17C+20260806-btmtksdio-deadlock-fix-v1-1-3a2d4392d117@uniontech.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 7 Aug 2026 12:10:23 -0400
X-Gm-Features: AUfX_mwnlvEBqaHq9pVkwxhN2lM7dsClJAMMw8cY-68R6f3NS5GmuPRzCsMKyAE
Message-ID: <CABBYNZK1VKSthhfEi_BRJSX90W_c3sAqCSdsFm3Z6wXYDcWaVA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix deadlock in close and reset paths
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091038_261870_9A41C89E 
X-CRM114-Status: GOOD (  26.19  )
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

Hi ZhaoJinming,

On Thu, Aug 6, 2026 at 2:36=E2=80=AFAM ZhaoJinming <zhaojinming@uniontech.c=
om> wrote:
>
> btmtksdio_close() and btmtksdio_reset() call cancel_work_sync() on
> bdev->txrx_work while holding the sdio host lock, which is also acquired
> by btmtksdio_txrx_work().  If txrx_work is queued when close/reset runs,
> a worker thread may start it after the host lock is taken and block in
> sdio_claim_host(), while cancel_work_sync() waits for the work to
> finish.  The host lock is only released after cancel_work_sync()
> returns, so both sides wait forever, deadlocking close/reset.
>
> Fix this by releasing the sdio host lock before calling
> cancel_work_sync(), then re-acquiring it afterwards.  The interrupt is
> already disabled (sdio_release_irq() in close, C_INT_EN_CLR in reset)
> before the work is cancelled, so no new work can be scheduled and
> cancel_work_sync() fully quiesces txrx_work before the device is torn
> down.  This mirrors the pattern already used by btmtksdio_flush(),
> which cancels the work without holding the host lock.
>
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
> ---
> btmtksdio_close() and btmtksdio_reset() call cancel_work_sync() on
> bdev->txrx_work while holding the sdio host lock that
> btmtksdio_txrx_work() also acquires. If txrx_work is queued at that
> point, a worker thread can start it and block in sdio_claim_host(),
> while cancel_work_sync() waits for the work to finish and the host lock
> is only released afterwards - a deadlock.
>
> This series releases the host lock around cancel_work_sync() so the work
> can always complete, mirroring the pattern already used by
> btmtksdio_flush().
> ---
>
> ---
>  drivers/bluetooth/btmtksdio.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index c6f80c419e901e71b21e550449250a5a6755d100..879d580226d25ad398105a158=
de1545dace33718 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -746,8 +746,16 @@ static int btmtksdio_close(struct hci_dev *hdev)
>
>         sdio_release_irq(bdev->func);
>
> +       /* No new work can be scheduled after sdio_release_irq(), so canc=
el the
> +        * work outside the sdio host lock. btmtksdio_txrx_work() also cl=
aims
> +        * the host, so canceling it while holding the lock would deadloc=
k.
> +        */
> +       sdio_release_host(bdev->func);
> +
>         cancel_work_sync(&bdev->txrx_work);
>
> +       sdio_claim_host(bdev->func);
> +
>         btmtksdio_fw_pmctrl(bdev);
>
>         clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
> @@ -1293,8 +1301,18 @@ static void btmtksdio_reset(struct hci_dev *hdev)
>
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
>         skb_queue_purge(&bdev->txq);
> +
> +       /* With the interrupt disabled, the SDIO IRQ handler can no longe=
r
> +        * schedule txrx_work. Cancel the work outside the sdio host lock=
;
> +        * btmtksdio_txrx_work() also claims the host, so canceling it wh=
ile
> +        * holding the lock would deadlock.
> +        */
> +       sdio_release_host(bdev->func);
> +
>         cancel_work_sync(&bdev->txrx_work);
>
> +       sdio_claim_host(bdev->func);
> +
>         gpiod_set_value_cansleep(bdev->reset, 1);
>         msleep(100);
>         gpiod_set_value_cansleep(bdev->reset, 0);
>
> ---
> base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
> change-id: 20260806-btmtksdio-deadlock-fix-f9421f1a7879
>
> Best regards,
> --
> ZhaoJinming <zhaojinming@uniontech.com>

Sashiko found a problem:

https://sashiko.dev/#/patchset/FD5D03449312D17C%2B20260806-btmtksdio-deadlo=
ck-fix-v1-1-3a2d4392d117%40uniontech.com

--=20
Luiz Augusto von Dentz

