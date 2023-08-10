Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3938C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3k2OOXXjJ/0jlJYbFzrhAWpYad7xcBCqy2YqNYhfHdE=; b=j2ge12eN9xkvokL3gARX2D+7LF
	psqeHQ0WzpEH1aZR2ZW2kRT1FYs33cCwTWM5REpfbxLblZ2TvRQsFXPZMYH9FvTptioyREbeAg4Tk
	rYnLhahujh+7akj6v/kcMUuuCjmIORD/S4ujDTXqofHluXyjH2nMIGkILc0XF+1MzHaW1/SIghYzL
	pD5K8dgHcdXD6XyXDXslOL0wKh88Q5mN+0w7wgubjqbXplsqyB004bf/yLvPQTVbFvtfvR+v9cLUV
	bXVTGPoz5sCnpk8bALM8C8d5ZPO5AXUoip07Yfd2OBp38qKgj7vufwz+LBy86eM/qWgdOEVqH9fNy
	C1YN3Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUDlA-008o2Q-1b;
	Thu, 10 Aug 2023 22:04:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUDl7-008o14-1Z;
	Thu, 10 Aug 2023 22:03:58 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 264AE6607234;
	Thu, 10 Aug 2023 23:03:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691705033;
	bh=6T/7egYNdrUimo6+730pCHWC9ylPwq+ljDhhdzr7HFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4Bh+ORvPNXXa126m8W13yZjzuJM+v4pK5z3u1dNQVk7UyncP6Ixr9iX87JeV8EHE
	 JNo5lZvuBnDW/1SmhcWVsPTpnTRor6Pxuxr1Iew54EOJukMeaE9krX7mf+KrsGP7Yp
	 I+59Y0JH/bSyTeq9pOMgtVQxOeRYZH3g7g4jJtDzHpbTUHjk9FzmwFNivz3DNG+bSR
	 jCJVOcRnklH+dkXvrfH3uUDGw3eBHfzCBPxnMqfit4fM2BMxIgbY98EjxfXHNIuSuZ
	 YKaVqApvuUgTHUrSegmo9tkduOni5mBN5DWLSi9ayBe2CWdBsg9j9+2yPkG6y6lyC7
	 B1La0X3KYgxNw==
Date: Thu, 10 Aug 2023 18:03:47 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@google.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	James Lo <james.lo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] spmi: mtk-pmif: Serialize PMIF status check and
 command submission
Message-ID: <a4684a81-eb04-492a-bff6-a5ff78fe6b0f@notapiano>
References: <20230724154739.493724-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230724154739.493724-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_150357_671729_CBA08DD7 
X-CRM114-Status: GOOD (  19.69  )
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

On Mon, Jul 24, 2023 at 11:47:33AM -0400, Nícolas F. R. A. Prado wrote:
> Before writing the read or write command to the SPMI arbiter through the
> PMIF interface, the current status of the channel is checked to ensure
> it is idle. However, since the status only changes from idle when the
> command is written, it is possible for two concurrent calls to determine
> that the channel is idle and simultaneously send their commands. At this
> point the PMIF interface hangs, with the status register no longer being
> updated, and thus causing all subsequent operations to time out.
> 
> This was observed on the mt8195-cherry-tomato-r2 machine, particularly
> after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
> drivers between 5.10 and 5.15") was applied, since then the two MT6315
> devices present on the SPMI bus would probe assynchronously and
> sometimes (during probe or at a later point) read the bus
> simultaneously, breaking the PMIF interface and consequently slowing
> down the whole system.
> 
> To fix the issue at its root cause, introduce locking around the channel
> status check and the command write, so that both become an atomic
> operation, preventing race conditions between two (or more) SPMI bus
> read/write operations. A spinlock is used since this is a fast bus, as
> indicated by the usage of the atomic variant of readl_poll, and
> '.fast_io = true' being used in the mt6315 driver, so spinlocks are
> already used for the regmap access.
> 
> Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi,

gentle ping on this one. MT8195 Chromebooks sometimes boot to a broken state
without it.

Thanks,
Nícolas

