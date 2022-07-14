Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A723BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYEq/mEsYre4zCsOes6eaBlXNp67nxdQ0sEedPA4wZA=; b=ZdYCuVNzmJL9epaz1dufEX0vlg
	Aemywf1hoRplkaVhKhePgCOsjEMsRjeDH1bD5Ps/wJqAETOicJVQljao+zEyYQns0+fwF2H7/seS2
	sM2T7YP+Ag2VQV4ueVB90XFYCI7E2S2+CB00P/m0tRRjnmHKjhg0++lWidk8GqFyhV/wKte7RGZqQ
	360JoqbfBvHOzU653/4pdn1JZFKTfqne6zNC1x/9iiS9DQc4AIsovBTrafvnScSeK0Nf79jMPjAHr
	QVn+SA8Y1GD7xtRHHoHOUQurJqTpQBo1uy0GOjp0aHMHBSAq342zOM4Lnm3N6Da7et12ztkvmdD3t
	X+u53g4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC13V-00Ft6y-8G; Thu, 14 Jul 2022 15:47:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0tN-00FmSV-Vh; Thu, 14 Jul 2022 15:36:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86E7B61F3E;
	Thu, 14 Jul 2022 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802A3C341C6;
	Thu, 14 Jul 2022 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657813001;
	bh=zYJJaUrh0bgAnjioQTzVPzxpmuk8Q9ixEbCMXRZqZms=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgBTkSM9MsfBd/EsNyNS6hLAEnQR6nToq3QTgoTJ69YYjzNytzkNYYYNho8f1ubLs
	 haeExN8q4RwhtVWg71qrU8jaXiNY/1zjloebiIkyLwRy5TlqTfXbG2af5u5NzLz0uP
	 28C0tx+BlLtSgCfY9lMi0xCZDIyQTrW18m1Tj6sK7FIedAeFGonm9T7shauuOf74hE
	 Plm5YLAD0650MquXaV2A19JNiSFx22MqzCXtFKyiAw47HWFWYs4Uc/J/k402yE5wM1
	 W0BqH1+4q7wFeMM/GKAu0Gnu9+3CrGP+1vsL7eFMQYPstLeZTAtr9WezdwnejCpHR+
	 sF1l/F03tZbEQ==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: soc: MediaTek related SoC driver updates for v5.20
Date: Thu, 14 Jul 2022 17:36:15 +0200
Message-Id: <165781284975.3193627.4432387522725212010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b733bd82-6d99-23ef-0541-98e98eb8d3bc@gmail.com>
References: <b733bd82-6d99-23ef-0541-98e98eb8d3bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_083642_085912_373F66A0 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 19:46:50 +0200, Matthias Brugger wrote:
> Please have a look for the updates of the SoC drivers. The most important update
> is the addition of the Smart Voltage Scaling (SVS) device support, which
> supports right now two devices but more are in the pipeline.
> 
> Regards,
> Matthias

Merged into arm/soc, thanks!

merge commit: ff6c226953b1bd57c6f4d4e7a37f586426b80e0d

       Arnd

