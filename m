Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15383ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 23:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwP3wUw8HveVVeTGT8zvNNrgrLIgJkeNwuiSyqbkQD8=; b=Vkvfd313jvMTYjR8liTOIeil3p
	2Qa4RFiKjKz0OKXBnIUeKH4D6wdOMCVnPw0qjCJh7clZzEUEbiASADz9skfsoITPaxVjnnnEIrubX
	ZPFPmzcN3F8ffJHJpViEvVbk06wtXADxq699yLkRtU1sQfnbu/kHAsNDtc/FAJuPQ3EJOGLbEMXUp
	DYbOEzIB74x+4wJH7/oB79XSwlDOshBQEU9mrnobZXuRb7H31p4woCo1hOMK9WcGyah7oTRe1H7Ek
	bkaGo3y03uPring2ezt8Sib1TzL/KX+p+MeMtP8hceaLJKoWua3Cq9FrVeHR974ZqNucNFfF+nElc
	labR/UNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTWvn-008dXb-IO; Wed, 31 Aug 2022 23:15:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTWvk-008dXI-QZ
	for linux-mediatek@lists.infradead.org; Wed, 31 Aug 2022 23:15:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC7A361C61
	for <linux-mediatek@lists.infradead.org>; Wed, 31 Aug 2022 23:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A12CC433B5
	for <linux-mediatek@lists.infradead.org>; Wed, 31 Aug 2022 23:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661987731;
	bh=t5oLcB72prq3YZIUNqEPd41rqmg1WT6c81QZ9d4pP+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JJdmPXPkEb5KAKQK58RkRFZHp1vv/m8fBIUnjEflCbguv06gYYw1DSVpEI4f0D7LM
	 LXXQQgdNq4P0FbaVyafoFtrcaIQLnD/++c5UNeRYMmc4t73njQZZL20AgSOIeJFgkl
	 XLEJKnXc+LaBQJ9J4jRoy8xd+K6eDrET6XciWkxycpjYIuPhO9V2HKLiUroeCWzcnl
	 RnAXqbsSYpLUfHnofp6UwdE7NP/4msYxuOssnMpjz+Wb6HwCkhNh5+1YdJxysz0NXi
	 iPXyG/3KN5lwEdy5hl7ZTeLBvAqmFegAYlF2bwsnsmFYev69JvgoHFapHfFH6jNkA9
	 27YJmjiBu7Zbw==
Received: by mail-wm1-f41.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso430344wmq.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Aug 2022 16:15:31 -0700 (PDT)
X-Gm-Message-State: ACgBeo1OPizuQWPjNRQpUKOWbJ+mYzm+6GVIuCLpGW8k/N6Zo1uOC7al
	WtGZYhobQXORplrYuYUmfugZNzpQ/BGR7HxqvcI=
X-Google-Smtp-Source: AA6agR47KiLpOQ7NE1BygeJXvnbTMo/oeCM40gdLvUbCGWvJBjgiyVkpD3aAMowLLny9he+rPkeYkuNhYvm0xzcjn34=
X-Received: by 2002:a1c:7408:0:b0:3a5:c9c1:f226 with SMTP id
 p8-20020a1c7408000000b003a5c9c1f226mr3264966wmc.47.1661987729340; Wed, 31 Aug
 2022 16:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <6675f56fc8b0910f17ec506d534cf5330ff04733.1660177086.git.objelf@gmail.com>
In-Reply-To: <6675f56fc8b0910f17ec506d534cf5330ff04733.1660177086.git.objelf@gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 31 Aug 2022 16:15:17 -0700
X-Gmail-Original-Message-ID: <CAGp9LzrzfAO0_Tejjg=NLBbq-TLC7JV=e05m9t97X1wbgxZ8+w@mail.gmail.com>
Message-ID: <CAGp9LzrzfAO0_Tejjg=NLBbq-TLC7JV=e05m9t97X1wbgxZ8+w@mail.gmail.com>
Subject: Re: [PATCH v5] Bluetooth: btusb: mediatek: fix WMT failure during
 runtime suspend
To: luiz.dentz@gmail.com
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, 
	=?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Soul Huang <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, 
	Leon Yen <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, 
	Deren Wu <Deren.Wu@mediatek.com>, KM Lin <km.lin@mediatek.com>, 
	Robin Chiu <robin.chiu@mediatek.com>, Eddie.Chen@mediatek.com, 
	CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, ted.huang@mediatek.com, 
	Stella Chang <Stella.Chang@mediatek.com>, Tom.Chou@mediatek.com, steve.lee@mediatek.com, 
	jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com, 
	michaelfsun@google.com, mcchou@chromium.org, shawnku@google.com, 
	linux-bluetooth@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	Jing Cai <jing.cai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_161532_978170_B7AFF32B 
X-CRM114-Status: GOOD (  27.32  )
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

If the patch looks good to you, could you help apply the patch to
bluetooth.git? It can fix the issue present in the stable kernel, I
would like to backport it earlier once it appears in the Linus tree.

Sean

On Wed, Aug 10, 2022 at 5:59 PM <sean.wang@mediatek.com> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> WMT cmd/event doesn't follow up the generic HCI cmd/event handling, it
> needs constantly polling control pipe until the host received the WMT
> event, thus, we should require to specifically acquire PM counter on the
> USB to prevent the interface from entering auto suspended while WMT
> cmd/event in progress.
>
> Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek
>  MT7668U USB devices")
> Co-developed-by: Jing Cai <jing.cai@mediatek.com>
> Signed-off-by: Jing Cai <jing.cai@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2:
> 1. move usb_autopm_[get, put]_interface to btusb_mtk_hci_wmt_sync whenever
> wmt cmd is invoked.
> 2. add the explanation why we needed the specific
> usb_autopm_[get, put]_interface there.
>
> v3: correct the version and there is no logic changed
> v4: fix GitLint fail due to Title exceeds max length
> v5: rebase to fix patches does not apply
> ---
>  drivers/bluetooth/btusb.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 30dd443f395f..70d61bb4a053 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2480,15 +2480,29 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
>
>         set_bit(BTUSB_TX_WAIT_VND_EVT, &data->flags);
>
> +       /* WMT cmd/event doesn't follow up the generic HCI cmd/event handling,
> +        * it needs constantly polling control pipe until the host received the
> +        * WMT event, thus, we should require to specifically acquire PM counter
> +        * on the USB to prevent the interface from entering auto suspended
> +        * while WMT cmd/event in progress.
> +        */
> +       err = usb_autopm_get_interface(data->intf);
> +       if (err < 0)
> +               goto err_free_wc;
> +
>         err = __hci_cmd_send(hdev, 0xfc6f, hlen, wc);
>
>         if (err < 0) {
>                 clear_bit(BTUSB_TX_WAIT_VND_EVT, &data->flags);
> +               usb_autopm_put_interface(data->intf);
>                 goto err_free_wc;
>         }
>
>         /* Submit control IN URB on demand to process the WMT event */
>         err = btusb_mtk_submit_wmt_recv_urb(hdev);
> +
> +       usb_autopm_put_interface(data->intf);
> +
>         if (err < 0)
>                 goto err_free_wc;
>
> --
> 2.25.1
>

