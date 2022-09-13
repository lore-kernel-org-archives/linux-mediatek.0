Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FED7C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOxXACyj7AdW1Jtze3rERZu7gDWPrcYjBkHp+HdY4z4=; b=yBlltdZ8VQ3g+3tT2apycRjFsp
	Nam34WuAikXAqwPDyW8XWPGsOE5xNXJf4HVMFymWmhEedX+TmC9ZaVeI1CBKIVvcvH7t6tuN8Rkxl
	Gsc4JtpWC0Vbv077sOKqSi1Hdb7Q2VNJFULbqRW7eAXyDsFjcCFpBxPzXge4jLriw6/emHOc5aNI5
	tz4NXNlmpctJUtmspFNE37sMK13dwf1Nh8ZGqIa28PHmAYhWGGNvde6YEx2S7TDfGinMGJdmiZ3uG
	9w7+7YfksOOzF7D9jATGQ4HTvPI5ZDU+i3wKl3B4Nr0+izUgzbqGz0325gPQ5bLy8luVmXpotQx5r
	8bws2jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0eN-003lbm-RY; Tue, 13 Sep 2022 07:48:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0eD-003lPT-Ua
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 07:47:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE1686601FFD;
	Tue, 13 Sep 2022 08:47:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663055272;
	bh=6u/thX32yOGH/bqlywjPbOzwMFBcKnBB26iBhycTJnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0wMsgxqZlK0q6dQRcwBUeYGM9WIrQL0rx0gQlqCA1lATN9B/W4LJpGMJg+5lF+1U
	 CT9A70UVYOYtkCy3IIopcLcefpLgMyR3SLkma4RBPna+dS+cRSXrRAxNdclXkkM159
	 KBEQHH3mLWa3GdD3Dyp2WaHVywwHM28cB/Jsl6hDwNsOYaE6MvsHIQ7PfKw5DHn/r9
	 4nzB157drCv3WqGH2atfYsdfKzXJpRuONAvtWo2ln81mmxOybQ/O6kivpYRh8R9bem
	 HOyMByi6ME2ZJX5YomQYqXkVspY3Aye/aoP9HBHTY3JJD/GXTHl3xuiFcJlDOCXM15
	 LR8foC4g1lWiw==
Message-ID: <8c734b83-aa2a-83a6-cb12-28e36ace2bbb@collabora.com>
Date: Tue, 13 Sep 2022 09:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] Bluetooth: btusb: mediatek: use readx_poll_timeout
 instead of open coding
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 abhishekpandit@chromium.org, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_004758_415536_1CC4371E 
X-CRM114-Status: GOOD (  19.94  )
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

Il 13/09/22 00:18, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Use readx_poll_timeout instead of open coding to poll the hardware reset
> status until it is done.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Hello Sean, thanks for the patch!
However, there's something to improve...

> ---
>   drivers/bluetooth/btusb.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index c3daba17de7f..4dc9cae3e937 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c

..snip..

> @@ -2910,18 +2918,14 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
>   	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
>   	btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
>   
> -	/* Poll the register until reset is completed */
> -	do {
> -		btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
> -		if (val & MTK_BT_RST_DONE) {
> -			bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
> -			break;
> -		}
> +	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
> +				 val & MTK_BT_RST_DONE,
> +				 100000, 1000000);

I agree with using readx_poll_timeout() instead of open coding the same, but
there's a catch: this macro uses usleep_range(), which is meant to be used
for sleeping less than ~20ms.

Even the kerneldoc at include/linux/iopoll.h advertises that:

  * @sleep_us: Maximum time to sleep between reads in us (0
  *            tight-loops).  Should be less than ~20ms since usleep_range
  *            is used (see Documentation/timers/timers-howto.rst).

So, if there's any reason for which you can't sleep for less than 100ms
per iteration, I'm afraid that you can't use readx_poll_timeout()...
...otherwise, please change sleep_us to 20000 and keep the timeout at 1 sec.

Regards,
Angelo

> +	if (err < 0)
> +		bt_dev_err(hdev, "Reset timeout");
>   
> -		bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
> -		retry++;
> -		msleep(MTK_BT_RESET_WAIT_MS);
> -	} while (retry < MTK_BT_RESET_NUM_TRIES);
> +	if (val & MTK_BT_RST_DONE)
> +		bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
>   
>   	btusb_mtk_id_get(data, 0x70010200, &val);
>   	if (!val)


