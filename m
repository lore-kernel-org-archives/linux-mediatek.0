Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B62CA9EBD
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2026 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=; b=j9YNvp2yNxk4OYvvrW8bdBo8NK
	b7KiTCaSD4vb+hxLmRmwxRF+v2atiZLFwQR0plSqYjftBnlf+0dDTP6TG87AF2x1y45JxiB1VMGAD
	G8X1dtHtC4EoDNtdHEDu+tqL7Xx86ISQEDs0PBldfCMLDIvFg5S99dU0tST+NjKGUWbbKQdWEWavj
	QRXCYhXSwGlZQAGJQ8TOHzPqNJyAH98sfWjO4u5QhJ0gpBUv3mq/TLnFE76JVHAPOBRQXiuGc5/G9
	SU5jZ9wm+wHhjBtGnwf7UTQrQu6iXLGoBtufqj1ZqOpDYbWDO6ryPOKh/1BjHoSP/5VuvgD9rAOHh
	UDq2aM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4y2-00000009YmS-3f1y;
	Mon, 12 Oct 2026 01:36:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4y0-00000009Ylj-0BLn
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Oct 2026 01:36:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2093029a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 18:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768998; cv=none;
        d=google.com; s=arc-20260327;
        b=j0hNEA6ev5ENPDTD7G3dm4xzPJ3NUUO5BeKp2Ix+vRXyK094aqFp1DQS8B8BS+s/iU
         VzfR2MgtRH78UtwEt7mSdh4pPV3HqCpbIpNv4gXaFd/8a1xnZMW0hVlB/BReoMwrXxlU
         1s92o5ua/0OtgWThuB1Qikjhq7QoKu8dibScmOTGKGAy5mHUwvs2/SJYUk1qoybYujjo
         a9v1leccaN13G+Q6GM55ZKqppwhdGkhlPNo/dVk+wypAGe/4Cs8ClG24TNUdGO24e0l1
         obFmxG3ocVvUSJ8hQvlpYTv8WKNw5IDoWesk6u79+BP8LoJ+bdtvK9E2QjPn5iMclLqi
         N7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        fh=+M00VWIJdJGYo0nVi0RL1nrkBqtMCA0PMepg8Q856bE=;
        b=c4D2aFtcvbVPkP+vOsr3dh1x5QxFgNhuwM79Y4DPbICv1+Y0WHNFIRGaj2OhznTstq
         EHYTlu0LilJSBqpZuqec+An4Ti9FXZP5Ov3XPw7vk+Tf2SW5xB35ni809P2fjbqTfoIQ
         yhOaso3njJbu1yXXc434EaAh81MNap7CQ5PVWHatNIm0kQj1ELrKsps9Vd44wGUO07qR
         456GGhMEQaKiExPoeHUsYN5vbu3LqeKzMvVIYQsKhKvPv88nN/chymv4deF+lViDoB4z
         5FFqlfq6pFNTVuTQsBOIhWlnsjfROWH7Gqlp9fidbFC2GCgt7c2FgmzhXc+oLCnEIQKP
         tPJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768998; x=1792373798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        b=pJsq8GtWeYu2NEziHIUA1HwV5tzfbqJWay+77ZJux2SN1dyEw0Z8VvrsqTVVwyCj/Z
         //OMAzgNGruj++ryspncdb6CIWj1ZJJk9I097uCOXqfGBhsamKNqX5DliMn7Wz9dkMUq
         pgY8AsUXJsv/gSyzg2ltFhJPE39qg4HR7QNwvAhCHShGhDKr/sBbMRviz75/UiCbZS3o
         PBCoSpvfyS0R35vSDp4Hsczi+hI58zNl1z1XCflHosPDBdkOMViRbDXqfd/oBE60/l62
         gXQzMb4JEQpRInI2i45wN2+6JgvWZIxl+0qTXM9hAzEq+4qMP6kSc6FRFhTxYzhhEbTq
         dNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768998; x=1792373798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        b=Qb9laA8IZGTI9FdNum1pZ6ipTx9NAasHm8ufXU7CyETKr4rsCqHpdzry/alSn+PGp8
         IxAflkyUdmc+cTLIFV89LNNrxSrng6pSXcDZ0b1ESojWWEpt1IC9hhM1Qz+G0oGmgM02
         /fRwrPbHI+pJl5l0hkTs75s7wgpefGNo0+ZcybUNxXhjs+ktEba8qIecwCf3dwquXcg5
         oMm7MTYoLaFM1TO4MZmyfeukGdSDUuZy8GLupLgozxaVBzykYkbkLwfZv+3g7C8XMsKh
         gzLhvSe0DkBuxBfjpO6U7lyUcHE+HoE5YqHv7pYrfl12dWkRFQ9wb4vTTE5UMlCxPphl
         MbWQ==
X-Forwarded-Encrypted: i=1; AKwUvByB9nJmlIZAY1xD+Ci4id33MJsjeNHAjhs6zzGi0fMwpbGBXudSYWbsqIw/rmYIkRuvcwCXPs/uQT0tdaa0VA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKWvxklmyFII+XCER9lpQhtAIyrd57F8W8ToLQQjfRjmeu/bBuw
	RImkqqae8SavRUQFU8AdUCTa3M3Z4yUBL6Fvub+b7xg09N0qRVtKAJpccg2tx5B0muZjMSWe7sY
	XmaN7Ra1HsExXm5DIzYqJ1pdQJb0dnbk=
X-Gm-Gg: AYBFou1wCu7J2dHOfeFc3vbA7Dpj40z8LWdKz6ZfewKpHdCGmSUJqGCMzXx4AwcPqZ7
	dXlIdNS7X03GerIM5Lhw4b/wpJEtD5rzafmvVSeiS6yXcpwGMYe0eX+7HjhQSjt7c/LiOZF+SVk
	nEv6VFmSIzTIVuUayBkFNZTgUbb+OhuRFDTgYoQHsQO+QrI1jIsnmjLh1Os+hsLZHZWgUBpnviC
	f8mTL4mwz5y5LZN6tVUdl8X/76iDUZh0P7iaTGiVdCzqahFJwzoQBuH+Q1XXVbgezo99ebvCBxA
	xfSITDFa74cajBJ8vPYWH7EK7gTXj2y7lD5VPn2ItKL+fCob2rfe7Vxm
X-Received: by 2002:a05:6402:4512:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b17c26e26cmr7148152a12.30.1791768997999; Sun, 11 Oct 2026
 18:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260917093923.2145007-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917093923.2145007-1-vulab@iscas.ac.cn>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:36:24 -0500
X-Gm-Features: AclHuK8Xsk6vNaWsbsfsc6m-jN-PLUBFBJUyFrXzBO7nFbW8E4MZEEKbb4KwlQY
Message-ID: <CABb+yY2ZnisPFR1mXU-E-KEa6SWz2pKicYMeo13PCeHwpW6oAg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix runtime PM leak in cmdq_mbox_flush()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, bibby.hsieh@mediatek.com, 
	ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_183640_092653_C0B23D76 
X-CRM114-Status: GOOD (  17.72  )
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

On Thu, Sep 17, 2026 at 4:39=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented
> even when it fails, but cmdq_mbox_flush() returns the error without
> dropping it.  The same happens when the GCE thread does not drain in
> time and the function bails out with -EFAULT.
>
> Undo the reference on both error paths.
>
> Fixes: b0524f7c9635 ("mailbox: mediatek: implement flush function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index eadd340f8fee..07a8c2382c93 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -565,8 +565,10 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, u=
nsigned long timeout)
>         int ret;
>
>         ret =3D pm_runtime_get_sync(cmdq->mbox.dev);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(cmdq->mbox.dev);
>                 return ret;
> +       }
>
>         spin_lock_irqsave(&thread->chan->lock, flags);
>         if (list_empty(&thread->task_busy_list))
> @@ -603,6 +605,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, un=
signed long timeout)
>                 dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x don=
e\n",
>                         (u32)(thread->base - cmdq->base));
>
> +               pm_runtime_mark_last_busy(cmdq->mbox.dev);
> +               pm_runtime_put_autosuspend(cmdq->mbox.dev);
> +
>                 return -EFAULT;
>         }
>         pm_runtime_mark_last_busy(cmdq->mbox.dev);
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi

