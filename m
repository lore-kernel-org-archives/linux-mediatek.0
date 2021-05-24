Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CD3C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 00:07:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D825E613F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 00:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D825E613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdOe+rwal+q7Q6ZcbsKezIJkzWr+aEk6Dgn69QOv9/M=; b=QpnUnoSWqH6w00
	9wBOsTay90LJQuc09rjlWXVAUMYSRLcEx2TPhuiq46W8T1fAhdTVBAj2rPjPEVvmX2Sg/+6YZyEZv
	DiRMn0ySIyOkyLKiVG9oukcTWUqsYKPa1lGSG08Bw2Okb6VgumaTPh+waPRFFDW12V8ty+3c77x2C
	d+1VeKA5wAoLAjVuQDYZ85jXeDjJ7M5SpRAIui/Xxk71FbhKCrffpUImoId72xx1m+o7ZPNxt1HOk
	JAdp1nvZnrrciAfCwLL5eBRX2LVaOSKLqub+JwxEUOthTcDq3btPU93DCdvbLvw6jKs1lI3hD2Zvv
	n26M+FXy/P8FJJN1TaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llKbp-002TO6-VB; Tue, 25 May 2021 00:07:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkyTy-000coX-IA; Mon, 24 May 2021 00:30:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1BA8161168;
 Mon, 24 May 2021 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621816210;
 bh=q6mTJKyox5cRnqe1I41aBw/eygE+kXX2ctglQtQyLIs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DfWsUb6vK7U9MO0Nl9vg4IRwkaImfJa8q3uGwdaqv3TafpmZCI9T4QLZM8jJJ0n9a
 CPc+UQG1Td230uQ8Ruv2BCGIZ6vuRcZsghSJrlYzyzU41AWiHVw7NcKdwzsTUSBhoZ
 RPaaTqMSlR/UebdubXzt1qLefKfDlmh0f2ciRQSiC2Rr0GxKnoU3s346mh0Mfmbn+u
 AuA28KpUWIaXwIY+fMMQbwNOY7Bj9cRUD+TfOew74y5A5jrQY3/DqcUGWMwgWDvT2V
 ITSLbghJlTkKY+JkDuqRcVoiFXEiQRiAc2cdBC/Q3HxKM0zK+nRWo+vdnM7bE5JaVL
 59OwiDoYebF2w==
MIME-Version: 1.0
Subject: Re: [PATCH net v2] net: dsa: mt7530: fix VLAN traffic leaks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162181621005.30453.18294739015052454506.git-patchwork-notify@kernel.org>
Date: Mon, 24 May 2021 00:30:10 +0000
References: <20210523145154.655325-1-dqfext@gmail.com>
In-Reply-To: <20210523145154.655325-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 frank-w@public-files.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_173010_642630_F719B58B 
X-CRM114-Status: UNSURE (   8.15  )
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

This patch was applied to netdev/net.git (refs/heads/master):

On Sun, 23 May 2021 22:51:54 +0800 you wrote:
> PCR_MATRIX field was set to all 1's when VLAN filtering is enabled, but
> was not reset when it is disabled, which may cause traffic leaks:
> 
> 	ip link add br0 type bridge vlan_filtering 1
> 	ip link add br1 type bridge vlan_filtering 1
> 	ip link set swp0 master br0
> 	ip link set swp1 master br1
> 	ip link set br0 type bridge vlan_filtering 0
> 	ip link set br1 type bridge vlan_filtering 0
> 	# traffic in br0 and br1 will start leaking to each other
> 
> [...]

Here is the summary with links:
  - [net,v2] net: dsa: mt7530: fix VLAN traffic leaks
    https://git.kernel.org/netdev/net/c/474a2ddaa192

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
