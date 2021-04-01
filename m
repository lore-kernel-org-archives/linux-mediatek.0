Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BBDC43460
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 21:13:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99FBD610F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 21:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99FBD610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0LRajLheu/Xr5wevV9joNEUl7rllkyWGlPfMOUwxdLw=; b=ebVsuIsVKD7/loK+0/jM9q8/k
	YwX2L0h+3ZHjIqMUJw951xsa/+9tF7fzi+YullW1G7kIFKqfWsAHLL3/V2yS4WqyS0HKrdS81feix
	Cqo2zIY9mjPTsJQN687NQW820o/FpNJ0qig7qHaDhQfB3U0QV24qqM4RcSkywoZHGfywFGANVJ8gk
	shwD0XXpuM1g630pgr7LBBa3UuXYladJKXUClSxGR/1HiAPP9DkTnLtFDHK77Owc3AUq4wSWvJd9n
	9sLqvnKcMADyyP6gVR6mO8w6F4e+uHCiNDEEu0SNOqXx93tC8Nq0VaYacF+gH62ZTzl3UAcAghtfJ
	ZrbwoNkGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4cK-00B1QF-Vm; Thu, 01 Apr 2021 21:12:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4W9-00B0wT-VI; Thu, 01 Apr 2021 21:06:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6827C61105;
 Thu,  1 Apr 2021 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311176;
 bh=aU5eIRlokgwXpE9A3/ENaHVe8YqqSvWFabzY1JGsmUs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q1s2JR8X4t8VeznZAJxE+1W7kx12/X0Vyr2hMpzoLGLTbfRIWzmeR6r2smklDQmH5
 kWplSRIz9z51nUgkcZ0hS4R08lgzxQ9IrNqk/X+Cj96SUnARjCLPYO6wg/NrmQ2mUl
 RebGfqM9eU1h8lZyCcMIqZzIKV01O2h9ObNRrPKZFyY/TtnU5w2ZFMDwmB+4j2xUXb
 0PR8WxwtSHWS4Kc8FtwDDoFe5/ac/PCOW4YW8xCxYa/so2L5qU8VfluMiruGmuWOSR
 1EGgRwhM2sUYiDrUCuN6IxIMdL8ujIAL2ZcEiT4pAAvg9dFB4Wn0K0Q8MR3QxXVhaC
 fu4rmCsnfSnmg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Enric Balletbo Serra <eballetbo@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] defconfig: mediatek: changes for v5.13
Date: Thu,  1 Apr 2021 23:06:05 +0200
Message-Id: <161731114634.662954.7269701673980981374.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <70f6a2ae-2a99-6861-e591-9cc71bb174af@gmail.com>
References: <70f6a2ae-2a99-6861-e591-9cc71bb174af@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220642_759100_D4ABF8A0 
X-CRM114-Status: UNSURE (   7.90  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 15:58:41 +0200, Matthias Brugger wrote:
> Please have a look at the following changes to defconfig. There is a small merge
> conflict with the IMX branch, but it should be trivial.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: 03c623535fbd7313f854f944b1e22f364e7b4c98

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
