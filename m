Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1914BC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TpMc0b3pyWyJuGgY3DBaNK0zVX38FZH6XbZpO+2+qU=; b=n6UdwrihTm3jkpmd9ZKETZbcBh
	RjInC2dW7f4DodlXXESUCTU2yIFklZKLDTRxJMwLfLWuzmWn7yow2dyxKN+NyP1/7ObPJac//HdTK
	0ccPDYelGgJtFj2N52x7ig9FeJURDF2Ls5bgFrLnLyDqSciSym/p7jk+nyEzypBM/E0qBd1/PnmXZ
	Q1LIhFJJOu1aZ/VBtah1iH7MNWIYqaOEgA0y/KbQ8LWBLeTPJ7k3eFMafUxzh3TuwDhBPCk3wG7bE
	VVJpnVBwLEClEHOd+Tc4dOORk13ESRiyiCtXcSf9fu9j5fuCqJRILEMONQ89AkyA13XPOj1BbwXah
	lawiIOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHre-00000000jgt-0PbC;
	Thu, 18 Apr 2024 02:51:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHrY-00000000jgR-44uX
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 02:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A3EF61659
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 02:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953CCC4AF08
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713408658;
	bh=3Rc6752rBiGPr/0xv5ZCsFWyNqVQsj4KsbGFchAYx5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gJS8EQ/BmnbFiUwfoXAjRwo6hApEJnsqydF038OLMNXnK1JEPEjuL4hQ6elXgffSC
	 phxPICNCuuqItPnFQrez7sQP6gInIEDv9TAJZheGjrCuJr/MZszmm0V7l5x+aZFZCr
	 DieYyttO4OBffTnznTiGXdmNhdmdb18JoOoN2hQhAcVOAqSQFWqRUapmsNoG7oCgEC
	 d8TFvlOWd1ZnhfaNxgeYAtCxSazk71jUI2274n8fF5BbPLO79z7m4gvngx3cx5CeS9
	 JPbkL2ThM2PpR9bxgST0PvmY6pXF8eyDoFC7G/Tbgdl1KxwZqwXMk/uScXlzPhY0DP
	 dvw3z1hkenZkw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d8cbcc5d1fso334341fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 19:50:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YwMzNLE0kzkpnSa3vr67+mfhzXTOnZ/GUfxH/6EkWA76zHdq1x8
	nB51O3Urp06VzUcMlm+1cYdUGIAOCny171CAW4ZZMKG746IQoui29lVnWkLCyEC+ZYleKnddEw+
	VUCUO2KXxvK/knfCOc2Zm1m8TCs8=
X-Google-Smtp-Source: AGHT+IGUOvWaUZzO3Cqsw5rBu/1uEhhnaWW6uCRk/Vqkwg/ZtKgqBoU0TSeGs/4NOQfyZwTP/TUo0vnbwJ1YrDERKJg=
X-Received: by 2002:ac2:599d:0:b0:516:d6b5:7caf with SMTP id
 w29-20020ac2599d000000b00516d6b57cafmr514839lfn.6.1713408656259; Wed, 17 Apr
 2024 19:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <608cc2bb1c10c2f53a6bf26711bf49fe2c491e59.1712806947.git.quan.zhou@mediatek.com>
 <CAGp9LzqVGHGriqpC-NTnOtvNNz5o-hXD=HcTCptHfXBD9bnfPQ@mail.gmail.com> <37ab8a32893ea9a1cbc33b6dae26b57127ea4e16.camel@mediatek.com>
In-Reply-To: <37ab8a32893ea9a1cbc33b6dae26b57127ea4e16.camel@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Apr 2024 19:50:42 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzq6g8YQ=_eZHJX4qQjv-F2anGnPw8f88rHD2Vo1iwiGWg@mail.gmail.com>
Message-ID: <CAGp9Lzq6g8YQ=_eZHJX4qQjv-F2anGnPw8f88rHD2Vo1iwiGWg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7921e: add LED control support
To: =?UTF-8?B?UXVhbiBaaG91ICjlkajlhagp?= <Quan.Zhou@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2hlbmd4aSBYdSAo5b6Q6IOc5ZacKQ==?= <shengxi.xu@mediatek.com>, 
	=?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>, 
	=?UTF-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	=?UTF-8?B?SGFvIFpoYW5nICjlvKDmtakp?= <hao.zhang@mediatek.com>, 
	Ryder Lee <Ryder.Lee@mediatek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_195101_148398_5E90119C 
X-CRM114-Status: GOOD (  32.32  )
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

On Wed, Apr 17, 2024 at 6:43=E2=80=AFPM Quan Zhou (=E5=91=A8=E5=85=A8) <Qua=
n.Zhou@mediatek.com> wrote:
>
> On Wed, 2024-04-17 at 15:06 -0700, Sean Wang wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  HI Quan,
> >
> > On Wed, Apr 10, 2024 at 11:00=E2=80=AFPM Quan Zhou <quan.zhou@mediatek.=
com>
> > wrote:
> > >
> > > From: Hao Zhang <hao.zhang@mediatek.com>
> > >
> > > Introduce wifi LED switch control, add flow to Control a wifi
> > > gpio pin based on the status of WIFI radio, if the pin is connected
> > > to an LED, the LED will indicate the status of the WiFi radio.
> > >
> > > Signed-off-by: Hao Zhang <hao.zhang@mediatek.com>
> > > Co-developed-by: Quan Zhou <quan.zhou@mediatek.com>
> > > Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
> > > ---
> > > v2:
> > >  fix to avoid wake device when Hardware interface not pcie
> > > ---
> > >  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
> > >  .../net/wireless/mediatek/mt76/mt7921/main.c  | 27
> > ++++++++++++++++++-
> > >  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 14 ++++++++++
> > >  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  5 ++++
> > >  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  8 +++++-
> > >  5 files changed, 53 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > index 836cc4d5b1d2..4c2de556dee1 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > > @@ -1189,6 +1189,7 @@ enum {
> > >         MCU_EXT_CMD_EFUSE_ACCESS =3D 0x01,
> > >         MCU_EXT_CMD_RF_REG_ACCESS =3D 0x02,
> > >         MCU_EXT_CMD_RF_TEST =3D 0x04,
> > > +       MCU_EXT_CMD_ID_RADIO_ON_OFF_CTRL =3D 0x05,
> > >         MCU_EXT_CMD_PM_STATE_CTRL =3D 0x07,
> > >         MCU_EXT_CMD_CHANNEL_SWITCH =3D 0x08,
> > >         MCU_EXT_CMD_SET_TX_POWER_CTRL =3D 0x11,
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > index ca36de34171b..ea6a113b7b36 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > @@ -242,6 +242,15 @@ int __mt7921_start(struct mt792x_phy *phy)
> > >
> > >         ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
> > >                                      MT792x_WATCHDOG_TIME);
> > > +       if (mt76_is_mmio(mphy->dev)) {
> >
> > I guess the led control MCU command is not limited to PCIe devices,
> > they should be able to be extended even on MT7921 USB and SDIO
> > devices, right ? if so, I think we can drop the MMIO limitation
> > condition to support more scenarios and to make it easier to
> > understand.
> >
> Hi Sean,
>
> This software flow involves chip GPIO control and is related to the
> module's circuit design. Only the PCIe module can provide support for
> this, so can't drop.

Hi Quan,

Thanks for clearing that up quickly. I guess we can add it just for
MT7921E. I have another question: Will the new command you added work
with older firmware, or is it made only for the most recent firmware?
I'm worried it might not be compatible with the older MT7921 firmware.

                   Sean
>
> > > +               err =3D mt7921_mcu_radio_led_ctrl(phy->dev,
> > EXT_CMD_RADIO_LED_CTRL_ENABLE);
> > > +               if (err)
> > > +                       return err;
> > > +
> > > +               err =3D mt7921_mcu_radio_led_ctrl(phy->dev,
> > EXT_CMD_RADIO_ON_LED);
> > > +               if (err)
> > > +                       return err;
> > > +       }
> > >
> > >         return 0;
> > >  }
> > > @@ -259,6 +268,22 @@ static int mt7921_start(struct ieee80211_hw
> > *hw)
> > >         return err;
> > >  }
> > >
> > > +static void mt7921_stop(struct ieee80211_hw *hw)
> > > +{
> > > +       struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
> > > +       int err =3D 0;
> > > +
> > > +       if (mt76_is_mmio(&dev->mt76)) {
> > > +               mt792x_mutex_acquire(dev);
> > > +               err =3D mt7921_mcu_radio_led_ctrl(dev,
> > EXT_CMD_RADIO_OFF_LED);
> > > +               mt792x_mutex_release(dev);
> > > +               if (err)
> > > +                       return;
> > > +       }
> > > +
> > > +       mt792x_stop(hw);
> > > +}
> > > +
> > >  static int
> > >  mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif
> > *vif)
> > >  {
> > > @@ -1372,7 +1397,7 @@ static void mt7921_mgd_complete_tx(struct
> > ieee80211_hw *hw,
> > >  const struct ieee80211_ops mt7921_ops =3D {
> > >         .tx =3D mt792x_tx,
> > >         .start =3D mt7921_start,
> > > -       .stop =3D mt792x_stop,
> > > +       .stop =3D mt7921_stop,
> > >         .add_interface =3D mt7921_add_interface,
> > >         .remove_interface =3D mt792x_remove_interface,
> > >         .config =3D mt7921_config,
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > index 8b4ce32a2cd1..2ebf0ffe78d5 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > @@ -606,6 +606,20 @@ int mt7921_run_firmware(struct mt792x_dev
> > *dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(mt7921_run_firmware);
> > >
> > > +int mt7921_mcu_radio_led_ctrl(struct mt792x_dev *dev, u8 value)
> > > +{
> > > +       struct {
> > > +               u8 ctrlid;
> > > +               u8 rsv[3];
> > > +       } __packed req =3D {
> > > +               .ctrlid =3D value,
> > > +       };
> > > +
> > > +       return mt76_mcu_send_msg(&dev->mt76,
> > MCU_EXT_CMD(ID_RADIO_ON_OFF_CTRL),
> > > +                               &req, sizeof(req), false);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mt7921_mcu_radio_led_ctrl);
> > > +
> > >  int mt7921_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_vif
> > *vif)
> > >  {
> > >         struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif-
> > >drv_priv;
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > > index 3016636d18c6..07023eb9e5b5 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > > @@ -27,6 +27,10 @@
> > >  #define MCU_UNI_EVENT_ROC  0x27
> > >  #define MCU_UNI_EVENT_CLC  0x80
> > >
> > > +#define EXT_CMD_RADIO_LED_CTRL_ENABLE   0x1
> > > +#define EXT_CMD_RADIO_ON_LED            0x2
> > > +#define EXT_CMD_RADIO_OFF_LED           0x3
> > > +
> > >  enum {
> > >         UNI_ROC_ACQUIRE,
> > >         UNI_ROC_ABORT,
> > > @@ -196,6 +200,7 @@ int mt7921_mcu_fw_log_2_host(struct mt792x_dev
> > *dev, u8 ctrl);
> > >  void mt7921_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff
> > *skb);
> > >  int mt7921_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
> > >                             u8 bit_op, u32 bit_map);
> > > +int mt7921_mcu_radio_led_ctrl(struct mt792x_dev *dev, u8 value);
> > >
> > >  static inline u32
> > >  mt7921_reg_map_l1(struct mt792x_dev *dev, u32 addr)
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > index 0b69b225bc16..f768e9389ac6 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > @@ -427,6 +427,10 @@ static int mt7921_pci_suspend(struct device
> > *device)
> > >         wait_event_timeout(dev->wait,
> > >                            !dev->regd_in_progress, 5 * HZ);
> > >
> > > +       err =3D mt7921_mcu_radio_led_ctrl(dev,
> > EXT_CMD_RADIO_OFF_LED);
> > > +       if (err < 0)
> > > +               goto restore_suspend;
> > > +
> > >         err =3D mt76_connac_mcu_set_hif_suspend(mdev, true);
> > >         if (err)
> > >                 goto restore_suspend;
> > > @@ -525,9 +529,11 @@ static int mt7921_pci_resume(struct device
> > *device)
> > >                 mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
> > >
> > >         err =3D mt76_connac_mcu_set_hif_suspend(mdev, false);
> > > +       if (err < 0)
> > > +               goto failed;
> > >
> > >         mt7921_regd_update(dev);
> > > -
> > > +       err =3D mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_ON_LED);
> > >  failed:
> > >         pm->suspended =3D false;
> > >
> > > --
> > > 2.18.0
> > >
> > >

