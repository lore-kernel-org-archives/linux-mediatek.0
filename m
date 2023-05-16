Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864F8C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTLDBa47+3qcjoa/37oDRBh0MwmCoV0TDGpJkJdT+dM=; b=Tqhu2A9OidIhfxmBGlluHuv+eD
	8VVN7Tdi+moM6UQ9+4x0MiCva+baUd6jCLOLMQT9e0VY820E7cQ7l0ofE2KofYECvz8eqE8KDFsQt
	Z4hZdTCJXn3ih8b6dPAxSbjurdO2YlFhJq/PdlqqBjnTl9id3DrU5rfAFzxKEyZcka1/xMejwCNnh
	cju4K7VvnaX2vyo+LclWPpv93VEwGDJB3Fui3QMeFGbh093TCIkiJPg0LoVhjag2CrLMU8xK7bcUT
	D0jYZen26080vxEiqkNHfB69EVt87H/2/uxFyiceUjbVyip3l3pLDLgJWkv17L0c9PxUEm85nqw7G
	jhx0vkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1ES-00737n-1c;
	Tue, 16 May 2023 20:25:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1EQ-00736w-09
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 20:25:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1277B63F5E
	for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 20:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22535C43442
	for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 20:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684268712;
	bh=aUPUoCS3ojzfEzlZ0+UF8Qt4isEJMeLDxZrZU/9jNg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mEREOKpKsWPL9ZleFEoERgM8Y6yrIfHWTOHjzpbwRY5VEgQXlhSnhFNPpu9ZhJ64X
	 22y9D/26kgsLcyoG2xKv8NrwdHnCmac1+pjvdBFeRAyG5d6SoubVw5OmXv1UhHivgc
	 WjFQP/EhsAGcRFe4WvUQ2od5L0sCUiVc8JLR74MyrGV9yTh92dnxaWgB1iup0xtvb6
	 7Hz5FiA9rHJT9KYxuRdW99XxGvfMHllHqTMdxCBPAInL6vuv89PN0lywbnzoasaVLN
	 rDO2sspf6k+ZVRVcCy72VFyAOqP9SFDUqrwjnYFDiVtWdlOMUSuwaP9xbyItMhOHTT
	 SHZ333ion6RhA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2aed75dbdddso5215121fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 13:25:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDxBRrRbfrobMGf+fG3fnzFJTiB7fA98AQ+lyLkcDDXI846u3E8H
	okKKjR4I9Jl27fZJyG6wufI/AauLR5tSA2RiWK8=
X-Google-Smtp-Source: ACHHUZ63qHyU91RG5+/VwDRcrFKwzjOoXCjyBQX78Eolrfz4f4g7HulPDyKoASvSVvgm9vQ1nERmfttjdrNPeCbMrOA=
X-Received: by 2002:ac2:44d3:0:b0:4f1:410b:ee7a with SMTP id
 d19-20020ac244d3000000b004f1410bee7amr108919lfm.3.1684268710099; Tue, 16 May
 2023 13:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <cc4ae6f7545cdf0615279890521b11774f062add.1683925801.git.objelf@gmail.com>
 <850ac832598f9d8558996fade7f7db0c0cf73521.1683925801.git.objelf@gmail.com> <CABBYNZLxgaNzj3dgPbhsnojVP25OeGLVdbv6vUXdyMhyvkjZGA@mail.gmail.com>
In-Reply-To: <CABBYNZLxgaNzj3dgPbhsnojVP25OeGLVdbv6vUXdyMhyvkjZGA@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 16 May 2023 13:24:56 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpXp8T2-ZwNzX3pn3eG5MPedqVO0Z_5gikmfgHEQdwiXg@mail.gmail.com>
Message-ID: <CAGp9LzpXp8T2-ZwNzX3pn3eG5MPedqVO0Z_5gikmfgHEQdwiXg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] Bluetooth: btusb: mediatek: add MediaTek
 devcoredump support
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com, 
	chris.lu@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, jenhao.yang@mediatek.com, 
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com, 
	jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com, 
	michaelfsun@google.com, abhishekpandit@chromium.org, mcchou@chromium.org, 
	shawnku@google.com, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jing Cai <jing.cai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_132514_194419_DC42DDA7 
X-CRM114-Status: GOOD (  41.40  )
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

Hi Luiz,

On Mon, May 15, 2023 at 12:08=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sean,
>
> On Fri, May 12, 2023 at 2:20=E2=80=AFPM <sean.wang@mediatek.com> wrote:
> >
> > From: Jing Cai <jing.cai@mediatek.com>
> >
> > This patch implement function .coredump() and dmp_hdr() in btusb
> > driver for MediaTek controller.  FW core dump was triggered by FW
> > specific event to show something unexpected happened in the controller.
> >
> > The driver would be responsible for collecting and uploading the device
> > core dump pieces in hci driver using core dump API. Once we finished
> > the whole process, the driver would reset the controller to recover the
> > kind of fatal error.
> >
> > Co-developed-by: Chris Lu <chris.lu@mediatek.com>
> > Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> > Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Jing Cai <jing.cai@mediatek.com>
> > ---
> > v2, v3: rebase onto the latest codebase
> > v4: update the newest API usage for the coredump which was already
> >     into the upstream
> > v5: support devcoredump on hdev basis
> > v6: reuse the coredump state HCI_DEVCOREDUMP_* in driver
> >     and drop the driver name copying
> > ---
> >  drivers/bluetooth/btmtk.c | 106 ++++++++++++++++++++++++++++++++++++++
> >  drivers/bluetooth/btmtk.h |  27 ++++++++++
> >  drivers/bluetooth/btusb.c |  14 +++++
> >  3 files changed, 147 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> > index ac2fac7e3c5f..60233afc0a9c 100644
> > --- a/drivers/bluetooth/btmtk.c
> > +++ b/drivers/bluetooth/btmtk.c
> > @@ -53,6 +53,56 @@ struct btmtk_section_map {
> >         };
> >  } __packed;
> >
> > +static void btmtk_coredump(struct hci_dev *hdev)
> > +{
> > +       int err;
> > +
> > +       err =3D __hci_cmd_send(hdev, 0xfd5b, 0, NULL);
> > +       if (err < 0)
> > +               bt_dev_err(hdev, "Coredump failed (%d)", err);
> > +}
> > +
> > +static void btmtk_coredump_hdr(struct hci_dev *hdev, struct sk_buff *s=
kb)
> > +{
> > +       struct btmtk_data *data =3D hci_get_priv(hdev);
> > +       char buf[80];
> > +
> > +       snprintf(buf, sizeof(buf), "Controller Name: 0x%X\n",
> > +                data->cd_info.dev_id);
> > +       skb_put_data(skb, buf, strlen(buf));
> > +
> > +       snprintf(buf, sizeof(buf), "Firmware Version: 0x%X\n",
> > +                data->cd_info.fw_version);
> > +       skb_put_data(skb, buf, strlen(buf));
> > +
> > +       snprintf(buf, sizeof(buf), "Driver: %s\n",
> > +                data->cd_info.driver_name);
> > +       skb_put_data(skb, buf, strlen(buf));
> > +
> > +       snprintf(buf, sizeof(buf), "Vendor: MediaTek\n");
> > +       skb_put_data(skb, buf, strlen(buf));
> > +}
> > +
> > +static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
> > +{
> > +       struct btmtk_data *data =3D hci_get_priv(hdev);
> > +
> > +       switch (state) {
> > +       case HCI_DEVCOREDUMP_IDLE:
> > +               data->cd_info.state =3D HCI_DEVCOREDUMP_IDLE;
> > +               break;
> > +       case HCI_DEVCOREDUMP_ACTIVE:
> > +               data->cd_info.state =3D HCI_DEVCOREDUMP_ACTIVE;
> > +               break;
> > +       case HCI_DEVCOREDUMP_TIMEOUT:
> > +       case HCI_DEVCOREDUMP_ABORT:
> > +       case HCI_DEVCOREDUMP_DONE:
> > +               data->cd_info.state =3D HCI_DEVCOREDUMP_IDLE;
> > +               btmtk_reset_sync(hdev);
> > +               break;
> > +       }
> > +}
> > +
> >  int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname=
,
> >                               wmt_cmd_sync_func_t wmt_cmd_sync)
> >  {
> > @@ -295,6 +345,62 @@ void btmtk_reset_sync(struct hci_dev *hdev)
> >  }
> >  EXPORT_SYMBOL_GPL(btmtk_reset_sync);
> >
> > +int btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id,
> > +                            const char *name, u32 fw_version)
> > +{
> > +       struct btmtk_data *data =3D hci_get_priv(hdev);
> > +
> > +       if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
> > +               return -EOPNOTSUPP;
> > +
> > +       data->cd_info.dev_id =3D dev_id;
> > +       data->cd_info.fw_version =3D fw_version;
> > +       data->cd_info.state =3D HCI_DEVCOREDUMP_IDLE;
> > +       data->cd_info.driver_name =3D name;
> > +
> > +       return hci_devcd_register(hdev, btmtk_coredump, btmtk_coredump_=
hdr,
> > +                                 btmtk_coredump_notify);
> > +}
> > +EXPORT_SYMBOL_GPL(btmtk_register_coredump);
> > +
> > +int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
> > +{
> > +       struct btmtk_data *data =3D hci_get_priv(hdev);
> > +       int err;
> > +
> > +       if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
> > +               return 0;
> > +
> > +       switch (data->cd_info.state) {
> > +       case HCI_DEVCOREDUMP_IDLE:
> > +               err =3D hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
> > +               if (err < 0)
> > +                       break;
> > +               /* It is supposed coredump can be done within 5 seconds=
 */
> > +               schedule_delayed_work(&hdev->dump.dump_timeout,
> > +                                     msecs_to_jiffies(5000));
> > +               fallthrough;
> > +       case HCI_DEVCOREDUMP_ACTIVE:
> > +       default:
> > +               err =3D hci_devcd_append(hdev, skb);
> > +               if (err < 0)
> > +                       break;
> > +
> > +               if (skb->len > 12 &&
> > +                   !strncmp((char *)&skb->data[skb->len - 13],
> > +                            MTK_COREDUMP_END, 12))
> > +                       hci_devcd_complete(hdev);
>
> This is a bad idea, not only it is inefficient since you have to
> compare the end after each append but it also assumes the size of
> MTK_COREDUMP_END to be 12, so Id scrap this code and probably use the
> return of hci_devcd_append or have the code in hci_devcd_append detect
> it has reached the end.

MTK_COREDUMP_END is a unique string of exactly 12 characters. It acts
as a critical marker, signifying the end of the MTK core dump. This
flag is guaranteed to be present in every instance of an MTK core
dump. Also, MTK_COREDUMP_END must take the last position in the core
dump, emphasizing its importance. While this method might be a bit
inefficient, which doesn't happen usually but also it provides an only
accurate way to determine the conclusion of an MTK core dump.
>
> > +
> > +               break;
> > +       }
> > +
> > +       if (err < 0)
> > +               kfree_skb(skb);
> > +
> > +       return err;
> > +}
> > +EXPORT_SYMBOL_GPL(btmtk_process_coredump);
> > +
> >  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
> >  MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
> >  MODULE_DESCRIPTION("Bluetooth support for MediaTek devices ver " VERSI=
ON);
> > diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> > index 6245662f6ccb..852a67db8f80 100644
> > --- a/drivers/bluetooth/btmtk.h
> > +++ b/drivers/bluetooth/btmtk.h
> > @@ -21,6 +21,9 @@
> >  #define MT7921_DLSTATUS 0x7c053c10
> >  #define BT_DL_STATE BIT(1)
> >
> > +#define MTK_COREDUMP_SIZE              (1024 * 1000)
> > +#define MTK_COREDUMP_END               "coredump end"
> > +
> >  enum {
> >         BTMTK_WMT_PATCH_DWNLD =3D 0x1,
> >         BTMTK_WMT_TEST =3D 0x2,
> > @@ -119,12 +122,20 @@ struct btmtk_hci_wmt_params {
> >         u32 *status;
> >  };
> >
> > +struct btmtk_coredump_info {
> > +       const char *driver_name;
> > +       u32 dev_id;
> > +       u32 fw_version;
> > +       int state;
> > +};
> > +
> >  typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
> >                                    struct btmtk_hci_wmt_params *);
> >
> >  typedef int (*btmtk_reset_sync_func_t)(struct hci_dev *, void *);
> >
> >  struct btmtk_data {
> > +       struct btmtk_coredump_info cd_info;
> >         btmtk_reset_sync_func_t reset_sync;
> >  };
> >
> > @@ -139,6 +150,11 @@ int btmtk_setup_firmware(struct hci_dev *hdev, con=
st char *fwname,
> >                          wmt_cmd_sync_func_t wmt_cmd_sync);
> >
> >  void btmtk_reset_sync(struct hci_dev *hdev);
> > +
> > +int btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const ch=
ar *name,
> > +                            u32 fw_version);
> > +
> > +int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
> >  #else
> >
> >  static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
> > @@ -162,4 +178,15 @@ static int btmtk_setup_firmware(struct hci_dev *hd=
ev, const char *fwname,
> >  static void btmtk_reset_sync(struct hci_dev *hdev)
> >  {
> >  }
> > +
> > +static int btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, c=
onst char *name,
> > +                            u32 fw_version)
> > +{
> > +       return -EOPNOTSUPP;
> > +}
> > +
> > +static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff=
 *skb)
> > +{
> > +       return -EOPNOTSUPP;
> > +}
> >  #endif
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 034edd8ad777..1c2a0cbcf62e 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -3035,6 +3035,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
> >         }
> >
> >         btmtk_data->reset_sync =3D btusb_mtk_reset_work;
> > +       err =3D btmtk_register_coredump(hdev, dev_id, btusb_driver.name=
,
> > +                               fw_version);
> > +       if (err < 0)
> > +               bt_dev_err(hdev, "Failed to register coredump (%d)", er=
r);
> >
> >         switch (dev_id) {
> >         case 0x7663:
> > @@ -3189,6 +3193,7 @@ static int btusb_recv_acl_mtk(struct hci_dev *hde=
v, struct sk_buff *skb)
> >  {
> >         struct btusb_data *data =3D hci_get_drvdata(hdev);
> >         u16 handle =3D le16_to_cpu(hci_acl_hdr(skb)->handle);
> > +       struct sk_buff *skb_cd;
> >
> >         switch (handle) {
> >         case 0xfc6f:            /* Firmware dump from device */
> > @@ -3196,6 +3201,15 @@ static int btusb_recv_acl_mtk(struct hci_dev *hd=
ev, struct sk_buff *skb)
> >                  * suspend and thus disable auto-suspend.
> >                  */
> >                 usb_disable_autosuspend(data->udev);
> > +
> > +               /* We need to forward the diagnostic packet to userspac=
e daemon
> > +                * for backward compatibility, so we have to clone the =
packet
> > +                * extraly for the in-kernel coredump support.
> > +                */
> > +               skb_cd =3D skb_clone(skb, GFP_ATOMIC);
> > +               if (skb_cd)
> > +                       btmtk_process_coredump(hdev, skb_cd);
> > +
> >                 fallthrough;
> >         case 0x05ff:            /* Firmware debug logging 1 */
> >         case 0x05fe:            /* Firmware debug logging 2 */
> > --
> > 2.25.1
> >
>
>
> --
> Luiz Augusto von Dentz

