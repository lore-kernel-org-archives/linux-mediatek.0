Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CD2CCA473
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpkMZGQTAQwUKLsKo+/x2BAB46L7A3kCMephfWKWjvI=; b=nyq9lY9WrYmHvs
	nex0Xgm/wcOHXwzcvPJNpMfQ7hUW1yl3Wz4OQNsJeaI4OmOTAYTaz72EDJ0xIjNmbyG4diZ/7eael
	vTvx//yaeya6ciKKZbM0Pm7XkTzTSQUdo0B5FimbHFnx+Au5xTGHrsJQeBDpGgSQ6a9tGUMKcazbF
	f+UdVnpXaSuxsvFu4YDrWU2J3sgJ/mKc0/LYuS6uNfVRdhEshs2cvuShD63LRXQM19p2CNKNMXacX
	BNOAOsqYWTL5gmm+m6SU1NG5dIwUBFTCUBJhLRf7k1F+chEDeAVg2qyxAvGTW2K2UMZomZRS5uhw0
	T9zPnOngvxJ7W0xrbMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwQQ6-00Gw9c-LY; Wed, 01 Jun 2022 15:38:02 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwQPv-00Gw5e-GK; Wed, 01 Jun 2022 15:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654097871; x=1685633871;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fhclYYO2TKhArGtsWs2l3T3omUSPUU+8y4xUw63O01Q=;
  b=GIPT8RpwuJWxrDt7wEx0YNCeuB2CNAL+JOuPw8F4gdypSnRbxfUXG7qL
   kbtsUJqf5xHCUyjuMWVgW1kekYuAxMeYrSmyRwMJhW3OIj2vWUD5Nn7NY
   9jIrsTHhdH0eskmnBwy1DIDJq3bY8H8+ut+1gleAUSX90ftn36VtTeyhT
   b2boyF34Hw9DkNUhS4s6B22Py4klNKjNkledK5/oR7+mSmcwCF0jad2XN
   dHXVVjWjzHOSBImE3i+gXw7AmrGsXEWrkgU3LcbgTKg55TKwCjfEEExJh
   3+cI17NkQrrrNZgl7OTlM3OKLbGhL+OXnQmohWIlGAKm7ZpNmh5nWqzKX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275639743"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275639743"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 08:37:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="606328164"
Received: from ksulliv1-mobl.ger.corp.intel.com ([10.251.214.28])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 08:37:44 -0700
Date: Wed, 1 Jun 2022 18:37:42 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
cc: angelogioacchino.delregno@collabora.com, gregkh@linuxfoundation.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
    linux-serial@vger.kernel.org, matthias.bgg@gmail.com
Subject: Re: [BUG] mtk serial broken on mt7622 with 5.18.0
In-Reply-To: <23accb82-8f75-4773-4fad-b6218930da62@public-files.de>
Message-ID: <8e98f469-c495-88a1-258e-33178e453a17@linux.intel.com>
References: <CAGXv+5Hx7cRwNzLWrExcFGy=MMOc3-0EbqCanv2E0G_DKXLCgg@mail.gmail.com> <23accb82-8f75-4773-4fad-b6218930da62@public-files.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_083751_658925_70A7A271 
X-CRM114-Status: GOOD (  16.08  )
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

On Wed, 1 Jun 2022, Frank Wunderlich wrote:

> Hi,
> 
> i get a serial console hang on booting my mt7622 bananapi r64 with 5.18.0
> 
> [    0.591802] Serial: 8250/16550 driver, 3 ports, IRQ sharing disabled
> [    0.599915] printk: console [ttyS0] disabled
> [    0.624563] 11002000.serial: ttyS0 at MMIO 0x11002000 (irq = 126,
> base_baud = 1562500) is a 16550A
> 
> git bisect points to this commit (cannot revert it alone)
> 
> 6f81fdded0d024c7d4084d434764f30bca1cd6b1 is the first bad commit
> commit 6f81fdded0d024c7d4084d434764f30bca1cd6b1
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Date:   Wed Apr 27 15:23:27 2022 +0200
> 
>     serial: 8250_mtk: Make sure to select the right FEATURE_SEL
> 
>     Set the FEATURE_SEL at probe time to make sure that BIT(0) is enabled:
>     this guarantees that when the port is configured as AP UART, the
>     right register layout is interpreted by the UART IP.
> 
>     Signed-off-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
>     Cc: stable <stable@vger.kernel.org>
>     Link:
> https://lore.kernel.org/r/20220427132328.228297-3-angelogioacchino.delregno@collabora.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  drivers/tty/serial/8250/8250_mtk.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> merged by 6811a466d27b "Merge tag 'tty-5.18-rc7'"
> 
> reverted these 2 commits works for me
> e1bfdbc7daca 2022-04-27 serial: 8250_mtk: Fix register address for
> XON/XOFF character
> 6f81fdded0d0 2022-04-27 serial: 8250_mtk: Make sure to select the right
> FEATURE_SEL
> 
> have see this discussion [1], but can't manage to import mbox file to
> thunderbird yet
> 
> regards Frank
> 
> [1]
> https://lore.kernel.org/linux-arm-kernel/CAGXv+5Hx7cRwNzLWrExcFGy=MMOc3-0EbqCanv2E0G_DKXLCgg@mail.gmail.com/#t

The FEATURE_SEL change is already reverted to fix the problem but it 
didn't make into 5.18:

https://lore.kernel.org/linux-arm-kernel/Yot+xTBus04O9TUu@kroah.com/T/

-- 
 i.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
