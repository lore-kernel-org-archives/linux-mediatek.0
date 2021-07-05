Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055F1C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 06:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC760613E7
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 06:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC760613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJrXVPGF/c5ZYBiaTtWAwQTR6wPbkBi3szy21pIlcf8=; b=1iiYso0NXLzeLr
	ELzTQwX9zYzrFnTfP6H4/YnmDAF0rQSfxiVFfF/gUJepYaJ9XGfCGFCMKfo4miBfvHnYsFgsF+Ncc
	L7Flp+Y3yjUg1kFYeqJrYINeIXrGT1CAW364Nx00ZDB6KbvGemQsIlFjYcLFPL0WVrfaFG9oRB9mH
	HkzR6DLCRa6Uw81Y3EjCQ+nKePFQjfmjuyWgpo2JXL/u4JFoJoQywfMvhU7PDnm7E73Kdf0ZtwCT5
	BQY8oMIy8ObE83CfXCq6O+Xe0kVNTlfXvx/A7XLKamwPAuzCiD3IBysEFXUTekVsAAwHsZVvJ7dex
	yDZQUrWgy9cXj9vsXfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HiC-007xS9-Kx; Mon, 05 Jul 2021 06:04:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Hhz-007xPL-SZ; Mon, 05 Jul 2021 06:03:57 +0000
X-UUID: 4bca15fb942b4b5498ccef5e5b910904-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3Lbb8DnJYAqu4D4uxpr2YqSoPb60hyB0hAmGTAf//sU=; 
 b=K/xUfzqaBDbkfMuQeeqVQf5PDaETdSFp93+dhnPGddkChDUUY1e0ZR0YFxZCtdYShkOVBDt0TCvVg+MjGWZW5F1QiEsytEygjGudh84VeNy6rqgomjA3ZLR56hTMMzZEm4HfTV2R++T/VHTCBf2au7N5X3xJGeaznK8fGrWoUWc=;
X-UUID: 4bca15fb942b4b5498ccef5e5b910904-20210704
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1120041421; Sun, 04 Jul 2021 23:03:51 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 23:03:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 14:03:42 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 14:03:41 +0800
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
Date: Mon, 5 Jul 2021 13:48:02 +0800
Message-ID: <20210705054802.31052-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210701085117.19018-1-rocco.yue@mediatek.com>
References: <20210701085117.19018-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_230355_973266_0864D36D 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, 2021-07-01 at 16:51 +0800, Rocco Yue wrote:
> On Wed, 2021-06-30 at 22:41 -0600, David Ahern wrote:
>> On 6/30/21 9:39 PM, Rocco Yue wrote:
>>> 
>>> Hi David,
>>> 
>>> Thanks for your review.
>>> 
>>> This patch is different with IN6_ADDR_GEN_MODE_NONE.
>>> 
>>> When the addr_gen_mode == IN6_ADDR_GEN_MODE_NONE, the Linux kernel
>>> doesn't automatically generate the ipv6 link-local address.
>>> 
>> 
>> ...
>> 
>>> 
>>> After this patch, when the "disable_gen_linklocal_addr" value of a device
>>> is 1, no matter in which addr_gen_mode, the Linux kernel will not automatically
>>> generate an ipv6 link-local for this device.
>>> 
>> 
>> those 2 sentences are saying the same thing to me.
>> 
>> for your use case, why is setting addr_gen_mode == 1 for the device not
>> sufficient?
>> 
> 
> For mobile operators that don't need to support RFC7217, setting
> addr_gen_mode == 1 is sufficient;
> 
> But for some other mobile operators that need to support RFC7217, such as AT&T,
> the mobile device's addr_gen_mode will be switched to the
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY, instead of using IN6_ADDR_GEN_MODE_NONE.
> The purpose is: in the IN6_ADDR_GEN_MODE_STABLE_PRIVACY mode, kernel can
> gererate a stable privacy global ipv6 address after receiveing RA, and
> network processes can use this global address to communicate with the
> outside network.
> 
> Of course, mobile operators that need to support RFC7217 should also meet
> the requirement of 3GPP TS 29.061, that is, MT should use IID assigned by
> the GGSN to build its ipv6 link-local address and use this address to send RS.
> We don't want the kernel to automatically generate an ipv6 link-local address
> when addr_gen_mode == 2. Otherwise, using the stable privacy ipv6 link-local
> address automatically generated by the kernel to send RS message, GGSN will
> not be able to respond to the RS and reply a RA message.
> 
> Therefore, after this patch, kernel will not generate ipv6 link-local address
> for the corresponding device when addr_gen_mode == 1 or addr_gen_mode == 2.
> 
> Thanks,
> Rocco
> 

Hi David,

Gentle ping for this patch.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
