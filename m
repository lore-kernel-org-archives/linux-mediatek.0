Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E5AEEC2A7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWKpmp7rR7lZ24ob2b+u9Uqg1OW7vSSvgBsPQFGMQYM=; b=Pj+MdcvlTOownDmepxiWnHU081
	5DCSMRJHLasF+YyU49Kqs2nPA/xGE8kbBMYJ0I5AMigkMpiw+ZQFCa9yx+/shSI0afIbHnPhZexii
	kspkxUi5Vq/wGZOdTnp2UQhdSdpI4Ukh4XNyW0mAsFoo2u7vukchznXWkadm+SIYkLwKlO3sgnMFW
	ZJqbrynBvpKnTeC5KTAU2H7JyIzA5ARkG0Y0SU5mrM9Do5KA7CYcl/BhVZwxB+J1ZzfVc595CDhFE
	oU6KsjlWgj20znGClEIoJSfsMXIvPJwTpWFlPDglppw7E4HAfsJoplyJMskRztAocBF9jr+4F1JHV
	KYI9ikKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuech-000000017ro-1i6R;
	Mon, 23 Feb 2026 22:41:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuecg-000000017rA-0o6B
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 22:41:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AB35600AE
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D8DC4AF0B
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771886509;
	bh=TeMt0AX/UmpbUNYFEiguHKbS1SjqNPE1azh8i2vqJzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q90md/KOfDcrfeagom1mAd7Dnb31vbELqv/0ewQ49+oNrfvDteCcF15V2QIFcXULU
	 2OLzBw2ngjDgswaMRmp1sqnGWkWuZgxtVyfBaWEfAbYBpbPKDjjEXC8iyUei9aM0kM
	 MZ3yxduWuGINQouT1LlLNajEQ65zx8t8yJhww+1Hqubax+F3Hgu1snRN4VK1QVvbTG
	 n1wHJtwowrr1tcsgwcaYYpJ5Rzb8WFOvCSC9qOIYqP451B/w3cBVq57KApTQnvk2zH
	 tI6TCQ2Xa7xn29xn0rQLAC+5jjiwCqKGuma7QANgvvRZJpSfZMEqlL5oC7qQKTLAmG
	 4ggxPjXV2EJVQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3871a08189aso39853721fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 14:41:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhwYkC+CVmAl/EVPrMJdHw1BZwaN9TyTqKw0VgNQRPOwFNuvblnzXsOhJ05lXi7rRO26C6mp81tjY0puDw5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXDm6dXH7cGR2BCgzT+e5fKw+jTtT3LGiJF+j3dxORokbZ+9j1
	52sW9VZ4Og4/3DPewjJQULuEUwSf7Ra0IRZDHe7mI0ECj47B7tIuJhSIS8CCy4ZuhDgERerBFgB
	DkWThD5K/prS7W5EOuFzfvTWBwRZtgho=
X-Received: by 2002:a2e:a7cf:0:b0:386:7e61:5de1 with SMTP id
 38308e7fff4ca-389a58a71b3mr36637261fa.0.1771886507309; Mon, 23 Feb 2026
 14:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20260223073854.2464232-1-jb.tsai@mediatek.com> <20260223073854.2464232-2-jb.tsai@mediatek.com>
In-Reply-To: <20260223073854.2464232-2-jb.tsai@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 23 Feb 2026 16:41:34 -0600
X-Gmail-Original-Message-ID: <CAGp9LzoJ=bi2Ao9V2byetnNCkYunHdGV4i4VUzyYC_iHHPu7WQ@mail.gmail.com>
X-Gm-Features: AaiRm52Tkb3GZi5rcuvrRWZRAU3Z5n3dk8fj2slXJOZmMqBLAby5G5mYuaWZbxo
Message-ID: <CAGp9LzoJ=bi2Ao9V2byetnNCkYunHdGV4i4VUzyYC_iHHPu7WQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] wifi: mt76: mt7921: refactor CLC support check flow
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Deren.Wu@mediatek.com, 
	Sean.Wang@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
	Leon.Yen@mediatek.com, litien.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

HI, JB

On Mon, Feb 23, 2026 at 1:40=E2=80=AFAM JB Tsai <jb.tsai@mediatek.com> wrot=
e:
>
> Move the disable_clc module parameter to regd.c and introduce
> mt7925_regd_clc_supported() to centralize CLC support checks.

typo, s/7925/7921/

>
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  | 14 ++++++++------
>  drivers/net/wireless/mediatek/mt76/mt7921/regd.c | 13 +++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt7921/regd.h |  1 +
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 8442dbd2ee23..1e2afa736cdf 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -4,6 +4,7 @@
>  #include <linux/fs.h>
>  #include <linux/firmware.h>
>  #include "mt7921.h"
> +#include "regd.h"
>  #include "mcu.h"
>  #include "../mt76_connac2_mac.h"
>  #include "../mt792x_trace.h"
> @@ -11,10 +12,6 @@
>  #define MT_STA_BFER                    BIT(0)
>  #define MT_STA_BFEE                    BIT(1)
>
> -static bool mt7921_disable_clc;
> -module_param_named(disable_clc, mt7921_disable_clc, bool, 0644);
> -MODULE_PARM_DESC(disable_clc, "disable CLC support");
> -
>  int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
>                               struct sk_buff *skb, int seq)
>  {
> @@ -422,8 +419,7 @@ static int mt7921_load_clc(struct mt792x_dev *dev, co=
nst char *fw_name)
>         u8 *clc_base =3D NULL, hw_encap =3D 0;
>
>         dev->phy.clc_chan_conf =3D 0xff;
> -       if (mt7921_disable_clc ||
> -           mt76_is_usb(&dev->mt76))
> +       if (!mt7921_regd_clc_supported(dev))
>                 return 0;
>
>         if (mt76_is_mmio(&dev->mt76)) {
> @@ -470,6 +466,9 @@ static int mt7921_load_clc(struct mt792x_dev *dev, co=
nst char *fw_name)
>         for (offset =3D 0; offset < len; offset +=3D le32_to_cpu(clc->len=
)) {
>                 clc =3D (const struct mt7921_clc *)(clc_base + offset);
>
> +               if (clc->idx >=3D ARRAY_SIZE(phy->clc))
> +                       break;
> +

I=E2=80=99d keep the refactor logic-preserving. This bounds check is a
correctness fix (prevents OOB on phy->clc[clc->idx])
so please send it as a separate hardening patch and describe the failure an=
d fix
Also, ARRAY_SIZE() is for compile-time arrays only if phy->clc were a
pointer, it would be invalid/misleading I guess.

>                 /* do not init buf again if chip reset triggered */
>                 if (phy->clc[clc->idx])
>                         continue;
> @@ -1403,6 +1402,9 @@ int mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *=
alpha2,
>         struct mt792x_phy *phy =3D (struct mt792x_phy *)&dev->phy;
>         int i, ret;
>
> +       if (!ARRAY_SIZE(phy->clc))
> +               return -ESRCH;
> +

Ditto,  to keep the refactor logic-preserving, send it as a separate
hardening patch and describe the failure and fix and also
!ARRAY_SIZE(phy->clc) isn=E2=80=99t a meaningful runtime check I guess.

>         /* submit all clc config */
>         for (i =3D 0; i < ARRAY_SIZE(phy->clc); i++) {
>                 ret =3D __mt7921_mcu_set_clc(dev, alpha2, env_cap,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regd.c
> index 6e6c81189222..70440ab8ba82 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
> @@ -7,6 +7,19 @@
>  #include "regd.h"
>  #include "mcu.h"
>
> +static bool mt7921_disable_clc;
> +module_param_named(disable_clc, mt7921_disable_clc, bool, 0644);
> +MODULE_PARM_DESC(disable_clc, "disable CLC support");
> +

should we explicitly include <linux/moduleparam.h> ?

> +bool mt7921_regd_clc_supported(struct mt792x_dev *dev)
> +{
> +       if (mt7921_disable_clc ||
> +           mt76_is_usb(&dev->mt76))
> +               return false;
> +
> +       return true;
> +}
> +
>  static void
>  mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regd.h
> index 0ba6161e1919..74bc2fdd532c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
> @@ -9,5 +9,6 @@
>  void mt7921_regd_update(struct mt792x_dev *dev);
>  void mt7921_regd_notifier(struct wiphy *wiphy,
>                           struct regulatory_request *request);
> +bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
>
>  #endif
> --
> 2.45.2
>
>

