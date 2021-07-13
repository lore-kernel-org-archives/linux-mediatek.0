Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C22CC07E9A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 02:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 375AB6101B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 02:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 375AB6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDUY9p0jzTEWS1OVVZqqzyw5kAVU/2BrwzpiG05gPVY=; b=C1ob2ubjLaULxC
	aMj+bS2DHMqiN1z5yPyNKFgNaOl1+ovAeXAOFNlqUOJEl2458+AgTOeC7dVgW+KJla4STt9wcyU5l
	Ls5gAhexe5PLdz/Wp1to6baLEJiHeCYSQVHLjJQrcMM3uiDNben5bnYIJhuoT2yaWYU4BM2B3aNvb
	JJKN0wi5ztkIjPB2S9TlAOpqAJ5g8yJC8XmAUvUT8s3217ngQ975nhnibX4hsPXXppyCD2Nxnp0oO
	T09LcHjX1KD3Ai7pQ3ORjCj7/8Q9RG/nK287UM5fKqyN7avZQdrCcRQnvihOIx/jdgh4149KtjceN
	G2pjivi3OmkQoA8to86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m37nK-008tzz-J5; Tue, 13 Jul 2021 02:05:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m37nG-008tz2-D9; Tue, 13 Jul 2021 02:05:09 +0000
X-UUID: e2bbc90d9fb243839e509724ed8c8df3-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4oViP5uXnYLqf8hbYUOimIhkq2EuVTJGnVnMkuJN774=; 
 b=o37aj2kFs/IHjIwJWTRHxi0jBQMINgzc+Jajc5SKZeV2j4yySD07izWCda5RQO+JsWmRRqPgPAt+UX6cQPsE/PpMin54m+CEm8nxT3dk/8hbH61I5Dr7OmE93o98Tkf8UbrZWDHr6Zh852Jo50M8n8xIykstJa4dHG3wyuet/78=;
X-UUID: e2bbc90d9fb243839e509724ed8c8df3-20210712
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1868221768; Mon, 12 Jul 2021 19:05:02 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 19:05:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 10:04:58 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Jul 2021 10:04:57 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <maze@google.com>, <lorenzo@google.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>, <kuohong.wang@mediatek.com>, 
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
Date: Tue, 13 Jul 2021 09:49:24 +0800
Message-ID: <20210713014924.1831-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <40951584-8f53-4e95-4a6b-14ae1cf7f011@gmail.com>
References: <40951584-8f53-4e95-4a6b-14ae1cf7f011@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_190507_913625_DA9BD5BF 
X-CRM114-Status: GOOD (  21.00  )
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

>> According to your suggestion, I checked the ipv6 code again. In my
>> opinion, adding another addr_gen_mode may not be suitable.
>> 
>> (1)
>> In the user space, the process enable the ipv6 stable privacy mode by
>> setting the "/proc/sys/net/ipv6/conf/<iface>/stable_secret".
>> 
>> In the kernel, the addr_gen_mode of a networking device is switched to
>> IN6_ADDR_GEN_MODE_STABLE_PRIVACY by judging the bool value of
>> "cnf.stable_secret.initialized".
> 
> and that can be updated. If the default (inherited) setting is
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA, then do not change to
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY.
> 
>> 
>> So, although adding an additional IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
>> user space process has some trouble to let kernel switch the iface's
>> addr_gen_mode to the IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA.
>> 
>> This is not as flexible as adding a separate sysctl.
>> 
>> (2)
>> After adding "proc/sys/net/ipv6/<iface>/disable_gen_linklocal_addr",
>> so that kernel can keep the original code logic of the stable_secret
>> proc file, and expand when the subsequent kernel adds a new add_gen_mode
>> more flexibility and applicability.
>> 
>> And we only need to care about the networking device that do not
>> generate an ipv6 link-local address, and not the addr_gen_mode that
>> this device is using.
>> 
>> Maybe adding a separate sysctl is a better choice.
>> Looking forward to your professional reply again.
> 
> per device sysctl's are not free. I do not see a valid reason for a
> separate disable knob.

Hi David,

Thanks for your reply,

honstly, this separate sysctl is really useful and convenient.

It allows users to simply configure the disable_gen_linklocal_addr
proc file to achieve customized configuration of ipv6 link-local
address without worrying about when the kernel will automatically
generate a link-local address.

At the same time, maybe a new addr_gen_mode will be added in the
future. If the method of adding a sysctl is adopted, we don't need
to consider the existing addr_gen_mode and the impact of adding
another new addr_gen_mode in the future.

Just simply echoing different values to the disable_gen_linklocal_addr
proc file can achieve this needs.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
