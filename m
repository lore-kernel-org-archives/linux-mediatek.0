Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 02:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A6160FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 02:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56A6160FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaQKGcdB5OwzRWzk4DSD5fV96Q4nxwxQ3fAuezTipoM=; b=TExlgGF14DYs7U
	ixahx1pJQN7BeG77wDAglZicu5Ak+/GU7Ouy/Eab5Df9cwspDu/N4EzinzZ+FjL2sEnuGfpXNKnj/
	FEf3semgXoTuYlt2jVBOGWGdUWjR6AJ+TV/IdxYOkrlRjnpXCHlTu8djmX3zvmMObh/GdA3Pw3Jli
	3cY86NJWecRS9ATvJj1G1me/GBeG6wxQKY2+Qt6ZvQHJOH9/KkjtDtYsOyXdOuffh6boEgSFKpKc+
	qG2smRhXNoHnNnUXbhm6f8CL3aNpm7y/1QurAytRPWgpRg8DqEcfo7slFUWT9WLmJUMbj+I3IQdCW
	LK1g3d8brd31OzwLHF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmRdm-00EGfZ-4i; Mon, 15 Nov 2021 02:22:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmRdi-00EGev-87
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 02:22:37 +0000
X-UUID: 62bf7bf9c07c4e03a94270cebe96cad0-20211114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5V7zxsBGfAoZFeacmV0XrOQPT3s0DM4Q5XOrjPdp2uU=; 
 b=es2abmKSZ0C8oEqDQBL13q8JjsDSuenn5jgNQS6Vl1BJaAyq9gqrqxMWbOXfIcL4cyXY0vZCiGe7qvM+PGdgW4tCtT1XoEUYeRS+hObai80cFEyEMzaqarx82K6QKsj0cAtr6EuqsYaxz4iGM4v/2Q+mq3ER8q7YKluDojwsdyg=;
X-UUID: 62bf7bf9c07c4e03a94270cebe96cad0-20211114
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 551234888; Sun, 14 Nov 2021 19:22:29 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Nov 2021 18:22:28 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 15 Nov 2021 10:22:26 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 15 Nov 2021 10:22:25 +0800
Message-ID: <308bb5b16ed0177c2c9f51ecda3934a5c3697858.camel@mediatek.com>
Subject: Re: [PATCH v2 02/11] mt76: mt7915: refine register definition
From: bo.jiao <bo.jiao@mediatek.com>
To: Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Mon, 15 Nov 2021 10:22:25 +0800
In-Reply-To: <a11f6064-6886-1cfc-38e3-6fe9bf6ea2d7@candelatech.com>
References: <cover.1636105953.git.Bo.Jiao@mediatek.com>
 <3ba42e47ae9cc7630e1f9b82955871fb90349f94.1636105953.git.Bo.Jiao@mediatek.com>
 <a11f6064-6886-1cfc-38e3-6fe9bf6ea2d7@candelatech.com>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_182235_732260_34D88FD7 
X-CRM114-Status: GOOD (  13.32  )
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

On Fri, 2021-11-12 at 12:05 -0800, Ben Greear wrote:
> On 11/5/21 3:02 AM, Bo Jiao wrote:
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> > 
> > Add mt7915_reg_desc to differentiate chip generations.
> > This is an intermediate patch to introduce mt7916 support.
> 
> While merging this into my patched tree, I noticed this discrepency,
> it seems this patch is changing the value for SDR32/33 and/or
> confusing
> SDR32 with SDR33.
> 
> Is this on purpose?
> 
> [greearb@ben-dt4 linux-5.16.dev.y]$ git am --show-current-patch|grep
> 088
> +	[MIB_SDR32]		= { INVALID_BASE, 0x088 },
> -#define MT_MIB_SDR32(_band)		MT_WF_MIB(_band, 0x088)
> +#define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x088)
> [greearb@ben-dt4 linux-5.16.dev.y]$ git am --show-current-patch|grep
> SDR32
>   	cnt = mt76_rr(dev, MT_MIB_SDR32(ext_phy));
>   	mib->tx_pkt_ebf_cnt +=
> FIELD_GET(MT_MIB_SDR32_TX_PKT_EBF_CNT_MASK, cnt);
> +	[MIB_SDR32]		= { INVALID_BASE, 0x088 },
> +	[MIB_SDR32]		= { INVALID_BASE, 0x7a8 },
> +	MIB_SDR32,
> -#define MT_MIB_SDR32(_band)		MT_WF_MIB(_band, 0x088)
> +#define MT_MIB_SDR32(_band)		MT_WF_MIB(_band,
> __REG_OFFS(dev, MIB_SDR32))
>   #define MT_MIB_SDR32_TX_PKT_EBF_CNT_MASK	GENMASK(15, 0)
> +#define MT_MIB_SDR32_TX_PKT_IBF_CNT_MASK	__MASK(dev,
> MIB_BF_TX_CNT)
> [greearb@ben-dt4 linux-5.16.dev.y]$ git am --show-current-patch|grep
> SDR33
> -	cnt = mt76_rr(dev, MT_MIB_SDR33(ext_phy));
> -	mib->tx_pkt_ibf_cnt +=
> FIELD_GET(MT_MIB_SDR33_TX_PKT_IBF_CNT_MASK, cnt);
> +		cnt = mt76_rr(dev, MT_MIB_SDR33(ext_phy));
> -#define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x08c)
> -#define MT_MIB_SDR33_TX_PKT_IBF_CNT_MASK	GENMASK(15, 0)
> +#define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x088)
> 
> Thanks,
> Ben
> 
> 
for mt7915, MT_MIB_SDR33's mask(15,0) is tx_pkt_ibf_cnt,
for mt7916, MT_MIB_SDR32's mask(15,0) is tx_pkt_ebf_cnt and mask(31,16)
is tx_pkt_ibf_cnt.

Thanks,
Bo Jiao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
