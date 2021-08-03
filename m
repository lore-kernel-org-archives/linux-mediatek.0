Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222D9C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 12:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1F460F58
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 12:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE1F460F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WScWpMApiFNEWM+jd1uRyCeBsZqmrlh0JCuqSlhUtaE=; b=VRNHy5NtBN31FK
	FetBSL/1yXq1zd/WS+3vDW8c52Jc2B95theEP+T1Qnh3wcduPv+iQ4BB8qEqJ2OGfvSbWN8g7DTpR
	mBtcIgOLNDVAPQo01ska7X5Ork+wxSm7Kkf/NxcbHQSAovUCHmB+J9baY4x4xt65iIeuEa0q4QPeQ
	2LMMWELcMUoyyGM4QVwGDj76hsnd3Nu+Z1whUBcyB4Fn0DRWNBBSJFqrKWGefW3xwHsx658VJM2Xz
	IusxrX8QZi15Bq8qPhvYK9olE/y1gODLovu9TFZ98ecK6+yfjTQp3kybHUFgs63aXEjvyj4eopF3X
	EocRwN3Xo+A8oSORYpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAtjy-002hql-66; Tue, 03 Aug 2021 12:41:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtJf-002Yw3-Ui; Tue, 03 Aug 2021 12:14:42 +0000
X-UUID: db35a99abe5c46ce8cd560deba04beda-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KID/axJK2Mdv71Gm3v/9Y8xkHg6aVBs25aBLbr2jPjU=; 
 b=Y/5eME+Ee8KvruIAR4bK83Ue8AxKVFZUB5zPRe9PPlypE6VCS182JjaBYtNQjxdGpOylcFBF9JHaCm0qAE67+Ms9aGmADISD3fWs97jz4+qJT0J5Mt99s8i2VeJiRL9lCGfuuy+ulGp6KT29SO/THSTip1tqtKQ0WrUdCTN0C2o=;
X-UUID: db35a99abe5c46ce8cd560deba04beda-20210803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1801734233; Tue, 03 Aug 2021 05:14:36 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 05:14:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 20:14:33 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 20:14:33 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v2] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Date: Tue, 3 Aug 2021 19:57:59 +0800
Message-ID: <20210803115759.4342-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <f66750af-cbda-6d49-2b39-860c10357e95@gmail.com>
References: <f66750af-cbda-6d49-2b39-860c10357e95@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_051441_479910_A1AC8FD7 
X-CRM114-Status: GOOD (  19.48  )
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

On Mon, 2021-08-02 at 07:35 -0600, David Ahern wrote:
> On 8/2/21 6:40 AM, Rocco Yue wrote:
>> 
>> Regarding setting "reject_message" in the policy, after reviewing
>> the code, I fell that it is unnecessary, because the cost of
>> implementing it seems to be a bit high, which requires modifying
>> the function interface. The reasons is as follows:
> 
> The policy can be setup now to do the right thing once the extack
> argument is available.
> 
> do_setlink() has an extack argument. It calls validate_linkmsg which
> calls validate_link_af meaning support can be added in a single patch.
> If you decide to do it, then it should be a separate patch preceding
> this one.
> 

Hi David,

Thanks for your advice,
I will send a separate patch to add extack arg firstly.

> Then userspace should get a link notification when ra_mtu is set so it
> does not have to poll.

It make sense, I will do it.

Thanks
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
