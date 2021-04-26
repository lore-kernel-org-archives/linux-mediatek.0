Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1720C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 19:12:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD7A61154
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 19:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD7A61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Ik/gDPuF+ydl2AeXOGl0B6qocRTBkpThbNwXLAaShA=; b=aiJha6L3FxlP+SRy2PFOYr5Ql
	S40f32hWqFDVH5fvLARlfpos7kulKHgggE63M+uP6siwEEb6LokhUp1AgxUxBtQKK0m0FASo8pQii
	8gB7mzBdJZ4AKbPLTx7sRCXhKuzDF/T+1fzn5INqt+8Bj9BoeArDTFgjOlL70oCBUCGt4aEXOL2rK
	GTbF71KWHScX5+ey2TMHwJK+1hqdCV6qL6sR3rGVxFQ0PLEczY/DLO2TNZxh3JwwwU4LymIk4ExSA
	RV/Rw/I3SikT2LxE4ZcCcMKRLZRZETUpm29KiLBV3WUutfqq5LIpdKioYbu0Ssp6JGppBihT0y7da
	lMA0rjMpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb6e6-008M1F-KA; Mon, 26 Apr 2021 19:11:50 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb6e3-008M0n-Lg
 for linux-mediatek@desiato.infradead.org; Mon, 26 Apr 2021 19:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=CQizQsUhJwGeUX8UCIeiU1Bi7+NJCgQWE99CedcvQtU=; b=0cnF/3dAlcP0jdoiCClxKBFY2K
 8YypWI/tzh+RBxjk/e0wIGVLk29T3eTHHRKwJuuPelSXCIA6QPWd4sgetPji9X2NgTTU6CYdm0iZ9
 Q6mFkYnpz6rD041Yz+QzK9YGeAOUNKi7rgYDpAxSz54IKkvfZFMCaab5FP2BHdDJ5KVhQOiYERfnE
 DX+f+CLwZeHqDJUURWxu+pxSlqnQs4fRQ43APw7z/WS4iI13yp6qUjPG/gLv1i1f/eVKzy/Fkdeck
 nw0/iY9ygGCQNZG040eIhY8wr+WXUMy57fF7sK+55tyx3MqlQm0P7brngSr53Zh8zyUu0Qopw3ypT
 mQosn/qg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb6dx-00G88I-Dj
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 19:11:45 +0000
X-UUID: 54eee18a10a246ef9ef58d69cd7adc9d-20210426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CQizQsUhJwGeUX8UCIeiU1Bi7+NJCgQWE99CedcvQtU=; 
 b=TqWWWwhkjBYvtkxlVswuEHL3f1S5h2abOj4IBiohQK9slv8cqIa0/u3X3IygzN9WF5iiJSlgEvylaNDRiwn6KlmSBN6o70yoYj4CW4b5LurjKgo+I1BXlO+ghi6S+NkATPx70ALHHAWW5Jn1V0I2p1+ZW1fQKNKYmUjGyseGgUg=;
X-UUID: 54eee18a10a246ef9ef58d69cd7adc9d-20210426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 953009266; Mon, 26 Apr 2021 12:11:30 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 12:11:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Apr 2021 03:11:27 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Apr 2021 03:11:27 +0800
Message-ID: <1619464287.15845.2.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] mt76: mt7915: add .set_bitrate_mask() callback
From: Ryder Lee <ryder.lee@mediatek.com>
To: Ben Greear <greearb@candelatech.com>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 27 Apr 2021 03:11:27 +0800
In-Reply-To: <7776c0d1-0578-5922-1003-f8498cc0357a@candelatech.com>
References: <22e4a169831b6b54661b6eb4ef4f3a4a18dceb19.1619453772.git.ryder.lee@mediatek.com>
 <d422f0c844c5da1ee027250820b67f615a8b50e5.1619453772.git.ryder.lee@mediatek.com>
 <7776c0d1-0578-5922-1003-f8498cc0357a@candelatech.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D5CD2055A3D98DF91B752F15436670F9F853D1953D45325ABD51BB99ACBC1CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_121141_487540_67B1631C 
X-CRM114-Status: GOOD (  11.43  )
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

On Mon, 2021-04-26 at 11:41 -0700, Ben Greear wrote:
> On 4/26/21 9:29 AM, Ryder Lee wrote:
> > Add runtime configuration for bitrate mask. Note that GI cannot be setup.
> > 
> > Example:
> > iw dev wlan0 set bitrates vht-mcs-5 1:9 he-mcs-5 2:7
> > iw dev wlan0 set bitrates legacy-5 6 he-mcs-5 2:0-11
> 
> Is this only for data frames?  In other words, is it OK to
> set exactly one HE/VHT MCS rate and let mgt, bcast, mcast, still
> work OK at legacy rates?
> 
> Thanks,
> Ben
> 
Yes. And this's more like a 'limit', and it actually re-initializes
firmware rate control for each peer to add a boundry on top of rate
table. When you specify something like 'iw dev wlan0 set bitrates
vht-mcs-5 1:9', which means nss=1 mcs0-9 actually. If you would like
stick to a fixed rate then there's a knob in mt7915 debugfs.
As for other the mgmt, mcast, bcast should sill remain in low rate.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
