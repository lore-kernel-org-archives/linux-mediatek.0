Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3F8CA1019
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 19:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCthWLth+i+YSOYrHqlebPwfix0ctZEuufdlDwdsoEE=; b=gM8TR3gUCwNz8KQiv7GKc5az54
	Nk8FLzF/PvU4PGl9bGUqkxNmckbnVleldMbf/7TgfBtG+NsdpDVUwiDpmw/m2gdFS98idhzsrMKXY
	l767zQ9DLeiRyynRjmIvU+SIuRaPzdlE1qLS7C+IeDPDgjuuhv+9BfI7bx2dYJZbjY7ooU7BrAFqg
	FcLn2ft/jBNP5lvV/66vNL+tsWUvmWMcnnrZX0bfJanic3r9ACiWvEsQRi3xwS3bqfXFD8SMkomC6
	0lfM4/DDWLJKKZdQrr70GqXjKJnFB2msaG/DFrKjHtP7pjNLDOpMpEeSLEof6ER+yrQfJ44+FLFVW
	eQ/vtMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttZG-00000007Ung-2QiA;
	Wed, 03 Sep 2025 19:54:54 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpR7-00000006v2B-32ZB
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 15:30:15 +0000
Received: from [192.168.0.5] (ip5f5af7fc.dynamic.kabel-deutschland.de [95.90.247.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id DB90A60213AFF;
	Wed, 03 Sep 2025 17:29:43 +0200 (CEST)
Message-ID: <6afa0585-1903-4a56-b433-1087897519bf@molgen.mpg.de>
Date: Wed, 3 Sep 2025 17:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Bluetooth: Fix build after header cleanup
To: Calvin Owens <calvin@wbinvd.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 oe-kbuild-all@lists.linux.dev, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 naresh.kamboju@linaro.org
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
 <aLcQsE3x9o4BzXxp@mozart.vkv.me> <aLhK5wEHgxc3BIgb@mozart.vkv.me>
 <aLhLTiIMRnjHfvOn@mozart.vkv.me>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <aLhLTiIMRnjHfvOn@mozart.vkv.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_083013_917535_C294AE70 
X-CRM114-Status: GOOD (  19.22  )
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

Dear Calvin,


Thank you for the patch.

Am 03.09.25 um 16:06 schrieb Calvin Owens:
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
> Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>   drivers/bluetooth/Kconfig    | 6 ++++++
>   drivers/bluetooth/hci_uart.h | 8 ++++----
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> index 4ab32abf0f48..7df69ccb6600 100644
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -312,7 +312,9 @@ config BT_HCIBCM4377
>   
>   config BT_HCIBPA10X
>   	tristate "HCI BPA10x USB driver"
> +	depends on BT_HCIUART
>   	depends on USB
> +	select BT_HCIUART_H4
>   	help
>   	  Bluetooth HCI BPA10x USB driver.
>   	  This driver provides support for the Digianswer BPA 100/105 Bluetooth
> @@ -437,8 +439,10 @@ config BT_MTKSDIO
>   
>   config BT_MTKUART
>   	tristate "MediaTek HCI UART driver"
> +	depends on BT_HCIUART
>   	depends on SERIAL_DEV_BUS
>   	depends on USB || !BT_HCIBTUSB_MTK
> +	select BT_HCIUART_H4
>   	select BT_MTK
>   	help
>   	  MediaTek Bluetooth HCI UART driver.
> @@ -483,7 +487,9 @@ config BT_VIRTIO
>   
>   config BT_NXPUART
>   	tristate "NXP protocol support"
> +	depends on BT_HCIUART
>   	depends on SERIAL_DEV_BUS
> +	select BT_HCIUART_H4
>   	select CRC32
>   	select CRC8
>   	help
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..cbbe79b241ce 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
>   void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>   			 unsigned int oper_speed);
>   
> -#ifdef CONFIG_BT_HCIUART_H4
> -int h4_init(void);
> -int h4_deinit(void);
> -
>   struct h4_recv_pkt {
>   	u8  type;	/* Packet type */
>   	u8  hlen;	/* Header length */
> @@ -162,6 +158,10 @@ struct h4_recv_pkt {
>   	.lsize = 2, \
>   	.maxlen = HCI_MAX_FRAME_SIZE \
>   
> +#ifdef CONFIG_BT_HCIUART_H4
> +int h4_init(void);
> +int h4_deinit(void);
> +
>   struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>   			    const unsigned char *buffer, int count,
>   			    const struct h4_recv_pkt *pkts, int pkts_count);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

