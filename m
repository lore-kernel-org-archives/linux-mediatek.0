Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D309C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W53sfTGjULBlsVrIz30TVDtvSx2/XuqDhyvxNMxymFM=; b=xc6Frh2Lc5cTSX
	CSzhWOH5nbtL9RVbKa+F90TXPOKPYl43H0Vgc+NDZlueFuSZNTNUjW7X46P8WykprRC+PAjljb5jy
	RvSWWWHjJe866Ff+fxnQs+6a5gS0t41RmzvjpXGGUHTqUwbmOYkswXH4XaWmJgXhFWttemZ1u1R0B
	jReeVscic7d5TIk374ZQaWDIFmweoDb7Sf00jGCyy9VqaiBi+8VilE2ko0jEhfVicFqE3JAoF2wic
	eLbPoeBclTDTu0XLEMF7iZXpkYp3nZDXIrUYiQer6uc1mcx4h/gsHAx0LagH9IQ6CB42wtsn3G2Qn
	7MK2E7xiZi5AuSsgMvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRXuI-0047Ci-TX; Tue, 08 Mar 2022 11:21:34 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRXu3-004732-Lg; Tue, 08 Mar 2022 11:21:20 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 06C743201D2F;
 Tue,  8 Mar 2022 06:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Mar 2022 06:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=pKOLDup6CMOwYt
 Ms01f3OYDYeaQCLPa97H9UsprugUY=; b=VvA4Pnhx9qU+d6MYTfyKTF1k3A5N7c
 QU5i6l3JMTARjoJTfOz/EG7PtNQe4RFT2gmmGQtOKevu68uc2IrdU0lDonp6rNJo
 G29IoRJEvJ4fitmEqz36A/KKc9Z7FI7bLIWrbsGwUt7JjHLtYbuHF/FAmbnxcOLS
 HorFClux16n9nX3CicIXKZBYfXEWgmezXOlfsPWertrQkp5Y9SBQ1P8YdBQzEqkf
 iw7O1/1qJh7xAehTRuZV/59wVQyUmbM/kuB/QyAKH4sSX+XzwWr9rQ8WfFwdv3Fr
 qPH1qWulQXWnpGV/RWrTAsJPMXNbnlP3yHFzPI5BaB9BWTam9IHkEePQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=pKOLDup6CMOwYtMs01f3OYDYeaQCLPa97H9Usprug
 UY=; b=c43SFXaZPv1kn4o+X4jmfEC62HVt7ROIE+BsQbrQDdtAfBdSlfbs9fTCu
 PJU1t9uvnDo6xPQZJNAWlspwmo3zSY4XNqWt1itsbzgM2t6N9cstdJGypmWC7TMA
 OIwKQqnOWzynePjh0jX9B3IyR3lFRl+dpn8ES/icwky7XSEmlFuxDy9AGOkJqu7p
 gIFVdUJoa7FFOspXX40r61EMS+AkMT6tWlaDfcZVsWApl1pYGFXWyseL2spZlW12
 OHsL3JQJFMKvGCvQkz1cRMmrAI8dD0XP1QKxEYuKAiEXgY6gBB67Yp8s9S1UT9vY
 Qig0IPtzYBFuQzod0j6wXCJYJa+DQ==
X-ME-Sender: <xms:LTwnYi96AiL9MsDM26SVXo1Nuf8sqa50MpadeP0GEUDjBnqO-nwrOQ>
 <xme:LTwnYitcHmJscRYdbhviUC-W4Ds8W-yZVakWQN_v1v_BU7gDg3qB3h-4ajRFuL3Zs
 iEywKhG6yXT2EZ8pt8>
X-ME-Received: <xmr:LTwnYoA4wEZUI8B7cULCj-R_ZseNnEyqeUn5j0NcrHSxQVISqW0Bd-8rzOjMHtO7YTKru9Qv68zgpohysWOPtQWlH2aM-SXp3K3G6O4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LTwnYqd6fi050ppkI1keeu99pDV8lOn7uRT4hesNwyItYqn2_HMUbw>
 <xmx:LTwnYnMHRCEhiI-aDiHS8vagCevvyjaRRftk2X3qXZv_do31L72zyA>
 <xmx:LTwnYkkak2GQstm9tyfkp9AN3lBfihK6eNYpv1bI4ednGT5lp3QISg>
 <xmx:LTwnYlsRt7uck-OuMmWt5Lzgs0QgEeF12SgO4o3Rzifw7CCE5NJR6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se, narmstrong@baylibre.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 airlied@linux.ie, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, matthias.bgg@gmail.com
Subject: Re: (subset) [PATCH] drm/bridge: parade-ps8640: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:03 +0100
Message-Id: <164673846305.2436174.333287001156624230.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228183131.23494-1-jose.exposito89@gmail.com>
References: <20220228183131.23494-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_032119_758673_7C51C83B 
X-CRM114-Status: UNSURE (   6.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyOCBGZWIgMjAyMiAxOTozMTozMSArMDEwMCwgSm9zw6kgRXhww7NzaXRvIHdyb3Rl
Ogo+IFRoZSBmdW5jdGlvbiAiZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlIiBoYXMgYmVlbiBk
ZXByZWNhdGVkIGluCj4gZmF2b3Igb2YgImRldm1fZHJtX29mX2dldF9icmlkZ2UiLgo+IAo+IFN3
aXRjaCB0byB0aGUgbmV3IGZ1bmN0aW9uIGFuZCByZWR1Y2UgYm9pbGVycGxhdGUuCj4gCj4gCgpB
cHBsaWVkIHRvIGRybS9kcm0tbWlzYyAoZHJtLW1pc2MtbmV4dCkuCgpUaGFua3MhCk1heGltZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
