Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F44C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 20:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD38D60F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 20:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD38D60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg+UpWXpEEmutC8O/jmZly7nUiN5uQuLAudiakJ7rmM=; b=d6akMqYDMbtZx0meOelMdTEcuo
	QamSpDqav/04/37kQzYUtMZeytetTAVcwen6706FqULbo7HAYzareMAKp1NsPXzPC5ORy9tNOY+ke
	b78tWEww6V1ITiACagL9eNzO9Gw1GyWbFcNwRxxsgYVLaQF+6Hva2qm+VP8gaOUegg6AkhEuqNIXM
	lomWW2/qkX3QGqJk1lnj2w4A838vHg5VmFRKlM3spkwXnd5Qvq6D5oih3+Vusvwpqv+jP/+mM+tZm
	pSWeiWEBeyP6RAVo4MiXFP/zbeo3xfGHt2v+MXHB3mTuGl+kX3Vwn1VcZ+o9xKrlVDqZHw4aUnzWP
	nVKy5wLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcnY-00BW4j-U8; Fri, 12 Nov 2021 20:05:20 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcnW-00BW4K-3c
 for linux-mediatek@lists.infradead.org; Fri, 12 Nov 2021 20:05:19 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.67.120])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 1B82F1C0085;
 Fri, 12 Nov 2021 20:05:15 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 89BEF34007D; Fri, 12 Nov 2021 20:05:14 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id E9D4E13C2B0;
 Fri, 12 Nov 2021 12:05:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com E9D4E13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1636747514;
 bh=XGlTOe8h47eDgp5pmwvtG6/41tLvJLctvUBvj+ENyXo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JiKW9PSloP2I88/0MqcizcCd/z8v1/MAFWBdwpt4CBjMykUm677ysVt04WvFUKfUR
 hZYEoi+vebtuvu9jz3T3fYARiDUDstUFk1Bvz9mR7koFUTjIwrmoiSKCbfoOO+oOhX
 nYFd50rz9WUmN4XvPy8CxQt3+TBT4kvDvqIZkkYA=
Subject: Re: [PATCH v2 02/11] mt76: mt7915: refine register definition
To: Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <cover.1636105953.git.Bo.Jiao@mediatek.com>
 <3ba42e47ae9cc7630e1f9b82955871fb90349f94.1636105953.git.Bo.Jiao@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <a11f6064-6886-1cfc-38e3-6fe9bf6ea2d7@candelatech.com>
Date: Fri, 12 Nov 2021 12:05:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3ba42e47ae9cc7630e1f9b82955871fb90349f94.1636105953.git.Bo.Jiao@mediatek.com>
Content-Language: en-US
X-MDID: 1636747515-9_5RKMg9bbMM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_120518_221328_129F13F4 
X-CRM114-Status: GOOD (  12.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/5/21 3:02 AM, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> Add mt7915_reg_desc to differentiate chip generations.
> This is an intermediate patch to introduce mt7916 support.

While merging this into my patched tree, I noticed this discrepency,
it seems this patch is changing the value for SDR32/33 and/or confusing
SDR32 with SDR33.

Is this on purpose?

[greearb@ben-dt4 linux-5.16.dev.y]$ git am --show-current-patch|grep 088
+	[MIB_SDR32]		= { INVALID_BASE, 0x088 },
-#define MT_MIB_SDR32(_band)		MT_WF_MIB(_band, 0x088)
+#define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x088)
[greearb@ben-dt4 linux-5.16.dev.y]$ git am --show-current-patch|grep SDR32
  	cnt = mt76_rr(dev, MT_MIB_SDR32(ext_phy));
  	mib->tx_pkt_ebf_cnt += FIELD_GET(MT_MIB_SDR32_TX_PKT_EBF_CNT_MASK, cnt);
+	[MIB_SDR32]		= { INVALID_BASE, 0x088 },
+	[MIB_SDR32]		= { INVALID_BASE, 0x7a8 },
+	MIB_SDR32,
-#define MT_MIB_SDR32(_band)		MT_WF_MIB(_band, 0x088)
+#define MT_MIB_SDR32(_band)		MT_WF_MIB(_band, __REG_OFFS(dev, MIB_SDR32))
  #define MT_MIB_SDR32_TX_PKT_EBF_CNT_MASK	GENMASK(15, 0)
+#define MT_MIB_SDR32_TX_PKT_IBF_CNT_MASK	__MASK(dev, MIB_BF_TX_CNT)
[greearb@ben-dt4 linux-5.16.dev.y]$ git am --show-current-patch|grep SDR33
-	cnt = mt76_rr(dev, MT_MIB_SDR33(ext_phy));
-	mib->tx_pkt_ibf_cnt += FIELD_GET(MT_MIB_SDR33_TX_PKT_IBF_CNT_MASK, cnt);
+		cnt = mt76_rr(dev, MT_MIB_SDR33(ext_phy));
-#define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x08c)
-#define MT_MIB_SDR33_TX_PKT_IBF_CNT_MASK	GENMASK(15, 0)
+#define MT_MIB_SDR33(_band)		MT_WF_MIB(_band, 0x088)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
