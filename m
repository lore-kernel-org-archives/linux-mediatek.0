Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuQo0V5ArruCojg5FTcizLXnPRKS4IWepnvRL/xZNOo=; b=vNxcAPOCSMhRagrgr5e1Ziqdpp
	90mS02HwKBN930b9/Egwex2EW75oZcN5Lh8xl+HYnueRTgFeYgLisrtqTIWRe2iBkE0/M1HhWkosv
	nICNxwHT8Neo+8rOUeBdHJUPV8Oxs+ycZdw9s5uvgfjzImye+pQbHwPjeywnTN3Zc0yi5iYFTsaTw
	aHFod4f4sYpNeE8oxhuAlhol3CGJKQVvznLNbAJahQBN9RGWJyW/iuXiaPYxTa4s/vBDf/sc3YmcI
	KChs08NDQuj1HI1xNefV7hD/Ok59GS2i73aiTxHyGUSiCwv+XB6rCWHA3M06DLJ5T5LHHVhQAK7ZH
	TvM/C7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVq0-00F9mS-BD; Thu, 02 Feb 2023 09:25:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVpp-00F9i6-C6; Thu, 02 Feb 2023 09:24:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A2206602EEE;
	Thu,  2 Feb 2023 09:24:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675329887;
	bh=GGlzxb9dTf55nUdjrZGMa6zqJ7/7TKIvIYIgKU9Rb5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZvUxkYeBF/qxbq81L6/3HDd//AT9Uxt1am7QMf3e6V6d6Zcehjp97kxk6TdFefmvs
	 B/c7D5eSdLngjBXHt8ZTlcQ4Qo51U298924xUKKrfkr6YVOvFNRW20cDK7EKzurQ7h
	 577xNPkTq9IDMrcUbs1UW3HV0mM7Z7R0RWVXPgJvxMPPaipdbKWZLA2ONEK6X+0D1/
	 0HOW5dXK7THS/ynnnJhv3QV93UCJMc0w5fVCUJmhdNJdJDCpndr23ZEb8TtM891Nr3
	 /3AeMYnjYskyIIlXcpP1yr2LqD2hMBAZVC18KVbnGsQWA21hAWw55R12nxpseI2otn
	 tVTp/5FdigjGw==
Message-ID: <6fd35f0b-60ed-36ed-45bf-62346c0e220e@collabora.com>
Date: Thu, 2 Feb 2023 10:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] nvmem: add generic driver for devices with MMIO
 access
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230201064717.18410-1-zajec5@gmail.com>
 <20230201064717.18410-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230201064717.18410-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_012449_647710_B696BF53 
X-CRM114-Status: GOOD (  11.53  )
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

Il 01/02/23 07:47, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> With nvmem layouts in place we should now work on plain content access
> NVMEM drivers (e.g. MMIO one). Actual NVMEM content handling should go
> to layout drivers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

I agree but if you want to really bring on this change, you should add
some kind of write support... and clocks... and regulators with different
voltage levels (write/fuse-blow voltage, read voltage if any)...

Describing this entire thing in device-tree should be possible, but then
some SoCs may need a specific register sequence in order to enter writing
mode, which is something that you can't just put in devicetree, so this
driver should be a framework on its own - hence not as simple as proposed.

Regards,
Angelo

