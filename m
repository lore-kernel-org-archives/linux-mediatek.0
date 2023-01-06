Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA6C54E76
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxpxpxZtuJU2+0G8qJTEoWKlxZe1f4BYC4ayj3OuMv0=; b=o8pdM8WeRPar5RoFF2xDzX5oSn
	5pinZtadiM2jFyEHPtp3NLo+lmqjihLDYbRt3WsVP343vpQUTl+9dQi3yx15Vo+r7f2uMktXDahOj
	tBVfWYylUZONPE1+oxQhWNJU5BNhvY8/5RW+Ubp0+McnN4SelAy1j0G+1aQD6j2eOUQx85fyH0knn
	SKaUuvmnBvzQxzXk65B17KvGmRMf+mh82FSx1YMp7AD1fP8MTTqrCj92Hy7rv65QMwEgQbckBVe05
	/uUAFerHh6SU2luowQl9KFi3W5nRb5EgZyzeGjywzuSBA+PKn3rPqeIhCQOoH3HUt6wDvuWO71GYu
	AITdJqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDezy-000zbT-PR; Fri, 06 Jan 2023 05:10:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDezn-000zIK-8N; Fri, 06 Jan 2023 05:10:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2FE3B81C58;
	Fri,  6 Jan 2023 05:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E1F9C433EF;
	Fri,  6 Jan 2023 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672981816;
	bh=5SLoqxM/8upTu0w4AyoWnpKjNoUu4gj9nG++Tz+f48g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WkcdSDlv3cLPTHUn8hCekQS0cPZyNmvxVks3RChvCugsSKvLcPllm3ckGRILoDMKP
	 lW8ikITsVQKpgMNgzKFzHOPEpyvse0l836SvKC4agzBUr79YdjmTEnxYdtYMnHUqHf
	 yOe9wY7wJjXrxCpc8vEpq+nkvcHvT+kRfuLblCTdEAJ+iRBQAaus6wK/pZu3TGdpvb
	 a5sOxuv9iQWNDBDOIwfZvvJsl3zdlO+7/NoajYUJ7PhWou9j5S4ztK8ERtDJWXE0/c
	 p+5odje49vnEmVi2tO4fl1s6hQEGSTF7wUxHS+c889mcy9b7D505o+1kDhtGt3/Pb1
	 csVLtzc+MIRHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4324CE5724D;
	Fri,  6 Jan 2023 05:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/2] arm64: dts: mt8195: Add Ethernet controller
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167298181626.11078.11919389168312167543.git-patchwork-notify@kernel.org>
Date: Fri, 06 Jan 2023 05:10:16 +0000
References: <20230105010712.10116-1-biao.huang@mediatek.com>
In-Reply-To: <20230105010712.10116-1-biao.huang@mediatek.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: andrew@lunn.ch, angelogioacchino.delregno@collabora.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 richardcochran@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_211023_481035_2C3C068A 
X-CRM114-Status: UNSURE (   9.84  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 5 Jan 2023 09:07:10 +0800 you wrote:
> Changes in v8:
> 1. add reviewed-by as Andrew's comments.
> 
> Changes in v7:
> 1. move mdio node to .dtsi, and remove the compatible
> property in ethernet-phy node as Andrew's comments.
> 2. add netdev@ to cc list as Jakub's reminder.
> 
> [...]

Here is the summary with links:
  - [v8,1/2] stmmac: dwmac-mediatek: remove the dwmac_fix_mac_speed
    https://git.kernel.org/netdev/net/c/c26de7507d1f
  - [v8,2/2] arm64: dts: mt8195: Add Ethernet controller
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



