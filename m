Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362ACC9830E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/aL5RPuPnylSm1p0HkGL1qSUDBTfmZ3Z2MEbsMXDSU=; b=b8pnW0r86ou5OGEpOKHRewy2aD
	RrfqreA6cE3RjUSoyGg0VkuOPBC07eharKtLL9JIPBHpDhyFWkmDk+4t87D/hCHRh2uzKVcj7ayBQ
	f+rh+Ll72CtJ0bSOeXT/GtAeKg9jgXRKqK/Iit8Sw76dPI3QSINT2Q1uc2goo6pCfjVNB0gHdNvH2
	pf24PHgyrtjgv3MO8t07dX0xP9d+THKrb5NmSPnzPiSvEyBKPOOwBAKgaT1c31G71FajT6daUckrL
	MMbAeRHH3PnDAulA1rAOrVdFlzczl9BSXsJfqMQWe4uBV4MOdjaurQrOQtlwMXci3zD57pCTLexMX
	ds+T9hIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ncx-0000000BqJO-3517;
	Thu, 24 Sep 2026 17:52:59 +0000
Received: from mail-106102.protonmail.ch ([79.135.106.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ncu-0000000BqI7-2m2W
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 17:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1790272371; x=1790531571;
	bh=I/aL5RPuPnylSm1p0HkGL1qSUDBTfmZ3Z2MEbsMXDSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WJPHGQAEe3cTEweMZsJIt4mSmDHQ/ed+tPIAI5nvJi6Q88Kpic9vaRumxyb4C80Gp
	 fIb4Y67EzqcaJXsGG3Jb1r7uPlIbaxXS2MkHEwGZhNlIUt1nYwWRdy29BUaftfnzrr
	 Vo+UGts86jmpijzmIzKDjY8wEICzdRJCYdcUBKDx9B4p8dhAAK8wVXEC3XKppH4XIv
	 agTQumlfcY+hk0PXGIyM6zZt8yxK71ID6xWMQ6D7kc+f/CIyR858Xo2kS+LxZefbch
	 qWBI33/59Wm7vWEK60eFyDZtKtfUSP3PeWXvKGKq7ukxwiAdt94UBV9ipjjBbXbDwr
	 p1x4QBJnVZOuA==
Date: Thu, 24 Sep 2026 17:52:47 +0000
To: Pauli Virtanen <pav@iki.fi>
From: dt <derektern@proton.me>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "marcel@holtmann.org" <marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] Bluetooth: btmtk: don't generate bogus ISO packets from zero padding
Message-ID: <uI6rH2cpN9VV5eZ8IdurmEg9qH4Vnth3L3uYaFHvcpXJ9ja2vBneScb0R_5lEDGlRO5T6Bb-hgXA2YIt_ZC3d_JdHo2HgGmxrxh_1GkkaCk=@proton.me>
In-Reply-To: <e4b4da9d018ab26c5376fef47476b8852222eb07.camel@iki.fi>
References: <fp1LLpMjte31CZfdRymzNx8DeLqozYHgFf2TAKxtIiHEkPcykA5jgtuDuZYcJTb5vPGpPkgB8GoVoX5_821oWe9NvenZdL4kwrxyCuanlw8=@proton.me> <e4b4da9d018ab26c5376fef47476b8852222eb07.camel@iki.fi>
Feedback-ID: 213585229:user:proton
X-Pm-Message-ID: df44e1e695f2945b59bb1b0669badff95c7f2914
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_105257_308135_BE64765B 
X-CRM114-Status: UNSURE (   7.88  )
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

Hi Pauli,

On 16 September you wrote:
> There was no comment / fix from Mediatek, so it probably should be
> resent since it seems like driver bug.

Could you refresh/resend this patch, or point me to a replacement if I
have missed one? I checked Linux mainline, stable 7.2.7 and
bluetooth-next today; btmtk_recv_isopkt() still lacks the padding filter.

I am still carrying the local adaptation on my MT7925 and would like to
retire it once an upstream fix is available. As reported on 17 September,
firmware build 20260813113236 exhibited the phantom handle-zero ISO
packets, and the adaptation removed them. I am still using that firmware.

For clarity, my adaptation uses the existing device ID and omits the
once-per-device warning; I have not hardware-tested the exact upstream
v2. I can test your refreshed revision before supplying a Tested-by for
that exact patch.

Thanks,
Derek


