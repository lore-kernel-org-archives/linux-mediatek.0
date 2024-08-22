Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0D8C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uffxY8UhiuQUgnPnP+FDxSdqU5/tNptMzrs5fECJrXA=; b=ThY2n17zdyEKXW3OZLGPAUWqYw
	87aZkramFIEMIWt89/Dsx7UBFqGxFPWnmXOR2U7N07N5S+STPqr4Tlk1rwh6k+eZo/3UjHSS896sU
	D1TSCBHeqJr0FNaAM5ZHRc7k/Bg+MzM/47NSrJs7ZNQ3lSw4F8YjMWC0yhrE2i4X7oL4/CIsAPwR2
	QP3E/6VjnssxjOallecXBS+9XCpUp7IlRqqW7SvYCofmzKU/PUxIsjp6QuaIX6u9NfIP5QvYTKdiX
	I1rT8EvGmPaYlG3OBefeLaa6d5moMAxn6rIxeEwlrVgHiEtYnCsxud1dncxa3em9JlPkYF7IAzP1C
	op4PjF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh4a5-0000000CLxV-24uF;
	Thu, 22 Aug 2024 09:58:13 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh4a1-0000000CLwc-2caJ
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uffxY8UhiuQUgnPnP+FDxSdqU5/tNptMzrs5fECJrXA=; b=RDCKhGBhe1m7afbbRaVetZDyS0
	SjFjF4PDy0vFjdSNdfkcHZxHCsnWXFsUMs+l14kwRP0wQK6ofShchw21x3hWPg4boFmOxXgJjxSCs
	MqgSB4WaN8SuKC7mD9yi9MGGqR1ENxgoXE0+NZy4gvtT/A7z6jBVNsnx4TlMfvYf2vpfIYNN3gB+Y
	+g2O2vOioHelDpT7hZDV/kOkrNz5q+k5Gmi36U4m0hsRi5fSHEs9Fd5Raf/rAereFQuuEETi1RVVU
	+kETBLWo8zTMMwRKe+rPQSViWhjYObsvdKODYhNfWwQR6V71VMDNc8kPZOB2j7JxcVj64z+6w2OCi
	jy46TFiQ==;
Received: from 179-125-75-209-dinamico.pombonet.net.br ([179.125.75.209] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sh4Zn-003VJb-9b; Thu, 22 Aug 2024 11:57:55 +0200
Date: Thu, 22 Aug 2024 06:57:44 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-bluetooth@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jing Cai <jing.cai@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, kernel-dev@igalia.com
Subject: Re: [PATCH] Bluetooth: btmtk: avoid UAF in btmtk_process_coredump
Message-ID: <ZscLmFqTGpAdWCdJ@quatroqueijos.cascardo.eti.br>
References: <20240731190330.1619718-1-cascardo@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731190330.1619718-1-cascardo@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_025809_986613_1CFC3F8A 
X-CRM114-Status: GOOD (  22.28  )
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

On Wed, Jul 31, 2024 at 04:03:30PM -0300, Thadeu Lima de Souza Cascardo wrote:
> hci_devcd_append may lead to the release of the skb, so it cannot be
> accessed once it is called.
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in btmtk_process_coredump+0x2a7/0x2d0 [btmtk]
> Read of size 4 at addr ffff888033cfabb0 by task kworker/0:3/82
> 
> CPU: 0 PID: 82 Comm: kworker/0:3 Tainted: G     U             6.6.40-lockdep-03464-g1d8b4eb3060e #1 b0b3c1cc0c842735643fb411799d97921d1f688c
> Hardware name: Google Yaviks_Ufs/Yaviks_Ufs, BIOS Google_Yaviks_Ufs.15217.552.0 05/07/2024
> Workqueue: events btusb_rx_work [btusb]
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xfd/0x150
>  print_report+0x131/0x780
>  kasan_report+0x177/0x1c0
>  btmtk_process_coredump+0x2a7/0x2d0 [btmtk 03edd567dd71a65958807c95a65db31d433e1d01]
>  btusb_recv_acl_mtk+0x11c/0x1a0 [btusb 675430d1e87c4f24d0c1f80efe600757a0f32bec]
>  btusb_rx_work+0x9e/0xe0 [btusb 675430d1e87c4f24d0c1f80efe600757a0f32bec]
>  worker_thread+0xe44/0x2cc0
>  kthread+0x2ff/0x3a0
>  ret_from_fork+0x51/0x80
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> 
> Allocated by task 82:
>  stack_trace_save+0xdc/0x190
>  kasan_set_track+0x4e/0x80
>  __kasan_slab_alloc+0x4e/0x60
>  kmem_cache_alloc+0x19f/0x360
>  skb_clone+0x132/0xf70
>  btusb_recv_acl_mtk+0x104/0x1a0 [btusb]
>  btusb_rx_work+0x9e/0xe0 [btusb]
>  worker_thread+0xe44/0x2cc0
>  kthread+0x2ff/0x3a0
>  ret_from_fork+0x51/0x80
>  ret_from_fork_asm+0x1b/0x30
> 
> Freed by task 1733:
>  stack_trace_save+0xdc/0x190
>  kasan_set_track+0x4e/0x80
>  kasan_save_free_info+0x28/0xb0
>  ____kasan_slab_free+0xfd/0x170
>  kmem_cache_free+0x183/0x3f0
>  hci_devcd_rx+0x91a/0x2060 [bluetooth]
>  worker_thread+0xe44/0x2cc0
>  kthread+0x2ff/0x3a0
>  ret_from_fork+0x51/0x80
>  ret_from_fork_asm+0x1b/0x30
> 
> The buggy address belongs to the object at ffff888033cfab40
>  which belongs to the cache skbuff_head_cache of size 232
> The buggy address is located 112 bytes inside of
>  freed 232-byte region [ffff888033cfab40, ffff888033cfac28)
> 
> The buggy address belongs to the physical page:
> page:00000000a174ba93 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33cfa
> head:00000000a174ba93 order:1 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> anon flags: 0x4000000000000840(slab|head|zone=1)
> page_type: 0xffffffff()
> raw: 4000000000000840 ffff888100848a00 0000000000000000 0000000000000001
> raw: 0000000000000000 0000000080190019 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff888033cfaa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
>  ffff888033cfab00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
> >ffff888033cfab80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                      ^
>  ffff888033cfac00: fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc
>  ffff888033cfac80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> Check if we need to call hci_devcd_complete before calling
> hci_devcd_append. That requires that we check data->cd_info.cnt >=
> MTK_COREDUMP_NUM instead of data->cd_info.cnt > MTK_COREDUMP_NUM, as we
> increment data->cd_info.cnt only once the call to hci_devcd_append
> succeeds.
> 
> Fixes: 0b7015132878 ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>  drivers/bluetooth/btmtk.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index b7c348687a77..46f605249df7 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -395,6 +395,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>  {
>  	struct btmtk_data *data = hci_get_priv(hdev);
>  	int err;
> +	bool complete = false;
>  
>  	if (!IS_ENABLED(CONFIG_DEV_COREDUMP)) {
>  		kfree_skb(skb);
> @@ -416,19 +417,22 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>  		fallthrough;
>  	case HCI_DEVCOREDUMP_ACTIVE:
>  	default:
> +		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
> +		if (data->cd_info.cnt >= MTK_COREDUMP_NUM &&
> +		    skb->len > MTK_COREDUMP_END_LEN)
> +			if (!memcmp((char *)&skb->data[skb->len - MTK_COREDUMP_END_LEN],
> +				    MTK_COREDUMP_END, MTK_COREDUMP_END_LEN - 1))
> +				complete = true;
> +
>  		err = hci_devcd_append(hdev, skb);
>  		if (err < 0)
>  			break;
>  		data->cd_info.cnt++;
>  
> -		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
> -		if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
> -		    skb->len > MTK_COREDUMP_END_LEN)
> -			if (!memcmp((char *)&skb->data[skb->len - MTK_COREDUMP_END_LEN],
> -				    MTK_COREDUMP_END, MTK_COREDUMP_END_LEN - 1)) {
> -				bt_dev_info(hdev, "Mediatek coredump end");
> -				hci_devcd_complete(hdev);
> -			}
> +		if (complete) {
> +			bt_dev_info(hdev, "Mediatek coredump end");
> +			hci_devcd_complete(hdev);
> +		}
>  
>  		break;
>  	}
> -- 
> 2.34.1
> 
> 

Hi, anyone can help review this?

Thanks.
Cascardo.

