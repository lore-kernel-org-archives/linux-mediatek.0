Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EE3CDE009
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 18:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj+H8KyqSqZJemvQ7/+PsCTryvM5ixfErY6XCGM2XsE=; b=GrigvwlkWsmZy7vWr4kzckOsXX
	N7j6OKLbUHCJJ/rFGVR5wYHs07evxX1Zvtr6LKtfZmrhoA9njjktOKYOhLuRcG9QxQZ8cEe9K7uWY
	q7QF0285bVEmVDbnCyIw9DD399Jx7tEgohj+eR4KlBiOjifSI4RXZ0FN8ujmGVcQz7V+IZpTTCSrS
	948e2N+fkXMGvGz4XUZwXjlvbLuYaeRJ8Zjuvhoe/FbZpzIHoZ4DcNkmb1GPvXOwXcuQOS5jmnQlz
	+R5TaudpKNQFbq0LF+/jR9l1AqAgO0PRL7Kze1lqMTfRUr8D/VMnQE51t92XLq73XbrtztPGxsKxH
	SZVgAbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoxo-00000009h5r-2f27;
	Thu, 25 Jun 2026 18:38:12 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoxl-00000009h5M-1D0C
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 18:38:11 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-663b9826fecso199156d50.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 11:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782412687; cv=none;
        d=google.com; s=arc-20260327;
        b=cjk/YHdDh+oxYRNGpfj3JRtosTvpCj59GbxWkMuHN2dYGzdDoJQqYxkqGJspWseDV5
         DskLNOp9mKPF2+FYXW8pv6sEXjmq9D5vGIWIZkO+CG+sYhiImNsgEZoYcl32TwP9kSX4
         y/9x47TT5bPEwhdacodwz3/kRYWwOiIxqDf30hExdkhH48roFQ/HO//Q/SmAdvSrbMB6
         VWFK33ddLAz3eSSjXqdbGHI04Z2DLb/slYzeaJV7sbM2E0h8X8/WmoPCDQ4xpoBZIAge
         S6gUyum/hg6n0VYW/ACd0BjpihjKRKSssYiTMV17Sv/YP//03yP5Ked+9UaBGx8Qc+RB
         Y9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bj+H8KyqSqZJemvQ7/+PsCTryvM5ixfErY6XCGM2XsE=;
        fh=8fqU8FvIRh/6Vqu7JeZl5EjJ+zlwDJD7GL/FrESnNz0=;
        b=NYhXMZOFwUXoF2tN1haD2xxpHVV+5fUa4O0TECeg7x7dxo2/8hNCzKkdEpMOp7Ef4I
         ooKyZXdilEOYB7aj12y8MnRZGQCtYtymSlz+LMMCuKufZNowblyftHvvMU177DAIzVma
         lqcjmTuYx51RVLqkp5yyrxRR5QC2ilZUVenFK5URNcgmHMYy+Ytbr7cxpNniDgQVoO1N
         7X/cTs/sUh5PJfKjrNymM6NaLZKmLWjrS7ElcnTV0xMppo5lp1wC7bOfeFdGXhGDvjlP
         NZj1p6ZHY04lYNiST2BHRsr7IqGdQp0eCnciFZB2PQwfgHCKlKZufwKCuelV+i94a83Z
         CATg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782412687; x=1783017487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj+H8KyqSqZJemvQ7/+PsCTryvM5ixfErY6XCGM2XsE=;
        b=IJuNgY4BKTvFv1iypiHQN9AS3iM/i5ne7ZurxBGVzs2DlQSOV4Ovo1Rt8ZhkjxKR4o
         UeKPrLMqFg0JYp8Jim2icxxiiSnkWk+96/ldHpcTNlQzplz0Pmu33jHITua1EQDT/yff
         XyJJ2R65KD1iJzf0LYWhwjVWIjeFl8slfSF/ge+eAm8AgQsNBT4chRmcOXH4ycQL8xRT
         b06B+jSOJjWHqrE8zTwSh3l6kqvkrm/97dXKfEMnszJdwf5QhVpy0FYDuCzdklMrHfVA
         +nDX2wkPeg5Jw7rSHmsZmQwwTLWzMV+9CzhSs2IHj3GpuE2uJtqqcBHp8uOy8nNJSj8n
         lrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412687; x=1783017487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bj+H8KyqSqZJemvQ7/+PsCTryvM5ixfErY6XCGM2XsE=;
        b=sY+RMSKcIaAbGjJF9+MZPlzjlvNMrecWmyuRpUzf5KSWePuu7+6NpoRev49q4PAZvZ
         JRIA/J/0F2qThI3rsGN70VczZ+MzZW+fU5USBrJXv1q7qeD6bCXmp06Cr1XiM4HvYx4V
         LxHUVRdgKGJoSlss58gr/jftXO0lBjXqjEsJRTDw/Vlo0n1dVayF0EzPMurTZm4/IR43
         ifpEWVS9yU+pa6aJoYg786SnznJW2jO+tyvMoLLGLPOGjaJz6hKOJzF1PzXiHx+QpQNH
         rF8/5/+L6JDzEJIZ0yIU/xrMCOnzT6W2LwUiBuHJc4rGs7jttaXOfG+lq2rYxG641tVP
         g9Lw==
X-Forwarded-Encrypted: i=1; AHgh+RpqrMkyPXZ3BmG4oSZDqfmi4ww5q7uUuKKJYLGBbTRXt0V/VGY6b0qZa2/odzPHhy6opOaZgwK5h50Qtjh3LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQzxINZmYoCuCXpetfVA224tmkd/5UxHFHxbu6apjVvLNeOzFl
	z0/JUyFvFP3N4rtzq24+ZhL9CEjyIaf2lD22fuQBADu4kUa8nAv+KLkId7bLOh5suHfyxalRLgP
	0d5yvQjxhKwIo4/56X8Q1bdi5b0ZcnNk=
X-Gm-Gg: AfdE7ckMxTcbSkmgunjUpGjn9XgCS1hMLfcQwGX9VY3jIDmSYCMZDq+fPeFduNioymH
	Fk5jfGp7zOsp1TwDcUy60u9RQagDkPVP3vW+hELKLa9pFJMqa/xZAedQfvxzUkaICJnrWVqnKg2
	76XbafomTcO2uzGKXUwxEf4DjyHZqlL1YUuL4TOHB/p7nQYb88H2AtK7+BUps7rI4R8CfYMd5aN
	8LI8nE4zwsMwLB5Iex4C5bY1s7gQy/7ywZFf8tc0XttMU/p4grGp3jypBmqb6csnx02s/M9lXzp
	T5ZrfJmpKeBhCLxUVc09MoKT2QnXLrUvqjD9FoGKiOz5HwDWdMcqSEADk6M=
X-Received: by 2002:a05:690e:bc5:b0:662:e60e:c64d with SMTP id
 956f58d0204a3-66487e66e64mr3055298d50.60.1782412686983; Thu, 25 Jun 2026
 11:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260624075505.1318804-1-chris.lu@mediatek.com> <20260624075505.1318804-4-chris.lu@mediatek.com>
In-Reply-To: <20260624075505.1318804-4-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 25 Jun 2026 14:37:56 -0400
X-Gm-Features: AVVi8CcSVHHZu_oc-Fw56cPbLv6uQyk2gutBATSnej4XAyrGkPeisStV2zybtbY
Message-ID: <CABBYNZ+yLUnQrcecDBMGGL5VmvgmOjqJ=v82iicp1e6PCoXhcw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Bluetooth: btmtk: Add MT7928 support
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_113809_421706_64E5F182 
X-CRM114-Status: GOOD (  27.95  )
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

Hi Chris,

On Wed, Jun 24, 2026 at 3:57=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Add support for MT7928 (internal device ID is MT7935) which requires
> additional firmware (CBMCU firmware) loading before Bluetooth firmware.
>
> CBMCU is a new component on MT7928 to handle common part shared across
> the combo chip (Wi-Fi/Bluetooth's subsystem), providing a better user
> experience through improved coordination between subsystems.
>
> Implement two-phase CBMCU firmware download: Phase 1 loads section with
> type 0x5 containing global descriptor, section maps and signature data;
> Phase 2 loads remaining firmware sections. Add retry mechanism for
> concurrent download protection.
>
> After CBMCU firmware loads successfully, the driver continues to load
> corresponding BT firmware based on device ID through fallthrough to
> case 0x7922/0x7925.
>
> The firmware(CBMCU_CODE_MT7935_1_1.bin/BT_RAM_CODE_MT7935_1_1_hdr.bin)
> required for MT7928 will be scheduled for upload to linux-firmware at
> a later stage.
>
> MT7928 bring-up kernel log:
> [  159.784050] usb 1-3: New USB device found, idVendor=3D0e8d, idProduct=
=3D7935, bcdDevice=3D 1.00
> [  159.784107] usb 1-3: New USB device strings: Mfr=3D5, Product=3D6, Ser=
ialNumber=3D7
> [  159.784140] usb 1-3: Product: Wireless_Device
> [  159.784166] usb 1-3: Manufacturer: MediaTek Inc.
> [  159.784192] usb 1-3: SerialNumber: 000000000
> [  159.795736] Bluetooth: hci1: Loading CBMCU firmware: mediatek/mt7928/C=
BMCU_CODE_MT7935_1_1.bin
> [  159.807197] Bluetooth: hci1: CBMCU HW ver: 0x7935, SW ver: 0x0000, Bui=
ld Time: 20260601T161751+0800
> [  160.123155] Bluetooth: hci1: CBMCU firmware download completed
> [  160.143013] Bluetooth: hci1: Loading BT firmware: mediatek/mt7928/BT_R=
AM_CODE_MT7935_1_1_hdr.bin
> [  160.152775] Bluetooth: hci1: BT HW ver: 0x7935, SW ver: 0x0000, Build =
Time: 20260527000816
> [  163.242266] Bluetooth: hci1: Device setup in 3367430 usecs
> [  163.242280] Bluetooth: hci1: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [  163.355900] Bluetooth: hci1: AOSP extensions version v2.00
> [  163.355956] Bluetooth: hci1: AOSP quality report is supported
> [  163.357902] Bluetooth: MGMT ver 1.23
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Reviewed-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 355 +++++++++++++++++++++++++++++++++++++-
>  drivers/bluetooth/btmtk.h |   3 +
>  2 files changed, 357 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index dc40820bfea0..1b08db862c20 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -21,6 +21,12 @@
>  #define MTK_FW_ROM_PATCH_SEC_MAP_SIZE  64
>  #define MTK_SEC_MAP_COMMON_SIZE        12
>  #define MTK_SEC_MAP_NEED_SEND_SIZE     52
> +#define MTK_SEC_MAP_LENGTH_SIZE        4
> +#define MTK_SEC_CBMCU_DESC     0x5
> +
> +/* CBMCU WMT command flags */
> +#define BTMTK_CBMCU_FLAG_QUERY_STATUS  0xF0
> +#define BTMTK_CBMCU_FLAG_ENABLE_PATCH  0xF1
>
>  /* It is for mt79xx iso data transmission setting */
>  #define MTK_ISO_THRESHOLD      264
> @@ -120,6 +126,11 @@ void btmtk_fw_get_filename(char *buf, size_t size, u=
32 dev_id, u32 fw_ver,
>                 snprintf(buf, size,
>                          "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin=
",
>                          dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff=
) + 1);
> +       /* MT7928 */
> +       else if (dev_id =3D=3D 0x7935)
> +               snprintf(buf, size,
> +                        "mediatek/mt7928/BT_RAM_CODE_MT%04x_1_1_hdr.bin"=
,
> +                        dev_id & 0xffff);
>         else if (dev_id =3D=3D 0x7961 && fw_flavor)
>                 snprintf(buf, size,
>                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
> @@ -736,6 +747,7 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hde=
v,
>                         status =3D BTMTK_WMT_ON_UNDONE;
>                 break;
>         case BTMTK_WMT_PATCH_DWNLD:
> +       case BTMTK_WMT_CBMCU_DWNLD:
>                 if (wmt_evt->whdr.flag =3D=3D 2)
>                         status =3D BTMTK_WMT_PATCH_DONE;
>                 else if (wmt_evt->whdr.flag =3D=3D 1)
> @@ -872,6 +884,336 @@ static u32 btmtk_usb_reset_done(struct hci_dev *hde=
v)
>         return val & MTK_BT_RST_DONE;
>  }
>
> +static int btmtk_cbmcu_patch_status(struct hci_dev *hdev,
> +                                   wmt_cmd_sync_func_t wmt_cmd_sync,
> +                                   u8 *patch_status)
> +{
> +       struct btmtk_hci_wmt_params wmt_params;
> +       int status, err, retry =3D 20;
> +
> +       do {
> +               wmt_params.op =3D BTMTK_WMT_CBMCU_DWNLD;
> +               wmt_params.flag =3D BTMTK_CBMCU_FLAG_QUERY_STATUS;
> +               wmt_params.dlen =3D 0;
> +               wmt_params.data =3D NULL;
> +               wmt_params.status =3D &status;
> +
> +               err =3D wmt_cmd_sync(hdev, &wmt_params);
> +               if (err < 0) {
> +                       bt_dev_err(hdev, "Failed to query CBMCU patch sta=
tus (%d)", err);
> +                       return err;
> +               }
> +
> +               *patch_status =3D (u8)status;
> +
> +               if (*patch_status =3D=3D BTMTK_WMT_PATCH_PROGRESS) {
> +                       msleep(100);
> +                       retry--;
> +               } else {
> +                       break;
> +               }
> +       } while (retry > 0);
> +
> +       return 0;
> +}
> +
> +static int btmtk_query_cbmcu_section(struct hci_dev *hdev,
> +                                    wmt_cmd_sync_func_t wmt_cmd_sync,
> +                                    u8 cbmcu_type,
> +                                    const u8 *section_map,
> +                                    u32 cert_len)
> +{
> +       struct btmtk_hci_wmt_params wmt_params;
> +       u8 cmd[64];
> +       int status, err;
> +
> +       cmd[0] =3D 0;
> +       cmd[1] =3D cbmcu_type;
> +
> +       if (cbmcu_type =3D=3D 0)
> +               put_unaligned_le32(cert_len, &cmd[2]);
> +       else
> +               memcpy(&cmd[2], section_map, MTK_SEC_MAP_NEED_SEND_SIZE);
> +
> +       wmt_params.op =3D BTMTK_WMT_CBMCU_DWNLD;
> +       wmt_params.flag =3D 0;
> +       wmt_params.dlen =3D cbmcu_type ?
> +               MTK_SEC_MAP_NEED_SEND_SIZE + 2 :
> +               MTK_SEC_MAP_LENGTH_SIZE + 2;
> +       wmt_params.data =3D cmd;
> +       wmt_params.status =3D &status;
> +
> +       err =3D wmt_cmd_sync(hdev, &wmt_params);
> +       if (err < 0) {
> +               bt_dev_err(hdev, "Failed to query CBMCU section (%d)", er=
r);
> +               return err;
> +       }
> +
> +       /* Query should return UNDONE status for successful section query=
 */
> +       if (status !=3D BTMTK_WMT_PATCH_UNDONE) {
> +               bt_dev_err(hdev, "CBMCU section query status error (%d)",=
 status);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static int btmtk_download_cbmcu_section(struct hci_dev *hdev,
> +                                       wmt_cmd_sync_func_t wmt_cmd_sync,
> +                                       const u8 *fw_data,
> +                                       u32 dl_size)
> +{
> +       struct btmtk_hci_wmt_params wmt_params;
> +       u32 sent_len, total_size =3D dl_size;
> +       int err;
> +
> +       wmt_params.op =3D BTMTK_WMT_CBMCU_DWNLD;
> +       wmt_params.status =3D NULL;
> +
> +       while (dl_size > 0) {
> +               sent_len =3D min_t(u32, 250, dl_size);
> +
> +               if (dl_size =3D=3D total_size)
> +                       wmt_params.flag =3D BTMTK_WMT_PKT_START;
> +               else if (dl_size =3D=3D sent_len)
> +                       wmt_params.flag =3D BTMTK_WMT_PKT_END;
> +               else
> +                       wmt_params.flag =3D BTMTK_WMT_PKT_CONTINUE;
> +
> +               wmt_params.dlen =3D sent_len;
> +               wmt_params.data =3D fw_data;
> +
> +               err =3D wmt_cmd_sync(hdev, &wmt_params);
> +               if (err < 0) {
> +                       bt_dev_err(hdev, "Failed to send CBMCU section da=
ta (%d)", err);
> +                       return err;
> +               }
> +
> +               dl_size -=3D sent_len;
> +               fw_data +=3D sent_len;
> +       }
> +
> +       return 0;
> +}
> +
> +static int btmtk_enable_cbmcu_patch(struct hci_dev *hdev,
> +                                   wmt_cmd_sync_func_t wmt_cmd_sync)
> +{
> +       struct btmtk_hci_wmt_params wmt_params;
> +       int err;
> +
> +       wmt_params.op =3D BTMTK_WMT_CBMCU_DWNLD;
> +       wmt_params.flag =3D BTMTK_CBMCU_FLAG_ENABLE_PATCH;
> +       wmt_params.dlen =3D 0;
> +       wmt_params.data =3D NULL;
> +       wmt_params.status =3D NULL;
> +
> +       err =3D wmt_cmd_sync(hdev, &wmt_params);
> +       if (err < 0) {
> +               bt_dev_err(hdev, "Failed to enable CBMCU patch (%d)", err=
);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int btmtk_load_cbmcu_firmware(struct hci_dev *hdev,
> +                                    const char *fwname,
> +                                    wmt_cmd_sync_func_t wmt_cmd_sync,
> +                                    u32 dev_id)
> +{
> +       struct btmtk_patch_header *hdr;
> +       struct btmtk_global_desc *globaldesc;
> +       struct btmtk_section_map *sectionmap;
> +       const struct firmware *fw;
> +       const u8 *fw_ptr;
> +       u8 *cert_buf =3D NULL;
> +       u32 section_num, section_offset, dl_size, cert_len;
> +       int i, err;
> +
> +       err =3D request_firmware(&fw, fwname, &hdev->dev);
> +       if (err < 0) {
> +               bt_dev_err(hdev, "Failed to load CBMCU firmware file %s (=
%d)",
> +                          fwname, err);
> +               return err;
> +       }
> +
> +       if (fw->size < MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATCH_GD=
_SIZE) {
> +               bt_dev_err(hdev, "CBMCU firmware too small: size=3D%zu, m=
in=3D%u",
> +                          fw->size,
> +                          MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATC=
H_GD_SIZE);
> +               err =3D -EINVAL;
> +               goto err_release_fw;
> +       }
> +
> +       fw_ptr =3D fw->data;
> +       hdr =3D (struct btmtk_patch_header *)fw_ptr;
> +       globaldesc =3D (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_P=
ATCH_HEADER_SIZE);
> +       section_num =3D le32_to_cpu(globaldesc->section_num);
> +
> +       if (fw->size < MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATCH_GD=
_SIZE +
> +                      (size_t)MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_nu=
m) {
> +               bt_dev_err(hdev, "CBMCU firmware truncated: size=3D%zu, e=
xpected=3D%zu (section_num=3D%u)",
> +                          fw->size,
> +                          MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATC=
H_GD_SIZE +
> +                          (size_t)MTK_FW_ROM_PATCH_SEC_MAP_SIZE * sectio=
n_num,
> +                          section_num);
> +               err =3D -EINVAL;
> +               goto err_release_fw;
> +       }
> +
> +       bt_dev_info(hdev, "CBMCU HW ver: 0x%04x, SW ver: 0x%04x, Build Ti=
me: %s",
> +                   dev_id & 0xffff, le16_to_cpu(hdr->swver), hdr->dateti=
me);
> +
> +       /* Phase 1: Download section type MTK_SEC_CBMCU_DESC */
> +       for (i =3D 0; i < section_num; i++) {
> +               sectionmap =3D (struct btmtk_section_map *)
> +                       (fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
> +                        MTK_FW_ROM_PATCH_GD_SIZE +
> +                        MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
> +
> +               /* Only process MTK_SEC_CBMCU_DESC section in Phase 1 */
> +               if ((le32_to_cpu(sectionmap->sectype) & 0xFFFF) !=3D MTK_=
SEC_CBMCU_DESC)
> +                       continue;
> +
> +               section_offset =3D le32_to_cpu(sectionmap->secoffset);
> +               dl_size =3D le32_to_cpu(sectionmap->secsize);
> +
> +               if (dl_size =3D=3D 0)
> +                       continue;
> +
> +               if (section_offset > fw->size ||
> +                   dl_size > fw->size - section_offset) {
> +                       bt_dev_err(hdev, "CBMCU Phase 1 section out of bo=
unds");
> +                       err =3D -EINVAL;
> +                       goto err_release_fw;
> +               }
> +
> +               cert_len =3D MTK_FW_ROM_PATCH_GD_SIZE +
> +                          MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_num +
> +                          dl_size;
> +
> +               /* Query cbmcu section */
> +               err =3D btmtk_query_cbmcu_section(hdev, wmt_cmd_sync, 0, =
NULL,
> +                                               cert_len);
> +               if (err < 0)
> +                       goto err_release_fw;
> +
> +               cert_buf =3D kmalloc(cert_len, GFP_KERNEL);
> +               if (!cert_buf) {
> +                       err =3D -ENOMEM;
> +                       goto err_release_fw;
> +               }
> +
> +               /* Copy Global Descriptor + All Section Maps */
> +               memcpy(cert_buf,
> +                      fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE,
> +                      MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH_SEC_MA=
P_SIZE * section_num);
> +
> +               /* Copy Phase 1 section data */
> +               memcpy(cert_buf + MTK_FW_ROM_PATCH_GD_SIZE +
> +                      MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_num,
> +                      fw_ptr + section_offset,
> +                      dl_size);
> +
> +               /* Download Phase 1 section */
> +               err =3D btmtk_download_cbmcu_section(hdev, wmt_cmd_sync,
> +                                                  cert_buf, cert_len);
> +               kfree(cert_buf);
> +               cert_buf =3D NULL;
> +
> +               if (err < 0) {
> +                       bt_dev_err(hdev, "Failed to download CBMCU Phase =
1 section (%d)", err);
> +                       goto err_release_fw;
> +               }
> +
> +               break;
> +       }
> +
> +       /* Phase 2: Download other sections (type !=3D MTK_SEC_CBMCU_DESC=
) */
> +       for (i =3D 0; i < section_num; i++) {
> +               sectionmap =3D (struct btmtk_section_map *)
> +                       (fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
> +                        MTK_FW_ROM_PATCH_GD_SIZE +
> +                        MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
> +
> +               /* Skip MTK_SEC_CBMCU_DESC section in Phase 2 */
> +               if ((le32_to_cpu(sectionmap->sectype) & 0xFFFF) =3D=3D MT=
K_SEC_CBMCU_DESC)
> +                       continue;
> +
> +               section_offset =3D le32_to_cpu(sectionmap->secoffset);
> +               dl_size =3D le32_to_cpu(sectionmap->bin_info_spec.dlsize)=
;
> +
> +               if (dl_size =3D=3D 0)
> +                       continue;
> +
> +               if (section_offset > fw->size ||
> +                   dl_size > fw->size - section_offset) {
> +                       bt_dev_err(hdev, "CBMCU Phase 2 section %d out of=
 bounds", i);
> +                       err =3D -EINVAL;
> +                       goto err_release_fw;
> +               }
> +
> +               /* Query cbmcu section */
> +               err =3D btmtk_query_cbmcu_section(hdev, wmt_cmd_sync, 1,
> +                                               (u8 *)&sectionmap->bin_in=
fo_spec,
> +                                               0);
> +               if (err < 0)
> +                       goto err_release_fw;
> +
> +               /* Download section data */
> +               err =3D btmtk_download_cbmcu_section(hdev, wmt_cmd_sync,
> +                                                  fw_ptr + section_offse=
t,
> +                                                  dl_size);
> +               if (err < 0) {
> +                       bt_dev_err(hdev, "Failed to download CBMCU sectio=
n %d (%d)", i, err);
> +                       goto err_release_fw;
> +               }
> +       }
> +
> +       bt_dev_info(hdev, "CBMCU firmware download completed");
> +
> +err_release_fw:
> +       release_firmware(fw);
> +       return err;
> +}
> +
> +static int btmtk_setup_cbmcu_firmware(struct hci_dev *hdev,
> +                                     wmt_cmd_sync_func_t wmt_cmd_sync,
> +                                     u32 dev_id)
> +{
> +       char cbmcu_fwname[64];
> +       u8 patch_status;
> +       int err;
> +
> +       err =3D btmtk_cbmcu_patch_status(hdev, wmt_cmd_sync, &patch_statu=
s);
> +       if (err < 0)
> +               return err;
> +
> +       bt_dev_dbg(hdev, "CBMCU patch status: 0x%02x", patch_status);
> +
> +       if (patch_status !=3D BTMTK_WMT_PATCH_UNDONE)
> +               return 0;
> +
> +       snprintf(cbmcu_fwname, sizeof(cbmcu_fwname),
> +                "mediatek/mt7928/CBMCU_CODE_MT%04x_1_1.bin",
> +                dev_id & 0xffff);
> +
> +       bt_dev_info(hdev, "Loading CBMCU firmware: %s", cbmcu_fwname);
> +
> +       err =3D btmtk_load_cbmcu_firmware(hdev, cbmcu_fwname, wmt_cmd_syn=
c, dev_id);
> +       if (err < 0) {
> +               bt_dev_err(hdev, "Failed to download CBMCU firmware (%d)"=
, err);
> +               return err;
> +       }
> +
> +       err =3D btmtk_enable_cbmcu_patch(hdev, wmt_cmd_sync);
> +       if (err < 0)
> +               return err;
> +
> +       return 0;
> +}
> +
>  int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
>  {
>         u32 val;
> @@ -896,7 +1238,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32=
 dev_id)
>                 if (err < 0)
>                         return err;
>                 msleep(100);
> -       } else if (dev_id =3D=3D 0x7925 || dev_id =3D=3D 0x6639) {
> +       } else if (dev_id =3D=3D 0x7925 || dev_id =3D=3D 0x6639 || dev_id=
 =3D=3D 0x7935) {
>                 err =3D btmtk_usb_uhw_reg_read(hdev, MTK_BT_RESET_REG_CON=
NV3, &val);
>                 if (err < 0)
>                         return err;
> @@ -1381,6 +1723,15 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>         case 0x7668:
>                 fwname =3D FIRMWARE_MT7668;
>                 break;
> +       case 0x7935:
> +               /* Requires CBMCU firmware before BT firmware */
> +               err =3D btmtk_setup_cbmcu_firmware(hdev, btmtk_usb_hci_wm=
t_sync,
> +                                                dev_id);
> +               if (err < 0) {
> +                       bt_dev_err(hdev, "Failed to set up CBMCU firmware=
 (%d)", err);
> +                       return err;
> +               }
> +               fallthrough;
>         case 0x7922:
>         case 0x7925:
>                 /*
> @@ -1598,3 +1949,5 @@ MODULE_FIRMWARE(FIRMWARE_MT7922);
>  MODULE_FIRMWARE(FIRMWARE_MT7961);
>  MODULE_FIRMWARE(FIRMWARE_MT7925);
>  MODULE_FIRMWARE(FIRMWARE_MT7927);
> +MODULE_FIRMWARE(FIRMWARE_MT7928);
> +MODULE_FIRMWARE(FIRMWARE_MT7928_CBMCU);
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 51c18dde0a80..5fe4964b031b 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -9,6 +9,8 @@
>  #define FIRMWARE_MT7961                "mediatek/BT_RAM_CODE_MT7961_1_2_=
hdr.bin"
>  #define FIRMWARE_MT7925                "mediatek/mt7925/BT_RAM_CODE_MT79=
25_1_1_hdr.bin"
>  #define FIRMWARE_MT7927                "mediatek/mt7927/BT_RAM_CODE_MT66=
39_2_1_hdr.bin"
> +#define FIRMWARE_MT7928                "mediatek/mt7928/BT_RAM_CODE_MT79=
35_1_1_hdr.bin"
> +#define FIRMWARE_MT7928_CBMCU  "mediatek/mt7928/CBMCU_CODE_MT7935_1_1.bi=
n"
>
>  #define HCI_EV_WMT 0xe4
>  #define HCI_WMT_MAX_EVENT_SIZE         64
> @@ -54,6 +56,7 @@ enum {
>         BTMTK_WMT_RST =3D 0x7,
>         BTMTK_WMT_REGISTER =3D 0x8,
>         BTMTK_WMT_SEMAPHORE =3D 0x17,
> +       BTMTK_WMT_CBMCU_DWNLD =3D 0x58,
>  };
>
>  enum {
> --
> 2.45.2

Sashiko seems to have found quite a few problems with this set:

https://sashiko.dev/#/patchset/20260624075505.1318804-1-chris.lu%40mediatek=
.com

--=20
Luiz Augusto von Dentz

