Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF88C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:58:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D4322CAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1bgyl6U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="FMWxyd/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D4322CAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tYKFlVVw5DQw+IqNrMNjmDT1xIssKTuZNaY+41TKFnM=; b=k1bgyl6UTeJ3VtcO1MQVhc1yZ
	R3Truwfiv3t/w0JHt0EQoQJM+FYnb0zmc/8UTwACqyOl1YMk1TAM4gvzuQ5H6oYnD9cUMkFR7l04f
	hT1/zwmEe8WXWOJ+9uciXQNGLCoZ/YYQad9g0sihQ+/GARbKEGamHYtWZ2sJaAHOHHS4AaKhT86Sx
	DwyiRA4RcBkwVHC6KfHfSbjfI1naihgAu1GbPwL6p8r1nzuQmE5vzpgKNNSi1PNJNfH2AqC4hI9US
	LE5JJhvCUSxggRbHbo2imTJh6ZZR0u2nwnrKAvB4e8EivrZL+JIi5UvPcNYgOAzwjmqXyYBFF8mFw
	Oollq0ljQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBIPo-0006uZ-BH; Thu, 27 Aug 2020 13:58:08 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBIPj-0006sO-PH; Thu, 27 Aug 2020 13:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598536675;
 bh=uLRcuAAqrW07F82sdCLeqyG0DIS6eSFEXsO8Otq5bp0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FMWxyd/5iXXZPguaf7EKjRwG2pjmyud5WcYyk5d3zmTSl1E2kVEtgswydUbWAt04Z
 8whhoWHz9f7gggJOApBoe6DI8hk0D1uoa+2+VlVqXkZOBwpaI+QdTaDwzmZ7ISMzCt
 /lWrLkydxD3exYUwBPVQJ1TD9EVe88Yg0XBedEHc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.146.7] ([217.61.146.7]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Thu, 27 Aug 2020
 15:57:55 +0200
MIME-Version: 1.0
Message-ID: <trinity-b7618ae5-0917-4595-81bb-51764215b02e-1598536674992@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Aw: [PATCH v2] maiblox: mediatek: Fix handling of
 platform_get_irq() error
Date: Thu, 27 Aug 2020 15:57:55 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200827073128.28389-1-krzk@kernel.org>
References: <20200827073128.28389-1-krzk@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:drKYd56QSglEjBuE+8kuiQEXMZ69EFTHi5u/RppsCaMnl2/1bzI+ad4TQuZM0LpPqMNI+
 bExz9I1CKtGN34wjU1YyJSm3LBeYZfKsPeRgTyXRClOF+OWGliHzwAXMA+ay1Ks7D+mPHiPtHbzU
 K7Ew5QronW1DJL7BgSoozF64nGFtmUs1gN1Q5Cbmsj8D0iZBWQ2GkaBGD7vwnwyTTRp23etWN1fV
 Ala6BRWTs6AQTtgkQcNxFsGd2VeHOX+wQYRIBHc5NbPtEQ8KWzYB2777+aCB41SXzFtjx0nnZ5ZM
 cU=
X-UI-Out-Filterresults: notjunk:1;V03:K0:2UK820SKAxA=:vbeSVlKXwhbcN7oKajiC5U
 3CJwxk7wBAzk3AXJ4fc/GGxrx0mzp2YROODrLeVB01H8r8bEJ23+5MulE1Ya5ThF7nVZ7jLTZ
 5EiwmTD2uL6xoIeSjnTo2N8uXwX+EDBa+Vf7DjGjovmwmPJSwYT3l7B7C8VAMa0QmefAgtdJm
 MNkzCWPjV/iUVAPqn5iXJxWmfHXNpnF/aQB+EsaWo2IsE66zAOajIpC+rjprzr4gHKxAXWK/0
 OO0l6eTS1Rvo4f12zHnTFBWjbI7qQwJEF4Y8bWRZhVPEJdx43zBAmRtmIGtB7Yhla4+3bShHl
 76oyFO5bXPD1zVEF712nAZt8Jgp8RS962sDTjuPScKUif2LNz3n82zW879xdCez4RIZ078KJ2
 xuhG4IeYbs37Lb0kZe5yTXCvDP1QD24XVIKUErRXVxncixl8dsLNlMSKAy4usz4pryMEl7BGB
 2WmbN4ZAXtxo01PUsBXfzJGRf0Ved7eZ4tmOdUGWUv+t4NuxofjC65l6Cl+ICE0O0EQVuyN46
 ZcMftG9E3nVtZiZFtrnGg4q5lySvnzklOZARVkgkvvfpSw+QSKF6p0GUlzgfSf7mceFbbLj2i
 p6c8wm1ft4WIYm3WQnSjnyr6vF5Zu3X4daci59TJY9OTbQYV6/Q22eIXWsdUxBfVT4OdQfEMI
 1s8InPqms8jiow8NwjVs8pWSKhTtdnBQPXJT5gKWBQYM80ZgjcY+ervVV67nAAhWV1rk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_095804_386926_BC55D056 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Donnerstag, 27. August 2020 um 09:31 Uhr
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> Betreff: [PATCH v2] maiblox: mediatek: Fix handling of platform_get_irq() error

typo in subject i guess it should be "mailbox"

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
