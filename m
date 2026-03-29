Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765EF3D60A
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2026 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=; b=Ie+gza5KnT2pAU
	CGuLjkvZvD+A3jTe1OUAB+XDknTBcYq3U7oG78QqmoQnb81ORqdxW2xfbEcj1vd0Zo51TOQ9KBCr2
	MsD401RvpMU28vj9vWpZKi/y5j7Tt0GhqsWxZ9iSpV26wCQjtxjyi9NuTCGcp52JyQHF3jqkVsGPq
	DvQunELviSlwNY3K8yONlLD6S8WmhLZFAoAFhOIajZBmbxmaX4rwTblgSHAXZsdumWZ9hIg/qNmY9
	Gh+FTiKIH6aqtxaNI7LqjjStjT6bY5x+x+fwrKdCyXBhA/SSCn/DqoAIff+kdq0trCKj3MJKp0K5g
	LN81sPp4Q77L2yVWIF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6scC-0000000A5aD-2KRK;
	Sun, 29 Mar 2026 16:03:52 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sc9-0000000A5ZJ-0Bjl
	for linux-mediatek@lists.infradead.org;
	Sun, 29 Mar 2026 16:03:50 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d744d9acbeso1479143a34.1
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Mar 2026 09:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774800227; cv=none;
        d=google.com; s=arc-20240605;
        b=YuvT9EF0LpqKpIaaAvo2bm7ciQVG1seKYZ0yf6JKMrwNJZBf3qh7kYZb8Rm6+R9SRP
         mhaZzPZnSbqbHrYlmDqze460Tfjv/VTHKf1sYS3v2ydKFowrItOePMrMNVnW5i2ahLsq
         mwMJCFqmHIY9eHkrX9HHqqFToASC1FRBsMZDZYIoG8AcMV8MGsRm6S/RNYuN26uZpNve
         0XHVGdlCmmCIxwHg1pP6qilifF7McVeOpRyH1/bI2n6OvwZ93Kxjr/EvATumg3IuEjsq
         kXR2gGzcD8bqLmNYB+DiWTra+Y9Tf7omY5nt9R4anhSgi1LO0AdrBTA76jhvbkIbPODs
         jXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        fh=rGT0MZGIO3yCFrfO5GCcysX4JBlmAecAgE/bcScWAyY=;
        b=g1z+x1BFTOGnaFNt5TcsyY5QsEr1PJ1Gdog8UE5xPqeXNEqqalduhzApn5v5wsSq6M
         KroJgtKAmJnhBc2uHBn8qMYvV+SIiJ0A2U4eItSwtPafGgFIeCnB4nD8iIGPWCK8lKdd
         BUqr/4nIO8X/1K4tWSn8zNTs1KofhdNNx7eghGyz5ChImSHQf82ROuioa0A7joX80vyC
         9vmQNFSAl/VnH1dvyfywP6Npk4iuj+Q3Kdi2mRcIvYD9/SJ4SWZG4PZrueR4vV0HgKd3
         rxmsTvLed9cxhoiAQM4kHuL92ybDSvB9Tg2OYmwbiZHYJxK+k/7S9joeCuwFWIl0uICe
         96gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800227; x=1775405027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        b=hmuuR7TiJdGZqATGtQRKQMKBgg7OkaveSd8HWVs9wLmQZLPRuSlWhwzsySJzGE4QQv
         p8HpP0E5YltjiegxH5EI64lBJXnU7rFmJNvUfK7JHl0Qa1QdMeWLEL3ajZC00Mmm36hW
         mA4hNcHh8+vLn0CkNn5WstYgMfUK9z9R7qwHBI23J6cUnijT8oacSUqLv1NGW1nziaRM
         FhkGHAWXndoriJqjQmcSH6ImyXjiO/5ivZ93fo5rY9L2uqLKiS7tus6HVPYgxaCAgQmG
         /GB3Sh/ZvFtpOFjeg6128JG7ykWcL42iyqwMpKC8TDc/R51TykQEZM3aHcMPvas1dsIk
         umDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800227; x=1775405027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        b=UxDO5cke2V6teYCB/Ij1P2doVzU/Syj7+iotvSNsh7f6eD0hIQlFt2EvJSktiJN7dq
         1ZfZnKs7uwLNE1pLzn2/e+0THiS1SQ3VeTq7/6zfFauFIvVYnVF5pzJ19l4Ot3FHIwxJ
         81tGh7tuUbRf096bHnVg87oLZ3nQkCH6EYjJxCXgvuUKiEdvwuq1l4DHvw4V9dBiNiNF
         mboYvDSr0gWlJff9ydLkK/5fbyViv30FvBjpL9dyhOljMT3tIeo3CqtXZfRDkp4mxpu7
         kTVu9/0GqR3oedVjtBp78hoZXyINGU+WYmR7P0wx8gDZYsClMOPoLV0UQ4FE4LLHezEu
         WL9g==
X-Forwarded-Encrypted: i=1; AJvYcCUhnT3Sd3mHvZMiDcF+ZNb1tR/1t2uIu9sJf6rDD08chFsU/LLRvkFo9/DH7CNbKHIcEsoCcYmrHu5HVdGYyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXb2jG4Oqh/BPxescsY1axlcNYFxoV1zO7z7Bnn9/L/tjZ9HQC
	wBSM5sWc6AqyUHq4xSAYrMtFjM+rVmUvCAyoAeoMgFySiuYIunZOANxa84W3xqwhoNCb8D1Hvba
	qA1CyRWzytxnMHh6Otw2so7pPWxijhiI=
X-Gm-Gg: ATEYQzwCsyCEpJssOvBMzB8sK734dk05Dw4FT0G0ZM1I9eY55tE59piOaIihwutVtM/
	RSYoRmsRoFNistk1VyB71GqLvm2qDow91zWfCzZbymfye6mbzj5hpgaZCRgUo1hfzjietc1WbKc
	E66rPEMiIbDpbBkEfqdgtcRtFsoXqPXofheXXraoO4pNcBTo5PchvEG3ActImbAdXQOdjh29RqH
	r7GJiXPbbs6eZwIscHtgN00DcmOTVKio3ov5GiVS0mEd13jvJ4c/9jQUTnr8wR8xZvx4piKSB2e
	5k+a1vpG
X-Received: by 2002:a05:6808:1a1c:b0:466:ff3a:c745 with SMTP id
 5614622812f47-46a8a3eb1b4mr4305468b6e.21.1774800227277; Sun, 29 Mar 2026
 09:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com> <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:03:36 -0500
X-Gm-Features: AQROBzDYnGEvrmF9Nv8aKI46KCu4qNGcGl029nctsf-3ar7uJysAlIX7PTC3c6A
Message-ID: <CABb+yY2cjMskJeXsn8+hZj2DcFs05yabHbSaGT5XSi0fn45zCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_090349_102899_B588A2DF 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 24, 2026 at 11:05=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
> and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
> cmdq_get_shift_pa() can be removed.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       |  8 --------
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 12 ------------
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index d7c6b38888a3..f463f443e834 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -123,14 +123,6 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, stru=
ct cmdq_mbox_priv *priv)
>  }
>  EXPORT_SYMBOL(cmdq_get_mbox_priv);
>
> -u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> -{
> -       struct cmdq *cmdq =3D container_of(chan->mbox, struct cmdq, mbox)=
;
> -
> -       return cmdq->pdata->shift;
> -}
> -EXPORT_SYMBOL(cmdq_get_shift_pa);
> -
>  static void cmdq_vm_init(struct cmdq *cmdq)
>  {
>         int i;
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mai=
lbox/mtk-cmdq-mailbox.h
> index 07c1bfbdb8c4..a42b44d5fd49 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -96,16 +96,4 @@ struct cmdq_pkt {
>   */
>  void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *p=
riv);
>
> -/**
> - * cmdq_get_shift_pa() - get the shift bits of physical address
> - * @chan: mailbox channel
> - *
> - * GCE can only fetch the command buffer address from a 32-bit register.
> - * Some SOCs support more than 32-bit command buffer address for GCE, wh=
ich
> - * requires some shift bits to make the address fit into the 32-bit regi=
ster.
> - *
> - * Return: the shift bits of physical address
> - */
> -u8 cmdq_get_shift_pa(struct mbox_chan *chan);
> -
>  #endif /* __MTK_CMDQ_MAILBOX_H__ */

I think the simplest would be to take this with the other two
predecessor patches.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

