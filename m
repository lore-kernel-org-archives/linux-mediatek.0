Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6198F55102
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Mar 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilRK9aPIvjZogcMjxFJcHbcMhn2TDRsdzjpXKO0xdU4=; b=0DxwHBmqDho1peeeYRDB+Hzx3b
	JuZwRJ6EkGG3YTmG3IOlJJb5elld//+lM675raTOaoP4tpUfXh7TalF0n7cn83kxlZ9dMHHQZXAEa
	ETBGrW6aCKC+jDxM40DZhaNRs+JblAg9yBYSfd/BU+0NIYH4IrbsrSYQ5dZPsXXtN+bebeJro+iqV
	qBsm76hbzBrckj2iAeWjpkcrMy2h/b6QyREN4MzPR3vlhiKeNigEcafod2qMTSLLZ4+lYL/z401U/
	7+/cB8MUdqe8nAUTV00+KpJJ5m369FdgeYuxjGA7Q8qlEJuVgEpWKbOF3Gc9GA8JHStju+irK5w5c
	fXpTiRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu7a-00000005LTQ-0TWo;
	Sat, 07 Mar 2026 16:03:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu7X-00000005LT5-2hix
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Mar 2026 16:03:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D650A40224
	for <linux-mediatek@lists.infradead.org>; Sat,  7 Mar 2026 16:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B625FC2BC9E
	for <linux-mediatek@lists.infradead.org>; Sat,  7 Mar 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772899394;
	bh=h3qZSjHG4685ymcHEEG49pAL0qpvRgdCJMgrCneaH/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hpTWYmTEM9imBEVAK++fkAXoedLU0u1zUDlqsGlgxcuiMXAk/q6Xjf6b2WVC1DeSP
	 rPXpHynZXUAfTXyKnhRnPvvFgQGO8agenDvHS8nBHOM1+/gcwmtiTF76eL8HSPUv4D
	 ec+ARVRwrd3ZATeRo2qHTFYPQzQO+6J7Ws6eIo4//gwcjYwLDkndTHkRpIM/1S/r02
	 cPY39HuWR7hZFGP0XdSzV0vSJqVqvCdLUR2fSod5MgCMBmH9H9M2q8YXYAi4cn8web
	 Xfu0aZ93QL4i+5C1k0wROMrmDz+2AGelVPOfEbx2FhenZUbWSJa6l4p1xaIXJXgU/q
	 Le2vDXofgbSRQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a4a8421b0so3496231fa.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Mar 2026 08:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwvOMo9THPuaVKK1BRwyeciQ51LltawlxJBseCVgv2L+IMVxe7aRy4y0cnr8OiSxXcBSsvOyC35cHOm1UafA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuqrZ4+BJ/WiBs5IJFGffwMD2xNYKce8kNMzdrncsk8FitHnnV
	St4nOCqNElWmdfyQl9ZPCGi8h744znyzr0Dp/bEypmoTkefDFSLi5PDJz5IZOk9Q1lRZR8VwiFW
	3hXzlSaZIqFZ1hR8M2prcABvh1tHRK2w=
X-Received: by 2002:a05:651c:50f:b0:38a:4df7:aeb3 with SMTP id
 38308e7fff4ca-38a4df7afa9mr1446861fa.11.1772899393033; Sat, 07 Mar 2026
 08:03:13 -0800 (PST)
MIME-Version: 1.0
References: <177272816248.352280.12453518046823439297@jetm.me> <20260305162928.5E8F11EA006C@mailuser.phl.internal>
In-Reply-To: <20260305162928.5E8F11EA006C@mailuser.phl.internal>
From: Sean Wang <sean.wang@kernel.org>
Date: Sat, 7 Mar 2026 10:03:02 -0600
X-Gmail-Original-Message-ID: <CAGp9Lzrysz8Tyh2KUMWVgHMsfUqojiJgPseG+CTULTqH=QQhaw@mail.gmail.com>
X-Gm-Features: AaiRm50Z5zLDAmRzmFDg9isAm_P-f83-g_hPMNKric6CZrYmyIJ7xGVQHUtqjc4
Message-ID: <CAGp9Lzrysz8Tyh2KUMWVgHMsfUqojiJgPseG+CTULTqH=QQhaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
To: Javier Tia <floss@jetm.me>
Cc: linux-bluetooth@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_080315_727500_77EB125B 
X-CRM114-Status: GOOD (  27.91  )
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

Hi Javier,

On Thu, Mar 5, 2026 at 10:33=E2=80=AFAM Javier Tia <floss@jetm.me> wrote:
>
> The MediaTek MT7927 (Filogic 380) combo WiFi 7 + BT 5.4 module uses
> hardware variant 0x6639 for its Bluetooth subsystem. Without this patch,
> the chip fails with "Unsupported hardware variant (00006639)" or hangs
> during firmware download.
>
> Three changes are needed to support MT6639:
>
> 1. Firmware naming: MT6639 uses firmware version prefix "2_1" instead of
>    "1_1" used by MT7925 and other variants. The firmware path is
>    mediatek/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin.
>
> 2. Section filtering: The MT6639 firmware binary contains 9 sections, but
>    only sections with (dlmodecrctype & 0xff) =3D=3D 0x01 are Bluetooth-re=
lated.
>    Sending the remaining WiFi/other sections causes an irreversible BT
>    subsystem hang requiring a full power cycle. This matches the Windows
>    driver behavior observed via USB captures.
>
> 3. Firmware persistence: MT6639 firmware persists across BT soft power
>    cycles (WMT_FUNC_CTRL=3D0 does not clear firmware). Skip re-download o=
n
>    subsequent setups to avoid a ~2.6s delay on each BT power toggle.
>
> Also add 0x6639 to the reset register (CONNV3) and firmware setup switch
> cases alongside the existing 0x7925 handling.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221096
> Link: https://github.com/openwrt/mt76/issues/927
> Assisted-by: Claude Code <noreply@anthropic.com> [claude-opus-4-6]
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
>  drivers/bluetooth/btmtk.c | 32 ++++++++++++++++++++++++++++++--
>  drivers/bluetooth/btmtk.h |  1 +
>  2 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 2507d587f28a..3821fde9e361 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -112,7 +112,11 @@ static void btmtk_coredump_notify(struct hci_dev *hd=
ev, int state)
>  void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ve=
r,
>                            u32 fw_flavor)
>  {
> -       if (dev_id =3D=3D 0x7925)
> +       if (dev_id =3D=3D 0x6639)
> +               snprintf(buf, size,
> +                        "mediatek/mt%04x/BT_RAM_CODE_MT%04x_2_%x_hdr.bin=
",
> +                        dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff=
) + 1);
> +       else if (dev_id =3D=3D 0x7925)
>                 snprintf(buf, size,
>                          "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin=
",
>                          dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff=
) + 1);
> @@ -130,6 +134,7 @@ EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
>  int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>                               wmt_cmd_sync_func_t wmt_cmd_sync)
>  {
> +       struct btmtk_data *data =3D hci_get_priv(hdev);
>         struct btmtk_hci_wmt_params wmt_params;
>         struct btmtk_patch_header *hdr;
>         struct btmtk_global_desc *globaldesc =3D NULL;
> @@ -166,6 +171,14 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, =
const char *fwname,
>                 section_offset =3D le32_to_cpu(sectionmap->secoffset);
>                 dl_size =3D le32_to_cpu(sectionmap->bin_info_spec.dlsize)=
;
>
> +               /* MT6639: only download sections where dlmode byte0 =3D=
=3D 0x01,
> +                * matching the Windows driver behavior which skips WiFi/=
other
> +                * sections that would cause the chip to hang.
> +                */

BT and WiFi use separate firmware.
I=E2=80=99m not sure why those WiFi sections are included in the binary.
Another concern is whether it is appropriate to upload the firmware
used in Windows to the linux-firmware repository,
The firmware files are probably intended for dedicated OEMs.

> +               if (data->dev_id =3D=3D 0x6639 && dl_size > 0 &&
> +                   (le32_to_cpu(sectionmap->bin_info_spec.dlmodecrctype)=
 & 0xff) !=3D 0x01)
> +                       continue;
> +
>                 if (dl_size > 0) {
>                         retry =3D 20;
>                         while (retry > 0) {
> @@ -852,7 +865,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 =
dev_id)
>                 if (err < 0)
>                         return err;
>                 msleep(100);
> -       } else if (dev_id =3D=3D 0x7925) {
> +       } else if (dev_id =3D=3D 0x7925 || dev_id =3D=3D 0x6639) {
>                 err =3D btmtk_usb_uhw_reg_read(hdev, MTK_BT_RESET_REG_CON=
NV3, &val);
>                 if (err < 0)
>                         return err;
> @@ -1339,9 +1352,20 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>         case 0x7925:
>         case 0x7961:
>         case 0x7902:
> +       case 0x6639:
>                 btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), d=
ev_id,
>                                       fw_version, fw_flavor);
>
> +               /* MT6639: firmware persists across BT soft power cycles
> +                * (shutdown only sends WMT_FUNC_CTRL=3D0). Skip re-downl=
oad
> +                * on subsequent setups to avoid ~2.6s delay.
> +                */

This is common logic for the other mediatek chips. It only takes
longer on the first power-on.

> +               if (dev_id =3D=3D 0x6639 &&
> +                   test_bit(BTMTK_FIRMWARE_LOADED, &btmtk_data->flags)) =
{
> +                       bt_dev_info(hdev, "MT6639: firmware already loade=
d, skipping download");
> +                       goto skip_fw_setup_79xx;
> +               }
> +
>                 err =3D btmtk_setup_firmware_79xx(hdev, fw_bin_name,
>                                                 btmtk_usb_hci_wmt_sync);
>                 if (err < 0) {
> @@ -1352,6 +1376,10 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>                         return err;
>                 }
>
> +               if (dev_id =3D=3D 0x6639)
> +                       set_bit(BTMTK_FIRMWARE_LOADED, &btmtk_data->flags=
);

If the firmware download is properly handled in
btmtk_setup_firmware_79xx, we don't need the extra bit.

> +
> +skip_fw_setup_79xx:
>                 /* It's Device EndPoint Reset Option Register */
>                 err =3D btmtk_usb_uhw_reg_write(hdev, MTK_EP_RST_OPT,
>                                               MTK_EP_RST_IN_OUT_OPT);
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index adaf385626ee..6645bcadb523 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -8,6 +8,7 @@
>  #define FIRMWARE_MT7902                "mediatek/BT_RAM_CODE_MT7902_1_1_=
hdr.bin"
>  #define FIRMWARE_MT7961                "mediatek/BT_RAM_CODE_MT7961_1_2_=
hdr.bin"
>  #define FIRMWARE_MT7925                "mediatek/mt7925/BT_RAM_CODE_MT79=
25_1_1_hdr.bin"
> +#define FIRMWARE_MT7927                "mediatek/mt6639/BT_RAM_CODE_MT66=
39_2_1_hdr.bin"
>
>  #define HCI_EV_WMT 0xe4
>  #define HCI_WMT_MAX_EVENT_SIZE         64
> --
> 2.53.0
>

