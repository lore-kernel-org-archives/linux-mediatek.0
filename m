Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D75FC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 17:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C61260E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 17:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C61260E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp37RlH/1jC+l4TBIL8g87RJiiUgupO0Q7WPqWxUQA8=; b=YvLyA6AfiLXkqI
	4OODj5y0zAzGUZ5KIYpG93ZKMWUFKQ8nDGqnBX9n7E++p3HtG6FKaHjaw6kxh2CpfHnBFj/gri8j+
	wJaXviJha2CJZyZxpmNbsRPMdD3bGor48pvTry1Etw7941Z8oDsleNw9x1nJghberqfU/Olaplyn7
	GBn+eLFKEFE9M/RljydWMml8QouwbHcLGvo4jNSifsfXgY6tFMXkOAwaHFyGXckNsnV0LhvGfpV9u
	KR2MWcEpeR95XAhehHoSU5oTa6ZthzxtHjkp3heQLtHt8GZFJ9Jp8iooCMQrw8j0fACdxIuFKAXaL
	BUaOKwIUIStBxz2egtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7L6e-007V8e-0F; Sat, 24 Jul 2021 17:06:32 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7L6Z-007V7E-8N; Sat, 24 Jul 2021 17:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627146376;
 bh=45e0H0Lk78ezpdCHaXHQi6m/MsRnxorf6VPy1DfA5rg=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=k6Tue3gwJ6yzegHJFgwwcNIfP5QpSB/PhMLA0dvuX0o7hOPPW9+Cohd0EgET33ADU
 2t7ztArwdbcCPu/zFoesd0xTOgkw4m1eANnOwNgxBrhoiEz+WQLPfd3zi0XgCnoo5F
 qWIGinmGQXH7hgDfXbg1K1fcTGUh0TeeJqrdY5mY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.144.209]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1l71if2i17-011BVY; Sat, 24
 Jul 2021 19:06:16 +0200
Date: Sat, 24 Jul 2021 19:06:11 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
 <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
MIME-Version: 1.0
Subject: Re: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
To: linux-mediatek@lists.infradead.org,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
X-Provags-ID: V03:K1:4FhZ1GklljU1021mGj9Ps5PKAoEI+UWnutXSedKAVhllFTdL6qE
 c1CqIwzfV3VC1imKUiJZBa2LZrDoeu81zvP/hOKF/nujp85aegg/n3/tKnl8R3s3l2J1dyP
 ReYdVoamgPbMSrCq/g8UplSje/TIqUUO/5sR0DGlVCrWrPhsj87eIuAB4Mq3bFvizVtlsle
 uABYORqkd1W6W50CWxbeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gfZr4u6469E=:2UmEpvl+OhZS14QzOalCMU
 OnlmbM91s4cRo5JYTmRLFMiA75U6gBKCM8/x7i+F8saSi40jfUIs5yQkc77/xCJ9O2btbmNYP
 bt++S1a4YXn+SiE7RRku9fPX22xdFwDBD8gOJKeCUewH7XjfOKqQeYCAJBl+5s65unGPxEQLq
 B9Jfz4YDJGFWlYJZUB7uhLQg3US4e6ODoCIYS2vRBQEA8mdSGHLUfsLV8FnGG6+6MOxz4TRZx
 bbnN3XFeo2kMHTvuZkrK2q2jhEqaSWVVpqOQPYpBGEXIpjjC7VQjvcu/UX2+2wbhTRPt5gOFk
 t8KovDLE9Te+Zb7mnp51LCkUYXzQOnzXqySziomcstLH5tXRhaKxoEIbJSh5qY6p+L/NRt6xu
 r/hosbLzlTt0nXny/SpTq7+undBqHpzfIprTQbemnIUdU/Vua3joZ1RpNAk/CF5brqGcwWGjq
 yh3e0IMkhkdIVKthIvJLwJa75X6oyxpd5M0pK5Ir/jle2Dk0T1/ov63ieLdmHbI3amBt1YNmk
 ChPnVaiZC4mzlb6UdO8LHI+6j1OG/zgPjOyYVgoDKqOSYV424gti6dQAuXxBvbn8xhIjaXzGs
 qDrWD8ZGefvcf4uuBrQTtCuqgcOFWIPcYv9XroRd0O7j65wTToolV7JrJ6MWqQWQjt6QSR5Ak
 dDI7d6I1bLxF5JvghMtsQkjAzK26fFFYP61i1gqg+1L9YaVBA6VacEywmkIXFmjFXTXp+JoAf
 ft00rR92KDHkoYPU2zhxXrOT2N8N96O37TDIe2I5cqNbMOqVsZq/To6SOBuf3CLkuLcJHNncu
 91tkrVFx3Sorg78DJpwuSHqOIvYIuzQW8PDvA2qtI7UoB+3HZMEG/WDIEh1Jmn5BnhGsVIuCk
 zeRedyIEAvcR8n8czXdhwQJGV7hxfcEfkwppwLWiSSsw5s+wZ3wfuTGLS4eJR+clRqjIcvcAw
 jNU7A54lY6mSFqkqEl8ObhSavXv28rlmG8ZG4UWetrDT6AXg4pFpCIrFPAFXJA1gFnPKEpIG4
 m0mwULvM6n4V9mL6WDS2VnGkpuobZuT4ZHz5g6QrO55nQAh/3G0DPraZsGbqezPGASY8SHVnZ
 ig0vxqstt0R1XOHTJ3IBFD7LHqHqkI4ZIamXs7dgC9tYm32UHoWMSm5hA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_100627_616630_22113081 
X-CRM114-Status: UNSURE (   8.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>On 12.07.21 19:16, Frank Wunderlich wrote:
>> Hi,
>> 
>> it turns out that problem is the read+or of the new value
>> 
>> i reverted my patch and changed
>> 
>> reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
>> writel_relaxed(reg, mmsys->regs + routes[i].addr);
>> 
>> to
>> 
>> writel_relaxed(routes[i].val, mmsys->regs + routes[i].addr);
>> 
>> and it works too, but maybe it breaks other platforms

A gentle ping. Amy further comments which of both ways is the right one (restoring old output select function or write only without read+or)?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
