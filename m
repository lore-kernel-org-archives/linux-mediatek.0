Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BE1CA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45D3H8+xv+cJQOWaurVBdJjz0km7uhmNmdRtwG5A/1w=; b=u9iv83PYfjo4BYdE3xLfM2LSFR
	huUGsz9P8Z1IovGubCrOSmN5S4HAroQeNgTn7iTKIHPecPfwQ3MIPQDj45ZSdPxs9nNkoArhCA1/X
	8JOJtHDiTCu0H1F8o9ScFh0YGNU4Y1izcniejJob5oh86jcO4lsbcYhG1SpUs4WXZzI1Gh6zEQy1E
	u9ZLDjOcH8aZBzig6bB7TsnxIfxkH+8cvHYwWmRn6jHmFSbUdAelZrGS3ih/5awJ5Xb3EzCfZw7qV
	QEOklS3IYFHSZm0PLFDHRHg92OwnvlhMI2p1ZdPzzPJJQbQlfNstKfAvZ9ojiEWA/ozNnXG00txnw
	lwvN3hiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWRA-00000001eT7-0FGh;
	Tue, 02 Sep 2025 19:13:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSwq-00000000gDx-3kzY
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 15:29:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3369d3513faso48818881fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756826966; x=1757431766; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45D3H8+xv+cJQOWaurVBdJjz0km7uhmNmdRtwG5A/1w=;
        b=SK6bBVGvjuKcZEQCleRE9wn3+h6LvtnE8F7MQ+ms8a2S17niJ7dvfkPhaYf6N5Rgmu
         keUzmYIuS0oqupGeJJ7ZeJEq2KgvBh0Y9Zk6WXLeCv/HBVrTg9A4x36henRyO8joAfUF
         waTFnhL0IXp2SkfI+XkcBqUTYvP2S+yEutm7gLTkRg5JHUjXmAxN4nd2GlI26kB46V2v
         64Wn6xPiPlmjWC0HRXMdQNkC7Xq9doE1algAT+ryNOTwDWGlI64dsu7j13glnA94OG/h
         rzplV2qnG9dZQH6Ke55VmPwIYCCfJGb/cqN8R673QuAYmqnZclHcCBc+o++lv+ol1rkR
         8xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756826966; x=1757431766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45D3H8+xv+cJQOWaurVBdJjz0km7uhmNmdRtwG5A/1w=;
        b=YhqxmVQK99c5wGNV4l/6yf4UvPOJY1UxWO7t56CI2tn0Zz4LBJ3oXADSGAx/b74dff
         U9n7dyajkVq6V4SrQAOUTAi4kvmr8ZdcHhNREraQossTliGL+cd9d4/CZ0z83RqYcBYE
         isese2/K6EI0hpGFeJRPePQEQL/JDuyytlnracI6Sg532pF0u81aPf55U1wxunP3SbYm
         HfBK0y4B0+cmxDfst+j/8pzlu5oMW7uBoax2bhe4DxYpyg1pfPy8fGpc/RNhkhrYELkr
         gNfmmPqowhRVrW7Q2cTkklyXsKPcrgqFeJiKqojMYtyn0h6MXKofH+6Czij556haoVKn
         botQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC9K9C47L/w7mceu5SXjI2ZZa4puJyI8UfRrKp1zbzqymtACrJH6fu4hc0edAKWMhBH/cjjN6KzSsH/bz1eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD/uMCu5lXqwZDC6wsCuDfcH0UylO/wsX5pfYPhWdllLpB1ait
	GqeRnOTf9k7r21zLBjGzlzVjyh/WbH9tl7M+z2vq0xCUEMbUcC13nvZF9hDU1fZ+PNqn4z+JMyc
	S7DZJqhg7UteCSwioVrp50cJTVZ6ZSSM=
X-Gm-Gg: ASbGnctvn5TBu94k47nzgPYz3oFh0EjTBxGFEVWVBHbwwsy7/vQoWfw67Df2cmAUAm5
	0A2Mpm019+aryahNAxlOBGwEEqM/ST1hO/naDqbbh2hd9ad63b1dCUbuKED0C2UojynZuid8h5g
	7Tce27bJVO4Xsm2xlUrH1fZwlVeEeEmL32CA86ogrkpngdpWKHxje2nTgX2AYSuxyaord6gxogQ
	IKwkBfrdP9AG6hjFZGCxlGanHcN5Cxm4WRmM9mJHHqRzQ==
X-Google-Smtp-Source: AGHT+IHJ+ifO3wbwufUVcTFDMp7vzAFqN/JcOC4u8JhOqaNrPYiCiSR9o2M3s+tthdJTnwxOiQhxQf4CM1nG6ewI/aE=
X-Received: by 2002:a05:651c:551:b0:336:e22d:804a with SMTP id
 38308e7fff4ca-336e22da0cdmr26270971fa.17.1756826966207; Tue, 02 Sep 2025
 08:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <202508300413.OnIedvRh-lkp@intel.com> <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de> <aLNRvzXE4O9dKZoN@mozart.vkv.me>
In-Reply-To: <aLNRvzXE4O9dKZoN@mozart.vkv.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 2 Sep 2025 11:29:13 -0400
X-Gm-Features: Ac12FXxpABT60qjwT9pgH_IdUsZUdnJMAR-u1w75YMCcYqqH0yYBL57h5ICrG1c
Message-ID: <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
To: Calvin Owens <calvin@wbinvd.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_082928_935064_FB8C7FBA 
X-CRM114-Status: GOOD (  39.53  )
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

Hi Calvin,

On Sat, Aug 30, 2025 at 3:32=E2=80=AFPM Calvin Owens <calvin@wbinvd.org> wr=
ote:
>
> On Saturday 08/30 at 07:11 +0200, Paul Menzel wrote:
> > Dear Calvin,
> >
> >
> > Thank you for your patch, and addressing the regression right away.
> >
> > Am 30.08.25 um 02:50 schrieb Calvin Owens:
> > > Syzbot found a randconfig which fails after my recent patch:
> > >
> > >      drivers/bluetooth/btmtksdio.c:442:33: error: array type has inco=
mplete element type =E2=80=98struct h4_recv_pkt=E2=80=99
> > >        442 | static const struct h4_recv_pkt mtk_recv_pkts[] =3D {
> > >            |                                 ^~~~~~~~~~~~~
> > >      drivers/bluetooth/btmtksdio.c:443:11: error: =E2=80=98H4_RECV_AC=
L=E2=80=99 undeclared here (not in a function)
> > >        443 |         { H4_RECV_ACL,      .recv =3D btmtksdio_recv_acl=
 },
> > >            |           ^~~~~~~~~~~
> > >      drivers/bluetooth/btmtksdio.c:444:11: error: =E2=80=98H4_RECV_SC=
O=E2=80=99 undeclared here (not in a function)
> > >        444 |         { H4_RECV_SCO,      .recv =3D hci_recv_frame },
> > >            |           ^~~~~~~~~~~
> > >      drivers/bluetooth/btmtksdio.c:445:11: error: =E2=80=98H4_RECV_EV=
ENT=E2=80=99 undeclared here (not in a function)
> > >        445 |         { H4_RECV_EVENT,    .recv =3D btmtksdio_recv_eve=
nt },
> > >
> > > ...because we can have BT_MTKSDIO=3Dy with BT_HCIUART_H4=3Dn, and the
> > > definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.
> >
> > The drivers below seem to be affected:
> >
> >     drivers/bluetooth/bpa10x.c:     { H4_RECV_EVENT,   .recv =3D
> > hci_recv_frame },
> >     drivers/bluetooth/btmtksdio.c:  { H4_RECV_EVENT,    .recv =3D
> > btmtksdio_recv_event },
> >     drivers/bluetooth/btmtkuart.c:  { H4_RECV_EVENT,    .recv =3D
> > btmtkuart_recv_event },
> >     drivers/bluetooth/btnxpuart.c:  { H4_RECV_EVENT,        .recv =3D
> > hci_recv_frame },
> >
> > > I think the simplest way to fix this is to remove the gate on the
> > > definitions in hci_uart.h. Since the constants are macros, there's no
> > > runtime cost to doing so, and nothing seems to rely on their absence =
in
> > > the BT_HCIUART_H4=3Dn case.
> >
> > Looking at the implementation, it looks like they only work with the H4
> > protocol? So maybe, that should be denoted in the Kconfig files?
>
> Thanks for looking Paul.
>
> Yes, my fix will cause a link error with other randconfigs, which my
> 'make randconfig drivers/bluetooth/' test loop missed after I made the
> function prototype always defined, whoops.
>
> We do need the dependencies here, as you note. The btmtksdio case syzbot
> found is the odd one out because it only uses the constants, and doesn't
> call h4_recv_buf().
>
> Hopefully this gets it all:
>
> -----8<-----
> From: Calvin Owens <calvin@wbinvd.org>
> Subject: [PATCH v2] Bluetooth: Fix build after header cleanup
>
> Some Kconfig dependencies are needed after my recent cleanup, since
> the core code has its own option.
>
> Since btmtksdio does not actually call h4_recv_buf(), move the
> definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
> avoid adding a dependency for btmtksdio.
>
> The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
> h4_recv_buf(), so the dependency is required, add it for them.
>
> Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header=
")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@i=
ntel.com/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/bluetooth/Kconfig    | 6 ++++++
>  drivers/bluetooth/hci_uart.h | 8 ++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> index 4ab32abf0f48..7df69ccb6600 100644
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -312,7 +312,9 @@ config BT_HCIBCM4377
>
>  config BT_HCIBPA10X
>         tristate "HCI BPA10x USB driver"
> +       depends on BT_HCIUART
>         depends on USB
> +       select BT_HCIUART_H4
>         help
>           Bluetooth HCI BPA10x USB driver.
>           This driver provides support for the Digianswer BPA 100/105 Blu=
etooth
> @@ -437,8 +439,10 @@ config BT_MTKSDIO
>
>  config BT_MTKUART
>         tristate "MediaTek HCI UART driver"
> +       depends on BT_HCIUART
>         depends on SERIAL_DEV_BUS
>         depends on USB || !BT_HCIBTUSB_MTK
> +       select BT_HCIUART_H4
>         select BT_MTK
>         help
>           MediaTek Bluetooth HCI UART driver.
> @@ -483,7 +487,9 @@ config BT_VIRTIO
>
>  config BT_NXPUART
>         tristate "NXP protocol support"
> +       depends on BT_HCIUART
>         depends on SERIAL_DEV_BUS
> +       select BT_HCIUART_H4
>         select CRC32
>         select CRC8
>         help
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..cbbe79b241ce 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, =
bool enable);
>  void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>                          unsigned int oper_speed);
>
> -#ifdef CONFIG_BT_HCIUART_H4
> -int h4_init(void);
> -int h4_deinit(void);
> -
>  struct h4_recv_pkt {
>         u8  type;       /* Packet type */
>         u8  hlen;       /* Header length */
> @@ -162,6 +158,10 @@ struct h4_recv_pkt {
>         .lsize =3D 2, \
>         .maxlen =3D HCI_MAX_FRAME_SIZE \
>
> +#ifdef CONFIG_BT_HCIUART_H4
> +int h4_init(void);
> +int h4_deinit(void);
> +
>  struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>                             const unsigned char *buffer, int count,
>                             const struct h4_recv_pkt *pkts, int pkts_coun=
t);
> --
> 2.47.2

Please send a v2 then otherwise this is no pickup by the likes of CI
and patchwork.

>


--=20
Luiz Augusto von Dentz

