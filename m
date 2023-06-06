Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D95C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNWqghAtXKeYEJDKR3KJv0xEnVAXzsCRqMzuMD8zIsc=; b=iNWa5Ds7ly85pmzYG71GfSxfBB
	r8FkREnV+kjLicVXHYVlZFAvVq8O0gBuBHCrb2AVPkL3Bw8s2TzjzwLup06sdAFGmCavgBteMoLE6
	n7g1TyM8mzmUWYa2o10J5oDVEH1Eda5M62s2sIAr7noI0HJuX+gtjvXzrEMmHje74Ep4pI2xYUIP0
	j6zEybROgb+qp0oaeebB0+00JyAOv/ExYaBTDUshJASvKfbDXBTPD4ICzEOcZhgZ0Mogn9wVKmIFm
	4Idc9j3k85CNhoJH66LwmMT78kO0ra1sM7C6136pqHm1DLZd/ufejwLJXBUmYzIo2Ry7f265nfgfP
	JCgw7wTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VZ8-001anm-33;
	Tue, 06 Jun 2023 12:13:34 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VZ5-001als-1i;
	Tue, 06 Jun 2023 12:13:32 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 5D36580AE;
	Tue,  6 Jun 2023 12:13:26 +0000 (UTC)
Date: Tue, 6 Jun 2023 15:13:25 +0300
From: Tony Lindgren <tony@atomide.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: 8250_mtk: Simplify clock sequencing and runtime
 PM
Message-ID: <20230606121325.GB14287@atomide.com>
References: <20230606091747.2031168-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606091747.2031168-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_051331_627473_37DB78D5 
X-CRM114-Status: GOOD (  11.72  )
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

* Chen-Yu Tsai <wenst@chromium.org> [230606 09:19]:
> The 8250_mtk driver's runtime PM support has some issues:
> 
> - The bus clock is enabled (through runtime PM callback) later than a
>   register write
> - runtime PM resume callback directly called in probe, but no
>   pm_runtime_set_active() call is present
> - UART PM function calls the callbacks directly, _and_ calls runtime
>   PM API
> - runtime PM callbacks try to do reference counting, adding yet another
>   count between runtime PM and clocks
> 
> This fragile setup worked in a way, but broke recently with runtime PM
> support added to the serial core. The system would hang when the UART
> console was probed and brought up.

Great, looks like a good for Linux next to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>

