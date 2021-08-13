Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ED5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:44:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9726610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9726610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7guApJdjXTir68fUNVOqpNcjxhvm9R2eV7rtqZsAL48=; b=tP+DvXikaHOOYH
	BDzbEjfcTTVBWO8oc1WzvcrdVAxsD4B9F44jQ+f0B3CU7Fpuy+tlpmHp2qUYFlD2Np6ngc87KiPoL
	pXMoVGG7MPR+r0EeFME1g0sePvan2560JV25/9VfY4uHFWueJXP90FWIJEwy1U8wjGJTVr7kx0cWw
	sitOgLATd3cXesATecXY+0k2dBBc301/7ZPseFf///1+2ZRwoKc3//DcXjxZh6IuWwtm0dalYThHa
	VpX95/lY4Gj1Rbdfijc42HP2C7ZMFhE3AAH+fSgxHs9zCrLPEIslJtCnhZ5MwAXddQx6RTHchSWwM
	rVAVdjGWM+HOOGcxzdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEaI4-00D97T-Ej; Fri, 13 Aug 2021 16:44:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEaHy-00D96y-TH
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 16:44:14 +0000
X-UUID: bd371e5897064fcfa117277180b56fc5-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nlGi2PGzjZSXEFnfI2iL8NNpCOdZihlIJKSOIf0gPbM=; 
 b=KEwDG/tDF080xIwkLqrOLsqjhtVif+GcBtstnaZQFUCnTMGeNYbEADa/RzsdaTEYyTKQ9U1qsZxscpmwqVDiBGV2SLNCrCvP6qYvgzex1Ff7dnjDXhhV++mjBMvySdfBaYuRualw8+Dj2P5nqlSwgvkbU3Hesn7l6JBxr8R/81s=;
X-UUID: bd371e5897064fcfa117277180b56fc5-20210813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1554478970; Fri, 13 Aug 2021 09:44:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 09:44:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 14 Aug 2021 00:44:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 14 Aug 2021 00:44:04 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>
CC: <lorenzo.bianconi@redhat.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: fix determining multicast frame in sta mode
Date: Sat, 14 Aug 2021 00:44:03 +0800
Message-ID: <1628873043-30762-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <6c6ba2fd-3952-3c44-6c6d-51f77eb66828@nbd.name--annotate>
References: <6c6ba2fd-3952-3c44-6c6d-51f77eb66828@nbd.name--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_094410_999974_110AC516 
X-CRM114-Status: GOOD (  12.75  )
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

From: Sean Wang <sean.wang@mediatek.com>

>>On 2021-08-09 23:13, sean.wang@mediatek.com wrote:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> We should use hdr->addr3 as the destination address to determine the
>> frame is multicast frame or not when the device is running in sta mode.
>>
>> We can simply use ieee80211_get_DA for ap mode and sta mode both cases.
>That does not make any sense to me. When a sta sends a packet with DA set to a multicast address, it will be sent as unicast to the AP. Why should it be treated as multicast by the driver?

You're right. I should drop the patch earlier. Sorry for the noise.

Eventually, I have found the cause, it is possible to some unicast frame picking up a wrong legacy rate
to send out because the current driver doesn't program the legacy rate information well.
The fix have been provided with ("mt76: mt7921: fix firmware usage of RA info using legacy rates") in [1].

	Sean

[1]
https://patchwork.kernel.org/project/linux-wireless/patch/4be4378630c93ae32a4db8bc3e0871c7b15150a6.1628661185.git.objelf@gmail.com/

>
>- Felix
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
