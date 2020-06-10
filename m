Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6409C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 01:40:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1ED206F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 01:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRILBsXF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ROHGXgoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1ED206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaKiqd+HlaVTrRMFIgDA7NE7UkPbL1jkeP4Q8lMz4vA=; b=dRILBsXFhLn3ET
	RTdgfKyePHVlRbrhBxnZQ2XuRWw+9Q4uIJsOEdZEB8xkAv+4m0FrVnqKkQF2yWxTG10ePSn3fIHhG
	NPFGVsScCRm+QkygpoKtzRYjbU25CEit4jAemfZpHsjStqX3sWKIGO/IzceyX31FvyNuWeiDzbVzt
	7QLRaB8Y++z/fZ/W2B7/NJUvXgASTt0CZz57GchL7Uya1nyJnTb68jJKdBq3yTxVgLr7ZOvqonMF3
	ZwNDp2xBDtY87fm6y2SD6VxlG97/ILMiyuXUg2tk1xxUin7pzAo8whD8x9Z2IHH79iFcLObgF9zvR
	1tNV/gqj0PdUUhUVX/Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jipj6-0001V6-2n; Wed, 10 Jun 2020 01:40:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jipj2-0001UU-OE
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 01:40:22 +0000
X-UUID: 10182ec38b0245c48a3ceef331e3352a-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qhYvj7zpeWIgmu8J+0ge/AWBJKAFPe78L9ZHRztXi94=; 
 b=ROHGXgoEWsN09MfFNKN7Pr9lh/OwAsSPKvpDbtvC4AyMOq1Y6PJiGT78RFNLpHHkaCsBqW4Wvy/WzTzh3V6SXWss6zjmgUN1Y4VIbLsvBpOIepoyiiZgGxm7K/IZKRKGl5GfE5Sk96e1lGEfsztjU11By/cQIq2lylthK0TEcG8=;
X-UUID: 10182ec38b0245c48a3ceef331e3352a-20200609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 164544588; Tue, 09 Jun 2020 17:40:06 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 18:32:32 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 10 Jun 2020 09:32:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Jun 2020 09:32:29 +0800
Message-ID: <1591752616.29387.26.camel@mhfsdcap03>
Subject: Re: [PATCH] net: stmmac: Fix RX Coalesce IOC always true issue
From: biao huang <biao.huang@mediatek.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Wed, 10 Jun 2020 09:30:16 +0800
In-Reply-To: <BN6PR12MB1779E6EF20FD8F5F3255CCE8D3820@BN6PR12MB1779.namprd12.prod.outlook.com>
References: <20200609094133.11053-1-biao.huang@mediatek.com>
 <BN6PR12MB1779E6EF20FD8F5F3255CCE8D3820@BN6PR12MB1779.namprd12.prod.outlook.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_184020_795832_5C2AA5C1 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-09 at 14:20 +0000, Jose Abreu wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> Date: Jun/09/2020, 10:41:33 (UTC+00:00)
> 
> > -		rx_q->rx_count_frames += priv->rx_coal_frames;
> > -		if (rx_q->rx_count_frames > priv->rx_coal_frames)
> > +		if (rx_q->rx_count_frames >= priv->rx_coal_frames)
> 
> This is no right. If you want to RX IC bit to not always be set you need 
> to change coalesce parameters using ethtool.

let's take look at these lines:

 	1. rx_q->rx_count_frames += priv->rx_coal_frames;
	2. 	if (rx_q->rx_count_frames > priv->rx_coal_frames)
	3. 		rx_q->rx_count_frames = 0;

before the if condition(line 2 above), there is "rx_q->rx_count_frames
+= priv->rx_coal_frames"(line 1 above) sentence; so the if condition
always true, and the assignment rx_q->rx_count_frames = 0 happens.

Here is the result on our platform, all desc3[30] = 1; you can also
check it on your platform. no matter what rx-frames you set with
"ethtool -C eth0 rx-frames", desc3[30] always true.

# ethtool -c eth0
Coalesce parameters for eth0:
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0
 
rx-usecs: 301
rx-frames: 25
rx-usecs-irq: 0
rx-frames-irq: 0

#cd /sys/kernel/debug/stmmaceth/eth0
# cat descriptors_status
RX Queue 0:
Descriptor ring:
0 [0x5038b000]: 0xa8541a82 0x0 0x0 0xc1000000
 
1 [0x5038b010]: 0xa8541202 0x0 0x0 0xc1000000
 
2 [0x5038b020]: 0xa8540982 0x0 0x0 0xc1000000
 
3 [0x5038b030]: 0xa8540102 0x0 0x0 0xc1000000
 
4 [0x5038b040]: 0xa658f802 0x0 0x0 0xc1000000
 
5 [0x5038b050]: 0xa658ef82 0x0 0x0 0xc1000000
 
6 [0x5038b060]: 0xa658e702 0x0 0x0 0xc1000000
 
7 [0x5038b070]: 0xa658de82 0x0 0x0 0xc1000000
 
8 [0x5038b080]: 0xa658d602 0x0 0x0 0xc1000000
 
9 [0x5038b090]: 0xa658cd82 0x0 0x0 0xc1000000
 
10 [0x5038b0a0]: 0xa658c502 0x0 0x0 0xc1000000
 
11 [0x5038b0b0]: 0xa658bc82 0x0 0x0 0xc1000000
 
12 [0x5038b0c0]: 0xa658b402 0x0 0x0 0xc1000000
 
13 [0x5038b0d0]: 0xa658ab82 0x0 0x0 0xc1000000
 
14 [0x5038b0e0]: 0xa658a302 0x0 0x0 0xc1000000
 
15 [0x5038b0f0]: 0xa6589a82 0x0 0x0 0xc1000000
 
16 [0x5038b100]: 0xa6589202 0x0 0x0 0xc1000000
 
17 [0x5038b110]: 0xa6588982 0x0 0x0 0xc1000000
 
18 [0x5038b120]: 0xa6588102 0x0 0x0 0xc1000000
 
19 [0x5038b130]: 0xa46df802 0x0 0x0 0xc1000000
 
20 [0x5038b140]: 0xa46def82 0x0 0x0 0xc1000000
 
21 [0x5038b150]: 0xa46de702 0x0 0x0 0xc1000000
 
22 [0x5038b160]: 0xa46dde82 0x0 0x0 0xc1000000
 
23 [0x5038b170]: 0xa46dd602 0x0 0x0 0xc1000000
 
24 [0x5038b180]: 0xa46dcd82 0x0 0x0 0xc1000000
 
25 [0x5038b190]: 0xa46dc502 0x0 0x0 0xc1000000
 
26 [0x5038b1a0]: 0xa46dbc82 0x0 0x0 0xc1000000
 
27 [0x5038b1b0]: 0xa46db402 0x0 0x0 0xc1000000
 
28 [0x5038b1c0]: 0xa46dab82 0x0 0x0 0xc1000000
 
29 [0x5038b1d0]: 0xa46da302 0x0 0x0 0xc1000000
 
30 [0x5038b1e0]: 0xa46d9a82 0x0 0x0 0xc1000000
...

> ---
> Thanks,
> Jose Miguel Abreu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
