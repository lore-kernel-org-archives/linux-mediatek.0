Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB72FD45FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6nA4CV0LkwsM1N6QDIXnBxXsnjq7I6TS4QSWRjp2eU=; b=YqM77Ew/NGivbWOR+AHC39Qe5j
	dO3TA2+9KJms2Rp3EzVGnKbeTJwoRoeWNqFgNuYdmBHjqB20iHNi4Q3Yg4qHou58KVcS+2c+d307M
	gjSXZRfVGhWr18U3pezMuvyvXcvx7ykZqX+eBUpF74WOvdi4IayLP+lFedJBTu8/0dJTLiGePhIHG
	xU8iH0r9j4DzX8gGwVgkF3bpSVAzyR6e3FdUF+O5bYheMGmWWpIb0ocEQg7MIkX8rQfx59ZMecJ23
	5K4araN2M3t90+lA0tD2Anorkz7M5zHk9M0cjics+5ZnWHKd4CAO6igqS3ddOcsUgPzza7xaRNccx
	FhVuFtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNwS-000000052I4-3UcW;
	Wed, 25 Feb 2026 23:05:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNwQ-000000052HM-0ztu
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 23:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D29E8444F5
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC3FC2BCB0
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772060712;
	bh=fXClZgYrWdJqhn83QVi9hg+uzNcWrfdO0GXcTLSKWC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GlJpHvwtn0hKDwhaGm/rEbb9cK8NcJLD2WxZiubZHzGKKStB4LBCdbPuKuhTUEBtP
	 XRxXkku1OvyeEdkiY1lbBOSz5JzEdSAOXpskdXFh4q6z3yU1v3CNM2dQDo8+AJsaK/
	 W2zUpPzbHX64J4cQEQKRwu9+MBeLKPJpe6LQ3q42Y2iuMIPQpbEmN3Ao/Kgc7c0Tqi
	 R/Rnl8H0PAKCuIaNPRYH4Mmg+AH4/9RLZEo2u51/1k8cJLULrPUxbezbqc12sMeUr5
	 VQsdcqe2CFdK8icRPFUy4dHcQ8ZZwrDTUOrDenwjdOvpcTBS0PRx4dR39EzxX5v/od
	 4jZuRm2iKc7uQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870df2331aso14469891fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 15:05:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPs7Hz3NwR2FpIEPzl+VnKZU7DmoTqlikJLvpCrj/mRJce3u7mLsx1nqzPHt1ssgpKSpwojXcTI4+Vpq1F6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLgGF3I7DHz6oZ74I8kshzl8mYlkxIO4Er3VQGWfOvKJa6sFiz
	A68jdIOe/zI/ITmzmCeNZjuH03ursIQ6fSzda+K5l/KxasNQNFLozV+QIGespjG47cD9ASOzEPY
	I0ca96XwvOKulhSJLoqcTqYf4Ockf2sk=
X-Received: by 2002:a2e:b606:0:b0:389:e845:9d2b with SMTP id
 38308e7fff4ca-389f1e0c895mr1303031fa.13.1772060710957; Wed, 25 Feb 2026
 15:05:10 -0800 (PST)
MIME-Version: 1.0
References: <f56ae0e705774dfa8aab3b99e5bbdc92cd93523e.1772011204.git.quan.zhou@mediatek.com>
In-Reply-To: <f56ae0e705774dfa8aab3b99e5bbdc92cd93523e.1772011204.git.quan.zhou@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 25 Feb 2026 17:05:00 -0600
X-Gmail-Original-Message-ID: <CAGp9LzrfZwRKTG4O9TxeCZsENKJZn6KxEqLhtUAPPyrTkUK77Q@mail.gmail.com>
X-Gm-Features: AaiRm53FR-8uDkOW-wjP5GYWa9L23iFbcdljos-gKmlAfnf6U4r9yInVwSNt94U
Message-ID: <CAGp9LzrfZwRKTG4O9TxeCZsENKJZn6KxEqLhtUAPPyrTkUK77Q@mail.gmail.com>
Subject: Re: [patch] wifi: mt76: mt7925: fix incorrect TLV length in CLC command
To: Quan Zhou <quan.zhou@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, 
	Sarick Jiang <sarick.jiang@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, 
	Shengxi Xu <shengxi.xu@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, 
	Michael Lo <Michael.Lo@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, 
	Robin Chiu <robin.chiu@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150514_339464_6B1F93C8 
X-CRM114-Status: GOOD (  18.13  )
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

On Wed, Feb 25, 2026 at 3:48=E2=80=AFAM Quan Zhou <quan.zhou@mediatek.com> =
wrote:
>
> The previous implementation of __mt7925_mcu_set_clc() set the TLV length
> field (.len) incorrectly during CLC command construction. The length was
> initialized as sizeof(req) - 4, regardless of the actual segment length.
> This could cause the WiFi firmware to misinterpret the command payload,
> resulting in command execution errors.
>
> This patch moves the TLV length assignment to after the segment is
> selected, and sets .len to sizeof(req) + seg->len - 4, matching the
> actual command content. This ensures the firmware receives the
> correct TLV length and parses the command properly.
>
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Cc: stable@vger.kernel.org
> Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index 1379bf6a26b5..abcdd0e0b3b5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -3380,7 +3380,6 @@ __mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *al=
pha2,
>                 u8 rsvd[64];
>         } __packed req =3D {
>                 .tag =3D cpu_to_le16(0x3),
> -               .len =3D cpu_to_le16(sizeof(req) - 4),
>
>                 .idx =3D idx,
>                 .env =3D env_cap,
> @@ -3409,6 +3408,7 @@ __mt7925_mcu_set_clc(struct mt792x_dev *dev, u8 *al=
pha2,
>                 memcpy(req.type, rule->type, 2);
>
>                 req.size =3D cpu_to_le16(seg->len);
> +               req.len =3D cpu_to_le16(sizeof(req) + seg->len - 4);
>                 dev->phy.clc_chan_conf =3D clc->ver =3D=3D 1 ? 0xff : rul=
e->flag;
>                 skb =3D __mt76_mcu_msg_alloc(&dev->mt76, &req,
>                                            le16_to_cpu(req.size) + sizeof=
(req),

This looks good. It can help improve stability and avoid firmware
misparsing and MCU timeouts.
Acked-by: Sean Wang <sean.wang@mediatek.com>

> --
> 2.45.2
>
>

