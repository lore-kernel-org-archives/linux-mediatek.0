Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE3AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 15:46:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F63224D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 15:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F63224D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=64mXKW6Ezqg38Ky/trWVjT/QTiSY5p9ydrcBIkeDKLk=; b=GfOgwh1hmfXrJv9qLxo8KhPwz
	XQJQApL7batvpVbCveC1BjEQp3fN5S9wtDb3L81JeIijd1HOkCeefExxyqZihyg6ZA8B60jfmXZ0l
	jgIQojQI0o5K1Mz/qP5yY7L9ZxlKciu6XymFqYJfJyhqG6Op34InNc5jTtjNv5PzAiPhAQD2X3ryt
	V34QKZ4zLxcgJEzaEshmWf/E6+efpedXvpDmeH3ETxRRFFkMWOjztltcBFLQTmGas5StJ6zcdPwCS
	f3J9YRUGvLxmgN9YBH9BnBwa4ovBfW3cVKS7oPNaxvjFHAsLUKsd1QTneJu63+qUtTIdt6aZ0GPxU
	2aFL/DVoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyzOp-00073d-Px; Mon, 11 Jan 2021 15:46:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyzOi-00070h-2R; Mon, 11 Jan 2021 15:46:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69B0A20897;
 Mon, 11 Jan 2021 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610379983;
 bh=Vb4EWJGhtPIfUX19jNXMSL+D+Wx8b6XEpNClUK+58ko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=omf8WyqzAdFiNBENs6FDTp9dRwmDGFd7toldLz8gPhXncb+6VzD6JuWiCmSB63EbX
 2hGoxcFQ+P+dgxd43gmBFKm7BzyzYP3WPdiydrAughKwpyHeAwEqRxrLgdbuYv9CF4
 JAQMCjUr2lv6eCzoXhq8KVh3VwnIdY9FT2H7Ym1c1PwPPQPN3Z5Z9fX6B5NS7atdu8
 X/8JB8BJTVrsa0o7A7X5RJNbLMvEeLfaomqDHW4x8j/GUuERevKI6LqK4jof5fz5jx
 GpP8UWC6McyCY+kkqzIGMUuL2umI5S7EpSjyyfpDbmQVKSQkWHZ1y7WVfseDhiQJMr
 aif/UEIZZHTog==
Date: Mon, 11 Jan 2021 16:46:16 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next 0/2] dsa: add MT7530 GPIO support
Message-ID: <20210111164616.1947d779@kernel.org>
In-Reply-To: <20210111054428.3273-1-dqfext@gmail.com>
References: <20210111054428.3273-1-dqfext@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_104624_274113_D748AA4B 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Qingfang,

what modes does the LED support? Does it support blinking on rx/tx?
What about link status?
I'd like to know because I am still working on patches which add
ethernet PHY/switch LEDs, with transparent offloading of netdev trigger.

Marek

On Mon, 11 Jan 2021 13:44:26 +0800
DENG Qingfang <dqfext@gmail.com> wrote:

> MT7530's LED controller can be used as GPIO controller. Add support for
> it.
> 
> DENG Qingfang (2):
>   dt-bindings: net: dsa: add MT7530 GPIO controller binding
>   drivers: net: dsa: mt7530: MT7530 optional GPIO support
> 
>  .../devicetree/bindings/net/dsa/mt7530.txt    |  6 ++
>  drivers/net/dsa/mt7530.c                      | 96 +++++++++++++++++++
>  drivers/net/dsa/mt7530.h                      | 20 ++++
>  3 files changed, 122 insertions(+)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
