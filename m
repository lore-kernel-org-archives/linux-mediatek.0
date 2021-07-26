Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D07C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A663360F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A663360F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPNGmW147LLlXCAXdY4thjUGFRJugzkEKhR4gH5EJpA=; b=jWV7/SDwAUKcox
	4crvg0Dg24qg/ItvIvgQE5/ZgFxMuzmIdF67tqV59In5y+iIsKzfHIGifyBYdgiGs/pxNFsi0nXzc
	Wt9z4fQfMm2VvDO/67koEICkrEKfHR+4VqC+1gLAcumwZ+v3ASWEypyiK2eOM0EiQaWb6E39QDjAx
	2d53rhgzjnL6aeLCUUYB4hHgvqpFGk9I7F7Qd3cmLeQOzHitkqeDcsqLR0JSbUypFA1JUdAfrBUV3
	Khx5CE0E3kR+HHRuYeKJx6Q9vM6P2WfmKeasKwjQDTFsb/RF1FT3HuomfWNzZZI4C5Jn7u9EA5SID
	EHf5qsIKnLO1c3qDJSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xvA-00Akzp-2I; Mon, 26 Jul 2021 10:33:16 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xv6-00AkyN-Qd; Mon, 26 Jul 2021 10:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627295581;
 bh=+VUL+QLDy3glb1Z4duCwJNXnE36cEk4VDEsuDj6mCnQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D4haEr6H/SaIBPEo3SJ8CWQB4DeoSwc2UtLQllOAVQsGyKYm01eMGbsPhTzMQ7TXa
 +Vpku6C6oeY4t8LkQSq2ylwij6Qn4zQ/odvh05cxoBq7D/y/1zO4Dl/ZIuMR7XCjhS
 y6jNDaZkirM2el+zVw9/P5wa+Ufys5riG9RzI5Qg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.151.117] ([217.61.151.117]) by web-mail.gmx.net
 (3c-app-gmx-bs55.server.lan [172.19.170.139]) (via HTTP); Mon, 26 Jul 2021
 12:33:01 +0200
MIME-Version: 1.0
Message-ID: <trinity-3fb57d4b-aa73-410c-9d9b-4ba3c8b0f674-1627295581632@3c-app-gmx-bs55>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML
 <kernel@collabora.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Aw: Re:  Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
Date: Mon, 26 Jul 2021 12:33:01 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
 <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
 <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
 <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:iPn7TUoOCvn5EtAyQEAe4fH9u6GWCjG99MHdzRiuhNVgs2b7AjqMoxzf+RKZ1aSoarRpO
 6di4hcveSpohkWPxcKqUEwsKney50YrmUADSL/bV4qeqUyR6rCMiTymQgeiIvA4v1XoQFKtCUX+H
 5cEdAvXLupE2EomWYtTOY26eGRYJSwzGODgEmjhcHavXkvGpordBctuERaRmSvEB/i3I9U5azvfC
 KpeAb5OpCwYueskrexzltzsrroC5uPn7X2Pa5hfOEtf71Bj0dWqygfBU+8gwdDTYdlLk5ip0ouTh
 sY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:3D1zLxNwjgY=:WUxgCA+GhIthK0mPzonNLV
 Tz6F3VlfZSjLkuGSpaC/9Tysu0WFvu7ofQJNq6I9eNAYT7bd4RaZV421YMrQXpzNl8RIWcKrf
 6V7g1DdfLtPp7Stjlkxopl7lHzJcYaWNJOYPYT7YapwJLHvHr2zrGGTiJ409YhjDNRUAq+O0f
 jkRMMCgJ9l8fOK4m94ShbZq3CWqJqPU5mNnGOu1WY/nWgcjj7sHIQuKjKrjepL31TU42LVwHe
 msQLZ96/zzoKY6CPOw8qVx8P93KTPG+WP3rtdtrCTzpEpOv09PB2VhsSv2FklwlOYjIM6Jczl
 uerSsDND6PouY7IineKf7Az3ZmPpqNzh5cD1nADyfieIrJoyV9dxLvg++V3n4escBGrplo3Bl
 b8LXnVZf/jDC6c3n325Gar8tus2x5vJCQFYdftGLRQYnNVB5XFbXatUGZiqZcRgMCvszB4+RF
 uVjwpEejJVycv/zgmXw/yEMA3EAlSZr6SwLfWkDMeDgHvajlpwYwCinHpGcZAumBxeu4N8G1i
 NZCUAhAsKxEG+1EOkxZRjX/+qgsSSfwebsC7UGOicSrVrmK6D7y7P+uHwUqsSkOYWy/B8/yB5
 4uZiPI0inEtH7ex8to3REb9MGi544f2F1f38Zw9cGZYSDtfleOs2YB4JJcw1lUOYkMyqoIIdV
 FepBaKWROreMfTvQgzTqEV7mipD8v6wrjyzXvjdQSi4lcxK8BIxkheAlp8a0A/AXqCkXpnhHj
 +dxUDQUiyIX3Ox7ocy6HoaTnnzQ3czx5fBK/MnlJM+nXHeID668eQplEapkxdyy+cVlkTPbvq
 XAah5Xx+cjNooG+Tpr9DWj0W3+X8MUM+6d6/mqRpoJSJ9qD1Eo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_033313_179328_DC9E8234 
X-CRM114-Status: GOOD (  10.99  )
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

Hi

> Gesendet: Montag, 26. Juli 2021 um 02:27 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
> As I've discussed in [1], SOUT has many bits and need to be cleared
> before set new value. Of course, write only could do the clear, but
> for MOUT, it clear the bits that should not be cleared. If you want to
> use the table, you need to implement the 'mask'.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/trinity-937ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43/

I've added the mask like you did here [1] on my repo [2]

and it works too...should i use you as author as i only take your code when posting?

regards Frank

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2345186/5/drivers/soc/mediatek/mtk-mmsys.c#294
[2] https://github.com/frank-w/BPI-R2-4.14/commits/5.14-mmsys

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
