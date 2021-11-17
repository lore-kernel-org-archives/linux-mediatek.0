Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 12:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD4C63227
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 12:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DD4C63227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r6uw/PIs1dmQagJF+F/SV2TRkHP8AbYFUypjxF1GeLY=; b=OHmcoMZt5G8j7Z
	H9yqwQAHd5e0cg7IGJsuv2wML3hiBVrcZ4OUbFwrKX0Yx2WeBSodp18nnFVheqjC9VaO20tVZlWtb
	fzS1Vyf9s/Mi6HfcvwHvija9YtkJS+vKbsKFdXjGPcfOsa9dIqR244M2LGGlkiFMxJ2gMVvS8MGkh
	Ji3XTK3EtMdKZONvZTD3SBIDFTK35TYEnzh+lwTZQu5pLCM5NaLi0J0zWc8LKQKK1DT5I3v3ER+3s
	QRv2akppiLniRdEprr/LWcsAALdDJq961c9VQZENnlQmOW2yecg5CDAYUoN07aH0SKMpaCrru85d2
	7kgnJBc/RQM8xv8cq+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnJzQ-004iEV-S9; Wed, 17 Nov 2021 12:24:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEBS-003PtO-Ay; Wed, 17 Nov 2021 06:12:39 +0000
X-UUID: 08aef051c52142e9aa064c70f04b8f4b-20211116
X-UUID: 08aef051c52142e9aa064c70f04b8f4b-20211116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1151192729; Tue, 16 Nov 2021 23:12:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 22:04:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 17 Nov 2021 14:04:08 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 14:04:07 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Jonathan Corbet
 <corbet@lwn.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <Rocco.Yue@gmail.com>,
 <chao.song@mediatek.com>, <yanjie.jiang@mediatek.com>,
 <kuohong.wang@mediatek.com>, <zhuoliang.zhang@mediatek.com>,
 <lorenzo@google.com>, <maze@google.com>, <markzzzsmith@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
Date: Wed, 17 Nov 2021 13:59:30 +0800
Message-ID: <20211117055930.6810-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_221238_401460_EEAB822E 
X-CRM114-Status: GOOD (  10.19  )
X-Mailman-Approved-At: Wed, 17 Nov 2021 04:24:36 -0800
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
Reply-To: 20211116193456.54436652@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-11-17 at 11:34 +0800, Jakub Kicinski wrote:
> On Tue, 16 Nov 2021 13:21:12 -0700 David Ahern wrote:
>> Reviewed-by: David Ahern <dsahern@kernel.org>
>>
>> you should add tests under tools/testing/selftests/net.
>
> Please keep David's review tag and repost with a selftest.

Hi David and Jakub,

Thanks for your review. :-)

I heard about selftest for the first time, and I am thinking
about how to write a selftest for this patch, and I will
repost thses patches again when finished.

Thanks,

Rocco


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
