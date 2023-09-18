Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B35CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmAQXDi1eFJFIz1BbU82J1+CnIbylJEmn229iHCJQIs=; b=WyY2LZsM5xf5ZZ5NRPecpg8lEw
	Xh0jTM85LmWX5qfrFLJkQJ3WRL1eh5uoWeC32Ja/iZoQ/Z8bNMaufpb1I/UJb4daBwZhuV3Z1mffi
	p8ECnHtXw5mrqdR/L4WgZ3s3SuoVZKnigOxmZBqHMtu7DybM6zLZvHWunnrNLo8DDwvqULD8Czy0V
	t0C+5mtu1SS3Z0mDmYjcfGbYa6IozKaXn3FfrEv1PnMzHH29oEEBf7sRn2YNBWSNjnGzM/sITmt5y
	qnGc0k/+N3kSYECwA5aEth0d9UdibPh/cEVmVLsfAlvQ/SEB72AnZv/Kv9Hgbqc2YJ9BbCoh+04e9
	23HVzVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8eK-00EgLx-1L;
	Mon, 18 Sep 2023 07:26:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8eH-00EgKD-0D;
	Mon, 18 Sep 2023 07:26:26 +0000
X-UUID: aac468a255f411ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pmAQXDi1eFJFIz1BbU82J1+CnIbylJEmn229iHCJQIs=;
	b=iXQBjyY+RHy3WfgWsRoEQk9ClNi24G+J9sMkQbBwomqELi5Sc59HCFnuCrY217QGTtK0HQtbfE2ZrXZVrjcGPKrqVwRspTafgyhE/84ceszmRUVXQszV2++LCssmXe375Mw790g8n6d5VhcdE3VSrLbuNxPhzjxz7qbi4x7e9/4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:27032722-6e89-4ea1-b03d-6d964807bdc2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:c4a7f5be-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:0|-5,EDM:-3,I
	P:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aac468a255f411ee9b7791016c24628a-20230918
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1766610083; Mon, 18 Sep 2023 00:26:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 15:25:46 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 15:25:45 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <akpm@linux-foundation.org>, <angelogioacchino.delregno@collabora.com>,
	<dvyukov@google.com>, <glider@google.com>, <haibo.li@mediatek.com>,
	<jannh@google.com>, <kasan-dev@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mm@kvack.org>,
	<mark.rutland@arm.com>, <matthias.bgg@gmail.com>, <ryabinin.a.a@gmail.com>,
	<vincenzo.frascino@arm.com>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
Date: Mon, 18 Sep 2023 15:25:45 +0800
Message-ID: <20230918072545.87653-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <CA+fCnZfuaovc4fk6Z+p1haLk7iemgtpF522sej3oWYARhBYYUQ@mail.gmail.com>
References: <CA+fCnZfuaovc4fk6Z+p1haLk7iemgtpF522sej3oWYARhBYYUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_002625_115231_833DF76D 
X-CRM114-Status: GOOD (  12.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> On Fri, Sep 15, 2023 at 4:46 AM 'Haibo Li' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> >
> > The patch checks each shadow address,so it introduces extra overhead.
>
> Ack. Could still be fine, depends on the overhead.
>
I do a simple test by reading memory.
Read 4096 memory by loop and the reading unit is 8 bytes.
__hwasan_load8_noabort is called 512(4096/8) times.
Measure the time of memory read.
Here is the result on ARM CA7X(repeat 100 times):
---------------min-------max-----avg----
before patch | 77.3ms | 80.6ms | 79.2ms|
after  patch | 77.2ms | 80.7ms | 79.2ms|
----------------------------------------

There is no obvious drop in this scenario.
It may differ in different arch.
just for information if you are intrested in it.

> But if the message printed by kasan_non_canonical_hook is good enough
> for your use case, I would rather stick to that.

