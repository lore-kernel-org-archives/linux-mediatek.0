Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F9C27C42
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MCw2NA6FuQmF0PukMrc2Be25BqR+HvivDNyfSxsc+Y=; b=3BhujArabL/91pZQ9uq9n4YXKT
	c3+kMds/bp4E8IKxPhLufRRuQVigkawBapQ4lTH5+/NgtqmJtrJq3AIAG1ypuxMvpclHVvPAkjMkU
	QvixqCkm1OE+JuyZ3daDupzR4q2cO/IpEo9gXxB1AqDpBWHGQiUM7NPWNwGyutvx7SphqwOuHYNt0
	eVP17fNwnWYNu9vbBNvc2AksVY1rTgWqRW7D2E/bGXgqV2n0XhWex7Cirv8ul8OR7732chXmTvD+Z
	efvyeGaFM9K98PomP+TfId6h8w3o3SUDWvq60JjMOUB9UpMdmir3KJkEuuzPGnwBKR6bIx+n988KW
	S7uOW8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNxx-0051ne-0K;
	Wed, 16 Aug 2023 21:22:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNxu-0051nG-0C
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 21:22:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3CD561B20
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 21:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E45C433C7
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692220924;
	bh=3Bvp22ELU8nW3j1fp0s4i/sN9z5ZKJBspasKela5NhI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FxUoroUCUDcJgv65sZTpxDJ3g7K+m3CvLM7Z096Hq8JyZYn7jK5KrGzklLDGUXTgh
	 S1IISiynyWEDHSxY8BZKCizCibGQaXYjxLu4lqZLlD2kfRLZBl74tfBRX+pOrsAeC5
	 R7yrnXqni8kX+3QFwoblJeMjEFeRCuQ1m9y1PYgBtkS8FVDmtxYGh1IdtSf8ojwgfS
	 uXRxtP2BWMUkDalm/fBH7UOdHJN0mzgkxhaiTN7/uxNbEQBGA3qukhAid/jJssFJ79
	 6bg/qrsLwiUoiAL1PomOivwrlEEwBR2cfXxpLbD7b3iRhJ4MZ3mSrchpaVBBzhbPx6
	 ISRnpfcQN69wQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99c4e426714so158115666b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 14:22:04 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+oFdGNaPN65zNaQWhzHRc69fCI7p3vl/LN0wwJOw90xAWuXlQ
	aN+Me0Ldl8qYoUwo/DuAhM4IEEDjathECUGjqwM=
X-Google-Smtp-Source: AGHT+IHqWODBc+h3tM2wS4K19wUprvx5pfsDx8ZnoT5mBofV6pD/AUeaQUn/R6py3UHYuEJvOD2B4YnZuHIkJNX+/dQ=
X-Received: by 2002:a17:906:51c5:b0:99d:e629:6cc1 with SMTP id
 v5-20020a17090651c500b0099de6296cc1mr2035501ejk.5.1692220922611; Wed, 16 Aug
 2023 14:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690863143.git.deren.wu@mediatek.com>
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 16 Aug 2023 14:21:50 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzr1Q48GnvWE1zCGqa0r33u8VQAbaQ7-xBsXxej=gF-xHQ@mail.gmail.com>
Message-ID: <CAGp9Lzr1Q48GnvWE1zCGqa0r33u8VQAbaQ7-xBsXxej=gF-xHQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] wifi: mt76: mt792x: add mt7925 support
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_142206_147054_BCF2C11E 
X-CRM114-Status: GOOD (  13.33  )
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

For the whole series, Reviewed-by: Sean Wang <sean.wang@mediatek.com>

On Tue, Aug 1, 2023 at 7:38=E2=80=AFAM Deren Wu <deren.wu@mediatek.com> wro=
te:
>
> This patch set adds more functionalities for mt7925 to reuse common layer=
,
> connac and mt792x. This is a preliminary patch to add mt7925 chipset supp=
ort.
>
> Deren Wu (8):
>   wifi: mt76: connac: introduce helper for mt7925 chipset
>   wifi: mt76: mt792x: support mt7925 chip init
>   wifi: mt76: connac: export functions for mt7925
>   wifi: mt76: connac: add eht support for phy mode config
>   wifi: mt76: connac: add eht support for tx power
>   wifi: mt76: connac: add data field in struct tlv
>   wifi: mt76: connac: add more unified command IDs
>   wifi: mt76: connac: add more unified event IDs
>
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
>  .../net/wireless/mediatek/mt76/mt76_connac.h  |  6 ++
>  .../wireless/mediatek/mt76/mt76_connac_mac.c  |  4 +-
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 60 +++++++++++++------
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 33 +++++++++-
>  drivers/net/wireless/mediatek/mt76/mt792x.h   |  6 ++
>  .../net/wireless/mediatek/mt76/mt792x_dma.c   | 49 ++++++++++-----
>  7 files changed, 123 insertions(+), 36 deletions(-)
>
> --
> 2.18.0
>

