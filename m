Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609B7C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 01:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF9wF4z7839UAmxkIc90uScP+0bSpvogpNwcqB8P+5Y=; b=Lxx7bfrACE0Eb4UxsF5jneHvN4
	TCKPbgoIZE5f53M1Yw7UfUD7TjA27Z6YxU80T3E7sk5VrwQNARj/17oG7EVT7MjoO3lRKV/kdoioy
	TCVrUTMDW10YOkBNwDjF+ZWP6dCoAsi1w4jZ1EOXUy/v9ux3OkrFFWQmburGB9nHJp6tD+NPde0du
	V1c+fcErnReum8RNtVngOsojAV0dFVChmXJtf2/Yl8T1fQZ33xnyRFKh6+3kTEArnynSVG9vACCqt
	id9n8sOpSBL9pbX7oKtZy2ITLIJR/KFZPGbYH+cKfIWIqP58nNI5zQ7tJfT19InfZLbEx/RDIhNon
	Wh7gQn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv6hH-008cMS-1K;
	Tue, 24 Oct 2023 01:59:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv6hE-008cLd-08;
	Tue, 24 Oct 2023 01:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA0806291F;
	Tue, 24 Oct 2023 01:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8C5C433C8;
	Tue, 24 Oct 2023 01:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698112742;
	bh=uF9wF4z7839UAmxkIc90uScP+0bSpvogpNwcqB8P+5Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aS+MzE+Sj5vGJG9GbOiv1rvX2mc8UQFAtd68zxmntCKK2ng4K5o/FcLJUGg4PE1rT
	 ixAlF7MFgO9G7EzQfntvFmtFQ2pcD18ICG4UsQ1Olw2W+ekTl9wsj0G/O7kkazbK0N
	 ZkhfWgpxFMXUSZfkUxuilb3Z30aaHQ2o2nLYm9BOBtsES8Es/NOXjg5SYbnC/Ho/05
	 FsiruFJmaG5bdS/lRpLx/9iPIXDIOgwRjPAJ1uRy950QmyuGzC59j4cmr0tFfCqfUM
	 Ti8LcY6re4NTYIAHN/a+ehbnyR+27jlmJNACbwgb5eXj4J1bWQpE1fWeSZAn+g7afh
	 S93EzmJHY1Zng==
Message-ID: <fa60aec390fa463f153ff0d890af075b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230724154739.493724-1-nfraprado@collabora.com>
References: <20230724154739.493724-1-nfraprado@collabora.com>
Subject: Re: [PATCH v3] spmi: mtk-pmif: Serialize PMIF status check and command submission
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@google.com>, kernel@collabora.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
To: =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>
Date: Mon, 23 Oct 2023 18:59:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_185904_126559_13EF6782 
X-CRM114-Status: GOOD (  17.11  )
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

Quoting N=C3=ADcolas F. R. A. Prado (2023-07-24 08:47:33)
> Before writing the read or write command to the SPMI arbiter through the
> PMIF interface, the current status of the channel is checked to ensure
> it is idle. However, since the status only changes from idle when the
> command is written, it is possible for two concurrent calls to determine
> that the channel is idle and simultaneously send their commands. At this
> point the PMIF interface hangs, with the status register no longer being
> updated, and thus causing all subsequent operations to time out.
>=20
> This was observed on the mt8195-cherry-tomato-r2 machine, particularly
> after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
> drivers between 5.10 and 5.15") was applied, since then the two MT6315
> devices present on the SPMI bus would probe assynchronously and
> sometimes (during probe or at a later point) read the bus
> simultaneously, breaking the PMIF interface and consequently slowing
> down the whole system.
>=20
> To fix the issue at its root cause, introduce locking around the channel
> status check and the command write, so that both become an atomic
> operation, preventing race conditions between two (or more) SPMI bus
> read/write operations. A spinlock is used since this is a fast bus, as
> indicated by the usage of the atomic variant of readl_poll, and
> '.fast_io =3D true' being used in the mt6315 driver, so spinlocks are
> already used for the regmap access.
>=20
> Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> ---

Applied to spmi-next

