Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA5C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RGTE8I/ffZ+H/WPfb9nREIwHLwu61pA3PK83pl89yI=; b=qORl3TL3s8odmKc/dW+SKUqLMt
	Z8I49LkB8YjJljQdoaxT0kwxGTEsMNtCIwwe+j83//ShpTQ5FpgIajWogYwEuFrQgbrEc8uJ2OEDC
	1bCV8Bvl8l/lyaFxThC95oLmZBb0DK9OFELNcP70QFlvB2GbIaAVkITbgy8LGiwWhdhyFxR+TGH5S
	v2hWkQ2mHld8KRfBef0oU90DrnxCT7SpSy5qqVG5GT/HgP7JeSfFHdkvGQ0IuvSLxf8WTd5ej5wdA
	v4rkZWqtC8NhZMS7atv6byRB8/ny2pkjuG2pn0jSAeK2q3faUfhFNz916CUZwjVHymKSDg3TdZZY4
	Y17QF2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZFS-008upc-KM; Mon, 27 Feb 2023 08:52:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZF7-008ukP-HJ; Mon, 27 Feb 2023 08:52:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2007B6602219;
	Mon, 27 Feb 2023 08:52:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677487937;
	bh=Sf3MrhyeShGhLOGSYT3msnb2qghBOREsCUqRzqNCHR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YEPx3bIPDldiXq3sftrtxJzUECVcOlg+HV3KYwCvSv1IXndnxB3pXbHVb+OFjBND/
	 BBuKdG43JUKkkIqSvIR1/jA0v1hdRone4AWY4d59tkJ2tUboyM4SXFmv4N7ryu+L8K
	 YJtOWBUKJZYttRJWSEpuNF7yHsAGkckda1MYAF2eDhDAxBPQ0KLwl+LuBlf7d07Qjl
	 gPBoim9l/sGWnM1CBoAGfJn653qBZKRRc15Rsv9zxOz2kZcKdwu5eZmTUDWF8dyNqQ
	 3N+yve+R/ti76hmHvUwUSbsOxhEOkui+NWQgj1liXXf81WVoyij3w6IGvoG6kue5DT
	 T1uo416NnpupA==
Message-ID: <90768a8f-3f03-f177-3b48-03efe88b587f@collabora.com>
Date: Mon, 27 Feb 2023 09:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] ASoC: mt8192: Report an error if when an invalid
 sidetone gain is written
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005221_834854_07F7180F 
X-CRM114-Status: UNSURE (   8.00  )
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

Il 24/02/23 15:03, Mark Brown ha scritto:
> Reporting an error on invalid values is optional but helpful to userspace
> so do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


