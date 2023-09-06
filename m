Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00171EB8FB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0081cInfBKzI1JPOJchcZQctsDgMNVHwcQcjiRNKTg=; b=Q7yG0illikmNXG
	ug+dhbidrBo03epiDpXK9Z5yoInzMG4oIp4tiy5ECt+ZC3oez/fWyjfQrHyGPkGvLdNjlMFawF9VW
	FgbI+/ozycb0eWLJyeN3e0YU4IqcX5+0T6ADfhnR0cqu6HKGsbMmqY2x/uyMdqVslJhkgdtSmOGr3
	zc9vzIyx9XDrJzX38U+aMRBgRQJe715saWZsxQMvaB/84fEbWqztYoc9pzXic01goiv3YCEWnE3h0
	D0Ch2tv1LPN5PBaqGbgaSKTwZer+eLydGcU7mKm85Kb247oH5br54pqQlD1ZOZUwVWNHzvvA22jFL
	gosX3QJM2alhrqkR8ZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrVJ-009J3T-2F;
	Wed, 06 Sep 2023 12:19:29 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrVF-009IxG-2W;
	Wed, 06 Sep 2023 12:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1694002754; x=1694607554; i=frank-w@public-files.de;
 bh=e0081cInfBKzI1JPOJchcZQctsDgMNVHwcQcjiRNKTg=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:Referenc
 es;
 b=n+FHE74GGs7iQQExFGT8fTlcQFlNWq7/pGkA1VAdENDlztHWxBjU7bEYfh7Wy/5TRc4Pljx
 E5DVV6SLJ4Ym9esjAQVJOzVgKnBbiyfo1Q7bwsJxyhlWgoXlQ0z1RgigwlxET/pxqmziBccB4
 pL52oYSQrcG8W/Lm3hoS18P8ZI+zZFWdsoezJwNe2hnts8PVfOmQigB5+BV9t9ejWgqfBrccC
 zi0GXALJQQ9f9CFTk3EOZp3d69o1cxPSlR4h7VvCpI4vYhsWTiWsCOYAI+KghRoiZ3uXg8Pe5
 fKpHL9Due/HqYr3ZwiJwP1xzqq1U67WKDzyTAJjmFmqK5gisPzyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.71.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOKc-1pmZMS1k8k-00uqpI; Wed, 06
 Sep 2023 14:19:14 +0200
Date: Wed, 06 Sep 2023 14:19:11 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?ISO-8859-1?Q?Bernhard_Rosenkr=E4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_dt-bindings=3A_arm64?= =?US-ASCII?Q?=3A_dts=3A_mediatek=3A_add_mt8395-evk_board?=
User-Agent: K-9 Mail for Android
In-Reply-To: <c951f693-b219-4745-be20-a8e1fee0099d@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com> <20230906092527.18281-1-macpaul.lin@mediatek.com> <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org> <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com> <f343b6e2-6106-47eb-71cb-f391aff6cb7f@collabora.com> <50f7fbdd-8592-7a47-b2d8-a1af8ed93b92@linaro.org> <c951f693-b219-4745-be20-a8e1fee0099d@mediatek.com>
Message-ID: <E3DEDA34-C203-4560-B07D-8BCB44204FF3@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O/pBamwEeOol5A2BT1I7ZdcnXSsAYQXRMcNrEL6HiXWgdfa1QVO
 Ss66XXOehHOACvDffgmThSn5M+rlr5/PLEgFCmUu9111ZdKdZfKainTtc8OxiGDPION4KiK
 UJ+KZNe5oLx1q/+ebykxqgeoqE+MdqF0uWVh5YIqU+bMARn8pGobL0iThqpb9tKCQAD5Ubc
 5LBgiudCKYEGk9urriwRA==
UI-OutboundReport: notjunk:1;M01:P0:E8Xc5Uvy3ng=;T+94gWu53WDA87IePiH/JBNpwDo
 VuP9OrqBwGjTaiiOY9KR0FN+QLAQFYQs32HJmOZbWjyj/4Hi1xNeYvNonaMC/WO3fyFtq5od8
 zmbalYdW4WcZiDm6TzDjEhzpF7bPXoRaGER/vIZwrzHjH/6+CZBbi2u6BCosvfKVKT3ltdLDN
 W21txCnhzHmdqnVdEmbEt5mVK4ybq5ek/vWoJBGzIu53SzVzoI3a9nAM8Dqr7jGUmn4mcafVK
 JuBevjuDNF02NW1dAE009nUZf5j2c74A032Uxsyh5qo4DZPWGM0eRapDbdcXC9LUceHHY1YkE
 TG6F2wbcGoqGUi3qoxG0zRDUyt4oGUACkRvXqCna3fo/L10XeerUzFNe/pOxjrv3+fRk/k4xb
 YvK1szY/ui0TNxHdKioL/8YBT42BD+xtOpuzlR5uBaqkE9lfTnPC5hT0IQa2Bi5Ksv+/9bBmJ
 0M7V5u7ay9wmNwmG9pOP4gSCDsISthNelCzV3w++CEk2SX+ssTpEM7P/sb2IbxRcpHTQJrKm1
 UbPMvyDZgbEioe/VJU1q4XOZ701tnafSvdbEWdYv4wLy1m37H/nu1Trft52ApiMjTitnKrH8O
 FIlvR66uFYXiD58VPeZq8kVaYXDALf1t8u7WkD1HtUJm5y4p7hMbckFr8tiUtOHR/l2cZ0Vof
 GqTd0omc31nrD0Jy6VXEDwIWo1D9pX0OvCykpxI59/gR3HbJ7olQp5e/G8khRZhEz34gK7Ghe
 IeJmB73NIV9HhCXmys14zf61/Y5W1GRflNKEYcxTqXg2NDh4YG9MOZwFW63qFo7eC6hLZPIEZ
 ZghiH4Oe+XgIb5EzzpuUAgfW2tUps53N/vtoYwTQHHJjv0f3EVTU/nPH7nFntkW4x7PDiCzNO
 ++L6PVzwqevWvgdUhNVDJ1+zHBhlOILW8ItlaTXtzhuX9duSrEp6n/dFQXYCWkTi9q8BSvAaX
 XpfYVaC4iFG7sKw9+w7iv4PDWqw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_051926_190269_6DC7BFA5 
X-CRM114-Status: UNSURE (   5.88  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Can you please only target Reviewers/Maintainers and mailinglists reported =
by get_maintainers script?

I have only sent patches for mediatek and did some tests=2E So i'm not int=
erested in patches for hardware i do not have here :)=2E I guess i'm not al=
one=2E=2E=2E
regards Frank

