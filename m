Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB7AC49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B8E613E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B8E613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79W1JxoYW41x4AnLvVa3jSrbArIOM/oX3HhbHRY161E=; b=ezdPHPeXA74YVz
	MgzwxxF/RqVHGUdk8P0rzug9ZIsgA1/35NYhg87KyQNa+D27SduVTZae/WahgpVTUVL/AoUBwek0q
	/7xv9WXeF92n5LL2El62sOhlkU/alx8EIUvtNiaAlCUGL3ZsMgnGFaPEhncuYdLqpYeFtIUqySfPp
	lJPEAoumAqZxwZftXPdGti9qVweW2FBrpCAa8aBE/LkIgtnb1qnLKrRK86a270OaYqgYpY3m0xpTu
	DnUH6T6Uoulq9CwlrF3wTyGgI7yaSQ4pFth3gNn1pepM+nPRnHbDen861v7HaXpDH7S+aBylXi46E
	Fpqwp/tkchs6z9xU8GGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwOA7-00EVwg-3N; Thu, 24 Jun 2021 12:08:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwOA3-00EVva-43; Thu, 24 Jun 2021 12:08:50 +0000
X-UUID: 9f8fbeabd04b4c1b933a1a348ecd3d75-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w7PrGw2Mx+cRFueVjwc3x1ibs4XaIbjw24eDzHulCzA=; 
 b=FnCbU6xCcluQrqNeEZnCQXCZPnuEMEZzum7Kqxd3h2i8u7WKLraq/+ZVRfklRNm7u1wlG2wg3FmBBrWFrLSgn+XemEkPnkNJrfcp9e34ymQuL5CZEv+tMKdKfp6BcY6HTF9Ulk8mr6Xt3xFIIeNKgeDyrDNEab5IGUGq+rp5Jm0=;
X-UUID: 9f8fbeabd04b4c1b933a1a348ecd3d75-20210624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1121627192; Thu, 24 Jun 2021 05:08:43 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 05:08:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 20:08:39 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Jun 2021 20:08:38 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <bpf@vger.kernel.org>, <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Date: Thu, 24 Jun 2021 19:53:49 +0800
Message-ID: <20210624115349.2264-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNNv1AxDNBdPcQ1U@kroah.com>
References: <YNNv1AxDNBdPcQ1U@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_050848_630734_BF97203B 
X-CRM114-Status: GOOD (  37.17  )
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

On Wed, 2021-06-23 at 19:31 +0200, Greg KH wrote:
On Wed, Jun 23, 2021 at 07:34:52PM +0800, Rocco Yue wrote:
>> +static int ccmni_open(struct net_device *ccmni_dev)
>> +{
>> +	struct ccmni_inst *ccmni = netdev_priv(ccmni_dev);
>> +
>> +	netif_tx_start_all_queues(ccmni_dev);
>> +	netif_carrier_on(ccmni_dev);
>> +
>> +	if (atomic_inc_return(&ccmni->usage) > 1) {
>> +		atomic_dec(&ccmni->usage);
>> +		netdev_err(ccmni_dev, "dev already open\n");
>> +		return -EINVAL;
> 
> You only check this _AFTER_ starting up?  If so, why even check a count
> at all?  Why does it matter as it's not keeping anything from working
> here.
> 

Thanks for your review.
Looking back at this code block, it does have some ploblems,
ccmni->usage hasn't been used to protect some resources or do
some specific things in the current code, I will delete them.

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ccmni_close(struct net_device *ccmni_dev)
>> +{
>> +	struct ccmni_inst *ccmni = netdev_priv(ccmni_dev);
>> +
>> +	atomic_dec(&ccmni->usage);
>> +	netif_tx_disable(ccmni_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static netdev_tx_t
>> +ccmni_start_xmit(struct sk_buff *skb, struct net_device *ccmni_dev)
>> +{
>> +	struct ccmni_inst *ccmni = NULL;
>> +
>> +	if (unlikely(!ccmni_hook_ready))
>> +		goto tx_ok;
>> +
>> +	if (!skb || !ccmni_dev)
>> +		goto tx_ok;
>> +
>> +	ccmni = netdev_priv(ccmni_dev);
>> +
>> +	/* some process can modify ccmni_dev->mtu */
>> +	if (skb->len > ccmni_dev->mtu) {
>> +		netdev_err(ccmni_dev, "xmit fail: len(0x%x) > MTU(0x%x, 0x%x)",
>> +			   skb->len, CCMNI_MTU, ccmni_dev->mtu);
>> +		goto tx_ok;
>> +	}
>> +
>> +	/* hardware driver send packet will return a negative value
>> +	 * ask the Linux netdevice to stop the tx queue
>> +	 */
>> +	if ((s_ccmni_ctlb->xmit_pkt(ccmni->index, skb, 0)) < 0)
>> +		return NETDEV_TX_BUSY;
>> +
>> +	return NETDEV_TX_OK;
>> +tx_ok:
>> +	dev_kfree_skb(skb);
>> +	ccmni_dev->stats.tx_dropped++;
>> +	return NETDEV_TX_OK;
>> +}
>> +
>> +static int ccmni_change_mtu(struct net_device *ccmni_dev, int new_mtu)
>> +{
>> +	if (new_mtu < 0 || new_mtu > CCMNI_MTU)
>> +		return -EINVAL;
>> +
>> +	if (unlikely(!ccmni_dev))
>> +		return -EINVAL;
>> +
>> +	ccmni_dev->mtu = new_mtu;
>> +	return 0;
>> +}
>> +
>> +static void ccmni_tx_timeout(struct net_device *ccmni_dev, unsigned int txqueue)
>> +{
>> +	struct ccmni_inst *ccmni = netdev_priv(ccmni_dev);
>> +
>> +	ccmni_dev->stats.tx_errors++;
>> +	if (atomic_read(&ccmni->usage) > 0)
>> +		netif_tx_wake_all_queues(ccmni_dev);
> 
> Why does it matter what the reference count is?  What happens if it
> drops _RIGHT_ after testing for it?
> 
> Anytime you do an atomic_read() call, it's almost always a sign that the
> logic is not correct.
> 
> Again, why have this reference count at all?  What is it protecting?
> 

The jedgment of ccmni->usage here is to ensure that the ccmnix interface
is already up when do wake up tx queue behavior.

Then I re-read the kernel code, I think my previous ider should be
wrong. the reason is that before calling ccmni_tx_timeout(), it
will check whether the dev exist or not, for example, it will be
checked in dev_watchdog().

I can delete this code.

>> +/* exposed API
>> + * receive incoming datagrams from the Modem and push them to the
>> + * kernel networking system
>> + */
>> +int ccmni_rx_push(unsigned int ccmni_idx, struct sk_buff *skb)
> 
> Ah, so this driver doesn't really do anything on its own, as there is no
> modem driver for it.
> 
> So without a modem driver, it will never be used?  Please submit the
> modem driver at the same time, otherwise it's impossible to review this
> correctly.
> 

without MTK ap ccci driver (modem driver), ccmni_rx_push() and
ccmni_hif_hook() are not be used.

Both of them are exported as symbols because MTK ap ccci driver
will be complied to the ccci.ko file.

In current codes, I implementated the basic functionality of ccmni,
such as open, close, xmit packet, rcv packet. And my original 
intention was that I can gradually complete some of the more
functions of ccmni on this basis, such as sw-gro, napi, or meet the
requirement of high throughput performance.

In addition, the code of MTK's modem driver is a bit complicated,
because this part has more than 30,000 lines of code and contains
more than 10 modules. We are completeing the upload of this huge
code step by step. Our original intention was to upload the ccmni
driver that directly interacts with the kernel first, and then
complete the code from ccmni to the bottom layer one by one from
top to bottom. We expect the completion period to be about 1 year.

> +++ b/drivers/net/ethernet/mediatek/ccmni/ccmni.h
> 
> Why do you have a .h file for a single .c file?  that shouldn't be
> needed.

I add a .h file to facilitate subsequent code expansion. If it's
not appropriate to do this here, I can add the content of .h into
.c file.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
