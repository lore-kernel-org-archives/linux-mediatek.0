Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23336C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 09:55:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC3BB61432
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 09:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC3BB61432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XlAdqe497Shp7Mz7Gqz6IgDqfDXWoP9ncCc/qMWK3bs=; b=pPtmgehLmCMleUl2orKZvSwVX
	8EjRTf1Tn7k1h7sM8Jhp3AKmuPrrv2h0vueaKi60Tz+wApejHmAeQKMtUbn6ma6cnEbRiqZGJTPGF
	ykEM9257CAFtjpzf4y8lGcVun5CcsJbsXrkLsJ6mR31oj/hkMKPMiBCBUa7a/e8XvhAyDMXvV7lmz
	RmR8G74ZM9sUmZWJc3hOdZM7cCk9jjXIrnuCRHoufL0nvSNIb5KUQswjX8gaQ9Tz2nggvgRKLjE9n
	2jHlXekZTLNKM1KxFtAYcA2oWaiFbuITng73vg/3qSSoukFlF6iGOpEvXJiFE7r4Wx4mPeoKAo+N7
	7aJ7bDk4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh83y-005GgO-I4; Thu, 13 May 2021 09:55:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh83w-005GgC-4a
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 09:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=LmJ1ZG/AhG3cFphlraoDA8hgTV4+Q3LYb4Hf1W8mF48=; b=hRbwC12f2R9opFw24HWxblpfWx
 XlX5bOEMjgcxazerKFkhLiXDhY8CUBxJfkabUnGnAwGU7XviRJHa1ATcm2NMbpwL1Ft1URXDKRJ+Y
 Q5ynOsAh0xWhmoXf9XGGtnzdQg0GsxN4SsBCZPThWi/Z97CaNS75IBGuQL+459R6t4K9lelFZ+HAa
 RnaDx+fr2ERDb9JVJ8rx1S5RFcc+j3I9MyEoJBEg9OQeeHcSyZaIy57HliPU7W7wP8hhYOepB8cp8
 dIqlZlIzR2m+oMpVq0/ZEcbsXd6/41qpPA6QaEPVp/3OFGCuCQQtds2aB0SYlwtPbEk+FTgfguyyY
 A0hl8hpg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh83s-00B9Fx-M1
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 09:55:22 +0000
X-UUID: 852e668ec0f641b598cb465e04a504d8-20210513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LmJ1ZG/AhG3cFphlraoDA8hgTV4+Q3LYb4Hf1W8mF48=; 
 b=Z6f0UCfpdk+S2Y8Ha9c4dhFMAIfotwELjz3u9bggJ5/9AxQJoDSKj4l4waVBx8pS8HuwW3MQhgcI/JHeaWBp31a+SUjMsD4TBTh8tDeWyMO9xfCdv5XJBnGh/gGWFUGrs3kVTy9Ft78v8seZXR8HvplpvqbQXeX/37f48LTzEg0=;
X-UUID: 852e668ec0f641b598cb465e04a504d8-20210513
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 174861986; Thu, 13 May 2021 02:55:19 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 02:55:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 17:55:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 May 2021 17:55:15 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 9/9] mt76: mt7921: add back connection monitor support
Date: Thu, 13 May 2021 17:55:15 +0800
Message-ID: <1620899715-4351-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <79633d77-a326-fb46-6356-65dddea9da44@nbd.name--annotate>
References: <79633d77-a326-fb46-6356-65dddea9da44@nbd.name--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_025520_754396_F65CBE76 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

>On 2021-05-10 17:14, sean.wang@mediatek.com wrote:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Hw beacon cmd to the mt7921 firmware doesn't only filter out the
>> beacon, but also performs its own connection monitoring, including
>> periodic keep-alives to the AP and probing the AP on beacon loss. Will
>> indicate the host with the event when the firmware detects the connection is lost.
>>
>> Fixes: 1d8efc741df8 ("mt76: mt7921: introduce Runtime PM support")
>> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: YN Chen <yn.chen@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>What happened to Patch 8?
>I don't see it on the list or patchwork.

I've sent again the patch 8. Please help take a look.
>
>
>- Felix
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
