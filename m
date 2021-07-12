Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB7BC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 17:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D404F611CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 17:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D404F611CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6taW5sG6tXgl1gjxZ0lb3p9BNh+qv6bcpvBJS+wbSjU=; b=mheaaOGQkyXlVm
	YpdCyF1kL46iQ64enP46fCo/ixXv3Ezw4O8W99f8f6wDHbNakTFaRnpRePl36HdIBnGsGpeeH3p1A
	uTpVW+k15dAzoY0koFp2+dHxE9ZwELIBefc7hCDG4JP3a7hFQFMXeAA5ffanVXiyXzy3r86K+ev9j
	tv/2ZU+CFtU7fSG92z5HyRiG6USmL/VdUrZONaJBrZhzzIW513Tj71coayvULY4mX+5ewz0XRBG6E
	FQ4ljGrduUF9LMzD+kK8Fbq0NQE9f58OvclToOHito2aunk+d6zeDtLJdCbLxF3t5K6Q+wXvZvVQ0
	I82AOGsLw8m7ekzr//nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2zXv-0082yo-3L; Mon, 12 Jul 2021 17:16:43 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2zXh-0082wb-TV; Mon, 12 Jul 2021 17:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626110171;
 bh=wmB0Rr9IQPBFqwimqWcf2igVM9vM9Uvnv61KwxUy1F0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kDJ6GpEThEucJ6kkIwvk3MbwBQ4M+BELrFJ4RmxfFiBt/ffm2yug8OcsiF3s966QM
 Dv3qu3+eBUi9Fx0B/BOUgzxnkXVFfRKmfyVyMVKIWEKNhgPBBgYDNA8C/d3CLgD+/Q
 Nwh3sNdT2YYE4AUugEv7dUea4D64QgkmygtbvOXk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.139] ([157.180.225.139]) by web-mail.gmx.net
 (3c-app-gmx-bs28.server.lan [172.19.170.80]) (via HTTP); Mon, 12 Jul 2021
 19:16:11 +0200
MIME-Version: 1.0
Message-ID: <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Enric
 Balletbo Serra <eballetbo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
Date: Mon, 12 Jul 2021 19:16:11 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3b3zuNuyYHAQu9Aq/AFNd3jBsrHOgzDw46MqypI0YOFxUQS6/rnXzfEUHUh5ESpFXzKOO
 pD8jmMsdfLTDif/vZg/Sp51P6PqmxTJAtrm8ytcEfrP4r51/+IXGDezxKiy4wd3k5VXj6C5ol1RN
 WJ7UdDAaaqyVmqpjv1sVSplsNFQFntB+8NDilMGEoRyPy2XOdNttOpNmgnpgKXSLMcUVp6jPtZpM
 mxuLAGwRAQH291NEcQ3FGu0R9yBX58deSR0w7jJJ/6PFO6iFgY/UpYtU0S5t/xuwjZEJNthV2eV4
 gs=
X-UI-Out-Filterresults: notjunk:1;V03:K0:eSKhF8PrMVA=:Z1dESeqor7vV5bK1IYE3ge
 42AW+RgtomeayWkMY57YT+JHjReiHY51YMVDORTwTKbJABWbFSnLdJqnSTk17PEujXIDIMsdM
 q+vICb3ZTo7h9rMjq04RVvK8c6ZBVxohoFAOnIMchNMbQP19SendItVbb3q7yfaJkYKtawL0b
 yXtbs2id09y6w1gWw8TwL7+57Dsy9c2JWVgaX94jkTIw+wxJLDx4SH4++6ig4BcwoeXxVnlZx
 pEKHzkvNFIYMsebpwufypJmGkY3jdFhBJv04aWeho/TRBDKLuoY21U0eZhRBilhzpBI4QNXXe
 1Qren1Tob3rF191kW/IKvY996OiQOe7ISGFuRy+x4rjieYgeKObgzdge0gdEF5JbYlJ1hCmts
 a2nz+z9Nc5ONbFlBiySoyuXPM2QJRu++PnkrYAaZ+uUOpTgW+23e4zqqxO6qYGJKwSnq92Atm
 qsecxASir6b1lK1j5gy4Od02ZCDjenDohTZHTqhCg7i8vOMueFtd+CQzj8dzP68jJSqLrPo/i
 641ZTB4pCOCCB54py4R+F2cR8beJ6Tf8IJI6kTjq08mBwEyf1oOeX/uq0nzvQsy9Wg34K3Uh3
 hYg67X728n0ZakdmgUsC+mFfF/NoQub/voGEWo1pF6uctgA5g0DAqd50PSpfAKbbF/mGPa05q
 b2SVix7U+lhESJXw0gRR5YeqTjdEbz88HAFzgVXPlAdwE4jOXhmCgWzzFU5T3vr1AciEXqUTA
 iEbjRcGNgm9m2aonqs6YXedL4QY6ubsKadknzDrqKYwmyQH2PYoL8Dw8kF7qbXBcFwRzE1QJr
 JoXGrT3F0y4vubRbioeCvuB2b+GpNk6vUwceHs5SFra3XMXGY0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_101630_270762_494F15F2 
X-CRM114-Status: UNSURE (   8.66  )
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

Hi,

it turns out that problem is the read+or of the new value

i reverted my patch and changed

reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
writel_relaxed(reg, mmsys->regs + routes[i].addr);

to

writel_relaxed(routes[i].val, mmsys->regs + routes[i].addr);

and it works too, but maybe it breaks other platforms

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
