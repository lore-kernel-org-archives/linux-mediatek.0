Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7326AF3D60A
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=; b=nOG3t78EWgAyyst9J7A40Fn3Nl
	ldC+MrEM17AmxII8pcstdz3LFclcGewX6X94D1HI+AzlJ1Q+Zj+kD2HyIg5rQeZ5zIvslnZU4vmxa
	sAbMe25xE/7dih12D+CH/bIb/WRcD8HpN8TfPT64xBwiIIp+YlscwufDh3lH6FKyE2RCNzd27CrP7
	wDzF5MIUMWlDI/DtvS6VP7sZcbhVd2GddPDXVt1f2wYqhWdFadU2IILMCBS6uKuUQpFiWeZW6Ojdz
	PxqONFH2/9iyjL0XRQ/0IDDdOsOhNHuLVppGHY/pQdpRGwZcTYofpBNPdUnyTzoQySdw9YAANSD9F
	YkBnONoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t1b-0000000A7J5-0vhI;
	Sun, 29 Mar 2026 16:30:07 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t1Y-0000000A7IL-1kOj
	for linux-mediatek@lists.infradead.org;
	Sun, 29 Mar 2026 16:30:05 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so3633908a34.2
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Mar 2026 09:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801803; cv=none;
        d=google.com; s=arc-20240605;
        b=d0D02i2zTqBkOqANPfYNyuNm3GjmNrV9IAIDKdi/wNVLO1G/YQ94qV3NsGR77C9FcK
         Eb4amzaYlYuKtH5T732FYtSyWT5MT2Z/0ISWnwoorxXZ4iVlfWOwtVRQK75lVbOKpa1h
         ywknE0mewgRwwCJ45I7vPi119oPama/pQ+TMrTlc3Gst78g8YWgi3wJFAWiVaH0HCtYN
         VC/U3wNwhQ1lR2JsnnA3F9KscuqflqwYan6cBmKpoxT+jQxVRU6dbrvRFRk0LtQp9LWx
         J1cphZFw18MOzCVJ+/ItIBKhVh7ZTanqQxOe3CD+CCIwl7F5M1qFZt0bfo/8WLRwu421
         Puog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=;
        fh=Rj+GNYBIb8vjs6p40wm81g+y7XzFX+yOxKoH0+eZSO0=;
        b=bwwBW4gLmFpoXhMCsOg3ivLIJc27KJ5nzqO72pkgQPatOBeF3WYpOf0oLt7JK+aXUm
         e8asHtfUEOI3r0FpiDYY3/OI+ZMHiSoqRVpy5k1onswLeLN3O6atlYKVOBL/a1m8Q557
         QSDZDjBVnoxekrrjBuFdG2szMUTlxPRmytoGBlSsWQOopNHlKzdtPUqdWsLHEwjfNtcq
         foFJNSHrNC0jqdNl1FfslfA4e+nyrh/zNDERn6PBZxo1hajNQ9I9ml8Qrkj9gU2xluVl
         cpG0k+a/7FZxbXepGDJsmEoMMaCHDK+eg/EIWxDFs73uHYrS8CTMLsvl1zK72R0HEr+r
         fEJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801803; x=1775406603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=;
        b=dPSZR/TjZ2Mde7KzNx4WujTTQaUy5tBcs7LzhxVrEhTzSGaqMDvY31gIoHug8atY7M
         PYgRx8/CY8N8pqFXAxzTXjzssZqIbYcTmB6LDCPAQ2amjjlgLXk2Nbq5JMV090jcenkm
         l1iOFbWcP5wHv/a2s8+ebpwSA0SF1DrAUAQAmir4onOEj87iJ7CoZz7lAVnKV2JxpJ8W
         9goHiDG55OCiYH0DMnO3nemRtsYpeYswErC0I6fxxLx/URkiLKbTyocoS0PxAPjqnXe8
         jjT6isdOBYX4gDLAf1rfPhY7A8x8pfgyQy8KJER/HCCvFyQU96G/96mlJ5NBGzTIVsky
         DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801803; x=1775406603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=;
        b=fpkH8gy1xpnd9T91PtCLOWXzOVaeasJM3KFlDmJy6bhFh480zoVpp1LVYy2NBlsAZs
         Gg093EXONuDWjGfWrCUJa/tZLkqRTVbXUVAfD8KLqZC/varlKQ9tnWqMD133ADiVbP5d
         jQbqifh7VEoSQOKGYQCLhT84kE0GTx8q+w8vCx08x+iWVCR/zXqVt/UkpmgUhBBjbjSc
         m85SI5RuVabbn0EQiJrGv96y3WEu9KohWD9xjRJqNKw6CZ2OHA75z/Jfv36z4AGzbKZI
         lAOJNym0NBdF/4Dp2SqemlDId9Rd8BN3VdFgGWfD97wXSi7sKvVvrrwyhJrkt6p3WxFg
         sxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOO9C3IIXBoC0LOv0kr0d2/WUdkDVpXzobtSJFmHSoWDQ0qvnrCb4egctBvAsXTGo3paVplkcoqSsmBzdzjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5hxh0pfthHEnG+flmhnYTEOeNLOU7c9mDBJkqerkxqWza6yNR
	V+kYaKuBK0h7QCYtXJel5ErrZPUU+Rw5L+YQDrriIXNmT2wsfMOK3dy7F5m6GWTf7RTmmQztCbo
	zRtsxY757pw7xhdxnQ5UaRoObUmLLCAk=
X-Gm-Gg: ATEYQzwKVyqSq8eaWIYfFxlfLXfAZyyXVtBWjGgSdWaJe1THVGMy3+n1mWRK8VuJKkV
	1qqo+s3gTSsl6yXWRO9Gw+Kmdwj8o1FjQrUknUDJyCsDUi0up92iFDQlUpgDwxmgDP0lX3ES9ZK
	VIPwKNVoqY7+QdVrnngHN4ZoXziOBLE4WUEh49VmVzW4xG0k+F2huLsIMgBAtH69/PoEZxKS7p8
	SMyirTgofQdnbY1Gio1spcjkrZM7vZBhu0aVUJnzg3peSlFYNWGP1S/GFHF8eMnwYQAoEZxrajg
	5M3KhOVk
X-Received: by 2002:a05:6820:212:b0:67e:2fbd:c363 with SMTP id
 006d021491bc7-67e2fbdcb15mr837332eaf.9.1774801803363; Sun, 29 Mar 2026
 09:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260226-vcp-v1-1-766c5877017d@gmail.com>
In-Reply-To: <20260226-vcp-v1-1-766c5877017d@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:29:51 -0500
X-Gm-Features: AQROBzBl1Ou1fhsJiwTmhLJSC1Vrfy8M5kKovqY1sGQqEd9y-J-hWzcG0L_WLfw
Message-ID: <CABb+yY0YNHSnkBegLhr-YtAOD52d+KH3ZyqKtjkvYp-=37Q61g@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-vcp-mailbox: Fix the return value in mtk_vcp_mbox_xlate()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jjian Zhou <jjian.zhou@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093004_457166_29C95C41 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, Feb 25, 2026 at 10:33=E2=80=AFAM Felix Gu <ustc.gu@gmail.com> wrote=
:
>
> The return value of mtk_vcp_mbox_xlate() is checked by IS_ERR(), so
> return NULL is incorrect and could lead to a NULL pointer dereference.
>
> Fixes: b562abd95672 ("mailbox: mediatek: Add mtk-vcp-mailbox driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/mailbox/mtk-vcp-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-=
mailbox.c
> index cedad575528f..1b291b8ea15a 100644
> --- a/drivers/mailbox/mtk-vcp-mailbox.c
> +++ b/drivers/mailbox/mtk-vcp-mailbox.c
> @@ -50,7 +50,7 @@ static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox=
_controller *mbox,
>                                             const struct of_phandle_args =
*sp)
>  {
>         if (sp->args_count)
> -               return NULL;
> +               return ERR_PTR(-EINVAL);
>
>         return &mbox->chans[0];
>  }
>
Applied to mailbox/for-next
Thanks
Jassi

