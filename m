Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7866BC5B572
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=111cZwE+fIsihcrOn87KAVC+gmNsgNFaiu9bx9gzA6c=; b=Lu23i9aSU/GCeqSYqZ/6is/56G
	8TzRy+PzbUAw7uvNgxUL+9v9V81f82Jg4Ov3CV9s5Mv5QbdmrbLCiVSrqIMuTLJiMSCnK2yFlsexy
	SudfJVwEsH0ajK/IdrnUF+pui61jOWOcsusFVnXS+wVNKUIcW2+Kr6GArLhFzYZj+FntGAwuRFjqY
	Dsi6g2WmxhZ7FcwonoOld6ROjQdW7hF+SwzNgjFD9F/lyHdvv5FwB6gvlQo8ED/2ybiNh8IhfL4uJ
	7on4YSGQuR/qf6f1aRapXC36mzBI+yEtkB0XGpthgWqStsTcpCMbepO45AoUQnnk4KhFo8U05E9ZB
	XhfyZgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4F2-00000006nSj-3O7E;
	Mon, 17 Aug 2026 20:47:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4F1-00000006nSF-21SP;
	Mon, 17 Aug 2026 20:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A91C7601DE;
	Mon, 17 Aug 2026 20:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910901F000E9;
	Mon, 17 Aug 2026 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786999649;
	bh=111cZwE+fIsihcrOn87KAVC+gmNsgNFaiu9bx9gzA6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FL0z2pUnciX4/Rv9iwWhFcb2vERfUR1zoJ8VQv1oWRemL7hekh9TWUinYS67I7TqN
	 RlQRH3t/1/0njxFN0sL0e0S56NAmnj6JwcipGbfE5sv9zWwxQyWA0SH/mEbb4fuqmh
	 7Xz1AHU6cYORwQULXlq+2x8bMt0eo3YqTDPn7I19Ajg+DgwB19B0L8E3TbP3m2szIH
	 1l7+129bQJNtPWJGJOUinh9MHY2jp0u6cX5f/wp2ubcd0jT63meYaz6iz/efakqDRU
	 +/Dxc38W25cd6Jy2JNSTQGv3kZbaXagWuC2ThDnwjwBBo7eDIrgdhs6+AFkrcsfBuj
	 7j7a6isGz0/0Q==
Date: Mon, 17 Aug 2026 13:47:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
Message-ID: <20260817134727.1f76d6dd@kernel.org>
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
> 
> At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.

Coccicheck says:

  drivers/net/phy/phylink.c:1039:31-34:
    ERROR: invalid reference to the index variable of the iterator on line 1028

  drivers/net/phy/phylink.c:1364:26-29:
    ERROR: invalid reference to the index variable of the iterator on line 1346

  drivers/net/phy/phylink.c:582:7-10:
    ERROR: invalid reference to the index variable of the iterator on line 569

I vaguely recall that you're supposed to make a copy of the pointer,
not just add a "found" boolean. Dunno if it ever happened but Linus
was trying to make the list iterators override the pointer on exit.

