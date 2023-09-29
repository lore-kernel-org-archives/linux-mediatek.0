Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA7E77347
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SC6zRVCkq2DeluDnnyOjJIKkDt3pXdF0TbDSBtfMCEE=; b=2gmF1ps4juuc5f
	kL51IXyXEfaS4kl5ZOx22ZJbJKbK6YHE+h529Kj2t1rL4DSQ7Ve9fmUcLY8o9sX4FjhGdykmiJQvY
	8pJ5QHXpNc3czW5GFXE+gjkUfI9p48Vb93jHBZqCJ5iE5pzIZFV8HgEpQXf03TMi6SeD0x/J6Edmh
	QF8TUn6dIO5g0zcoUl6ba3xgmMcQ1ods0Mau8tTgqzf+IUfudWMkP1o6taWGoEywaihpDg/uhGhgS
	32MIJVWHwL3LyeObNm53aR4/DCtSabk4ulRWRpWx5/SLQYOe95NxN4LU28OqaWyEYEy6yAfdTjB1z
	Nbvev6FlPDsXrL69lSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMQs-008g1x-2F;
	Fri, 29 Sep 2023 22:58:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMQo-008g0p-2v
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 22:58:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CBF8ACE2681;
	Fri, 29 Sep 2023 22:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DBEC433CA;
	Fri, 29 Sep 2023 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696028274;
	bh=meAmfIZh4pVZAbrgCrY8UlN/iLhYwcGcAVNrSFyN0tI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lBHegamYcFx4guTEnL7zSfBO1bzwJlewb3dkCPWmn9NyHE9HWn4+/U3LR4pyG4ULg
	 pfqlGJ9G6rXR5o356YpxUps3XhcZEXmIPa7S6CSxjjLZH2ReMkJ8Thl0hNSYOvhWvo
	 +/dqUj8TWsA09Ou2VvzgYbDtMr0ziHmr/i6yE41bq0PXi+ZegLJ9AFT8dMjwI8CwPC
	 y8gKrLLWqqNKmwVf7YAGwkxCj9QkHKn+MXZtvxD/8xIGX4Nkts1PthtL3NYD05HtnS
	 leh9/PqSHSfGzwqEhIIW0dtS3/5ebrld8oRo/R60u5EfffS+hjIC0bGKpmsKPH6g/I
	 j53VShVxGGwiw==
Date: Fri, 29 Sep 2023 17:57:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ingo Rohloff <lundril@gmx.de>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: mt7921e: Support MT7992 IP in Xiaomi
 Redmibook 15 Pro (2023)
Message-ID: <20230929225752.GA560382@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826200241.5077-1-lundril@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_155759_139244_1770C67D 
X-CRM114-Status: GOOD (  18.41  )
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

On Sat, Aug 26, 2023 at 10:02:41PM +0200, Ingo Rohloff wrote:
> In the Xiaomi Redmibook 15 Pro (2023) laptop I have got, a wifi chip is
> used, which according to its PCI Vendor ID is from "ITTIM Technology".
> 
> This chip works flawlessly with the mt7921e module.  The driver doesn't
> bind to this PCI device, because the Vendor ID from "ITTIM Technology" is
> not recognized.
> 
> This patch adds the PCI Vendor ID from "ITTIM Technology" to the list of
> PCI Vendor IDs and lets the mt7921e driver bind to the mentioned wifi
> chip.
> 
> Signed-off-by: Ingo Rohloff <lundril@gmx.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# pci_ids.h

> ---
> Changes in v2:
> As requested, move the definition of the PCI Vendor ID for
> ITTIM Technology to the (hopefully) right place in pci_ids.h
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
>  include/linux/pci_ids.h                         | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> index 95610a117d2f..ed5a220763ce 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -17,6 +17,8 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
>  		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7922),
>  		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_ITTIM, 0x7922),
> +		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0608),
>  		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 2dc75df1437f..6ae1803bcd2f 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -180,6 +180,8 @@
>  #define PCI_DEVICE_ID_BERKOM_A4T		0xffa4
>  #define PCI_DEVICE_ID_BERKOM_SCITEL_QUADRO	0xffa8
> 
> +#define PCI_VENDOR_ID_ITTIM		0x0b48
> +
>  #define PCI_VENDOR_ID_COMPAQ		0x0e11
>  #define PCI_DEVICE_ID_COMPAQ_TOKENRING	0x0508
>  #define PCI_DEVICE_ID_COMPAQ_TACHYON	0xa0fc
> --
> 2.30.2
> 

