Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E0FE7717F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrBthU6FRDseQslcjAXYKHMM4GBGX3lqrFrwXfNYIbk=; b=Z17xAhLxCqjUbMf/wsEWdBIWV7
	Q+YVD1BgSxknwZeARMJmDQeiQ7HVF7B0ZN9jmbbZ6DKVdHeTMn7Iis2k+OCCin95qHpgSFRC4fj69
	wQ6fvtS8tPo3J3ADaSJbgfh5HAEB0qt+Y+nEOhn2euXIeuavL8ci+IwfK/YjQoOxKam0MI7UcW2Fw
	Yrmz67mqme34UZo5NDgtAygN+IxNxoCYTSTHaOXjbHgdDQ2cb1Ot1BK+Gv/pxDmY1rUXbdidZ9v0i
	M3IXTumScPcwEBXSuyQ7YbcWwVDObkBNyG/oehrD6p+s7BhNjSnTqLqHBWRYNo2gFV04/2hHclKpm
	uT17bPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg2l-0000000HaSg-3naS;
	Thu, 12 Dec 2024 10:03:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg2j-0000000HaSC-2AEf
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 10:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997815;
	bh=2H8h1Nfoc5f+Dhu3pA1T+My9+ckrZ7/7fSy9strk77U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mNfHSPDlRRpFZOBF82YMoS0p5Dtv4tUaPxcpHEUcyQbXi8FeMzQ+L0qBSmhRAEiG+
	 qkVxYru0Xct0nlq0V2H1jx74YoDuoBWwOAzQsQpjjD4pX9VsxV02/XKux4a8+I8qPX
	 UcbdfymwcLIIWVF143ZCJJ4DrCsPBbH8lzZ6NiVd+I+oUttrM7NqC+h+oOAHXpQ4QL
	 Hb2VcWhVDgRsZfOecvhW6moGLU6nMtTY0fhc03zKLphoHZshchWXohmV9m/yJelUhA
	 JxGCiISUL9WBbsag26Re2ulJC8mUfEpZ7rWdAcfbtj6M9WDDnJnGO1huQtXl9caB9e
	 CXat/QQpeDLoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51F1A17E35F2;
	Thu, 12 Dec 2024 11:03:35 +0100 (CET)
Message-ID: <d5101ebb-6d6a-47f1-bd14-032b85ea7021@collabora.com>
Date: Thu, 12 Dec 2024 11:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Resend] Bluetooth: btmtk: avoid UAF in
 btmtk_process_coredump
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 linux-bluetooth@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jing Cai <jing.cai@mediatek.com>,
 Chris Lu <chris.lu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 kernel-dev@igalia.com
References: <20240731190330.1619718-1-cascardo@igalia.com>
 <Z1iYKvmenw81i1UG@quatroqueijos.cascardo.eti.br>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Z1iYKvmenw81i1UG@quatroqueijos.cascardo.eti.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_020337_702506_745FF35A 
X-CRM114-Status: GOOD (  10.73  )
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

Il 10/12/24 20:36, Thadeu Lima de Souza Cascardo ha scritto:
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
>   <TASK>
>   dump_stack_lvl+0xfd/0x150
>   print_report+0x131/0x780
>   kasan_report+0x177/0x1c0
>   btmtk_process_coredump+0x2a7/0x2d0 [btmtk 03edd567dd71a65958807c95a65db31d433e1d01]
>   btusb_recv_acl_mtk+0x11c/0x1a0 [btusb 675430d1e87c4f24d0c1f80efe600757a0f32bec]
>   btusb_rx_work+0x9e/0xe0 [btusb 675430d1e87c4f24d0c1f80efe600757a0f32bec]
>   worker_thread+0xe44/0x2cc0
>   kthread+0x2ff/0x3a0
>   ret_from_fork+0x51/0x80
>   ret_from_fork_asm+0x1b/0x30
>   </TASK>
> 
> Allocated by task 82:
>   stack_trace_save+0xdc/0x190
>   kasan_set_track+0x4e/0x80
>   __kasan_slab_alloc+0x4e/0x60
>   kmem_cache_alloc+0x19f/0x360
>   skb_clone+0x132/0xf70
>   btusb_recv_acl_mtk+0x104/0x1a0 [btusb]
>   btusb_rx_work+0x9e/0xe0 [btusb]
>   worker_thread+0xe44/0x2cc0
>   kthread+0x2ff/0x3a0
>   ret_from_fork+0x51/0x80
>   ret_from_fork_asm+0x1b/0x30
> 
> Freed by task 1733:
>   stack_trace_save+0xdc/0x190
>   kasan_set_track+0x4e/0x80
>   kasan_save_free_info+0x28/0xb0
>   ____kasan_slab_free+0xfd/0x170
>   kmem_cache_free+0x183/0x3f0
>   hci_devcd_rx+0x91a/0x2060 [bluetooth]
>   worker_thread+0xe44/0x2cc0
>   kthread+0x2ff/0x3a0
>   ret_from_fork+0x51/0x80
>   ret_from_fork_asm+0x1b/0x30
> 
> The buggy address belongs to the object at ffff888033cfab40
>   which belongs to the cache skbuff_head_cache of size 232
> The buggy address is located 112 bytes inside of
>   freed 232-byte region [ffff888033cfab40, ffff888033cfac28)
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
>   ffff888033cfaa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
>   ffff888033cfab00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
>> ffff888033cfab80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                       ^
>   ffff888033cfac00: fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc
>   ffff888033cfac80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



