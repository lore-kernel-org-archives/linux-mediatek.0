Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1910C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 12:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8EE60FD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 12:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B8EE60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC84LhDXKtfjnVQCSh/xaYiJ7FsidIugwn5jhg/k99A=; b=g6/p5azXq3uP9s
	O7FUe8XdMekcn68fRCBYKb1fcJrtlEosphjCVQhiatRY7OMn11/AK3Xptz5UDpG1dbq63DRIwXWwF
	ktWOgzED6ZJ9logJ48dL4MQyLILR86xtkALubDG6rt+G8qTaZgQwEJvdLsYyafxRb9MazYcbZF+Dw
	DnhSHFJN2RZL79xxV53uxSUumsQoz5VWIE0k0ve4gB9DgPMUl8Z1bB8SMAUnHdXTgLPT0j4BcDn8u
	gEaZmWn4I+LDwIr9iGwkSCvS4I5K1g2Z34zh+p5ms5tsqDa2l5Nj/HeF3H2vQtyb1IrkZDp+fO9Bv
	sfvywUUL9RlGswXX/vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcRwC-00FevO-Vn; Mon, 18 Oct 2021 12:40:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcRw0-00FerY-4y; Mon, 18 Oct 2021 12:40:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id D1C4260FDA;
 Mon, 18 Oct 2021 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634560806;
 bh=b4+rdq4Rd1kwbT3ywFTRo4E4wOrsblqhJWSJ7DL8HQM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=S7zPFNsXG3HYe/US4XtuhOlKFcy2DEZTzuG9eQZzubFYast2cxKVLxEKDaWPMgxLX
 a3x3/Ptxzlw5Na+LgHssB/d+0UkKAsliVqY1fdxlBfjje8fzSvVEcr6vtVlKcQmSs8
 zHRq/0KQO9n7i/TUVKChFtzG8R448UbQLhBSGY6BBbBtW85VLrK/ZUHWCp5AW6KRzE
 ymTtK7PmfscqUhiz5t+LYqJZNRa/vhtZcNumtiDGyNGhLYha8VEkx3oXkYSkQm76/Q
 ZX9XT2STY4W4qWOYXkToFnEAJFzmFAsafn5S3vMyL0DXnWBAHlHokB2OFHnQ/hjMiy
 qJHOvo1gYHzew==
MIME-Version: 1.0
Subject: Re: [PATCH net] net: dsa: mt7530: correct ds->num_ports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163456080675.22515.9678454844933633243.git-patchwork-notify@kernel.org>
Date: Mon, 18 Oct 2021 12:40:06 +0000
References: <20211016062414.783863-1-dqfext@gmail.com>
In-Reply-To: <20211016062414.783863-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_054008_236099_3085E80D 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat, 16 Oct 2021 14:24:14 +0800 you wrote:
> Setting ds->num_ports to DSA_MAX_PORTS made DSA core allocate unnecessary
> dsa_port's and call mt7530_port_disable for non-existent ports.
> 
> Set it to MT7530_NUM_PORTS to fix that, and dsa_is_user_port check in
> port_enable/disable is no longer required.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: correct ds->num_ports
    https://git.kernel.org/netdev/net/c/342afce10d6f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
