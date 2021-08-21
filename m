Return-Path: <SRS0=N9OQ=NM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD59C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 06:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371E461185
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 06:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 371E461185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjOkVOO1G3OYKOqKLg0g4c13NEJGLS0AI2q6tL+cajI=; b=qTzMRX+7d2aICF
	TMG0lQh3NEj19t4OS+u+sCtYXuoW+7GthLOA59+GgC/4XUoLlb2ikPiFqkDgX+bW/jun5TpdSruW1
	52xgLYSXdJsK4zE3oe/W00jVsNhynIxhFu9SETM2AEWQbN14J7m2sLm3uNGlllfKTyN9nfmSmuPxx
	+GTscwP978ZORfQVzGUzSJTXuN52kfbsnb5rveQ9gdQ82S+ohCBZDvDRwwI8Y3QML9G7G5neThKLC
	IpQITb9jmDAd0JfxuT1xzxlSq9vHUC8oJzS0PefMcQCX9yb9ZeISz+X5GL5/p2a6Tdi0xUiQJrseQ
	kh7AvwUXcIFTghxu+AGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHKDe-00CVuh-8D; Sat, 21 Aug 2021 06:11:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHKDX-00CVu8-8A; Sat, 21 Aug 2021 06:10:59 +0000
X-UUID: 069b3ca607db4b22b6b9b9a0ef0a7825-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=B6hFEJsV8FxcoO8Yno9P215ZBqmzvor1eHB8oHEw8Ds=; 
 b=bilmzm1A3kl/jPBRg6cyRxyrPZ+hkfnfvBjMCZlhXD+rVp2cVBeh/9T09Bsm+V9Y6v3kd8WNE4HXMC7XKQL4OrafcGrvhImNXZCeCKAy02DIzdSVCETaEE0XeejADdqE8ZfguhOfeUS3S896cucPDBJRkK4baJSZtyWNLwDKrmM=;
X-UUID: 069b3ca607db4b22b6b9b9a0ef0a7825-20210820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451371508; Fri, 20 Aug 2021 23:10:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 23:10:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 21 Aug 2021 14:10:48 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 21 Aug 2021 14:10:47 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v4] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Date: Sat, 21 Aug 2021 14:10:30 +0800
Message-ID: <20210821061030.26632-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ad32c931-3056-cdef-4b9b-aab654c61cb9@gmail.com>
References: <ad32c931-3056-cdef-4b9b-aab654c61cb9@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_231055_347032_C7E4A646 
X-CRM114-Status: GOOD (  19.81  )
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

On Tue, 2021-08-17 at 09:05 -0600, David Ahern wrote:
On 8/17/21 1:26 AM, Rocco Yue wrote:
>> @@ -1496,6 +1490,11 @@ static void ndisc_router_discovery(struct sk_buff *skb)
>>  		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
>>  		mtu = ntohl(n);
>>  
>> +		if (in6_dev->ra_mtu != mtu) {
>> +			in6_dev->ra_mtu = mtu;
>> +			send_ifinfo_notify = true;
>> +		}
>> +
>>  		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
>>  			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
>>  		} else if (in6_dev->cnf.mtu6 != mtu) {
> 
> 
> If an RA no longer carries an MTU or if accept_ra_mtu is reset, then
> in6_dev->ra_mtu should be reset to 0 right?
> 
> rest of the change looks good to me.

Hi David,

Thanks for your review.

In this patch, if an RA no longer carries an MTU or if accept_ra_mtu is reset,
in6_dev->ra_mtu will not be reset to 0, its value will remain the previous
accept_ra_mtu=1 and the value of the mtu carried in the RA msg. This behavior
is same with mtu6. This should be reasonable, it would show that the device
had indeed received the ra_mtu before set accept_ra_mtu to 0 or an RA no longer
carries an mtu value. I am willing to listen to your suggestions and make
changes if needed, maybe it needs to add a new separate proc handler for
accept_ra_mtu.

In addition, at your prompt, I find that this patch maybe have a defect for
some types of virtual devices, that is, when the state of the virtual device
updates the value of ra_mtu during the UP period, when its state is set to
DOWN, ra_mtu is not reset to 0, so that its ra_mtu value remains the previous
value after the interface is re-UP. I think I need to fix it.

Thanks
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
