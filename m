Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112B9C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 14:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC75261004
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 14:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC75261004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQqAWJq55EykH/xax0c+brhIwG2Gn90LMNKw8ztrFCU=; b=bWbNJug3S2nzpT
	FSh2ADteSfL5FF15CgGfTFkNdioT9b4PsHPGa9f3FyEK5U/X/fc2nnziUjmoLpxD/0e0WPAp+zjOn
	Ne27FCZMJ1CcXmVXaeWr3C80Vijqd1jX4jcgulOiBB80aMpktCThXSGK0wE4Zcz45YuCOfRwmDKc7
	umk2S0OjlZOCWIhKg6KSYGnXIGDE3gk/snPGl24gDQnjAnh2rmt8kZ3jYmbMXQ8TOJZg4MCf9D75g
	Qh2x+knQu2RkyyvPoOwGAxgTPuYpOLHcdIEwAyR51vyACajrrRlOukSVBx/zw9sbaOs9Rf5ja6iu6
	EWjGXj5eUBxHoi8MWjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m42Sn-001754-BF; Thu, 15 Jul 2021 14:35:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m42Sa-00173r-BI; Thu, 15 Jul 2021 14:35:33 +0000
X-UUID: 0b7c55f6bb254b7baea5fd2a78cc4484-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KRl1dkAGdHW0kh4yf3mSkztnRhFSLKa4B0WqMptuIGE=; 
 b=kRp6VK4vIwr+KBl4ucnIl0JyB2/8oHJ6htKunbrQXlqIRiLD1afLbz2+t1E4hY4z3bUukZWTAyIzXmkbBgYIUQutUMiVXNfhnzcN/iILWcU/gCsGt2996oZG+oN0Jc40+c0e1IFJ2/5geUG4ckhIJFNa05gydxdaQl4bPPLSqas=;
X-UUID: 0b7c55f6bb254b7baea5fd2a78cc4484-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1017636176; Thu, 15 Jul 2021 07:35:27 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 07:35:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 22:35:18 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 22:35:17 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH v2] net: ipv6: remove unused local variable
Date: Thu, 15 Jul 2021 22:19:37 +0800
Message-ID: <20210715141937.5356-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20986885-73a5-8e58-0eb9-54b0723467e4@gmail.com>
References: <20986885-73a5-8e58-0eb9-54b0723467e4@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_073532_442169_95FA9203 
X-CRM114-Status: GOOD (  23.45  )
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

On Thu, 2021-07-15 at 08:16 -0600, David Ahern wrote:
> On 7/14/21 10:20 PM, Rocco Yue wrote:
>> The local variable "struct net *net" in the two functions of
>> inet6_rtm_getaddr() and inet6_dump_addr() are actually useless,
>> so remove them.
>> 
>> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
>> ---
>>  net/ipv6/addrconf.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>> 
> 
> a v2 with no changelog. From what I can tell the only difference is
> "net: " in the Subject line which is not what I said in the last email.
> 
> Let me try again: There are 2 trees - net for bug fixes and net-next for
> development (anything that is not a bug fix). Each patch should specify
> which tree the patch is for by putting 'net' or 'net-next' in the
> brackets ([]). This is a cleanup not a bug fix, so this patch should be:
> 
> [PATCH net-next] ipv6: remove unused local variable
> 
> and really that should be
> 
> [PATCH net-next] ipv6: remove unnecessary local variable
> 
> If you send more versions of a patch always put a changelog - a summary
> of what is different in the current patch versus the previous ones.
> 
> No need to send another version of this patch unless you get a comment
> requesting change, or the maintainers ask for a re-send.
> 
> Reviewed-by: David Ahern <dsahern@kernel.org>

Hi David,

Thanks for your detailed explanation,
I am appreciated that you shared these valureable advices for me.
They are important for my furture upstream work.
I will re-send it :)

Sincerely,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
