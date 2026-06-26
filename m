Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD3C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=; b=seENX0+GdZ3UYCh0g2Oo4Gk/Qr
	3IQ0TKK7lytashHrd69JpY6bJlD/Mpi9OcrIsw823Uw8StjNGc0r7m878aL7O7wlDwc8bRP2E8bi1
	k5tCR+sQsKr0wlA8Y93KHGK+xe0suWGTek7BSGG/b8cU1gR0Zhgm6TfW+GuNwltLqkw8t8vzdB0jO
	P8pXz3GJAsGeeWZG/c0CV7+N4q2qyeMxF/uomhT2ly3U9l+4AZsLv00Y9kJvRx7E99HYFBfOIrJ0k
	p0btou+ZO+k4rwPKVdTwyKwzlOQhcZsDUlysVXN5JIM5cRZcJfrLlaXNxadRgXBq2YxDJfvOCe2Mr
	AJ5q0+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9pO-0000000Bf9f-3Whs;
	Fri, 26 Jun 2026 16:54:54 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9pL-0000000Bf8p-30Hg
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 16:54:53 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-662fa4a4470so1420908d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 09:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782492890; cv=none;
        d=google.com; s=arc-20260327;
        b=RzrHRZpxaEW2iZj1qGorRhjjhYu/AEYs3NN0o8A/CASL/saHYVIaGfBLhoCM1nk0g2
         ktWlCoewJcbuI4X4vtng/29YzwOx93hiicg9PxHgKi9f7B1QW248bknZc9fxaACQuEUK
         jKpFZfY7Eu4APxrx7ARky+thVT5VpRuWuhnnPUcUX0soZLDl1TGCtfMGKrhyleeuBlTj
         748h2yZB1zuS8vSaf3Yf1nAg3QQusr40g3drnXa6SzxzJnBUJYLoqfGHvE3mhkL/SNgI
         ARdxdXuofuR4NjAvYs0kOxewvq++dlUzWjsVverxPrqbFpkcYCx003jUMdZi/+snSIDj
         HM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=;
        fh=kGF0wnOeTpk6E+Jr3DgHa1m2eVeaycFlq91mUxlxUD0=;
        b=YBg9oBMK8wO+xPgl+Zw7aeaQYf77nqjE4D3PNpWA02s8h1s7cagbc+Msr4lWcCI8xO
         Jy5tG/crFl+h6MNwEnqWNK1OaPA9VWbN0IyD9CC5KqRL99QR1g0t0iYMaufmEP1oHJdU
         V+sw3dPgSrmMVKNWfQmzF2h7wCrtz3e2UZ7TgcN3OMxGwS9SJfBu5zJIqiyMJYwFCu0f
         cUmjkxLHadI0RwNq9DANxJWpLnDC5e1Cu+xwrRq5g4QJOEfpxltwPst1rs9+Tt8//CMY
         Q9rQ60gcRZlsG9KkkXK4Bc7ulztlARoDa63GyZhd34O5U1AhmamuLoZ81b4MKqxTCzcB
         jkXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782492890; x=1783097690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=;
        b=aH+VWR27NnRcqdfPDDRCkjeNlVLR5OfAlZvDzcL1gd7iemm4ZHMY86lRx4Y4EeVi6P
         sOeVvTbzSGk55XkiruJ/bKqjA78QqmSmly8O3jTBJEx0cMonHzep0BHKpI8xXiy4E1sA
         LQm0ly9OnyJYeD64IqbS2peXk6diwx2GbQq/TFZO+0rHAYaRwOTXWC++pqtU5ORAzoHb
         Me1mC3MJnvlbTzBVA5kWB/OS6KOGM0l0C66e62aBX+n5cBE1D6ZXNS0Q+vDfNOIwQjvF
         Fnc3F/P9Nv/GeHLy3XPllXBlXWqEpT8OVSSBnGBMAdr7vNMlCzxB/p+w8ngIoUwAF2R5
         yrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492890; x=1783097690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=;
        b=DW0tacr0r8Gb+AUObFjjkEbTJ4H9ATO4GD69AqxtdenqWpDQvF2yqBTaVxiWp9Xnl6
         Awt0gWnMw4e5RZ70nwkcx/OWHC0LB2n+LCUbwWRgBcN6Wz3PSpQgP3QtG4fvpQyW+jgU
         Fv0Y4c0vGzkEcSkkRlnE9J4Z3cFfDw5TMbv0f8x/Ld87k+op4r9OFALrQVCi4Dm1mt7V
         2CHzDQ4nUZac2ZNueOJN6eNH/1wsJzbDWVf8wF/zcoVdgVpOIKTEceAgv6nLAPnJgPVN
         R/ZCRSRSIDcNDuaAFQ9RnBOwBd6XVajsjAwTT5jd/gBWPpZi4N+xYLXTY5u0Q8EUV2Ps
         itsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2i1jRVMRQFjTyC45ShI419W0A6pQT8OdM7RDNcJrVzbGp9CrmKiyGrW2MrBVj2pOVq8wvgQy/VXbTt2pO0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFzjzNoMK30zciXEMPWrw2pcrIjoWebPJvNcnA0gj8lvCl7/FN
	WT/pAklmrDXQuiK5mYFFchFwqkHpiRAKXAN1Tb/YI+bxgjt8G3wRIFopU5ZsxGQ4croqRb/rMOf
	Ul5Gw/cNnvzhyQ00Zga9v8AqzSYt47JA=
X-Gm-Gg: AfdE7cmD3oVFbDYhVrFd8xwvZAzEOVN2PhCIXh5f3H+5uPNzJE04j3CfCbtZgP+WvHS
	7S3JLVvbj03yXTivvSITbwU1PxVHngpN6OdGVH0jbjfOYIToX9VgpoUy25k3HNt1J/8Xu4+c4Cc
	ELWXU9xfqfdu5crMFwqOOimU/lkA2rh8c/hqdue3/jjYiAwJyZE6uO9/ccaIFPdlzfFu3Ar9m84
	nuao+13I+OMNIh0fLIdlsavRCvaRqhPM4jaYdf7PQXn0LrHWaMsvritZARD9sRC8maziNBqd5tK
	3Bf3/8yq3V3mrPlrv9685t7TVXmyfUHdu45E8+aB2ogbBTqY66v7hS0S
X-Received: by 2002:a05:690e:408f:b0:65c:477a:2ad7 with SMTP id
 956f58d0204a3-66487e02906mr6126812d50.25.1782492890243; Fri, 26 Jun 2026
 09:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
 <178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
 <3f9c376a5dbfc9d737e2a7f83c5db8e591fb8793.camel@mediatek.com> <17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
In-Reply-To: <17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 26 Jun 2026 12:54:37 -0400
X-Gm-Features: AVVi8CdVv3HHwGMLXRaGH6j7p0AAQgeoBhar-UCT0NoarWVa66KqAbaQhtDgliw
Message-ID: <CABBYNZ+rR71SKUEuZBTf+E3SwRNzV2-s-zt8EwNJM3PSx9qB_A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
To: Rong Zhang <i@rong.moe>
Cc: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>, 
	"patchwork-bot+bluetooth@kernel.org" <patchwork-bot+bluetooth@kernel.org>, 
	"marcel@holtmann.org" <marcel@holtmann.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_095451_796082_68AA956C 
X-CRM114-Status: GOOD (  22.56  )
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

Hi,


On Fri, Jun 26, 2026 at 7:19=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Chris,
>
> =E4=BA=8E 2026=E5=B9=B46=E6=9C=8826=E6=97=A5 GMT+08:00 10:40:54=EF=BC=8C"=
Chris Lu (=E9=99=B8=E7=A8=9A=E6=B3=93)" <Chris.Lu@mediatek.com> =E5=86=99=
=E9=81=93=EF=BC=9A
> >Hi Luiz,
> >
> >Could we revert this change?
>
> Please don't. The fundamental goal of the patch is to make MT7922/MT7925 =
*usable* on affected platforms.
>
> Moreover, almost all recent AMD platforms ship with MT7922/MT7925, revert=
ing this patch affects quite a lot of users. Almost every AMD platform I've=
 met suffers from the issue, and there are plenty of bug reports.
>
> Intel platforms never ship with MTK WLAN NICs, so I can't tell if the iss=
ue is reproducible on them.

We cannot really remove it anymore, since it has already been pulled.
Therefore, I strongly prefer that the issue is fixed somehow or if
there is no other way then a proper revert patch must be sent, since I
don't have any hardware with this controller I cannot really test this
myself.

> >
> >Sorry, MediaTek wasn't aware someone submitted this change and it had
> >already been merged.
> >
> >MTK believes this issue is strongly related to the platform's USB hub
> >behavior,
>
> Still, I believe that there are some interoperability issues in MT7922/MT=
7925's hardware or firmware, as reinitializing the XHCI root hub (by logica=
lly removing it from the PCI bus and probing it again) doesn't make it reco=
ver at all.
>
> > The product lines MTK directly support haven't reported such
> >issue.
>
> ...or did you mean none of the existing AMD platforms are supported by MT=
K?
>
> >
> >Disable wake capability would severely impact wake on Bluetooth on
> >MTK's official product lines.
>
> Could you kindly explain "MTK's official product lines"?
>
> > Furthermore, this patch looks like a
> >workaround. There should be a better way to handle this issue. We hope
> >this change can be reverted.
>
> The issue is severe on affected platforms by making the Bluetooth interfa=
ce completely gone. IMHO, we must figure out the "better way" before revert=
ing it, or else it's more like burying your head into sand by shouting "wor=
ks fine on our platforms" (TM).
>
> That being said, I think we can narrow the range of the quirk down to AMD=
 platforms only. Does it make sense to you? If so, I will submit a patch fo=
r this.

Ok, then you guys please coordinate. I don't want to start requiring
Sign-Off-By (SOB) from driver authors because this instance shows that
response time can be very long. Therefore, the best way forward in my
opinion, is to have the issue fixed in a way that works for both of
you.

