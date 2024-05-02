Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169F8C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjQUlzia2T3bdlLodc1ahNcb6Mxn6+stbi7TL1EH+cs=; b=Izp5W4Xzf0e0DyRI0auyszj87d
	kr0h7NA9crUAfluHSKkvNfNnLoSMDuPy//I3m7Dl7Bhujhi3Dplvs8Hfj+ck1Yt9/AkaGLCIUajcV
	Erm7aKo78cBahaQE9J8JVVixxRc4LDLEnujlXrXSLKX023FGxXJ+hY7+ajPpDXnfWOZPn4Bj0uGsd
	ldqyhofqF0/SgteSU4eNfGUkf4WApsBvrCk+RvMtGSSDWhx3S8G7Ke79D44J0hC7ZeVwQcjE53oS9
	EnlCSjTRzgHjGpkxKjNeTjpBS0tQPyIoy2kuu0DgT02xG1SB39q6iWcOGFYh1pSfNHYJ8FCci+gkN
	rcU4G14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2a0O-0000000DPad-2QFs;
	Thu, 02 May 2024 17:14:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2a0L-0000000DPZm-0la6;
	Thu, 02 May 2024 17:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5122ACE174F;
	Thu,  2 May 2024 17:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EFAC113CC;
	Thu,  2 May 2024 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714670032;
	bh=mEB1gRELdQnLF3NedpdthFU8hdoEXluhSN19HDNaTrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SjQrSC/pQ/NzYQi6sjZmmhaSFW2jaK9JBtL/Pp1TyjA+qh6dd40EzBHKsf5mp5V8k
	 lFa2C5sOhi3TBK6F1V+pu8Tav3o101aFwCmBb6/7i31py4vXFQBddsyd/q2SWlEKXJ
	 FgwlUeAT/RNFftUQ6x2isiDRf/Ix8raPqgpI6LiCydT/oxVea3kAH9XajS88S8jW1f
	 F0juaSyrgIFQNsLe/lAFdZqmNOhsDmsaS53Ej1R/JULwHuMTQugD94sQBDStU3ZJTj
	 X3rgf143EwgfhAOJUEcK89IlWC+UkwPvhBxLi8Rd/GWrPW5lKglzRH6LFnIbFd5O8V
	 sz9JEHFnTPkQg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
References: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: mt6370: Remove an unused field in
 struct mt6370_priv
Message-Id: <171467003040.1220105.4821265051022211211.b4-ty@kernel.org>
Date: Thu, 02 May 2024 18:13:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_101357_409115_3C55E0B0 
X-CRM114-Status: UNSURE (   6.77  )
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

On Sun, 28 Apr 2024 20:27:31 +0200, Christophe JAILLET wrote:
> In "struct mt6370_priv", the 'reg_cfgs' field is unused.
> 
> Moreover the "struct reg_cfg" is defined nowhere. Neither in this file, nor
> in a global .h file, so it is completely pointless.
> 
> Remove it.
> 
> [...]

Applied, thanks!

[1/1] leds: mt6370: Remove an unused field in struct mt6370_priv
      commit: f2994f5341e03b8680a88abc5f1dee950033c3a9

--
Lee Jones [李琼斯]


