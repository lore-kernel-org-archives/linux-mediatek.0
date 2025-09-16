Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D398CAC598
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Sep 2025 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BnqEj9RHHv7quzPDQGpxHMHL8zNwveBfzJJlOw44Vo=; b=x4lYILG46J1h1b0YoUaC7rkLXX
	6K0m0tU55g/8PG2yC5xrfSZeDJnasG/NK/ngEzxzcC0gD8uNU5tGyFBVC9xYfCuKRQoF3qj1a+o9h
	Bh9r+3SJIp0ZZdozA2GAqsqu7by0jtR9Go9laUsJaF7TMwzJio3d/9ADshnP0WL/Db3tFRY+YT6oP
	q2/DXTfHw63+Vtn2y4fVwGNfHpZkIzVtSI8ytUY/Gp3DVjTTl9Jodc5Db2PEaJec8lH3g6gwSkm1E
	BNuP3wJSQggJyWukgmt7DhhHIjcPom4pZhOZjgjDHTaV/2TQic1HBczLFiSoLSPiCr/Y1x8L9jzoX
	+rvsuWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUH4-00000007hxn-1PY6;
	Tue, 16 Sep 2025 11:55:06 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUH1-00000007hvy-25so
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Sep 2025 11:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=9BnqEj9RHHv7quzPDQGpxHMHL8zNwveBfzJJlOw44Vo=; t=1758023703;
	x=1758455703; b=TqzbwRY5smnuKNe8AoZScY7JYI1g5ePBdWKkZ21y+VH/v1o6DogRn9NM/BqBc
	y8lU6ONEQwH9M0AsfzS2nmDD5lVcoYyrNRO+jo/d7JhxXA6LfQjXOMFnHlgeBujr67fKULC+faG8h
	BQxUbxN4+GSDn9Xp9oqIQsd+QkOO8575dPOoBJvx73HZfejOoac3XyyP7N9scoOeb79JQQ/Mus14k
	/aIdtUYGlrUMcb1t5j8mQXgUZH068zETOuXcUeyf5BBttNpnn/uBCsJcYggIByFknqRRjbQXE6oaO
	Vpk/gVM52uJwn0eOiOB40EOPYjnLn6lzeclK5wOAn6yXDv0vtg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uyUGt-001mgL-0H;
	Tue, 16 Sep 2025 13:54:55 +0200
Message-ID: <26bc2a33-2a45-468c-a3c1-6ef2ed414f44@leemhuis.info>
Date: Tue, 16 Sep 2025 13:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.16 fae58d0155 prevents boot of google-tomato
 (mt8195)
To: ninelore <9l@9lo.re>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1758023703;19e8f282;
X-HE-SMSGID: 1uyUGt-001mgL-0H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_045503_684275_BC3895C4 
X-CRM114-Status: UNSURE (   6.57  )
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

Lo!

On 16.09.25 01:22, ninelore wrote:
> 
> starting with the bisected commit
> fae58d0155a979a8c414bbc12db09dd4b2f910d0 ("[v2] drm/mediatek: Fix
> device/node reference count leaks in mtk_drm_get_all_drm_priv") on
> 6.16.y my chromebook codenamed google-tomato with the SoC MT8195
> seems to hang while initializing drm. Kernel messages over serial
> show CPU stalls some minutes later. I am attaching the full kernel
> logs below.
> 
> This issue is present in 6.16.7, however not in v6.17-rc6

A problem caused by the upstream commit of the change you mentioned
above was fixed for v6.17-rc6, see 4de37a48b6b58f ("drm/mediatek: fix
potential OF node use-after-free") or
https://lore.kernel.org/all/20250829090345.21075-2-johan@kernel.org/

I wonder if that might fix your problem. It's currently scheduled to be
included in the next 6.16.y release.

Ciao, Thorsten

