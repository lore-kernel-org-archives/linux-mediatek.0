Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ADBEEC2AD
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IehcyyhDnyZIhxx3qT+HJmRMWVPnhvXUm4NUqO4dsM=; b=vOiGSRcV5wl4yEwwQVciLibxRs
	/f1+Bz/5gZB/w0R0dGvTcKtduyRsfv4MxeZM9BeA8KFMwlUKWeDndjcynungOamXNlM5Shrn4DFJv
	YBNLgT57Ndxs8FhsJeHI73wyMxTme+hvsv+riAxPFHVbtazNu/NwV+ZhPPTUqd0obShNt0qXVSp3Y
	2AL04okAeH2KVo6qW1eeIcUKNj6qBnMQi9sBiuiZYhAi/DKO25hohyh6dZPm1nGcMjxb2QFVSkGKL
	SzI+GAAQMnGuI9ZqvnX8IKf99gVi1OhRrfiPvM5m9S0uTk4atVUXLENEja4QvHPopt/A+gfeieIgr
	dRInImZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufcU-00000001CxJ-3jE4;
	Mon, 23 Feb 2026 23:45:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufcT-00000001Cx1-2JV6
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 23:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B96F6013A
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 23:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB79C116C6
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 23:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771890340;
	bh=dMJAamPMttQVB14LwejzQz8So/iEKZx4aqjj7wWaGLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dKvppV09RjBX6b6vaSCFlO+cqIJLW17qvrkHfNA5nurOQFpPPKxVu7cuf1OK+b7ZC
	 uZiH5g1yVEY0smI1Nlshl2yMfBrzALVWVHeekZLD8WKBdxtwcwGxGiuGTUxAutFrhf
	 O6lI2AysC6lt2bf/HIFKr5nWyyh7ObVRKXJ2GUh78+D6kQlzpXFsosYb75m9QLletA
	 1VeFof+rRJ+/dgXNPUh5rgNTwkVwC8x8m8FagLvyNXJT1uSNqFu5hs4tACghU2uWax
	 liA3FOZBt7wXHOngx7o8r3HWC44VYOLpZCO/u/lAJJJs7SKqu3rrEVbKFbqj5b7fWO
	 ENz8qidfiv8SQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e60925251so5121300e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 15:45:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4OATdJ/MkicdasRNfDfi0jXWlMu9RPHjyJRTrcjv8bGQ9CDbdrBGtyd2K9r7+lDOLAEjI4fEs1fNI2dEfag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/NOcUF2sTmTZbkqklVTjIrIA8qIQSN6zqtEBvxwPzsplreGj0
	PHl/Y7TaWeXsIrccx8qZZT1wwxydB8UYeckvnqKZ0j7BNQb5SktuzU32Z8okd9Dlq6/YAx9hFZI
	cWanelnVJIB7oLVaIQBNR1ffCv8yyPN8=
X-Received: by 2002:a05:6512:1302:b0:5a0:4cb8:f51 with SMTP id
 2adb3069b0e04-5a0ed882ca6mr3293363e87.19.1771890338723; Mon, 23 Feb 2026
 15:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20260223073854.2464232-1-jb.tsai@mediatek.com> <20260223073854.2464232-4-jb.tsai@mediatek.com>
In-Reply-To: <20260223073854.2464232-4-jb.tsai@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 23 Feb 2026 17:45:26 -0600
X-Gmail-Original-Message-ID: <CAGp9LzpWqW7NL4iHMVLHqqUg6wpWabfQLnL9ssGpvx+zYgecgw@mail.gmail.com>
X-Gm-Features: AaiRm52dg97jQQvqRnAJZAe4VN-LKok6GIs3rgj8_wkg-i8M5S3cjobbWzDDei8
Message-ID: <CAGp9LzpWqW7NL4iHMVLHqqUg6wpWabfQLnL9ssGpvx+zYgecgw@mail.gmail.com>
Subject: Re: [PATCH 4/5] wifi: mt76: mt7921: add auto regdomain switch support
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

Hi, JB

On Mon, Feb 23, 2026 at 1:40=E2=80=AFAM JB Tsai <jb.tsai@mediatek.com> wrot=
e:
>
> Implement 802.11d-based automatic regulatory domain switching to
> dynamically determine the regulatory domain at runtime.
>
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 +-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   |  3 +
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 12 ++-
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  3 +-
>  .../net/wireless/mediatek/mt76/mt7921/regd.c  | 81 +++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7921/regd.h  |  2 +
>  6 files changed, 93 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index f44977f9093d..263778be4a34 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1586,7 +1586,7 @@ struct mt76_connac_hw_scan_done {
>         u8 pno_enabled;
>         u8 pad2[3];
>         u8 sparse_channel_valid_num;
> -       u8 pad3[3];
> +       u8 alpha2[3];
>         u8 channel_num[MT76_CONNAC_SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
>         /* idle format for channel_idle_time
>          * 0: first bytes: idle time(ms) 2nd byte: dwell time(ms)
> @@ -1599,6 +1599,7 @@ struct mt76_connac_hw_scan_done {
>         u8 mdrdy_count[MT76_CONNAC_SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
>         __le32 beacon_2g_num;
>         __le32 beacon_5g_num;
> +       __le16 channel_scan_time[MT76_CONNAC_SCAN_DONE_EVENT_MAX_CHANNEL_=
NUM];
>  } __packed;
>
>  struct mt76_connac_sched_scan_req {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 03b4960db73f..bcca4b17e8f2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -7,6 +7,7 @@
>  #include "mt7921.h"
>  #include "../dma.h"
>  #include "../mt76_connac2_mac.h"
> +#include "regd.h"
>  #include "mcu.h"
>
>  #define MT_WTBL_TXRX_CAP_RATE_OFFSET   7
> @@ -697,6 +698,8 @@ void mt7921_mac_reset_work(struct work_struct *work)
>                                             IEEE80211_IFACE_ITER_RESUME_A=
LL,
>                                             mt7921_vif_connect_iter, NULL=
);
>         mt76_connac_power_save_sched(&dev->mt76.phy, pm);
> +
> +       mt7921_regd_change(&dev->phy, "00");
>  }
>
>  void mt7921_coredump_work(struct work_struct *work)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 00ca3d3f3ef0..dfe8cbd7dfa5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1027,8 +1027,16 @@ void mt7921_scan_work(struct work_struct *work)
>                 rxd =3D (struct mt76_connac2_mcu_rxd *)skb->data;
>                 if (rxd->eid =3D=3D MCU_EVENT_SCHED_SCAN_DONE) {
>                         ieee80211_sched_scan_results(phy->mt76->hw);
> -               } else if (test_and_clear_bit(MT76_HW_SCANNING,
> -                                             &phy->mt76->state)) {
> +               } else if (rxd->eid =3D=3D MCU_EVENT_SCAN_DONE) {
> +                       struct mt76_connac_hw_scan_done *event =3D NULL;
> +
> +                       skb_pull(skb, sizeof(*rxd));
> +                       event =3D (struct mt76_connac_hw_scan_done *)skb-=
>data;
> +                       mt7921_regd_change(phy, event->alpha2);

Because this changes the firmware/driver ABI, we need to consider
backward compatibility. Will the driver still behave correctly with
older firmware?
For example, on older firmware the scan-done event doesn=E2=80=99t populate
alpha2 (it would effectively be coming from the old pad3 field and may
contain undefined bytes).

> +               }
> +
> +               if (test_and_clear_bit(MT76_HW_SCANNING,
> +                                      &phy->mt76->state)) {
>                         struct cfg80211_scan_info info =3D {

