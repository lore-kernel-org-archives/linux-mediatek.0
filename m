Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B605C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBR0dTHnWTEQ+rm9IH7GSA4md4wYn5q6badDeJXV+Gs=; b=n4HAWraxPtBNGXU6kIqZ8nqFlD
	lVjThRz8qJCa2X0c+FOSPE8ttR/nRN/O2s1ghjJiQBCGWRwj7KcF9tEi7p1XMkxcuTSh5CZnYU2qk
	kyuQ8ibNFezChi1KzASlBYjhnBtWNXVPTdTFJLx5Paj0RKwhbS3q+SKL3y60hvuU0/L9+B+Mn+MhW
	GRuDD44BVpJJODCQum8egx+uecDF+/tWUus9dgFKiotda15q/lrthcrrtasAwEyo/eE1AxYqX8Jop
	MiDLGN9xYXN9takG/ImYvrCDw6cioDL+MCQC6hAW5dL1RRK5liqerGCztqhEfyu617s9svcg/z5WB
	Ye0i09YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07HC-00BHiV-4v; Tue, 29 Nov 2022 20:32:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07HA-00BHhb-2P
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 20:32:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D3F5DCE16C9;
	Tue, 29 Nov 2022 20:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E4FC433D7;
	Tue, 29 Nov 2022 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669753934;
	bh=JyLkOv6qe8XoJmjUwZu4AkrIj/J83ky0BnWFQEsVcek=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=itasrGJ1a2etQH/UdTZXRLMvSnUofxXW2jFFfOUsmGEJ+VrPQiffHpiQa+U7sncKi
	 P6TieZ8GBD7m8akhvFzJMnZyaZKGhcSo7ajhSAilVfvpRqtm025PoIVgWj3HiFyIj1
	 zBOxOkeX416JvfWVul/VqHHN/xcqHLaQGxlXYg1obzDCW6BMYwXuclhIp3wGoB4Iw7
	 7ACNRbqRcG+ij8OTUBYeL5iatD4VNtuUaWaeEzobRC3jKvk/zBXSumOTd+ASyZXmm3
	 FYKI+UYytzXHj4JV1cEKEy0153JxokmDeEbXhlxcC3YkoUSDIhuSFbObT2NCLaG8Z6
	 2JbaRRFt6Vx6A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y4WxN+u0nB4gg39Z@google.com>
References: <Y4WxN+u0nB4gg39Z@google.com>
Subject: Re: [GIT PULL] MediaTek Clock Changes for 6.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 29 Nov 2022 12:32:11 -0800
User-Agent: alot/0.10
Message-Id: <20221129203214.B6E4FC433D7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_123220_313626_26570B37 
X-CRM114-Status: UNSURE (   7.54  )
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

Quoting Chen-Yu Tsai (2022-11-28 23:13:59)
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git tags/mtk=
-clk-for-6.2
>=20
> for you to fetch changes up to a46315295489933209e902638cd287aeb5f982ab:
>=20
>   clk: mediatek: fix dependency of MT7986 ADC clocks (2022-11-29 14:49:29=
 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

