Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAECC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 10:35:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7394064DE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 10:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7394064DE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zYSFyrFSPBRORJouT9HfDg36laz6aA4fKxAhxqkiVEg=; b=SvdkFEVm9RO5R0g1NM5YlIkpl
	5oqff3knEd6tM7B2eZe8ISUi1XwY5hSYaibji+YJyJw87NcC7wYIhnVTeV4xMURLxGBJm5TlLDzM0
	BCa3ALzfy8Oz5Xsbr+hMiqJ/m0jgeUv09hP8n0BLWyMU76JQvXXqw4nBRsgm4cUnlQxLiqmIDUz4A
	BukTadHiUJIZfzD16yC3RNLvA9q8fHfpXPY9PYbuXP+8lPtoK6NblWlXorMlypsXGBXchoMvFIsP/
	J276aXX32+1pJKCn7MH0bE0I1xS07B1ER+Bno8xGJFce9QR7+naIsz+ZuRkL8TlMFk0sZfvOii0EV
	x+7Zc6VCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKf8R-00BBkR-AI; Fri, 12 Mar 2021 10:35:11 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lKf8I-00BBey-KL
 for linux-mediatek@lists.infradead.org; Fri, 12 Mar 2021 10:35:04 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lKf7u-0007WV-02; Fri, 12 Mar 2021 11:34:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 081E0C1E4A; Fri, 12 Mar 2021 11:27:31 +0100 (CET)
Date: Fri, 12 Mar 2021 11:27:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci-mt7620: fix PLL lock check
Message-ID: <20210312102730.GC7027@alpha.franken.de>
References: <20210307041724.3185139-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210307041724.3185139-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_103502_977529_C9D7D561 
X-CRM114-Status: GOOD (  14.80  )
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

On Sat, Mar 06, 2021 at 08:17:24PM -0800, Ilya Lipnitskiy wrote:
> Upstream a long-standing OpenWrt patch [0] that fixes MT7620 PCIe PLL
> lock check. The existing code checks the wrong register bit: PPLL_SW_SET
> is not defined in PPLL_CFG1 and bit 31 of PPLL_CFG1 is marked as reserved
> in the MT7620 Programming Guide. The correct bit to check for PLL lock
> is PPLL_LD (bit 23).
> 
> Also reword the error message for clarity.
> 
> Without this change it is unlikely that this driver ever worked with
> mainline kernel.
> 
> [0]: https://lists.infradead.org/pipermail/lede-commits/2017-July/004441.html
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: John Crispin <john@phrozen.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/pci/pci-mt7620.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
