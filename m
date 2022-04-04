Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D24EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9b1Ba7naA9lRaacnaBha9LwEJ7/eb+XJmPaTmKyefM=; b=XvpavaiiMgbu7n
	EnjLaf6miVm7CdgFmqZrVn6irUBoebkS6xGGEG3IE8gEsOPzM7BmCLWxR1ecmEgq3qXcCXbFXZLde
	kwHPptBuA25tj7OwCI54k1XxTmblXVG66T6UjAfVQHW/r+mN+QheRl/OWvYVU6kw11gDZLVANRI7l
	Fp86N7H7UB2lSEMkiAbvgWQqmCvn07gu7RTnh0guxrU+7UnJyKAhyXQONUCTGD7p+FDs2O0f8BsRR
	RIU4MEs4rPzmVltMgwozaxGoD+yKTcYERdAW0garkXW+IqR2ktQyTzLkXjB36/DzgRGj5nTINMPTk
	gLBcVtVS1igCONTnRdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbQ7t-00FtoQ-H3; Mon, 04 Apr 2022 17:04:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbQ5a-00Fskz-61; Mon, 04 Apr 2022 17:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1D4260DC5;
 Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51705C34110;
 Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649091720;
 bh=04frVOBorwVRLC9iR0TJrmOXUmgPLE7sifjv285UBqY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=u4wKiB3cMuSr8X85DCWSAFYjooVhda9cApTtmkp7tZRxtQTB+pgUau+XD8HAdu9co
 oxThbzXsle2iXHmd+iemZT0F0XHev26IPwYM4iI1hbroEUz17L+D8nm6vD0/CoCNIY
 J/21dCexLvUqK0WwftAOMKgJpGSwNk7nglnDRs06SRyKGXGlM3OTFjNFbnDAlA2Q/g
 WxrStf87q5tvCOcufEqKt9tTU4ATyPF2w4MTGfNeZBT5Ju1Na5o1C+nSOI4ojUtpe9
 Z1fpj/klB5G7TabOuiLNZF9qS0Hw4zFloxHqr5WmL1IjlaRcg2esfmHuVUGF94Rzuq
 tCqb83VI/qWcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2AAA7E85B8C; Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] mfd/pwm: dt-bindings: google,
 cros-ec: include generic pwm schema
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <164909172016.14329.4245687704208123308.git-patchwork-notify@kernel.org>
Date: Mon, 04 Apr 2022 17:02:00 +0000
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, bleung@chromium.org,
 groeck@chromium.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, heiko@sntech.de, dianders@chromium.org,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_100202_314669_F2E92530 
X-CRM114-Status: GOOD (  11.46  )
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

This series was applied to chrome-platform/linux.git (for-kernelci)
by Heiko Stuebner <heiko@sntech.de>:

On Mon, 14 Feb 2022 09:19:12 +0100 you wrote:
> Hi,
> 
> DTS patches are independent. Not tested, but I really hope no downstream kernel
> depends on pwm node naming... If it does, please change it to compatible. :)
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [1/4] dt-bindings: pwm: google,cros-ec: include generic pwm schema
    https://git.kernel.org/chrome-platform/c/6b94ee669e8a
  - [2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
    (no matching commit)
  - [3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
    https://git.kernel.org/chrome-platform/c/1e49defb8636
  - [4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
    https://git.kernel.org/chrome-platform/c/a0024f55eb5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
