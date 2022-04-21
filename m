Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 02:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zlb5iZ2r7Wz7adLPORtLuPd5TrZvLIZEyGUtKJwkzI=; b=wnXSZEgn6Ns8nL
	GNcgtUSbi1a1NKMAYylNcKbZfmCrmKB/9jjorjunNqIBxq6txLWZdO8+z7VsF3SUL97+4JhR4w4qH
	XpYolYZAxwr6x+RV9tt4btYkmsZVQn7K+LR7Wqb874kiju7CD7+uPv+Gfjze9VhV1LzjuK09R/PBJ
	Dvn2PTLlVUUCvIDOLMEWeKUocG8Cy6e0+BRsDpsEXgmyytpzuq2Z8pCkdJNAj2pKdgExu0cSdnkw1
	Bj+sNiVGBWbv1VQbhdL4nQe2vabkIl+ksKLmLKTyM6BfOGw8LWDqVJFvW4ZZecl0RpGze4Jfi7lca
	zivOYGVlBy64weUsVTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhMLL-00B8bf-V2; Thu, 21 Apr 2022 02:14:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhMLI-00B8bB-D1
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 02:14:50 +0000
X-UUID: 330e0e72e4e24df5a85d5e0a0633137b-20220420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=z3FEF2fYWl+FXjaxy6KJSkyozrjgy35Bi9YStdUeIuI=; 
 b=XWEAWpviGuBRpURAbcMdfN23lhQUU1f1ryo7r/NWbdl1Ga4Yts5pU0SeJ164yX6EHzJN1z8Ydm5oCtXUbudpaauU+xeOR4CWSr6aTL+XaJbzA9M46i66uroKTozwSBlxWo96gXpc85c1w+fqTRh8OPC+yU1+IA1iulnvAbdEUOQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:5c337e33-e891-4a30-80d6-cc59b9d64013, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f0196af0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 330e0e72e4e24df5a85d5e0a0633137b-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1077571730; Wed, 20 Apr 2022 19:14:43 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 19:14:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 10:14:39 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 21 Apr 2022 10:14:38 +0800
Message-ID: <0576ef565f161b6044cb5143b4b5bde1acece1c2.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: fix msta->wcid use-after-free in
 mt76_tx_status_check()
From: bo.jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Thu, 21 Apr 2022 10:14:39 +0800
In-Reply-To: <ad0756ac-ebaa-b5b3-6680-539e6986a11a@nbd.name>
References: <20220420031451.6770-1-bo.jiao@mediatek.com>
 <ad0756ac-ebaa-b5b3-6680-539e6986a11a@nbd.name>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_191448_498033_53BD870B 
X-CRM114-Status: GOOD (  28.26  )
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

hi felix.

we found this crash calltrace:
[2022-03-26 10:12:33.755] [48338.807322] Unable to handle kernel NULL
pointer dereference at virtual address 0000000000000003
[2022-03-26 10:12:34.104] [48338.816123] Mem abort info:
[2022-03-26 10:12:34.104] [48338.818908]   ESR = 0x96000006
[2022-03-26 10:12:34.104] [48338.821983]   EC = 0x25: DABT (current
EL), IL = 32 bits
[2022-03-26 10:12:34.104] [48338.827298]   SET = 0, FnV = 0
[2022-03-26 10:12:34.104] [48338.830036] br-lan: port 6(ra0) entered
blocking state
[2022-03-26 10:12:34.104] [48338.830338]   EA = 0, S1PTW = 0
[2022-03-26 10:12:34.104] [48338.830341] Data abort info:
[2022-03-26 10:12:34.104] [48338.835489] br-lan: port 6(ra0) entered
disabled state
[2022-03-26 10:12:34.104] [48338.838609]   ISV = 0, ISS = 0x00000006
[2022-03-26 10:12:34.104] [48338.841709] device ra0 entered promiscuous
mode
[2022-03-26 10:12:34.104] [48338.846636]   CM = 0, WnR = 0
[2022-03-26 10:12:34.104] [48338.846642] user pgtable: 4k pages, 39-bit 
VAs, pgdp=000000005a94d000
[2022-03-26 10:12:34.104] [48338.846647] [0000000000000003]
pgd=000000005a88b003, pud=000000005a88b003, pmd=0000000000000000
[2022-03-26 10:12:34.104] [48338.850605] br-lan: port 6(ra0) entered
blocking state
[2022-03-26 10:12:34.104] [48338.855016] Internal error: Oops: 96000006
[#1] SMP
[2022-03-26 10:12:34.104] [48338.857981] br-lan: port 6(ra0) entered
forwarding state
[2022-03-26 10:12:34.104] [48338.864382] Modules linked in: ksmbd pppoe
....
[2022-03-26 10:12:34.124] [48339.002070] CPU: 2 PID: 8122 Comm:
kworker/u8:4 Not tainted 5.4.182 #0
[2022-03-26 10:12:34.124] [48339.008575] Hardware name: MediaTek
MT7986b RFB (DT)
[2022-03-26 10:12:34.124] [48339.013533] Workqueue: phy1
mt7915_mac_work [mt7915e]
[2022-03-26 10:12:34.124] [48339.018568] pstate: 80000005 (Nzcv daif
-PAN -UAO)
[2022-03-26 10:12:34.124] [48339.023344] pc :
mt76_tx_status_check+0x98/0xd8 [mt76]
[2022-03-26 10:12:34.124] [48339.028464] lr :
mt76_tx_status_check+0x98/0xd8 [mt76]
[2022-03-26 10:12:34.124] [48339.033581] sp : ffffffc01adf3d10
[2022-03-26 10:12:34.124] [48339.036879] x29: ffffffc01adf3d10 x28:
0000000000000000 
[2022-03-26 10:12:34.124] [48339.042171] x27: ffffff801b27b738 x26:
ffffffc0108a07e0 
[2022-03-26 10:12:34.124] [48339.047463] x25: 0000000000000002 x24:
ffffff801b302ba8 
[2022-03-26 10:12:34.124] [48339.052756] x23: ffffff801bd8df78 x22:
0000000000000000 
[2022-03-26 10:12:34.124] [48339.058048] x21: ffffffc01adf3d58 x20:
ffffff801bd8a840 
[2022-03-26 10:12:34.124] [48339.063340] x19: fffffffffffffee3 x18:
0000000059479c00 
[2022-03-26 10:12:34.124] [48339.068632] x17: 00000000ffffffff x16:
0000000000000000 
[2022-03-26 10:12:34.124] [48339.073924] x15: 0000000000000d80 x14:
ffffffc010b95000 
[2022-03-26 10:12:34.133] [48339.079216] x13: 00000000000006c0 x12:
0000000000000040 
[2022-03-26 10:12:34.133] [48339.084508] x11: 0000000000000228 x10:
0000000000000000 
[2022-03-26 10:12:34.133] [48339.089800] x9 : 0000000000000000 x8 :
0000000000000000 
[2022-03-26 10:12:34.133] [48339.095092] x7 : 0000000000000001 x6 :
0000009259428972 
[2022-03-26 10:12:34.133] [48339.100384] x5 : 0000000000000000 x4 :
0000000000000000 
[2022-03-26 10:12:34.133] [48339.105676] x3 : ffffff801b34ccf0 x2 :
000000007fffffff 
[2022-03-26 10:12:34.133] [48339.110968] x1 : 000000001b34ccf1 x0 :
0000000000000000 
[2022-03-26 10:12:34.133] [48339.116261] Call trace:
[2022-03-26 10:12:34.133]
[48339.118696]  mt76_tx_status_check+0x98/0xd8 [mt76]
[2022-03-26 10:12:34.133] [48339.123470]  mt7915_mac_work+0x60/0x90
[mt7915e]
[2022-03-26 10:12:34.133] [48339.128073]  process_one_work+0x1fc/0x390
[2022-03-26 10:12:34.133] [48339.132066]  worker_thread+0x48/0x4d0
[2022-03-26 10:12:34.133] [48339.135712]  kthread+0x120/0x128
[2022-03-26 10:12:34.133] [48339.138926]  ret_from_fork+0x10/0x1c


void
mt76_tx_status_check(struct mt76_dev *dev, bool flush)
{
	struct mt76_wcid *wcid, *tmp;
	struct sk_buff_head list;

	mt76_tx_status_lock(dev, &list);
	list_for_each_entry_safe(wcid, tmp, &dev->wcid_list, list)
		mt76_tx_status_skb_get(dev, wcid, flush ? -1 : 0,
&list);
	mt76_tx_status_unlock(dev, &list);
}

crash on:list_for_each_entry_safe(wcid, tmp, &dev->wcid_list, list)
we get wcid from dev->wcid_list, 
x19: fffffffffffffee3 is wcid

our test steps:
1. Configured APUT setting as 3 BSSID with 2G band / WPA2-PSK
AES/NGHT/Channel 11/HT40/ group key rotation upgrade interval to 5 mins
in card0.
2. Configured APUT setting as 3 BSSID with 5G band / WPA3-PSK AES
/HE_5G/Channel 149/ HE160/ group key rotation upgrade interval to 5
mins in card1.
3. Intetface down 
4. wifi restart
5. Repeat step3 to step4 about 500 times.
6. After Step5 ,Check it's without any error or crash.. 
7. After Step5, Check the APUT memory usage and memory leakage issue.
the crash disappeared after applied my patch.

thanks.

On Wed, 2022-04-20 at 12:40 +0200, Felix Fietkau wrote:
> On 20.04.22 05:14, Bo Jiao wrote:
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > 
> > fix msta->wcid use-after-free in mt76_tx_status_check when the sta
> > has been removed.
> > 
> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> > ---
> >   drivers/net/wireless/mediatek/mt76/mt7915/main.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> > index 800f720..160d80e 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> > @@ -701,6 +701,11 @@ void mt7915_mac_sta_remove(struct mt76_dev
> > *mdev, struct ieee80211_vif *vif,
> >   	if (!list_empty(&msta->rc_list))
> >   		list_del_init(&msta->rc_list);
> >   	spin_unlock_bh(&dev->sta_poll_lock);
> > +
> > +	spin_lock_bh(&mdev->status_lock);
> > +	if (!list_empty(&msta->wcid.list))
> > +		list_del_init(&msta->wcid.list);
> > +	spin_unlock_bh(&mdev->status_lock);
> 
> I'm trying to figure out where this use-after-free bug is coming
> from,
> and I can't seem to find the cause of it.
> 
> Some context:
> mt7915_mac_sta_remove is called by __mt76_sta_remove, which also
> calls
> mt76_packet_id_flush afterwards.
> mt76_packet_id_flush calls mt76_tx_status_skb_get in a way that makes
> it
> iterate over all pending tx status packets and clearing them from the
> idr.
> If the idr is empty afterwards, it calls list_del_init(&wcid->list).
> The only way I can see your patch making a difference would be if
> clearing the idr fails. That could happen if for some unknown reason,
> cb->pktid is out of sync with the id that was used to add the packet
> to
> the idr.
> 
> Can you please try the patch below and see if it avoids use-after-
> free
> issues and if it also shows the warning I added?
> 
> Thanks,
> 
> - Felix
> 
> 
> ---
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -181,7 +181,8 @@ mt76_tx_status_skb_get(struct mt76_dev *dev,
> struct mt76_wcid *wcid, int pktid,
>   		/* It has been too long since DMA_DONE, time out
> this packet
>   		 * and stop waiting for TXS callback.
>   		 */
> -		idr_remove(&wcid->pktid, cb->pktid);
> +		WARN(id != cb->pktid, "Packet id %d does not match
> idr id %d\n", cb->pktid, id);
> +		idr_remove(&wcid->pktid, id);
>   		__mt76_tx_status_skb_done(dev, skb,
> MT_TX_CB_TXS_FAILED |
>   						    MT_TX_CB_TXS_DO
> NE, list);
>   	}
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
