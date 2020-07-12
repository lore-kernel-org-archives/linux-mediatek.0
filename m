Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8517C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 17:22:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D4F206F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 17:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EeNoH70c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="eSDwBiHz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D4F206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yq9/fqUy9ADgadfpaZhAc3W+VloV1G7PtIYMWXgnb0=; b=EeNoH70ck3uSo/6boo5D2LaJ+z
	hPDBF9nXvkkCIQqDYZjoE2nmioMsv7BmCdILHqEoPYOqL22UAKV0WbUAWoXATpKRXHEzHROFe9Bik
	Mtqaej7CyAYWU+/RXmPmyGSWOMy1tlbxjD+4GfZpZe0M860wej+w5Hgk6Alw/7PVDAcuytQa1kMpY
	m6r+BkXl3lRUs5zYUlwamPyyrkEw+DXh7MtFb7hzwhoSYm2cLeBUdNnIt6C+ZXHeg7gKJ62W8czfi
	OHRbboe1AJFF0pHJMV1I0GZI439Mc4+gaYDtWKmm53CXM0BrqIisGmyawx1eV2yAP7u4qwz8FRinE
	jw3rXPVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jufgR-0006tv-7x; Sun, 12 Jul 2020 17:22:35 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jufgL-0006rQ-2h; Sun, 12 Jul 2020 17:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1594574543;
 bh=M2koFojxYZHpRAK0x2WQcPQc3sv3CjqDJzdHS3xYj14=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=eSDwBiHzyPYU0+n4Bj9oU96LIvd1BcJk+u2wpJVSqI53iOVeuLEoIN8MVTCYGEBtC
 6/USMvPwzf87OrGK+AztxjhrK2B+C6YZx4SF5eQMw9fFARe1yu2Hj7XARZyF/yA1iI
 8MjCBm6BbG5e8Fc9gBeafD79dA3rXFEfOf2UvsF4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.75.74.1]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1jufas3Myu-0004bk; Sun, 12
 Jul 2020 19:16:50 +0200
Date: Sun, 12 Jul 2020 19:16:43 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <f9c3cb16-ef6c-b7ff-6832-a858cb2c9b3d@gmail.com>
References: <20200707103412.1010823-1-enric.balletbo@collabora.com>
 <98369dbc-2e2a-a1bd-f3cd-68f33f66b882@gmail.com>
 <f9c3cb16-ef6c-b7ff-6832-a858cb2c9b3d@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "thermal: mediatek: fix register index error"
To: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <F97EEB5B-958A-4CA3-A3F2-7668B8E778FA@public-files.de>
X-Provags-ID: V03:K1:mS6EkSIZOrghNWC5/SoCGSYcpQLUuJGPL1lv6FDvjKZ3vSgAhWI
 BoxxaAmyLLri3QA4FRCwXpRFwYdxWw/SkIEdEMQCjFri9SEA0fKL/fuT+pQ14zircKQ7iSX
 QaRZ/Uu9sy/7rwLrzWVsf6hnWK0LFJa5kHtC0KMdSLN5u2iPY/Dc7LPzDmIPy+kphwrdAgS
 6csCl11UWB5pslnyK1sjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kGAOK+zg71w=:ESzkqFAkh8tJBXCOYQUij7
 NfIwkr785Nen909pRJjL2w36eyHBB9NL6XCRZV5eYkK+Gpv79RzwkLJYjrwP1m9bv7mD5C3z7
 AKdJwUOTo/BaVXKiZPi1uH01+MHrW0KHJYYvmSQKJ7I/AGeeOJFx5WXskjj79IoGqqXyp1OTq
 HIQmJmbuv9QVyBL2Cgs+QuRh6x447dVhNHDbdjCMfYUewRxnxRMxWsFi8wu4wbCYk/SwHT86H
 oOmZ7DNMu2QelwExwmLEXT5yJLjhbzvbkt1OlVUkADbGdwObYuNge5+3D9nCQkDNZE7A3oJdq
 Bbg3HZFAPd0CeSrTaqfFRcasrNdnYkRInJDtt6A5xe1DaUaXfjy8tycbxTdTJSxovVJs6fJLy
 2sExKcaMn4KoTJnJDGAB084MRfP30+UdXLJ60fS5+bqoUTHOYHXJ76T2dJPxxeFTjPN0teVTK
 uQJJcb2x24HTVW30faMd2Ar/sW8sBBkqvQIeM1RsCtg5Yn/iQluHMFNHlhkQqVf4WeDaFTD44
 tqgj3yL4q+KuT5AXjrg8C7+eYPfax9UIAoaUifwZWPZzBeAi+b/Rql5U2bAHcWxV3jBVI6rtV
 0Ila7dKLDFvPH9b9rFb9xLQZO2x/D4Bd0+3UbWjTIoUbjEnxlriEfHEGdztW1WmGEYiayyHpT
 vkwTcTCTxnTgt6TS+hTHVk8m9Plac4RG+VSB9oZIU+SpZw0UYfgF9EL3TCLTUznHB9NxoTywi
 0wWCu+TFcYux5pOXeNBbHNK01Ita6qJ5aldYsXdjYhJO7d1L7G3FDg057jhzE57QEjzr+b3vZ
 7YWs6c7T99um5BSwVCHfaFAOvhxgUt3NafSR1eNbwROfNQTPBxaGpMfitkUkF4nb92ovQ4Fkk
 AvmikSEUsuuYbQ0Vzto8H5c0KTB/D4Ri2Ae4EcAdYmHcwgtNcWXmjsXsoCN5Al9kQ1vpjmscY
 +FK56XCZjDiFYy18LuSuy8f+qYYdYVvlj7k1dAvOJdjxT57gI8hiUP/TvMMZBUuo6zu3mF/za
 iXKdlEP5C05Um4d2UvK3Kkx27oa3Hb6B23K/zOg+OzQKp288j6EdU4FQ3pKhrE5Cv9BSMEB0Z
 dbihdAIa0Tg7wJFDe7iSuzvwGIUuwPH3HNRdhNNWZYN9RjhxBlAyEPO9bZ/e4IDgJk/fLzEtR
 S6mCGFiThS9xdVMASmATHQ+AvSDAMVRbnPgCgSzB+NJSxOkRhe+YMHGQL0REwRc3srWAVy/oI
 lPdaFvG/J3Q4Ij5PInQLmC0maiR4avXd23Dnrjw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_132229_388887_2FA1FE6A 
X-CRM114-Status: UNSURE (   6.15  )
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
Reply-To: frank-w@public-files.de
Cc: drinkcat@chromium.org, linux-pm@vger.kernel.org,
 Michael Kao <michael.kao@mediatek.com>, Eduardo Valentin <edubezval@gmail.com>,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 12. Juli 2020 18:55:41 MESZ schrieb Matthias Brugger <matthias.bgg@gmail.com>:
>On 10/07/2020 15:58, Matthias Brugger wrote:
>Even more interesting, with and without the revert the
>thermal 
>sensor returns always zero, so it seems it never actually worked.

The thermal driver works on bananapi-r2 till 5.6. Something in 5.7.0 breaks it, but it's not caused by the reverted commit or the revert...neither the commit nor the revert has any effect on r2 (no crash/error/functionality change).

Additionally there is no difference in mtk-thermal.c between working 5.6 and non-working 5.7. Thermal-merge in 5.7-rc1 shows also nothing suspicious and dts(i) is also same in relevant parts.

Maybe anyone of the recipients have an idea about the broken mt7623/mt2701 functionality.
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
