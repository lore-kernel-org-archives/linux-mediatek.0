Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139FBC47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 03:29:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2156128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 03:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA2156128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYATyuGvV7KqFyVTDKvGLe31byU9kuv0smmThUDZNwE=; b=fMKs8OF4yA2hUb
	5QHiebcph0ZEOubdLAYDlP8rcGNxnPgqSWU0kJr3VSlCH31RCC667MPL/mdYo61pFtsgUr1nQOCJG
	steBlGvz+RxPGdTAgvMZrerfUY9/sRCRkOXXFFaw2mKKKrzBUYlxavCnQpeIY8iKXCxkpkTHJONls
	N4xsgx7VkyndzQVr6apnX+qflFuTjiEsjYME1eZGggvSKcQmMze+N/jPtWUMcf1mf7XFkPS5KOm/G
	vbpjgu/jGheui5d54f2idyiw5OmByjPzcV03llyNr81WuvbY67pBIV9+j2rv2/YV1z60pkLbQ9pvt
	sba9fC5N09EbIdYaskiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loHZ7-001i5f-9B; Wed, 02 Jun 2021 03:29:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loHYu-001i4Z-8U; Wed, 02 Jun 2021 03:28:57 +0000
X-UUID: 9770d3a6d9ea4ca3a0be7b4d8174c349-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NBiAF44Z0BtUeTRSF4e//RAkBuhpMZw7bnC7/smJZjI=; 
 b=OaLtl888ey9LhkjEFp7odk5Jo2CAw5JyyTWWJPoFDKSRV4B+/705Yr1A1IoPv7y3qsRJXA2n5kgVh+nJnq7gilywDa9oaNCOearxO9pTtQxIBhHi8k3b9uVdbcYeZX0a9QfESHaarTC1poOCxpbp+nWqWzY4k8FbE8dJ7KZe4WU=;
X-UUID: 9770d3a6d9ea4ca3a0be7b4d8174c349-20210601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1390778066; Tue, 01 Jun 2021 20:28:51 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 20:28:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 11:28:47 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Jun 2021 11:28:46 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH] ipv6: create ra_mtu proc file to only record mtu in RA
Date: Wed, 2 Jun 2021 11:15:02 +0800
Message-ID: <20210602031502.31600-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <7087f518-f86e-58fb-6f32-a7cda77fb065@gmail.com>
References: <7087f518-f86e-58fb-6f32-a7cda77fb065@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_202856_333077_F1F12776 
X-CRM114-Status: GOOD (  18.40  )
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

On Tue, 2021-06-01 at 18:38 -0600, David Ahern wrote:
On 6/1/21 3:16 AM, Rocco Yue wrote:
> > For this patch set, if RA message carries the mtu option,
> > "proc/sys/net/ipv6/conf/<iface>/ra_mtu" will be updated to the
> > mtu value carried in the last RA message received, and ra_mtu
> > is an independent proc file, which is not affected by the update
> > of interface mtu value.
> 
> I am not a fan of more /proc/sys files.
> 
> You are adding it to devconf which is good. You can add another link
> attribute, e.g., IFLA_RA_MTU, and have it returned on link queries.
> 
> Make sure the attribute can not be sent in a NEWLINK or SETLINK request;
> it should be read-only for GETLINK.

Thanks for your review and advice.
Do you mean that I should keep the ra_mtu proc and add an another extra netlink msg?
Or only use netlink msg instead of ra_mtu proc?
I will do it.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
