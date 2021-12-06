Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXeyPiQoZxI0D1dKw2w+vFpn9i0vjJmxxS+xJ9lFZ5s=; b=5Bsy6DDK3pA+No
	H397pn6+dRI+4UTHuxLzajT9k0bntdFvoWcmohH5RcD3TjwdJV9COImTd+ZjXqf+xLAb+md3FYQJL
	LzpXA4DtEDYWCHms0Hlkw0E/pNgpZ3bNEFXR8odZzLLzx3vvG0S90k5sKy53KW+GhFec/1AyWeUqn
	cSceZFrNDtHRR+pxKgirV6VDGk8xTDSNf/VzcPmDtEwhJx0geG1hvF9f3KwZDUZanQoEoI0I9D0AT
	jcujagMEKAIzB7lNGibKaYmlylhMf/8y6l0LsYoJCV/zS+gfD75kq+cSSigoUfdrv/uB73hWrqfF6
	gynqIiTH3wTiiIxvQUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muAeD-003D0m-7c; Mon, 06 Dec 2021 09:51:01 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muAe6-003Cz7-NC
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 09:50:59 +0000
Received: from [192.168.0.2] (ip5f5aea86.dynamic.kabel-deutschland.de
 [95.90.234.134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id CA94B61E5FE00;
 Mon,  6 Dec 2021 10:50:39 +0100 (CET)
Message-ID: <61e772a7-6e46-7c0f-32ba-b3e3ad88062c@molgen.mpg.de>
Date: Mon, 6 Dec 2021 10:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] Bluetooth: btusb: Handle download_firmware failure cases.
Content-Language: en-US
To: mark-yw.chen@mediatek.com
Cc: aaron.hou@mediatek.com, kaichuan.hsieh@canonical.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, marcel@holtmann.org, johan.hedberg@gmail.com,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
References: <20211206092546.27216-1-mark-yw.chen@mediatek.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20211206092546.27216-1-mark-yw.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_015054_970432_CE31DE2B 
X-CRM114-Status: GOOD (  17.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Mark,


Some small nitpicks:

Am 06.12.21 um 10:25 schrieb mark-yw.chen@mediatek.com:
> From: mark-yw.chen <mark-yw.chen@mediatek.com>

Instead of the user name, maybe you can use Mark Chen (or the whole name)?

     $ git config --global user.name "Mark Chen"
     $ git commit --amend --reset-author="Mark Chen 
<mark-yw.chen@mediatek.com>"

Also could you please remove the trailing dot/period at the end of the 
git commit message summary?

> For Mediatek chipset, if there are no firmware bin or command_timeout,
> the process should be terminated in btusb_mtk_setup().

Otherwise what happens?

> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> Change-Id: I99f1d7b72fa70643d9123e7e6cdc8d0b4369ce52

To what Gerrit instance does the Change-Id belong? Without that 
information (Reviewed-on tag?), it should be removed?

> ---
>   drivers/bluetooth/btmtk.c | 1 +
>   drivers/bluetooth/btusb.c | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index c2ee5c4b975a..526dfdf1fe01 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -121,6 +121,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>   				} else {
>   					bt_dev_err(hdev, "Failed wmt patch dwnld status (%d)",
>   						   status);
> +					err = -EIO;
>   					goto err_release_fw;
>   				}
>   			}
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index ab169fc673ea..3ea04b1d0750 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2554,6 +2554,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>   			 dev_id & 0xffff, (fw_version & 0xff) + 1);
>   		err = btmtk_setup_firmware_79xx(hdev, fw_bin_name,
>   						btusb_mtk_hci_wmt_sync);
> +		if (err < 0) {
> +			bt_dev_err(hdev, "Failed to setup firmware (%d)", err);

The verb is spelled with a space: set up.

Also, this error message seems unrelated to the patch in question. Maybe 
add it in a separate commit?

> +			return err;
> +		}
>   
>   		/* It's Device EndPoint Reset Option Register */
>   		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
> 


Kind regards,

Paul

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
