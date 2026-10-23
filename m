Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFF606A320
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyGwMWYK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VXxbsgEQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptu90dMF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jxNvehtlWeM2v9I8bvYmlnUOj1vAh6WkD6i3fkgpUTk=; b=FyGwMWYKWbYrmF
	O+xfgfooO29aM1pVYz6UhUMKcMumXAQSAeywyS83DT+Nm83xq8hJrBxYfoSbE/50U0meDNz+/r/vb
	KgFQcXHsHXcULfv/z0UPUrj9x9XgPG3l5KR+gm3+3cZQ4GbTZRJtqkakE7Hf9ld/2X4VEhauqSreb
	g220hCJT+8ZpCLqS3DKTVWmO/aed2mAjg01HRM4TtaeZe6/+XeDwAynpbtchr8tdZ1QnI+YSH8abJ
	cmyfV+tzv7qeAh1aiIhz9EFfmrcw6BO6Tv0JdVUVhxiboqTlugaUebQvvDUXZN9ZoVye03f7KmsaR
	UTjN8sKFUb6/7iHOC2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNqA-0000000H3C1-1mjZ;
	Fri, 23 Oct 2026 22:34:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNq7-0000000H3Bt-3Q8x
	for linux-mediatek@bombadil.infradead.org;
	Fri, 23 Oct 2026 22:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jxNvehtlWeM2v9I8bvYmlnUOj1vAh6WkD6i3fkgpUTk=; b=VXxbsgEQHxmQnMzSWSJl64l5L5
	7Y4IMfSQ5micEmwpTsX6UNj3CIror3WunQsc4oYGqht8lvTec4gBABCS+yxFTdNt/DEmQV4YBYVZj
	8UaQQHxZwdf3QF1+6CcdVm3Eo49ObOr/buI8XYaYxxqz52VsnOp65SKzYY8WhCcGag2ZLxzGBMUgJ
	Mw5mYiTmzkgMNuBFak4C9ppPA5GfP94AaQsEbnYXulEjCQT8C7mjm2IWpCeonwlXD/HJ2/ZGw4Hc/
	1lLkxD++eYYGeEpBnoIhYSN8aT2FiuLLJZiRhAAka8r8ogVs67SrEgb0tGYA9KcjN7Q2MF959IStB
	RSfU6g5w==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNq4-0000000AjJ9-1VNS
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 22:34:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-89f639ba307so546795b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 15:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792794853; cv=none;
        d=google.com; s=arc-20260327;
        b=fbuH/k55G3LGSM5nWdW9t3OlMq1gIhEclR5+3G35pEsHAP4xALuEltzhAFe5XX6544
         gfgUDevWXZGTYGANJDQm7m5VlhbPHHqNNf1XSLFu09KRQ06KEWz4upHa64UP3DYREbmY
         OwVujfR3103QuKiVdoM50T9YwsXBATD21FUzLmKHc0KVnBuHuFUEjxglOAH5U/viMqap
         ZGwD1VVLm3GUnOuKgsTzwyfWjPs2mOnHK0oO8dy81hI4V528EKVwkSlhTKyal0H4njR0
         2Y6qPzJrnF/zk+ViWPba3xcmQxoa5G9lobZ04dKRwe9PkDdtYtGX+RHdAww0OWcZSGG4
         ZbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxNvehtlWeM2v9I8bvYmlnUOj1vAh6WkD6i3fkgpUTk=;
        fh=2IKpBkXEiKdY40Zym1GS/vqnpgMKqte6mByEJbcnZIw=;
        b=kRtg1CGnd6G13zFkZSuo4IKwIE3+B+0jH+CdfT2hKXmkbZ/LdEoCJ2DwP5Is4X8PG7
         r9ms8glIeo+Xif9DsJ013LLhEFwwUevodf3ZvlA9ny4j/NDaGsi6rlqO+WV9acERPcWi
         Fe0y5dXU+8Gk+8V9xkGhccdPz+2pqbKMaLk68zlLr3QYX085tCrYRxctuYDb+Z36xKjX
         Y3Unkq83Yd8lco3JxLUKCZRo6MRtkJ6LQXBrTkEpejCb362AHZ32+oYMydc8Hy5xN9Jn
         gEp+Jvd/KS/GvHTqxEZClF0Y92ikeXD7ish8QQtr8scmwXr6PG7A5N+y7nmc4n3Rvaqf
         XU3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792794853; x=1793399653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxNvehtlWeM2v9I8bvYmlnUOj1vAh6WkD6i3fkgpUTk=;
        b=ptu90dMF9YkmKodHJfixzz2Y+HMQEvzkclenwCAC1Sfpd7a/uofnZlijO9jbM1SLK6
         bOAPAqvO3hEBrowp37s5Ha6eMjXM7QfMWnN+LVaxUkogTawW9+pn+bHJ98jMRqj74BaF
         IuzcwFjwpJODS1FIEodDM/pIPTjKFxv9cNvjLGTdVj8+iYqsMAvBQD7J8deS8fpWp+H6
         y6y8O5VVee1aO+YfTCMb2JFW5F3TTl40rhE/gD2jGPWqfLiM0+ay7HVKDpHxUir95Y26
         HL81fGyqjdQJmQehRMZXPug6YVYqvGLiZdrRmuM+V8MBZLrktfYlyZoAC+Yy0mL9lSu+
         6Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792794853; x=1793399653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxNvehtlWeM2v9I8bvYmlnUOj1vAh6WkD6i3fkgpUTk=;
        b=BhjyzIKsE4AXyRjlTfmdTaGfqPFbPfPaOQ+b2+X7Vt8ZExwm1SZJUMjEaFS36GVX20
         0ojynLv+DR6hl8ij7zbu7ufe/9tIjxUFVBMQAO+sQDFHtSgQP0W0JR1WMd4tUs7TGoyq
         2rjnQq9juNKlSByQ+U11357GEaZkHYoqILw6VmgpcYrxylNciFfaeYeTeMZRkyuU6PT9
         ZMEGp/LAupCcNj95zCkPYtTLwHvF4bfulPqr5IdD/0eDwsNX2g1DHhaiFEwGBEX5Qhdt
         DAUFKdI51BRyOIPwF+iRhHQpGV5+0l8XXFptF9HFWIBqaVh2gsJUtlr9aVaXD7PKdW+X
         u2hA==
X-Forwarded-Encrypted: i=1; AKwUvBwzkD+zvsqpWqoxocBKt3xpKdjKaH5Ze7XXXnpTZ4100x3EEc+LlA3Ybc8Ed5Gn8SohLtuFAVTMAIlcKbh6WA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLcA0mrnPOXAwNOEub+1lL1Njra3h2S4uA6VaFsH153qA+KqFqy
	2cd4g5oleNqOc+Na6h/5U09CeAAB6S9sGSUfGO4T/Qq0/ulVK5BqEg2yY9D8PJjYb2aw9bSHaLg
	f85Zje9q0ioe/vzfg4UgUgL2swn2GNAk=
X-Gm-Gg: AYBFou30eL57QzlCMyGP3gcPMSnxSvXZchBaOlHXlm1AnWlaaF/rmYkaJH/AA0o+5uD
	t+79bZWly0wptMxWkbpAkzYUyrqk5rLVsMsOs/1R3mYPwiAMFTwq3iFSsEfW2D4GIdN7A2awDaK
	VLvGQEH3dXIEKpkhZZB0hZUH506k4VouKihSYWhfaVKiWB+0npcHC8xIudYt3yjJnWrH9pnxcjf
	oCoPRkzuE/LxlWEIhEQtOne3F6gjQL/DD0dL9L0Uw0rxMRGpmRmLZ29mBoMzWGa9OqjpOLK08qj
	yHJbXbbrvfNQ6YoiP+Vrg84LeQUzl5vZzF1f4Gn53xqrfWPQbP3J8XweSq40LZRZRwlGniFAJSR
	e0C6Su1ZJbFLfoqq/RkzntP1vwc9VWpZK3cT11A==
X-Received: by 2002:a05:6a20:3c8d:b0:3e0:ba43:3d3d with SMTP id
 adf61e73a8af0-3e7af8001f7mr442293637.9.1792794853057; Fri, 23 Oct 2026
 15:34:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com>
 <20261023180554.7266-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261023180554.7266-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Fri, 23 Oct 2026 18:34:01 -0400
X-Gm-Features: AclHuK-TQOKJ5AyUFSaxMUSVX5DG5h7fuIaa4gR6ynEKVI3XJIwGu3Fysv6Wifo
Message-ID: <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_233416_734251_C18DB3FC 
X-CRM114-Status: GOOD (  34.68  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 2:06=E2=80=AFPM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> Busy time in the mt7925 survey is bogus. The register it comes from
> doesn't work on this chip, so every update adds the same large number
> and busy time soon outgrows the time spent on the channel. Transmit
> and receive time come out far too low as well.
>
> Ask the firmware for all three instead, the way mt7996 does.
>
> The MT7927 counts 5 and 6 GHz on a second band that the survey never
> read, so read both bands there and only add the one the channel is on.
>
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Fixes: 05fd14885303 ("wifi: mt76: mt7925: sync MT7927 BSS band assignment=
")
> Reported-by: Chris Kelly <hoopyfrood42@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/CAHaeJsT8O8Nhq351hFp3NAL8e=
0iU85N-LBdYZ9nYHFHVy7t_hQ@mail.gmail.com/
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> Chris, here's the RFC you asked about. Busy time now follows the load
> and stays under the time on the channel, hopping every half second too.
>
> It's an RFC because the offsets aren't documented. On an A9000:
>
>   19  busy time, including the card's own transmit
>   20  receive time
>   28  transmit time
>
> The MT7927 counts 5 and 6 GHz on a second band, which keeps counting
> while unused, so only the band in use is added.
>
> Busy as a share of time on the channel, A9000 on 2.4 GHz next to an
> MT7921AU:
>
>                before    after    MT7921AU
>   idle         4229%     4.2%     1.4%
>   100 Mbit/s   4317%     37.3%    33.7%
>   saturated    4346%     79.5%    77.4%
>
> Tested on the A9000 (Arch 6.18 and 7.2, Ubuntu 7.3, wireless-next with
> lockdep) and on a PCIe MT7925 and MT7927 (Fedora 7.2). mt7921 keeps its
> registers, which work on my MT7921AU.
>
> Could you try it on your A9000 against the Wi-Spy?
>
>  .../net/wireless/mediatek/mt76/mt7925/mac.c   | 42 +++++++++++
>  .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
>  .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 70 +++++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 17 +++++
>  .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +
>  .../net/wireless/mediatek/mt76/mt7925/pci.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7925/usb.c   |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
>  8 files changed, 136 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index 7af996abe294..4ec3712fe614 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -1470,6 +1470,48 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, en=
um mt76_rxq_id q,
>  }
>  EXPORT_SYMBOL_GPL(mt7925_queue_rx_skb);
>
> +void mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset)
> +{
> +       struct ieee80211_channel *chan =3D phy->mt76->chandef.chan;
> +       struct mt76_channel_state *state =3D phy->mt76->chan_state;
> +       struct mt792x_dev *dev =3D phy->dev;
> +       int i, n_bands =3D 1, band =3D 0;
> +
> +       /* The MT7927 counts 2.4 GHz on band 0 and 5/6 GHz on band 1, and
> +        * the band not in use keeps counting, so read both every time an=
d
> +        * only add the band the channel is on.
> +        */
> +       if (is_mt7927(&dev->mt76)) {
> +               n_bands =3D ARRAY_SIZE(phy->state_ts);
> +               if (chan)
> +                       band =3D mt7927_band_idx(chan->band);
> +       }
> +
> +       for (i =3D 0; i < n_bands; i++) {
> +               bool add =3D !reset && i =3D=3D band;
> +               u32 bss_rx;
> +
> +               bss_rx =3D mt76_get_field(dev, MT_MIB_SDR37(i),
> +                                       MT_MIB_SDR37_RXTIME_MASK);
> +               if (add)
> +                       state->cc_bss_rx +=3D bss_rx;
> +
> +               mt7925_mcu_get_chan_mib_info(phy, i, add);
> +       }
> +}
> +
> +void mt7925_update_channel(struct mt76_phy *mphy)
> +{
> +       struct mt792x_dev *dev =3D container_of(mphy->dev, struct mt792x_=
dev, mt76);
> +
> +       if (mt76_connac_pm_wake(mphy, &dev->pm))
> +               return;
> +
> +       mt7925_mac_update_chan_time(mphy->priv, false);
> +       mt76_connac_power_save_sched(mphy, &dev->pm);
> +}
> +EXPORT_SYMBOL_GPL(mt7925_update_channel);
> +
>  static void
>  mt7925_vif_connect_iter(void *priv, u8 *mac,
>                         struct ieee80211_vif *vif)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 22cc5b49da0a..393c225c19e4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -351,6 +351,7 @@ int __mt7925_start(struct mt792x_phy *phy)
>                 return err;
>
>         mt792x_mac_reset_counters(phy);
> +       mt7925_mac_update_chan_time(phy, true);
>         set_bit(MT76_STATE_RUNNING, &mphy->state);
>
>         ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index f299a3379adb..b741a4880cfe 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -1057,6 +1057,76 @@ int mt7925_mcu_get_temperature(struct mt792x_phy *=
phy)
>         return temperature;
>  }
>
> +int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool a=
dd)
> +{
> +       enum {
> +               IDX_BUSY_TIME,
> +               IDX_TX_TIME,
> +               IDX_RX_TIME,
> +               IDX_NUM
> +       };
> +       struct {
> +               struct {
> +                       u8 band;
> +                       u8 __rsv[3];
> +               } hdr;
> +               struct {
> +                       __le16 tag;
> +                       __le16 len;
> +                       __le32 offs;
> +               } data[IDX_NUM];
> +       } __packed req =3D {
> +               .hdr.band =3D band,
> +       };
> +       static const u32 offs[] =3D {
> +               [IDX_BUSY_TIME] =3D UNI_MIB_BUSY_TIME,
> +               [IDX_TX_TIME] =3D UNI_MIB_TX_TIME,
> +               [IDX_RX_TIME] =3D UNI_MIB_RX_TIME,
> +       };
> +       struct mt76_channel_state *state =3D phy->mt76->chan_state;
> +       struct mt76_channel_state *state_ts =3D &phy->state_ts[band];
> +       struct mt792x_dev *dev =3D phy->dev;
> +       struct mt7925_mcu_mib *res;
> +       struct sk_buff *skb;
> +       int i, ret;
> +
> +       for (i =3D 0; i < IDX_NUM; i++) {
> +               req.data[i].tag =3D cpu_to_le16(UNI_CMD_MIB_DATA);
> +               req.data[i].len =3D cpu_to_le16(sizeof(req.data[i]));
> +               req.data[i].offs =3D cpu_to_le32(offs[i]);
> +       }
> +
> +       ret =3D mt76_mcu_send_and_get_msg(&dev->mt76,
> +                                       MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO=
),
> +                                       &req, sizeof(req), true, &skb);
> +       if (ret)
> +               return ret;
> +       if (skb->len < sizeof(req.hdr) + IDX_NUM * sizeof(*res)) {
> +               dev_kfree_skb(skb);
> +               return -EINVAL;
> +       }
> +
> +       skb_pull(skb, sizeof(req.hdr));
> +       res =3D (struct mt7925_mcu_mib *)skb->data;
> +
> +       if (!add)
> +               goto out;
> +
> +#define __res_u64(s) le64_to_cpu(res[s].data)
> +       state->cc_busy +=3D __res_u64(IDX_BUSY_TIME) - state_ts->cc_busy;
> +       state->cc_tx +=3D __res_u64(IDX_TX_TIME) - state_ts->cc_tx;
> +       state->cc_rx +=3D __res_u64(IDX_RX_TIME) - state_ts->cc_rx;
> +out:
> +       state_ts->cc_busy =3D __res_u64(IDX_BUSY_TIME);
> +       state_ts->cc_tx =3D __res_u64(IDX_TX_TIME);
> +       state_ts->cc_rx =3D __res_u64(IDX_RX_TIME);
> +#undef __res_u64
> +
> +       dev_kfree_skb(skb);
> +
> +       return 0;
> +}
> +
>  static void
>  mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.h
> index 11f9eac13ffc..f3e892dbb74c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> @@ -57,6 +57,23 @@ struct mt7925_mcu_reg_event {
>         __le32 val;
>  } __packed;
>
> +enum {
> +       UNI_CMD_MIB_DATA,
> +};
> +
> +enum {
> +       UNI_MIB_BUSY_TIME =3D 19,
> +       UNI_MIB_RX_TIME =3D 20,
> +       UNI_MIB_TX_TIME =3D 28,
> +};
> +
> +struct mt7925_mcu_mib {
> +       __le16 tag;
> +       __le16 len;
> +       __le32 offs;
> +       __le64 data;
> +} __packed;
> +
>  struct mt7925_mcu_ant_id_config {
>         u8 ant_id[4];
>  } __packed;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers=
/net/wireless/mediatek/mt76/mt7925/mt7925.h
> index 636efe038392..706e67e8ec42 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> @@ -375,6 +375,9 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, st=
ruct ieee80211_vif *vif,
>  int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
>                               struct ieee80211_chanctx_conf *ctx);
>  int mt7925_mcu_get_temperature(struct mt792x_phy *phy);
> +int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool a=
dd);
> +void mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset);
> +void mt7925_update_channel(struct mt76_phy *mphy);
>
>  int mt7925_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr=
,
>                                    enum mt76_txq_id qid, struct mt76_wcid=
 *wcid,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 0d477dc1086c..939a46c0428b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -604,7 +604,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>                 .sta_add =3D mt7925_mac_sta_add,
>                 .sta_event =3D mt7925_mac_sta_event,
>                 .sta_remove =3D mt7925_mac_sta_remove,
> -               .update_survey =3D mt792x_update_channel,
> +               .update_survey =3D mt7925_update_channel,
>         };
>         static const struct mt792x_hif_ops mt7925_pcie_ops =3D {
>                 .init_reset =3D mt7925e_init_reset,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/usb.c
> index f97f787b2198..2d3bf035fdfc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> @@ -174,7 +174,7 @@ static int mt7925u_probe(struct usb_interface *usb_in=
tf,
>                 .sta_add =3D mt7925_mac_sta_add,
>                 .sta_event =3D mt7925_mac_sta_event,
>                 .sta_remove =3D mt7925_mac_sta_remove,
> -               .update_survey =3D mt792x_update_channel,
> +               .update_survey =3D mt7925_update_channel,
>         };
>         static const struct mt792x_hif_ops hif_ops =3D {
>                 .mcu_init =3D mt7925u_mcu_init,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wi=
reless/mediatek/mt76/mt792x.h
> index a7d71e007da0..3ee513258d00 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
> @@ -221,6 +221,7 @@ struct mt792x_phy {
>         u32 ampdu_ref;
>
>         struct mt76_mib_stats mib;
> +       struct mt76_channel_state state_ts[2];
>
>         u8 sta_work_count;
>         u8 clc_chan_conf;
> --
> 2.56.0
>



On Fri, Oct 23, 2026 at 2:05 PM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
> Chris, here's the RFC you asked about. Busy time now follows the load
> and stays under the time on the channel, hopping every half second too.
[...]
> Could you try it on your A9000 against the Wi-Spy?

Thanks, Devin. It works here.

A9000 (mt7925u on USB 2.0), Ubuntu 7.0.0-38-generic, WM firmware
20260605184805 from Ubuntu's linux-firmware 20260319 (not the
2026-10-20 release), built out of tree from Ubuntu's mt76 source on
top of your survey v2. Ubuntu's 7.0 has no MT7927, so I dropped the
is_mt7927() block and the chan local it used; the rest is as sent.

Monitor mode, no association, 98 channels at 500 ms dwell, survey read
every ~5 s, 102 minutes: 8596 per-channel updates, none with busy over
active time, none going backwards. Quiet 6 GHz channels read 0.1-0.3%.
Without the patch the same setup gave 6013% on one channel. No MCU
timeouts or resets.

Load was a phone on a 2.4 GHz AP on channel 1 playing 2160p video.
Busy as a share of time on the channel, next to the Wi-Spy DBx2's RF
occupancy (bins 6 dB over its floor):

                              hopping                  locked on ch 1
                           busy      Wi-Spy     busy    Wi-Spy
  normal air         41.9%   71.4%       50.8%   69.1%
  2160p video     57.2%   85.5%       69.4%   85.0%

The Wi-Spy counts any energy, so it reads higher on 2.4 GHz, but the
two move together, and channels 2-5 rose with the load on both. On
5 GHz the Wi-Spy is the weaker of the two (3-16% on busy channels where
busy reads 13-32%), and busy stays above the airtime of the frames I
can decode there, as it should.

One thing on offset 20: in monitor mode it doesn't look like all of
rx. On busy 5 GHz channels it mostly reads under 2% while the frames I
decode alone take 13-19% (ch 149: 1.6% vs 19.1%), yet on 2.4 GHz
channels 2-4, between the networks on 1 and 6, it is nearly all of
busy (22-25%) with almost nothing decodable there. It does follow load
(ch 1 locked: 29% -> 55%). Busy doesn't depend on it, but MediaTek may
know what it counts. tx stays 0, as it should with nothing sent.

Tested-by: Chris Kelly <hoopyfrood42@gmail.com>

Chris

