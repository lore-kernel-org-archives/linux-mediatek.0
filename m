Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4297DC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 062E560ED5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 062E560ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+Q65okr1TJN7PL3kt0LekyfxdPXATzeBlALOL4B+k4=; b=Q6A2fwoWArHB+p
	SARYsLCS0UCnseQydbvbTdoIAshfQ/dP18/pNGWQzScz0XQ5+6ln+28RkhZxbdnw7iIRs+WkAKN0F
	w2vFLn/Zfsae1DkNLnVO0k1PQZ3KUf0JAD9SS5WNHZkcSAKOeAtuIYJDwk/OxiOnakJdFLQYt/jzq
	oeB6ScfiSlvI5vZ6IiQVUBkBLNRYMeq6hoSnIA/yW6f1Q5n73C6v9jaim7H6UnZ6qTsVniwowrl6L
	581ZvISWNtwKor0ZjdEB1qZig4oyjfh5d4j0NtzXVTbkhhbvBDlFqsuK2MbrdvmUYmVPcwD+brzld
	jJDP99ySb1FCq517AwUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHuo-00BJiu-CT; Thu, 12 Aug 2021 21:07:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtn-00BJUp-So; Thu, 12 Aug 2021 21:06:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02C2C60FC3;
 Thu, 12 Aug 2021 21:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802359;
 bh=P2+yjXgpe5h9ZiR7iZDKUesx/rUkYvbe4X2FBdeDs40=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eQ7V4fAcxaBDtY2X0HnXmQ+9SyAXXZS8Nnr/Hb3OuI+t7JoVV+HBaM/7QAFCtooGk
 mBo8OSrpOJC8Y2yrVev6FVqtJzWL0m3zh+/I18aELTE1rQmTp1QJfsP8PTqn+DiLc+
 z955BNS9+JQe9QEYDkDS1s65cX16D6t+dWUuzdfMkGkwvxIyTKuobou9/aCbbztme3
 H+GWdDcczJCzX6NTkLX040fAZ5g4nss2XZxy4eAgtCQZDe8Ny0yLgelNL4BJcQINJd
 8DHWSY03L8hQhoXAzHAI5rml3+umMTTbKWdlBCM1hyHbmbkcI9S9WGF5K1yTDX7DD5
 LD7E8yGndMrwQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Bilal Wasim <bilalwasim676@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: dts updates for v5.15
Date: Thu, 12 Aug 2021 23:05:39 +0200
Message-Id: <162880206138.1376011.17456680023998324459.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <26c4026a-9f26-d5a3-c30f-439120a4eaa0@gmail.com>
References: <26c4026a-9f26-d5a3-c30f-439120a4eaa0@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140559_992791_439D7253 
X-CRM114-Status: UNSURE (   7.32  )
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

On Mon, 9 Aug 2021 14:20:11 +0200, Matthias Brugger wrote:
> Please have a look for the arm64 DTS updates. This time we only have smaller
> changes for existing boards, but no new HW. But don't worry, probably for v5.16
> we will see some new SoCs.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 261a910d6cb7f6079974aa61d31124483832911a

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
