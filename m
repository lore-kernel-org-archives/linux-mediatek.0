Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF05C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 07:23:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CE161B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 07:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84CE161B08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OK5xgEvJP40/P0AxDwbqSANLArxb/3PB+sKWuEo41eE=; b=KQCE25QldsP6iL
	OfZfgB9ySGpypuTSbAqGhObCUF/T6CD8f61CQhtI7HZ8yehQztgM/bhYa4KL06tZW498UASLUGJP2
	11ovTibgQXJbGoXv10ouqPx1T03lhaqngbh03vBI8V4bQHPrAZKBAjzb7eVnenfeO/7ed4LChViIR
	8fXpEJw+oS2NgO9YMAFjSAhW08JPXQCO02ngn52bVX50KDADo+6AACw9VejGEXMCzREpsc2Sohnxk
	pue89DSBco2Qw7WlE73X/k8MZARMwyQeubYw81KEx73cqGvZMQ0TVFPmoFqKoXnSbJLRSjzm/6oB6
	oA/Mbk76EqyDTtflIy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFHR-003ktw-Nf; Wed, 17 Nov 2021 07:22:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFGs-003kgw-3z; Wed, 17 Nov 2021 07:22:20 +0000
X-UUID: b990692390a74b31b17753dc2b2ce653-20211117
X-UUID: b990692390a74b31b17753dc2b2ce653-20211117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1425235276; Wed, 17 Nov 2021 00:22:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 23:22:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 15:22:11 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 15:22:10 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: <lorenzo@google.com>, <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <Rocco.Yue@gmail.com>,
 <chao.song@mediatek.com>, <yanjie.jiang@mediatek.com>,
 <kuohong.wang@mediatek.com>, <zhuoliang.zhang@mediatek.com>,
 <maze@google.com>, <markzzzsmith@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
Date: Wed, 17 Nov 2021 15:17:32 +0800
Message-ID: <20211117071732.7455-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAKD1Yr02W-WuLx8ouvP+wTtkxeyTBW_dp1deo9sim7wfLA2LXQ@mail.gmail.com>
References: <CAKD1Yr02W-WuLx8ouvP+wTtkxeyTBW_dp1deo9sim7wfLA2LXQ@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_232218_208166_B2204A01 
X-CRM114-Status: GOOD (  25.03  )
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

On Wed, 2021-11-17 at 13:09 +0800, Lorenzo Colitti wrote:
> On Tue, Nov 16, 2021 at 3:15 PM Rocco Yue <rocco.yue@mediatek.com>
> wrote:
>> 
>> In the 3GPP TS 29.061, here is a description as follows:
>> "In order to avoid any conflict between the link-local address
>> of the MS and that of the GGSN, the Interface-Identifier used by
>> the MS to build its link-local address shall be assigned by the
>> GGSN.
>> [...]
>> 1) IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA, this mode is suitable
>> for cellular networks that support RFC7217. In this mode, the
>> kernel doesn't generate a link-local address for the cellular
>> NIC, and generates an ipv6 stable privacy global address after
>> receiving the RA message.
> 
> 
> It sounds like this would violate RFC 4291 section 2.1 which says
> "All
> interfaces are required to have at least one Link-Local unicast
> address. It is also not what 3GPP requires. 3GPP *does* require a
> link-local address. It just requires that that the bottom 64 bits of
> that link-local address be assigned by the network, not randomly.
>

Hi Lorenzo,

Thanks for your reply. :-)

Disabling the kernel's automatic link-local address generation
doesn't mean that it violates RFC 4291, because an appropriate
link-local addr can be added to the cellulal NIC through ioctl.

In fact, the current kernel has similar precedents. For example,
when device type is ARPHRD_NONE, and its addr_gen_mode is NONE,
the kernel will never generate a link-local addr for such interface.

> Given that the kernel already supports tokenized interface addresses,
> a better option here would be to add new addrgen modes where the
> link-local address is formed from the interface token (idev->token),
> and the other addresses are formed randomly or via RFC7217. These
> modes could be called IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN and
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN. When setting up the
> interface, userspace could set disable_ipv6 to 1, then set the
> interface token and the address generation mode via RTM_SETLINK, then
> set disable_ipv6 to 0 to start autoconf. The kernel would then form
> the link-local address via the token (which comes from the network),
> and then set the global addresses either randomly or via RFC 7217.

The method you mentioned can also solve the current problem, but it
seems to introduce more logic: 
  (1) set the cellular interface addr_gen_mode to RANDOM_LL_TOKEN or PRIVACY_LL_TOKEN;
  (2) set the cellular interface up;
  (3) disable ipv6 first;
  (4) set token addr through netlink;
  (5) autoconf through the kernel;
  (6) kernel trigger send RS message;

For the current patch, it is simpler, the configure process as follows:
  (1) set the cellular NIC addr_gen_mode to RANDOM_NO_LLA or PRIVACY_NO_LLA;
  (2) set the cellular interface up;
  (3) configure the link-local addr for the NIC by ioctl;
  (4) kernel trigger send RS message;

I wonder to hear what you and David think.

Thanks,

Rocco


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
