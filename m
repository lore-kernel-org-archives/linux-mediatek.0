Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E527FCA9EBD
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=; b=fYCyIsIetdZtyFDIbsznfz+gAD
	xMph0/v296XM5DtXr/dJhvHyco3YWdQyumZFxto0WDxkp14ctjScyGiaHEx84YSNLCPfTDE1pGSx5
	wllXUx6DqI42UZ2UcDnw/4n1nsrZ5gKLET43v8BFOoEAM9sVWGcmVn6IqiAseI8UG3eMM0OqnbOFA
	INecojheq1vi/+Y0wFmKTkqlmzLntl6CUgVIVtv1iSaz960M+scheq94vxBlKLoBD/Q/s5eSd/htT
	/MlecW3sp9xLC/MBfPX/E0MffRH0Sgshgh826R5kbYmRX0LB2JrnXg7nzsFCO11hU94/lTmZBlSac
	p4mTle8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFydi-00000009JqN-04Pe;
	Sun, 11 Oct 2026 18:51:18 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFydf-00000009Jpi-0Sce
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 18:51:16 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6de08b2e447so491362eaf.3
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 11:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791744674; cv=none;
        d=google.com; s=arc-20260327;
        b=Lq5bxMn9bRiCiDfP+CHT3cMxZiNqaskSRFJtNL4VwIcm86QJLUQCqwq+vIZy5cKBrT
         qV7zS05sFxLnA9gnYcRAVqojhh6x/uzSb7VlbfW2R8cBjDx571YFKCFjj6cnPQVFypQW
         /sNX0QuhE01o3MnpKV8poRNBagwtCddhSkJGnImVCYcRm3+2+Zv/bKDrrK+3ZNBkGx3r
         LltAStW3uJnWQiVSvcMnxuxGIgqtx0fZYUJO7PEpOb6sj12YkOLYjE386ctCBJbBtCAX
         HwJcUCY6CJH1+PZWoBor/cVbLy+sM2Xt1aHUqRmQRqy3Ff0ltkfW54jtF6uHi054W+0h
         MgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        fh=2a0z6UpwIDk3Qi5mq3OF1cC7IlrAwYqMys70rMx5nfE=;
        b=a8phhi65jZkUiO5Cn/5woFviTYTRPOMWm86uhEhx+txY/F8zWNS69EjhwHmrDf3qGG
         t+W8ULFh16O9Ux2G1Og+My1RbfD+B3aL2tbi/C6Q98gxYhM0WbMWt+34L3CaHY/M1dwP
         fVaiMLf9JjrMI0kWpwcEsHUHAMrUx5Y9/8GbeUzRpErZJ4Ewc/NBR2fv/NSgNiIwLGKx
         h46NWY+Y+OynZds7+k5DZkq8Ge972ZQteuJ8dbLamJ8u/83seeFDwowUAX/C6TAtLva/
         opkizBWyFyCq31WIr2CLLH9hczjE+6U+XuIhvLTJRmaQ7M+R2vq6iMjWGni7iCy724H9
         i25w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744673; x=1792349473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=a7XkSvdAXLwvhpizlk39f7MIPy4TSoDtAoJPpYvXSQXiQNp4JCainv1HlduWnN/Hy0
         xCsPzAMtsnk9nn1sK9r+aXfKMi2zgoz2TGl4R8e/4MAuGOjgJ7uwNhUWfV/zxTlARqaf
         mPLsfHmUHvkcxa5oDTcaDn+7QPaLAdY4kgqh1zZs3qEcXb9/TTD0nsT1RSUgoiFWOHpH
         1M681I3u4sZT5nL17PiODTtHMRSpfLK51e3rI3233yWj8/pYPtLUuT1N6Q5adTLbXS5t
         Tij/IzcT5bASmaKZalWizwm7IG2Pi0JkI1yDSL8TEuxM1DecNg1Zkx21ODi0RPbEK7jX
         x3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744673; x=1792349473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=So+VXK+jCyvuxMPcdVF9c9Va/K9qxjIGKfLbmfBkJzLxZ6lwT52gml1BxupXcsa7fB
         xChTmtWlSlJXLQMMeHooe4tQDq9CUo/KoZArKVCoALk9VdNmcupwUiV44/6WcC9gt/tf
         RF1UmiMzTsuS+bZCopQUO9ae7I6pvU0+4F44ewuiXOwqsV9439snHGz3AHaACNiOpOCy
         Dbq3HCsXP0zmVypUKN+G9xV/VZd1MoDFYn6yHhDGyYAoHZGvpx6JMc5Gn8OAkhWNc4bG
         u+jt9De9WT3kfOrDzJQ/1SyKjbLuNEUuiVWxKn6ZGi8ynnAidL19SAqL0qvIbybGOiAp
         /ZJw==
X-Forwarded-Encrypted: i=1; AKwUvBxQxfSBZBgx7bE3575HwE5BPNlJV1g6/exN8tjtzMBeRUrJ/rZ5TgUYglH4zpsSQkkZDoVfZJ3Ps8Nqgcilrg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLL0IaU72VTCMn8qtYD3ARAq/7rORNg0Ccbx3FFdsR4pcxwx21t
	82rzbPn8JhFexUB0aKNnbMq3PVpXS6oREb9Tt3+ZbkA/Hu8dbf+e1qV2IO1UY4H92MJ5qiQ6u8m
	62oEfNjZCabiLgeQLGKBjj90Armc70wU=
X-Gm-Gg: AYBFou0IkZmpGwdALs8IZds+oetaFqujKJiiKKlQQRx1qdWDYvym20blnR5gDU7KidI
	vMNdURo4HPrOLqnz/Kd0PXCNP3MT/VZA+Si5aglLykmMypfhtVBMl71jWNWs1FGMu4tPE3GVUHX
	k/VR6eeY4yx1WlxbK9fMUzu0P9aS/bjsnD47fON/+QUpXFm0JU48wiGYxNo9OD+D8t1run3ThHG
	o5PP4hBcs/IvU+wypU8vU4TKBHBDp+/e9E8HqixODaB9BOTwAjO7sFPkCXXE+pFeI29Q/6gBGwZ
	jY0mhq21vBBgmbH3rbxK/1PtxRNnJ8RIM+VU9dWnOh9YEd5Hi+tniHY=
X-Received: by 2002:a05:6870:e311:b0:47d:a12f:3951 with SMTP id
 586e51a60fabf-4a2a89f425bmr6103374fac.39.1791744673650; Sun, 11 Oct 2026
 11:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-2-412a5b037290@protonmail.com> <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
In-Reply-To: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 13:51:01 -0500
X-Gm-Features: AclHuK96ynSq9uLesTtRAZnhZ7wj24Xtpvp969Wwe99Ul08jW1tzra27V2b0o08
Message-ID: <CABb+yY3oEfZrx+=igTVUOSGB1+J-pa6=k=+DGOxWozJnK_sJgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rva333@protonmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_115115_161711_B4C4C335 
X-CRM114-Status: GOOD (  16.76  )
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

On Wed, Sep 9, 2026 at 4:57=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 9/7/26 20:03, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Some SoCs, such as mt6572, have different WRITE and POLL instruction
> > encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs hav=
e
> > 22-bit offset and 2-bit subsystem ID.
> >
> > Extend cmdq_instruction struct with additional union and struct to hold
> > the legacy format of instruction encoding. Add legacy_isa to select
> > legacy GCE ISA when writing instruction. Finally, add special handing
> > for legacy_isa cases.
> >
> > Also correct comment about PA writes, because it's incorrect for legacy
> > ISA. Only v2 (mt8167, 8173) and v3 (mt8168, 6768, 6779, 6785, etc) have
> > GPRs and SPRs for PA writes.
> >
> > While mt6572 GCE supports 22-bit offsets, the parameter type for offset
> > remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xfff=
f
> > range.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>
> Verified in the lab on multiple MediaTek boards.
>
> ... but I either need an ack on patch 3/3 from mailbox maintainers, or th=
ey need
> an ack from me on this patch to pick everything.
>
> I'm fine with anyone picking this, so...
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
>
I realize the patch order is messed up - it should have been 1-3-2
instead. So maybe for this time...

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Thanks
Jassi

