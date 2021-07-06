Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEEEC07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 12:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0435E611B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 12:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0435E611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkY6Ag/QvvJ1hdGNn7/9ahKuBmZYv7waO8tG8I7k9BI=; b=wuM5cSQazh/HQr
	+iMBF8gOM8aHd9ocFspN+hxKW6tUwfSnom/hW6S3on01y2NVt0pdhvxnxfElJlATA/im0brlgG/vv
	OXK9jTo3OzQstNhwDybjUKT3kluXebxWuXr9hTCh95Pvrh7EjcnZ3fYMqHzaFwfC/+R5MtecI46aL
	cNPYJqLUmHUAmD071MXRDShl9riTUJOloSvdTfiETASIzWrwHaUW23LsqAVndsBjp6BCMWbzuO3wq
	rX/0+riLhTkRHFH5G/8SKgVIGQrhSLN5IUdJf3LQdc9UB58SWhprD2h8++tGkPi3385Y94XfgoSC1
	NB2PVSW8GiUn+X8FvA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0kZC-00Bpz4-GD; Tue, 06 Jul 2021 12:52:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0kYy-00BpwT-1N; Tue, 06 Jul 2021 12:52:34 +0000
X-UUID: a0e20190beb040b893424ec3e1100c3b-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pT+nI49nT3uqhDAQkA681Y6x2H/UREcw3ZZ0AF20oKo=; 
 b=Qb5U6vr0Ydzi3O7RpDe3eOGgRKHosFNyvsTNaJR5WWqTNonmdP7beqaunlLttJDFJByOmz9ilOf49eJk5qoWScxPJeaL9EbX/5fM0so/67zcvQx7UR2wfb7LKIoQxNx8CndnqqmS9DGSRi0wglfXe56KE0MmNew2PSI8wjyRcnA=;
X-UUID: a0e20190beb040b893424ec3e1100c3b-20210706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 948413110; Tue, 06 Jul 2021 05:52:29 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 05:52:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 20:52:20 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Jul 2021 20:52:19 +0800
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
Date: Tue, 6 Jul 2021 20:37:02 +0800
Message-ID: <20210706123702.29375-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
References: <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_055233_542320_98F47A4C 
X-CRM114-Status: GOOD (  20.97  )
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

On Mon, 2021-07-05 at 10:35 -0600, David Ahern wrote:
> On 7/1/21 2:51 AM, Rocco Yue wrote:
>> On Wed, 2021-06-30 at 22:41 -0600, David Ahern wrote:
>> 
>> For mobile operators that don't need to support RFC7217, setting
>> addr_gen_mode == 1 is sufficient;
>> 
>> But for some other mobile operators that need to support RFC7217, such as AT&T,
>> the mobile device's addr_gen_mode will be switched to the
>> IN6_ADDR_GEN_MODE_STABLE_PRIVACY, instead of using IN6_ADDR_GEN_MODE_NONE.
>> The purpose is: in the IN6_ADDR_GEN_MODE_STABLE_PRIVACY mode, kernel can
>> gererate a stable privacy global ipv6 address after receiveing RA, and
>> network processes can use this global address to communicate with the
>> outside network.
>> 
>> Of course, mobile operators that need to support RFC7217 should also meet
>> the requirement of 3GPP TS 29.061, that is, MT should use IID assigned by
>> the GGSN to build its ipv6 link-local address and use this address to send RS.
>> We don't want the kernel to automatically generate an ipv6 link-local address
>> when addr_gen_mode == 2. Otherwise, using the stable privacy ipv6 link-local
>> address automatically generated by the kernel to send RS message, GGSN will
>> not be able to respond to the RS and reply a RA message.
>> 
>> Therefore, after this patch, kernel will not generate ipv6 link-local address
>> for the corresponding device when addr_gen_mode == 1 or addr_gen_mode == 2.
>> 
> 
> I think another addr_gen_mode is better than a separate sysctl. It looks
> like IN6_ADDR_GEN_MODE_STABLE_PRIVACY and IN6_ADDR_GEN_MODE_RANDOM are
> the ones used for RAs, so add something like:
> 
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
> IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
> 
> to in6_addr_gen_mode.
> 

Hi David,

Thanks for your reply.

According to your suggestion, I checked the ipv6 code again. In my
opinion, adding another addr_gen_mode may not be suitable.

(1)
In the user space, the process enable the ipv6 stable privacy mode by
setting the "/proc/sys/net/ipv6/conf/<iface>/stable_secret".

In the kernel, the addr_gen_mode of a networking device is switched to
IN6_ADDR_GEN_MODE_STABLE_PRIVACY by judging the bool value of
"cnf.stable_secret.initialized".

So, although adding an additional IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
user space process has some trouble to let kernel switch the iface's
addr_gen_mode to the IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA.

This is not as flexible as adding a separate sysctl.

(2)
After adding "proc/sys/net/ipv6/<iface>/disable_gen_linklocal_addr",
so that kernel can keep the original code logic of the stable_secret
proc file, and expand when the subsequent kernel adds a new add_gen_mode
more flexibility and applicability.

And we only need to care about the networking device that do not
generate an ipv6 link-local address, and not the addr_gen_mode that
this device is using.

Maybe adding a separate sysctl is a better choice.
Looking forward to your professional reply again.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
