Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23FBC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 03:20:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2D122583
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 03:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2D122583
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFrPhqsGrWIthrLUVf3gfY+fNrmf5RJF2uTU8WUFpEg=; b=lSQCLxbL8rf67RTXhrlcgYvSf
	TZmrg6yTzp94tZKAj+gZraiQxchXQhBLW2ED4/EBjeQ08xn/plg1+uuXYHCwE+8xr/lxje+yZAnpm
	9arcajFn5QUXAQinYPbZAjpzUZ9TFpdw0bu6rZnFZ1SL0z/DmB4sDfE3fMIRIe1gAf0CIwVvn6MhI
	Tufo1k5pWG0NRuBPppGPCpylRktF0C6r9oeTYq0q+qjpg4ueE/AqkgU0X4AIlWVcN37VALhx+qwpX
	3kQI5idh0YcS2HUDoxDXDVpM6wtluEOp1L79VNtvKWPeX0eFlwk/ubyUXZuYql+HJvLqD1QEVOb3h
	Rxihqcj1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Etu-0000UA-O3; Tue, 26 Jan 2021 03:20:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Eto-0000SC-VE; Tue, 26 Jan 2021 03:20:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id EAAE022AAC;
 Tue, 26 Jan 2021 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611631211;
 bh=0BYXnPwP/7+FDy+ACZrXbGfA1ZDJYTwE8vtnENsCVNQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=F/7gZBD48vDK9w4c64ZBsQ03x7wkIpODzeFTv/nX6uTsAN0IYL3aQRIZfgACk7x0v
 ve2Rgg9PU4PTiRZhpCJ4mLIMttr6L/4dLszZtuZWqRgQvVACFvNIeFKclCnqgj6zQS
 qy2DqvAOtyLPaxc3kF8GqNJbqmi2UqBaEiH1PyAh6TGOyOpn1qoMmc/v1o2lRUzUUP
 Zyrhi6fG8zv35EDMh6IQzRE0E0njiFUNZ9Ll6Q3GTwXBNN5kJXwZm02Ltv4rMDbWgB
 brHPZ2y+DJv5IgZc9J/jTznH9osmA6lZcQaw6P0bHTmcYOxPfFI77vIFmMYo2OcBT/
 Sbf2Lsst+JKMQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/2] dsa: add MT7530 GPIO support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161163121089.4087.613122174827769113.git-patchwork-notify@kernel.org>
Date: Tue, 26 Jan 2021 03:20:10 +0000
References: <20210125044322.6280-1-dqfext@gmail.com>
In-Reply-To: <20210125044322.6280-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_222013_077080_F94BD0A2 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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
Cc: andrew@lunn.ch, linus.walleij@linaro.org, opensource@vdorst.com,
 f.fainelli@gmail.com, linux@armlinux.org.uk, bgolaszewski@baylibre.com,
 kuba@kernel.org, vivien.didelot@gmail.com, devicetree@vger.kernel.org,
 Landen.Chao@mediatek.com, frank-w@public-files.de, sean.wang@mediatek.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, olteanv@gmail.com,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 25 Jan 2021 12:43:20 +0800 you wrote:
> MT7530's LED controller can be used as GPIO controller. Add support for
> it.
> 
> DENG Qingfang (2):
>   dt-bindings: net: dsa: add MT7530 GPIO controller binding
>   net: dsa: mt7530: MT7530 optional GPIO support
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] dt-bindings: net: dsa: add MT7530 GPIO controller binding
    https://git.kernel.org/netdev/net-next/c/974d5ba60df7
  - [net-next,v2,2/2] net: dsa: mt7530: MT7530 optional GPIO support
    https://git.kernel.org/netdev/net-next/c/429a0edeefd8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
