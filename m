Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF10C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxddD4ttW9JH0mDWBuhRJg1hzMrJrWdCsr/oTIrtjVQ=; b=Ex7wWEb1qyDd3V4hRWADtvjm4S
	PSJJUbuvUhmgmpyrg//NxoMUOIsAi8bf7jvLYo7hcajEp0KCXh2YNzybSD69guGVFDhqNMhl68F6b
	bGqd36ZhTXqUr8jAXZ22j0jcMJYewIW33mQ4zkvWIA5sPKouhSrxyr3zoV9mCDwUu2JKm/tIC69CH
	Zo7yD5VPWIfuVZTVnrvtfvI7InUmiHBW9zCjH8CARL82GF5cyZewJCGlfsLzLQM/u5vYNrsBUDg5S
	Ar747OXKKPFi/tV8jUrSIfTDVfcRiY0UbobYJ8JzexNOFh6Q8mtH7+HpWv+I0nkAQECGz/Mrpi3CF
	L5xVR4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWINy-007Rqt-9a; Sun, 26 Feb 2023 14:52:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWINP-007RZW-HJ; Sun, 26 Feb 2023 14:51:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1955060C4C;
	Sun, 26 Feb 2023 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D44DC433A0;
	Sun, 26 Feb 2023 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677423106;
	bh=KPCyFstw9exQqQKr55mQv4a0MH+XQcDbin9adazcQOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UkQZxIVW7ppF75PJ5Pbjt430pRfor45r2LTB+004hWrT2gLa7vQBDFmXd6Q/aC4Nu
	 E69UW3iw8JoR1c0c3eptZdBInFojY6/cyOoJG5aainy6JtWnAbkFY9objSUGOvVtbG
	 0DtDjxTBje70FeP0PXjB3avo8CIMiQ9+A+4zJzmahSx8F3lOHy/dgQuCP/hleYpwlL
	 Zhk8JhBCUL0RVm43crg4RVTohM6zf3ng6xcrDQWsw7geONVs14in3+xWrZr+DRKtnD
	 fDNwVk9ydJU5qQzoXw7INg96Wkw3G9AaRqeqgw3F0D/Iy7kIjjGtwgvLRAKgQwpi3y
	 a2zQWOYup8rDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisoo Jang <jisoo.jang@yonsei.ac.kr>,
	Jakub Kicinski <kuba@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 07/19] wifi: mt7601u: fix an integer underflow
Date: Sun, 26 Feb 2023 09:51:09 -0500
Message-Id: <20230226145123.829229-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226145123.829229-1-sashal@kernel.org>
References: <20230226145123.829229-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_065147_819540_77321879 
X-CRM114-Status: GOOD (  14.36  )
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

From: Jisoo Jang <jisoo.jang@yonsei.ac.kr>

[ Upstream commit 803f3176c5df3b5582c27ea690f204abb60b19b9 ]

Fix an integer underflow that leads to a null pointer dereference in
'mt7601u_rx_skb_from_seg()'. The variable 'dma_len' in the URB packet
could be manipulated, which could trigger an integer underflow of
'seg_len' in 'mt7601u_rx_process_seg()'. This underflow subsequently
causes the 'bad_frame' checks in 'mt7601u_rx_skb_from_seg()' to be
bypassed, eventually leading to a dereference of the pointer 'p', which
is a null pointer.

Ensure that 'dma_len' is greater than 'min_seg_len'.

Found by a modified version of syzkaller.

KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 PID: 12 Comm: ksoftirqd/0 Tainted: G        W  O      5.14.0+
#139
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
RIP: 0010:skb_add_rx_frag+0x143/0x370
Code: e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85 86 01 00 00 4c 8d 7d 08 44
89 68 08 48 b8 00 00 00 00 00 fc ff df 4c 89 fa 48 c1 ea 03 <80> 3c 02
00 0f 85 cd 01 00 00 48 8b 45 08 a8 01 0f 85 3d 01 00 00
RSP: 0018:ffffc900000cfc90 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888115520dc0 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffff8881118430c0 RDI: ffff8881118430f8
RBP: 0000000000000000 R08: 0000000000000e09 R09: 0000000000000010
R10: ffff888111843017 R11: ffffed1022308602 R12: 0000000000000000
R13: 0000000000000e09 R14: 0000000000000010 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff88811a800000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000004035af40 CR3: 00000001157f2000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 mt7601u_rx_tasklet+0xc73/0x1270
 ? mt7601u_submit_rx_buf.isra.0+0x510/0x510
 ? tasklet_action_common.isra.0+0x79/0x2f0
 tasklet_action_common.isra.0+0x206/0x2f0
 __do_softirq+0x1b5/0x880
 ? tasklet_unlock+0x30/0x30
 run_ksoftirqd+0x26/0x50
 smpboot_thread_fn+0x34f/0x7d0
 ? smpboot_register_percpu_thread+0x370/0x370
 kthread+0x3a1/0x480
 ? set_kthread_struct+0x120/0x120
 ret_from_fork+0x1f/0x30
Modules linked in: 88XXau(O) 88x2bu(O)
---[ end trace 57f34f93b4da0f9b ]---
RIP: 0010:skb_add_rx_frag+0x143/0x370
Code: e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85 86 01 00 00 4c 8d 7d 08 44
89 68 08 48 b8 00 00 00 00 00 fc ff df 4c 89 fa 48 c1 ea 03 <80> 3c 02
00 0f 85 cd 01 00 00 48 8b 45 08 a8 01 0f 85 3d 01 00 00
RSP: 0018:ffffc900000cfc90 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888115520dc0 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffff8881118430c0 RDI: ffff8881118430f8
RBP: 0000000000000000 R08: 0000000000000e09 R09: 0000000000000010
R10: ffff888111843017 R11: ffffed1022308602 R12: 0000000000000000
R13: 0000000000000e09 R14: 0000000000000010 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff88811a800000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000004035af40 CR3: 00000001157f2000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554

Signed-off-by: Jisoo Jang <jisoo.jang@yonsei.ac.kr>
Acked-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://lore.kernel.org/r/20221229092906.2328282-1-jisoo.jang@yonsei.ac.kr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt7601u/dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
index 6f2172be7b66a..072888072b0db 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -118,7 +118,8 @@ static u16 mt7601u_rx_next_seg_len(u8 *data, u32 data_len)
 	if (data_len < min_seg_len ||
 	    WARN_ON_ONCE(!dma_len) ||
 	    WARN_ON_ONCE(dma_len + MT_DMA_HDRS > data_len) ||
-	    WARN_ON_ONCE(dma_len & 0x3))
+	    WARN_ON_ONCE(dma_len & 0x3) ||
+	    WARN_ON_ONCE(dma_len < min_seg_len))
 		return 0;
 
 	return MT_DMA_HDRS + dma_len;
-- 
2.39.0


