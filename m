Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4540DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm/GJJ9Czjqqoc1hhTZQDgESR07NX7R3YwJjR9HlOKY=; b=S2ctBy9c3yIkETiGqKBjl/l76m
	u8d81vp8HCXqTSfYEhp9qyarjDm+XjSPGYOTnNxytoHSjkWktoNmFMQM3JCdOiCd+DZmSVwehtdgh
	VpcelAXF+kdO7Tax0e6HBCClfRHiEIH6rhH0KBb4sEXp+C9b5YHYVk0zlEWO+lG+G4/A2fEYDI628
	jdUrJx6t9YD860yNYRIae/nQdTlDsLBOg1a9RCPKyvC3SFyPKcjfMdBWne3CgBUreoiD7JgbjyDac
	As/QlXwwVbw5KdBQ+nQPTZf1g1Xcyaj6V2KBoS/5BJvngcDRpi3HSWHq56ScArPpTdYgXV0m+7VY7
	8gAeeJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T0z-00ANjr-Hz; Wed, 29 Jun 2022 08:25:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T0l-00ANcV-Us; Wed, 29 Jun 2022 08:25:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CF0666018F4;
	Wed, 29 Jun 2022 09:25:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656491122;
	bh=0EEMo713xuhiHvrr74nGxbYhhEiW7g5+BgdFVNHIrR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jKXRgLt656eTCfQq+Ge4efTa5Ejo/MfX5HM57WKCAjr4Pmw2RD1GATn2B89wVW7S/
	 z2Q1Xp21o/eaVOC9jU2TDQWxa1hmRoIEy7Di7DHrYQ+pFtLMJQygDA0538Qvnz/Lmh
	 Ewz1phtFGFO+WdgNmh6C/+0vclKcVqPc6YshCQqxQsmcz9KyxL5h25eqVdIR8yo9Lj
	 J+GashTxqS5bmzrz3jby0xCVAFM0eR4M7ERFj02iDlUX8qC7CmMSVjf1BujyndIx/c
	 G9Jl2bzwKDfI6+BxsO0gsxtmzSf4PzhvX/MB75GwtPPvfiNd+SctVUNXk3HFrwTdsO
	 g+V1i0t498vIQ==
Message-ID: <cc55775b-5e9e-ac92-581a-ff8defdf11f8@collabora.com>
Date: Wed, 29 Jun 2022 10:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/8] watchdog: mtk_wdt: Remove #ifdef guards for PM
 related functions
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220628193449.160585-1-paul@crapouillou.net>
 <20220628193449.160585-4-paul@crapouillou.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220628193449.160585-4-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_012524_178641_AD447992 
X-CRM114-Status: GOOD (  11.28  )
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

Il 28/06/22 21:34, Paul Cercueil ha scritto:
> Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards. Not using #ifdef guards means that the code is
> always compiled independently of any Kconfig option, and thanks to that
> bugs and regressions are easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

