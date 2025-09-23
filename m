Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A72CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 06:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bgzZZDPwt6mR+yrhL0DPNNQWzGay8xhFTXNxkwlNfc=; b=zLA8K7glO68KicXA7RoQWXqEYp
	fzWLHKcZ+cUQkrk7zDZ+4aJoOUVdvIqAONnubuzzj8xBP2hMVVk20ihBf4azjG2jxy6NJ3SRt19FF
	5nQBqv1Vpa6yNSGqBvMMJq5pqX5MLOj9eNVkPPmnHeLSxMugS38m3mTRgNZjhD1uK4Q7TcPSmlmYq
	AwWza264qdEktRkCwX5u+zLGB0JeB7dicFWfsCgb0GyXlXkK7s1H3OJUDt1E+bX2efLG8ShjaydgK
	xFNaQSF1wLsNamuOePiT+26JZWfhlGe1HClFBy+AunX6Q0zKTDlnjyWfaSB+iJTr1g/+uT6Au2YK5
	fzbXBokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0w6H-0000000CW3e-3wb3;
	Tue, 23 Sep 2025 06:02:05 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0w6E-0000000CW26-2MWR
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 06:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1758607313; x=1759212113; i=frank-w@public-files.de;
	bh=9bgzZZDPwt6mR+yrhL0DPNNQWzGay8xhFTXNxkwlNfc=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r7AKeM6enx8JiUsp+ItzfBdg3bgeFh9Lu8pqKm/IOxtOAn5J0sAeRG9zZmxtQ9eG
	 uEM5oYuo9IstwIjPwAM+GREwFuW4z6JkywLAxgZSDDWawfcyxE3VeOArmwa3V17I1
	 k9SePmTAnsoUpcv4TTQQH0Cf0gEKEK9vy1pJRtawjMrc74hFWx0KVl6G3ExTkd670
	 9d83wZBskhrHmkCK4lJl7Bmu5neP59iiUD3nYlmJENWog/Jthkw6EEA/nI/s+/XC6
	 /k58oPWg5Sv1LfpNTmHH5wXYZzNTqklVCpJf2YEBoGvr76ksERLjynXnoU4Fisfr1
	 9ql7iCv0c8GaYuNmGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.86.44] ([194.15.86.44]) by
 trinity-msg-rest-gmx-gmx-live-cb7cf587c-xzfvz (via HTTP); Tue, 23 Sep 2025
 06:01:52 +0000
MIME-Version: 1.0
Message-ID: <trinity-1454faf5-c5c4-4c90-8023-9b7dd1ea6bd3-1758607312841@trinity-msg-rest-gmx-gmx-live-cb7cf587c-xzfvz>
From: Frank Wunderlich <frank-w@public-files.de>
To: ryder.lee@mediatek.com, ryder.lee@mediatek.com
Cc: linux-mediatek@lists.infradead.org, ryder.lee@medaitek.com
Subject: Aw: [PATCH] wifi: cfg80211: fix width unit in
 cfg80211_radio_chandef_valid()
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 06:01:52 +0000
In-Reply-To: <02e27f91195aebcc1d80351fba4a01a719bfeccf.1758577296.git.ryder.lee@medaitek.com>
References: <02e27f91195aebcc1d80351fba4a01a719bfeccf.1758577296.git.ryder.lee@medaitek.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:2kAHaKp5i2cacAbXgXkAhW+qaUzad/vrz89lirKfSs0yNfaf1GnyFMfkoWiDxMwSUVMNZ
 HNZCwii45KUo/KSRbkqnJj/3zgHsNFNIiQIcwGL1ypD1pOksbOhBSzvYBrn4DFzcSgSX8Tyn5JdX
 WgZ42mT2q22zEPtsN7GhIrr3mYjO+H6UvYMQebHDSKwdtp4XSe/+4UKipSbZpkRVM6/lSIE1XwOI
 zfc5HjBV4hpZcoyUl47PrdBcuOa+V0Kw5ODMr6Rv1oijV9b1eojrqSeZBQzYKlstIdJp4PLrkR3g
 WlGD5N1e0U5xUijeERLCdy4fQSYpgzZTPLMTHqNDSk3skNWVJ0cc08cUn2bWxs2FEc=
UI-OutboundReport: notjunk:1;M01:P0:lF/MVEzj3oI=;VqnGKqsYLaNhDsVst+kh4X7XjLI 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_230202_974461_ABA1BF7B 
X-CRM114-Status: UNSURE (   5.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

> Gesendet: Montag, 22. September 2025 um 23:47
> Von: "Ryder Lee" <ryder.lee@mediatek.com>
> An: "Ryder Lee" <ryder.lee@mediatek.com>
> CC: linux-mediatek@lists.infradead.org, "Ryder Lee" <ryder.lee@medaitek.com>
> Betreff: [PATCH] wifi: cfg80211: fix width unit in cfg80211_radio_chandef_valid()
>
> From: Ryder Lee <ryder.lee@medaitek.com>

noticed a typo here (medaitek) which will affect author information i guess

> The original code used nl80211_chan_width_to_mhz(), which returns the width in MHz.
> However, the expected unit is KHz.

regards Frank

