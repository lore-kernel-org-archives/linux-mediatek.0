Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D535D6AAF7
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2026 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=; b=Rttebpv//RtNoap/hc+mwmoi6B
	xKtLRY6vXHgFBx8cP3sqAbwyP2gaox5RVkTQDepS4nvv4MwqCqhSKJjWz09SlthnsIX8laDwk5qz1
	E+vmyLxtsFLw68ADJop5kj6hqUWDnNPLN998/uVHUH7SozdQ6GcHRu5HywAZM4sgTnmIl3VOrMNdX
	R/7SPphb4GC3TiXKF696i3ij+jcalKxKF9hXgv4Bmx9Ciy6RsP/aSQu7nol2RaxovY2wX92jY64re
	zAGzozHmyrA4YC+GNM0HezfjexgtHXeNWs6H1OhOE/9CbYpcyxiJ7PHpCU5rf4fQtD1/CeVVNO57f
	ZiM3PMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MKZ-00000000cji-2VQf;
	Thu, 02 Apr 2026 17:59:47 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MKX-00000000cj2-2lUN
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Apr 2026 17:59:46 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-467e044082dso380751b6e.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2026 10:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775152784; cv=none;
        d=google.com; s=arc-20240605;
        b=YmBrKnpYjrkN3l6MEBKQ1JCRk7hKwrJvTck22ETX9nGiL6LCm9DlIYFLjL9XinHGCu
         B6brz9jrVIau3dj+9X2R6bVJapDOZK72jKBNalTOpHJ/FgxSLDHa/UUuSUokM/BKqrbh
         7dEabwaC1bH676gEJq0Ar00F+fwS4k5kcJJG6b9wpfViVdGU2HEnQu+xTK+ON9lX5S5X
         Z8ViMbWM3bWcdCFDbWGPflY3xYQb8NF5Xfo1H2sM18QnQVu/K56NzBZsMXceEHjgdOAq
         yciFy382F0Qz6a/ONSdiklSZRNic+hgkpUaOoMeKXEhqGjKvKQ8UJfdSu4djZiY35Pxm
         rx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        fh=aMfk4sbcRKMVB/M8XwOB1qAasNj1CiJIb9X2Qwc/Bd4=;
        b=N5s6os6BuV2VAjkVn+pFg6sNaiJwuI2Dr7zQaM5fHMsWYwZgqEk8CJAM64p03CLKC/
         R5Hvy7aX8oZUN9Kzw1ZEFP0Ar9xO2j4LB75RWpUsBYx5Qjf2KC1oNfL8os01ZywMCcqj
         MEdvAoe4dTploxwfJpBydhjoiYR1xZWzHnsi7tBARx0nwB1PUMxg75BMhU0TNhyMpory
         Ul9a3blk3mHi3r558LbRC6RbCizhWe5Q2bMWpOXiU40RsAgT0r5N/mkcM+VLjX9wWflS
         7l9/d5dsxQVejp+IbAWlR8aal2VMsuG94fhiJE7nc0sy14oZYx2KZGS3Y3zvFeDh+DE0
         Uhfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152784; x=1775757584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        b=mDGFBLVDyMCTFjKlGcLPcmOiZk8LWI/FOeXwTEMjFQuXb96ajxQgx/biWNR0Ib30Gz
         11qw6M0OdZgYWJU/lLgPAkdslEN7Q6aYXZQMwswi7zH3ER2W6KZHaptnsuw2y2iSSb2W
         COGO+uwAKFE2eE5jNrbk5euwymihDs2dNDY99hsXi+DCfKtk5Tcm6v/eeN5dLTGYdbHz
         2pfmHJnoqV95Wz1/nSpyNomjgp77FHS8pAHv7h3UagfGcI3NPVzH5MKd1LA/nKnJK+PJ
         gWT9c6Af9rq+DAtOq1VUFzc+sWGpHtyBA3zOp6TWen7ILU13Cn0L36rUsWWI2LEYxyf3
         o3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152784; x=1775757584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        b=gTRY/snvnMnelmtqvK0dPuT38/D5+ISo6m+7adpdyvHYqNNGSsgNqzCh2RVmSerqtY
         WMJLfIgLtWaMOvPRzWwfPRpgnWGuOZEGZPKvrzXl1TF0mYui8ro0F/G7SdMinBhd3tiK
         y3fxoZ91H7TBQ7esyYXCWYYBI5bDe0/+0bTMJY+uz2TRAGiwzHbnHQFvEmw1EzOwEXdy
         LJRAfGZRGLbJjlBLOIFi0YAq0szTLYp974ukgxq94VnnioCYcRw+yCCkw5A5VQ5FAmSk
         05X6YkMOQneOluojJ9BB4G79AEsLwzGz4mj6rV+7qTh75Svg0lCr4GBEiDSsiPSiGASI
         Qxiw==
X-Forwarded-Encrypted: i=1; AJvYcCUAAGg+xB/Lq5qPGFpxubaV7QGFLTMesxl6qzmHjEzbzfiFo+oI25pW7oghyXRBSNTuRxtoY+ynFUlQoS0WPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHx72/RVTOJ2+mCI5drOoDIwT3h/61iBb/L4lzvV+54Cdx8Hiu
	zZey98s1R3OWadrSWIBhq9rMT7LC9V7C7gFazuRE51+cYfrBx3zL2nf9nyZL9aaEM+hdmmnpA8s
	8wcJqXQNjGlvGW4YYT164WZhBoc1l81U=
X-Gm-Gg: ATEYQzyxO51BsmlOGilrcGfc5PanFmMcK6ndPIS2ZJn3gRhhnYYXVG2O01WpVkgXYkQ
	BJLszyDSv/AA8CmCtt0FzAyU5SU+HlJhUqcwliK5fp+zqaQKqqa10919XskcMme2qX/NWUqNED9
	NxXYL8oMsjdxeQdWL+r1AlA9tImqg2Jr36gqohx+kQn/cLU89D/kCOQeUItKGEAoYdQ6UQkWsAm
	4P6RS8Qpk6l+0VpRshdKtFC0YZ3SUDfhCknKlo1zEftN8TOMsynKIilaaA/4+/LXl/BiEDbhO+n
	2E7JTMbh
X-Received: by 2002:a05:6808:d47:b0:450:bbed:7a75 with SMTP id
 5614622812f47-46ef7309386mr165326b6e.28.1775152783969; Thu, 02 Apr 2026
 10:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com> <20260402170641.2082547-2-joonwonkang@google.com>
In-Reply-To: <20260402170641.2082547-2-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Apr 2026 12:59:32 -0500
X-Gm-Features: AQROBzAmx7Mp6DrgKOrwAcb8k8UUyDzlYzRN_6Wdz-72pTbSanHYGSjh0AuoTJQ
Message-ID: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105945_694731_60DBBE7F 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> Previously, a sender thread in mbox_send_message() could be woken up at
> a wrong time in blocking mode. It is because there was only a single
> completion for a channel whereas messages from multiple threads could be
> sent in any order; since the shared completion could be signalled in any
> order, it could wake up a wrong sender thread.
>
> This commit resolves the false wake-up issue with the following changes:
> - Completions are created just as many as the number of concurrent sender
>   threads
> - A completion is created on a sender thread's stack
> - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
>   its target completion
> - tx_tick() signals the completion of the currently active slot of the
>   message queue
>
I think I reviewed it already or is this happening on
one-channel-one-client usage? Because mailbox api does not support
channels shared among multiple clients.

Thanks
Jassi

