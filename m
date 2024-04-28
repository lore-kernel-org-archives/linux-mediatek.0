Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4CC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Apr 2024 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yWj9gnBpdQvY/FOoP2JiH4HKhrBwyUXjDq6sLrBxgw=; b=AYszp1IHOLlmh/o8hPdMFzx2RA
	uMIVkwaosCV8ZJDBK0tRtGxmifTktT83n4RBzlG7Cmf/7czA50dWLMsXVPNyDMG/Mc5b9lNCYAauk
	BEIKytNUDsYwnsiGbQ56CtmcpXf5TpuWVlwEqJiEV1rIYXScFkOUDyaLfjrmdImxckW8Q0QpDgA5K
	0EKkNr/9qceTbHHFwewNgF8i4w2ypPhIZYvCY5chM8pHqh3D3jh4kCtiQZlh0K+Rb+sVvrhci0Yjy
	l2qEjiaUUb54HfRNdp5tiNJy+r9i/M6y9JovblUfGnAwzDuA1BnPVr4vEdYL2CIGYKDmHTmFoIxkJ
	3dScmrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s15op-0000000093F-2bb8;
	Sun, 28 Apr 2024 14:47:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s15ol-000000008ii-3ys3;
	Sun, 28 Apr 2024 14:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9yWj9gnBpdQvY/FOoP2JiH4HKhrBwyUXjDq6sLrBxgw=; b=abUND1j1XB+cN7hv/0oa1HimyE
	tZ1UTp+F8tyWSADJtwPjRkIk+bY7PnpWh8xlvV56UPMLYdViQtiu6hj0xnWudE2tyquZNYXr5rk+3
	oge4P/2lcRclN+GxGB437c5nyOMZuxZDU4ljl//wdd9o0XKcHXhMLOBSA6ETiInfZB01iqWuTRUmJ
	gcOuOoh06k8eoa/4USr74QdLGRmfJTE/Y46a6kna27a6tm8jur9EHuaGYZH3dmis7Y+s5N0T2nGof
	bDURnQs/800x0oTUmudJVYAe6UkCq2ubvMPYSQshfRS5cD7BpAlB9DHM5sNs06rag5qxHZbpsYcXA
	r+BkWoZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41668)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s15mY-0002Eu-30;
	Sun, 28 Apr 2024 15:45:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s15mX-0008Qb-89; Sun, 28 Apr 2024 15:45:33 +0100
Date: Sun, 28 Apr 2024 15:45:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "boy.wu" <boy.wu@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Iverlin Wang <iverlin.wang@mediatek.com>,
	Light Chen <light.chen@mediatek.com>
Subject: Re: [PATCH v2] arm: kasan: clear stale stack poison
Message-ID: <Zi5hDV6e0oMTyFfr@shell.armlinux.org.uk>
References: <20240410073044.23294-1-boy.wu@mediatek.com>
 <CACRpkdZ5iK+LnQ0GJjZpxROCDT9GKVbe9m8hDSSh2eMXp3do0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ5iK+LnQ0GJjZpxROCDT9GKVbe9m8hDSSh2eMXp3do0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_074752_009637_D1032440 
X-CRM114-Status: GOOD (  10.58  )
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

On Fri, Apr 12, 2024 at 10:37:06AM +0200, Linus Walleij wrote:
> On Wed, Apr 10, 2024 at 9:31 AM boy.wu <boy.wu@mediatek.com> wrote:
> 
> > From: Boy Wu <boy.wu@mediatek.com>
> >
> > We found below OOB crash:
> 
> Thanks for digging in!
> 
> Pleas put this patch into Russell's patch tracker so he can apply it:
> https://www.armlinux.org.uk/developer/patches/

Is this a bug fix? If so, having a Fixes: tag would be nice...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

