Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=na+AuNQqOLBXLdaq3AUy6E3GK0erie05g1mtUsMJz+Q=; b=aPa4arsaM6zVT4
	W6js8s2I8vdIy7cr0wMcFroTaQ/T3fAMsUhpeNLEAwVrJN9fWeeMQMzhqP3rdAFUNsE7FbNVMbD34
	KhkLMOu/eBjHqxA32L39IUrNeZ2VOHKTV3zmQDEbtz9dzEoxkzyrJM8IG8t2NHeu/32r3mpl/1e9t
	r7W9KeYiv98GlDgE+AqVMd1LDEM1/Uk/aWpe5AgXUHpg2v6YlmtUwttfV2H6DNfVHeu1FSBqfZaiA
	KN9ixFf7SjSo2WmanBFmYZmQ9L66cmKcPHUFJtWg1RC8pASMDCSBgaR0DigOgNBiRZ2VTPDMLkBk+
	w0toQUwdgDEdEjOXddig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhWR-005qm6-Fl; Thu, 03 Mar 2022 09:13:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhWN-005qlI-Py
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 09:13:18 +0000
X-UUID: 45a4d50c13aa4d96a2e2d6325da8d1a6-20220303
X-UUID: 45a4d50c13aa4d96a2e2d6325da8d1a6-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 906951004; Thu, 03 Mar 2022 02:13:07 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 01:13:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 17:12:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 17:12:58 +0800
Message-ID: <60fd581a57945efc1c6a2a8d58a88301a79e51ec.camel@mediatek.com>
Subject: Re: [PATCH] mt76: fix monitor mode crash with sdio driver
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Thu, 3 Mar 2022 17:12:58 +0800
In-Reply-To: <d065e4492a9e995d6ebe95c7ad8a1ec6183f56ef.1646277169.git.deren.wu@mediatek.com>
References: <d065e4492a9e995d6ebe95c7ad8a1ec6183f56ef.1646277169.git.deren.wu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_011315_883697_CE5D02E6 
X-CRM114-Status: GOOD (  17.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Felix,

I need to submit v2 patch. Please drop this one.


Thanks,
Deren


On Thu, 2022-03-03 at 11:28 +0800, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> mt7921s driver may receive frames with fragment buffers. If there is
> a
> CTS packet received in monitor mode, the payload is 10 bytes only and
> need 6 bytes header padding after RXD buffer. However, only RXD in
> the
> first linear buffer, if we pull buffer size RXD-size+6 bytes with
> skb_pull(), that would trigger "BUG_ON(skb->len < skb->data_len)" in
> __skb_pull().
> 
> To avoid the nonlinear buffer issue, enlarge the RXD size from 128 to
> 136 to make sure all MCU operation in linear buffer.
> 
> 136 = 128 + 8
>   128 : RXD size
>   8   : max header padding length
> 
> [   52.007562] kernel BUG at include/linux/skbuff.h:2313!
> [   52.007578] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> [   52.007987] pc : skb_pull+0x48/0x4c
> [   52.008015] lr : mt7921_queue_rx_skb+0x494/0x890 [mt7921_common]
> [   52.008361] Call trace:
> [   52.008377]  skb_pull+0x48/0x4c
> [   52.008400]  mt76s_net_worker+0x134/0x1b0 [mt76_sdio
> 35339a92c6eb7d4bbcc806a1d22f56365565135c]
> [   52.008431]  __mt76_worker_fn+0xe8/0x170 [mt76
> ef716597d11a77150bc07e3fdd68eeb0f9b56917]
> [   52.008449]  kthread+0x148/0x3ac
> [   52.008466]  ret_from_fork+0x10/0x30
> 
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
> b/drivers/net/wireless/mediatek/mt76/mt76.h
> index 5e10fe156926..4f4ce3b3df54 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -19,7 +19,8 @@
>  
>  #define MT_MCU_RING_SIZE	32
>  #define MT_RX_BUF_SIZE		2048
> -#define MT_SKB_HEAD_LEN		128
> +/* 136 = 128+8. 128: RXD, 8:max header padding*/
> +#define MT_SKB_HEAD_LEN		136
>  
>  #define MT_MAX_NON_AQL_PKT	16
>  #define MT_TXQ_FREE_THR		32


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
