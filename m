Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417E3C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3646146B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3646146B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMGqBj8ec1bb+lrNJycfV54t0Cob4ewSoUrUOW5psJ4=; b=HbgPLKeWAFiYDr
	yICi+PaI8K3aUgL8h5195IpegGG9hMI2C7x6BXA3Zp3KAEUgiJF2xZHSuPU+rBjHLJdjwIjgaI/34
	PPDEYPeaTsNZy/l0O2SMAU0GmH/G8qEyUbUWYGdClz6RtCMLF3j9Em8v8BgKmJcsDaywhOlmccql+
	sVZ/tVgH+2IjyCUrxhzUgKDoH2fT7F3LlBYpSFtJCzzhzHzbrZVCGYYVmOWRORqlUJ2aBNSRaC+ug
	PYqaZhYSKS1c6dMNepqFCsoo1JECfmTqdi7DFFGQgrjNyvp/FVeBeIgzz7A+bUHuRaSloGXV+lZ/2
	LNMr03xUZxfTgebO+ukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lysfk-00GenC-8F; Thu, 01 Jul 2021 09:07:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lysfL-00Gefx-MI; Thu, 01 Jul 2021 09:07:26 +0000
X-UUID: 353c98beadb2415a953c7d8ba8a8b0b7-20210701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vLKrgJuRc3ysI9+l11z4d3a6B3EDBD0K3aG3eX3QlZs=; 
 b=KbxSfRIzvY3v4Zcq/hjKa1hll2XpsSxcSqmYNYnYOxps02uXQs/aQEpburACrS75i5E2+m8t7Jq6t/meaFW2LgkhnvXetJS+hDVmkgpDjvlJoqq/OIFOlubKaCeab6YTxWHKswVnZdN6MSKiRm3rhVXrhLXqsgnxhnRzFDDW/7k=;
X-UUID: 353c98beadb2415a953c7d8ba8a8b0b7-20210701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1778230339; Thu, 01 Jul 2021 02:07:19 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 02:07:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 17:07:09 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 17:07:08 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, <zhuoliang.zhang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
Date: Thu, 1 Jul 2021 16:51:18 +0800
Message-ID: <20210701085117.19018-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_020725_234559_A9A19B96 
X-CRM114-Status: GOOD (  18.91  )
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

On Wed, 2021-06-30 at 22:41 -0600, David Ahern wrote:
> On 6/30/21 9:39 PM, Rocco Yue wrote:
>> 
>> Hi David,
>> 
>> Thanks for your review.
>> 
>> This patch is different with IN6_ADDR_GEN_MODE_NONE.
>> 
>> When the addr_gen_mode == IN6_ADDR_GEN_MODE_NONE, the Linux kernel
>> doesn't automatically generate the ipv6 link-local address.
>> 
> 
> ...
> 
>> 
>> After this patch, when the "disable_gen_linklocal_addr" value of a device
>> is 1, no matter in which addr_gen_mode, the Linux kernel will not automatically
>> generate an ipv6 link-local for this device.
>> 
> 
> those 2 sentences are saying the same thing to me.
> 
> for your use case, why is setting addr_gen_mode == 1 for the device not
> sufficient?
> 

For mobile operators that don't need to support RFC7217, setting
addr_gen_mode == 1 is sufficient;

But for some other mobile operators that need to support RFC7217, such as AT&T,
the mobile device's addr_gen_mode will be switched to the
IN6_ADDR_GEN_MODE_STABLE_PRIVACY, instead of using IN6_ADDR_GEN_MODE_NONE.
The purpose is: in the IN6_ADDR_GEN_MODE_STABLE_PRIVACY mode, kernel can
gererate a stable privacy global ipv6 address after receiveing RA, and
network processes can use this global address to communicate with the
outside network.

Of course, mobile operators that need to support RFC7217 should also meet
the requirement of 3GPP TS 29.061, that is, MT should use IID assigned by
the GGSN to build its ipv6 link-local address and use this address to send RS.
We don't want the kernel to automatically generate an ipv6 link-local address
when addr_gen_mode == 2. Otherwise, using the stable privacy ipv6 link-local
address automatically generated by the kernel to send RS message, GGSN will
not be able to respond to the RS and reply a RA message.

Therefore, after this patch, kernel will not generate ipv6 link-local address
for the corresponding device when addr_gen_mode == 1 or addr_gen_mode == 2.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
