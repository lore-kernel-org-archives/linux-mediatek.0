Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB2CA1009
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 18:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF7NNzOTfeAplUyiGrcXUnjULOlHRrGxxOTtvokNWdo=; b=N5jcSxRpyDiNSQKlnKsXOioU5U
	NqqZ3X8V9C60k9Ohqj6EqVqjgQYXst0vGNQvalAOduco9zTCJfDNSgbwMjdc5biSdPEg9ZfDSQ5Kf
	bdM2bgMY6EoLVCxQz3T2vdTJQs+WMXxQLPJrwgD8fTkjY8JZo6oH1yRC7ynUQ8QFjiRTwpjSunT54
	AJAGiXKTu3PwSYhAdD/XdRFjlBpss5CMl5qEm5w8pFxP4HSmbgywhp3/xjludOvCHjlE6UQ4eYd2j
	m0N/aLEBn3y1Z72hBvlekRv0qXDgf6p8T7/Alo9e11gQEEeDGENgNmV7qs1DVUyERE6wF/D3PLH6L
	tlrKB3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utscK-00000007Mi1-2EEG;
	Wed, 03 Sep 2025 18:54:00 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto65-00000006gTf-0eSP
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 14:04:26 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7722c8d2694so4397267b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756908264; x=1757513064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DF7NNzOTfeAplUyiGrcXUnjULOlHRrGxxOTtvokNWdo=;
        b=CyMP3SjGzTX9VEIDlMOQGhCPDRbZoc/8MxH1QObESaSOPD6Wfp6rmxokUPRTib1u4c
         Bg0w/KOAldRzTuAFfl4/Do+pRCVoWVACTpnY7s+9HTIKlbgeidn4SPPpd11bYPIEO+wM
         +b99mjLdm++U5Msg6jcEHFDpjJn6mUnIAZxApYjLOb8BfSoFov6Wcs5yezMW+fcVc3J3
         aLC2IBc8p1/9p2Ccyy0JCARnf9jAC/fUZkbRa8F3U1No6d2tm1JFKy8OiktPfQYVPJ+O
         a+3uxbguFAMzpZLrmVegM1x+svT8amvgHzPLEwEbN4a3q52Mb/k0GQCgkmKR4Olfpf14
         N/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908264; x=1757513064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF7NNzOTfeAplUyiGrcXUnjULOlHRrGxxOTtvokNWdo=;
        b=PUV45OpHXTDul560neGUuNXNQ8olGDErJKElghyqqsUdDeD6ujSFZYXXWD/IwJu5tF
         v3VssHqc+yhNtyRB82pMeqlMWFviH70O8FwNCP/z6qy9v9pO0XVL7KPKVwCs5SNDzI+e
         NHrQ4Ta4tChI+LI/CJtsSf9kQMw0j0Ob+yYJPiQbLf5jppWkvp9aH8wnQ12qlIQjYWzF
         WEkKeIaKplngdIphrYv0nKdPLU9kqfnzVqBFYhhasu96OaOZMj6NKdsKuBSWWcU3zQKL
         M5rurJ/OwE9mPt0MFaPynFmrTexLd5aw5Ah+xNZJEgk72LLikhdbXirh78rRCg0Ue5m0
         pF2w==
X-Forwarded-Encrypted: i=1; AJvYcCVDHV04nLD75WYAUm10hVEQMFs4lcQ52CcHRpIqZCD0tZE7bxNX8i6UnaekS5Ua4Q5F8EaWmBF6ThIO0RZffg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnPa4fRGYut02EZ4QtFZnYVFP8oyV9S2iJ42KUnv1d4QbuQ/Q5
	FFMH97UyNBzUnCwkau3dfkQ76RwKdIRGidxkl4++OF0PXQjB5NrxlBhnqJqcYa7XOUc=
X-Gm-Gg: ASbGnctrEknXpmrl8MvJ/TQGcZJ6MiLlWcQGUZJx95boAFI+pCuiEljmmK37wjn4gTw
	xVMNyij71BBy4i4wVsAzFqOcTWOealqWx/JYUkjklSyF7AEOf3c7HI8vWEjqXpWlOpYBYSAPgLk
	ZB9geA8g/x6/4akvi1hbvNm67n71vfLlao+JA3h01eR+QNVyK2lgvl7bJAlgWHf8GOjfXEjBadd
	eRat8rcc2xwSoJPvqjyT8nOvZ45gvrRclxnzisWXmxBSlEAWc87BCxz2aat5tghssthrqp2ti5q
	PgNHPDXxHU2OItaNKYXadyV+cUb2wZZnuOGHAfITXmRrlFoC3fBEB2U9fmb656IVzZh51p1DIWa
	jXyz/QJOaMaGDGL0rfGnhEqwm
X-Google-Smtp-Source: AGHT+IFBlpLNtgdmmoa5SdWAbPJh9KJ+b6IiZlofc2uxPPTjS7ICUieyCle+dJztVNFLBP++9ETglw==
X-Received: by 2002:a05:6a00:1a8f:b0:772:4759:e433 with SMTP id d2e1a72fcca58-7724759e59emr18474843b3a.2.1756908263633;
        Wed, 03 Sep 2025 07:04:23 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b65a2sm16961841b3a.34.2025.09.03.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:04:23 -0700 (PDT)
Date: Wed, 3 Sep 2025 07:04:23 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
Subject: Re: [PATCH v2] Bluetooth: Fix build after header cleanup
Message-ID: <aLhK5wEHgxc3BIgb@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
 <aLcQsE3x9o4BzXxp@mozart.vkv.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLcQsE3x9o4BzXxp@mozart.vkv.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070425_195599_7E4F4E14 
X-CRM114-Status: GOOD (  21.49  )
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

On Tuesday 09/02 at 08:43 -0700, Calvin Owens wrote:
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
> Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")

Hi all,

My fixes tag was wrong and Stephen's automation caught it in linux-next.
I'll send a v3 in response to this with a correct tag, it should be:

Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")

Thanks,
Calvin

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
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
>  	tristate "HCI BPA10x USB driver"
> +	depends on BT_HCIUART
>  	depends on USB
> +	select BT_HCIUART_H4
>  	help
>  	  Bluetooth HCI BPA10x USB driver.
>  	  This driver provides support for the Digianswer BPA 100/105 Bluetooth
> @@ -437,8 +439,10 @@ config BT_MTKSDIO
>  
>  config BT_MTKUART
>  	tristate "MediaTek HCI UART driver"
> +	depends on BT_HCIUART
>  	depends on SERIAL_DEV_BUS
>  	depends on USB || !BT_HCIBTUSB_MTK
> +	select BT_HCIUART_H4
>  	select BT_MTK
>  	help
>  	  MediaTek Bluetooth HCI UART driver.
> @@ -483,7 +487,9 @@ config BT_VIRTIO
>  
>  config BT_NXPUART
>  	tristate "NXP protocol support"
> +	depends on BT_HCIUART
>  	depends on SERIAL_DEV_BUS
> +	select BT_HCIUART_H4
>  	select CRC32
>  	select CRC8
>  	help
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..cbbe79b241ce 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
>  void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>  			 unsigned int oper_speed);
>  
> -#ifdef CONFIG_BT_HCIUART_H4
> -int h4_init(void);
> -int h4_deinit(void);
> -
>  struct h4_recv_pkt {
>  	u8  type;	/* Packet type */
>  	u8  hlen;	/* Header length */
> @@ -162,6 +158,10 @@ struct h4_recv_pkt {
>  	.lsize = 2, \
>  	.maxlen = HCI_MAX_FRAME_SIZE \
>  
> +#ifdef CONFIG_BT_HCIUART_H4
> +int h4_init(void);
> +int h4_deinit(void);
> +
>  struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>  			    const unsigned char *buffer, int count,
>  			    const struct h4_recv_pkt *pkts, int pkts_count);
> -- 
> 2.47.2
> 

