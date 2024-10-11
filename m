Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB1CCFD2FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJsIGOFTLJywGV3RFUvc8mo4tgzwI0xqXXRpnqJRBPI=; b=ywtZq2KZEDqlSBW+Q5FeU+UJGZ
	w09SsVr6n+OpLSxi5hcoiiL1MThn3xEsXQ6u1D+Cld7VdwDIyrvXVKLgyjU1sVIyiM1XK65vrc5S9
	Q1uv8PJyBK93divyZD6u9zgiF9WMgkW69IJ1O7zGEiWCg6gw3wtJsU0Kdxu15hzqCAksiEASgazke
	e8N3VZAIGH5uHjw5z0SmstNcgf/pJci3OBcl5iLQW7suGCBKn13w+N9PWgkAuPTn6WmU+kGR2GsRD
	slTCEPMWwmY5ny8L1W6LVb9y1U3FZpkCf7bPjhursqss/ElpJq6rEn5v5yK8E7iz+8EJ0nP0d2asy
	hH8l3YEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBg7-0000000Fn31-3LxZ;
	Fri, 11 Oct 2024 09:11:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBeK-0000000Fmts-2rcP;
	Fri, 11 Oct 2024 09:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42834A452CF;
	Fri, 11 Oct 2024 09:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5440C4CECD;
	Fri, 11 Oct 2024 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728637767;
	bh=WTLPG5TpzTM7pI72vmZiWR6qaBN/V+V9dD5cQ/3G57M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pwo4xkBNGXQcKhzDdN0UMvdmxZDavsXaiiyKAQ2yLv5R0N9RJfSasHApgiP7Q7SDN
	 IeuvtaSAtZodVlV5YP/MrDgIoJi1i90UEPdQ1MRz3Ae3YGJgp2reXmEIQMSyJ4Pmv1
	 dyMWlIOAY0ooMC1Xz/Vnv+B20QA92u7upFHcgBJ9yjp7Z7FNb3w9+Nb46quafOv1C1
	 QZABjSPewnJs3wU5aXxZnLXrKZw4odH2q8rk27bDoTZETvtXCoPRaUHTyiFJ68cjAr
	 bLhUyg94ve5dyfyEl9KrYaEFrQaAIO4yWJMnFo2ehqL/F3wLrMoqEsHoRLxqR9LJpg
	 +FBhxI2Ori9dg==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, 
 SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241006131337.48442-1-surajsonawane0215@gmail.com>
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-Id: <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 10:09:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_020928_804384_610E0B77 
X-CRM114-Status: UNSURE (   5.78  )
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

On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> to resolve the following warning:
> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> error: uninitialized symbol 'ret'.
> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> [...]

Applied, thanks!

[1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
      commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e

--
Lee Jones [李琼斯]


