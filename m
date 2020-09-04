Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8D2C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 15:04:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221B72073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 15:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OCHupfk3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="erhLky5S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="X7wk/6zg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221B72073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLtaUQSXsz+0LP1ekdMCvSpbz5Ej2gt90iJqQte+irM=; b=OCHupfk3VElmsgQ3ONgcrLpAQ
	X9eGAZNa70k1PaMEBfUHIcl8OQdwGDqayIK46mnleDNdg2tPXww2b9BK9CYx0vQ8Ow69TUY9OyWeb
	nJ80I86NegtmHAlmIG7wP3+atqsqjEb0z+4/vWKEC/SL7MhSWHS5hSEfPiPFsv91vzn1L+sY+VfbA
	GV0fXVnnnKk76IeIuswfPVzyED5H1fGPbpBSmcuF52Bkr3X28JPE4+dTWMfd5QrBneVegGMnUqtoF
	Ef6fylDtYpGVM3ZbNiEp0P+CEK0Hvhd9T1Gpt6Sn+jONOUNGVqHimKp5BbuQMZ7VM/2/ItiRfnj5V
	Ze5UTWP5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDGF-0004Ec-29; Fri, 04 Sep 2020 15:04:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDGD-0004EF-NX
 for linux-mediatek@merlin.infradead.org; Fri, 04 Sep 2020 15:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ODT7HpTlapjg5CzOuoOTo8SJPHHlMe4W9upOfVEYdWw=; b=erhLky5Sadiop8Og+RHKo5n0D4
 oQnapsvPMBm8NWktYmf21ru6egIA+5nMWJpG+TjwSf8Xky6/62FvDy7cRV/FKpza/iCg9MyaF7XsU
 iDd4UevJrDW/iOiHi9yUbdce8tR8m+GNGWr/f3lIK6/cVcU4v8SsNh3U3u1sA0eX2F40egcJXq+Z4
 CZ8MHFgxzfUjIliIYTPOwv9alitQH85G3EMMWUN2nt0iBqIK3vWXDBU9uwtGEoqqVN+oU+IAvZCkr
 RuUexd8OG11YgT2bzvk7/CVDvJ/oeJILEJnJ66dyIcxR2rwM2en4H2B3TjHQjl1+Ti06oFJ1A64ay
 J52CHGcw==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDG8-0002Bf-VU
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 15:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599231842;
 bh=ODT7HpTlapjg5CzOuoOTo8SJPHHlMe4W9upOfVEYdWw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=X7wk/6zgi5G3VfwqwtTXAROuYvMFevFItkPtQjKr1dA8t8JrzGTrO1C4vw1YK7RN3
 G90gcBUic0KOQSdWre3ogTeQK4S1KgKDpZPmhiJj0MPvZSD9/uxfVaaiJV8dyxi/Vt
 67A2OcIPHjxZjOzPs2L7TDCYX89aN8y9d/708ox8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.193] ([217.61.147.193]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Fri, 4 Sep 2020
 16:50:10 +0200
MIME-Version: 1.0
Message-ID: <trinity-3825f323-0deb-4f60-8cd5-b673f02e7115-1599231010390@3c-app-gmx-bs07>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v5 0/4] Move Mediatek HDMI PHY driver from DRM
 folder to PHY folder
Date: Fri, 4 Sep 2020 16:50:10 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:KpMzbqOqM5q/mCTt5CedCNkbKG9MoqFurTCaE2fv8zT3Jk8FbuztfGPNDkS8ZIUwmmNrm
 swZAg1L3OfhnPQLicSZu+5aaVonS5O/nItBgBB+usLTMycfJOW18FzbM9RCje9Utso/6tA7juSxI
 T+0UDN8w7zuiLir2AEBDU/V/PyIYpPu3JDa8M4RmPcYKcvaWqYGqq7Iu+HFPnUVzoeijhQxaybZc
 AMXQYTBxTNsOVIb3mLGWVjy+BnELcjsMLl9ZLG6WQ2BCNSwAuct87WWOTrTWN8/iqJaKhoG8Af95
 mA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:JTw2oL4i/ks=:rjoLoXqtm5x7h3OByogq8F
 gxv24a8qyVIXktKZvqpw5x+9eBUuq68rZtRiWfS2cZ2eZVh/m51TtsvySf2kRJ6Sttk84bLEU
 ViznGUoS6bwEU72xVWsaZjWH6GqlstdLjKxAz/6Xn1aawPUYnr24rkwFzlHwTa/IX00MiUkxP
 KPtL8Fx/nzCHPHyx1pj2WwfPekrjwaJ6o8xB18lTRVH2QGmKpPaaQi23bBfKg0jSxwhF/Dx0i
 jwalqWHQHDMu6A5JQcM4tx2harGkCR0cfBUxiKWofuQCd4Tug465gtYHFug4K1Ik1BJ7w3Jf7
 US82rx77M72xebD/818OjxkqfIg0z4SeUYBV7QfzgVUdDbMYeljKetd074Boe3k/Mjt67GS+U
 q7tm5ZQ1KnMbBBw9GDq6e8frz9Y0miIMLG9Rr3kQZ9apahCezlqimGjVgKfA1bhy5y8HLrR7j
 1D1gpwUpWQaSSWiknaLjqCBevqqurbzRQHb6UXg+gBvuKlnVzNx4jWUdKFTyanueONzNd9RA0
 Egj8FI7VnBcwauh6ihg8IkGExRyPsg4NUIiZMu7sugJc1tT2GqXvQogao5kuQLN2MRu/xXH64
 f1xfBgfCOqCdYRjJ6ftJ5JqfhjMN+z/swW79I83qA6OPzAsU3Ok/905Ajr4DA3TGFBqzgl//o
 P2+1+OnE2xgmK6RbhOizshDGiHaL4UlDYHTxQVqnDSKhNL40pDg3sPtPhzbCGOVx1i2Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_160414_281140_32EF94A6 
X-CRM114-Status: UNSURE (   4.90  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
