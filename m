Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83E9C83F1B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoIIMgyFI92D0kpYrFiwsaNqHhGFlkxfLJuM/Eltb0A=; b=3NvIAr4KkCUioVxwc6U8CgI/Jw
	dvlka4DrPbY0iJsbDCIO/+QYVkifUIi7z4FIz85Xh0cTo/Bk9bEeT4lfBmxYY1YtoFg1YR2aQ3j1+
	acHlX9ZM9m30xGOipLeElO1zHz4x+t0LeIsWqoz4tgzzvbbs7MU7dOrZ8dTl3iAcpeEaOw0GO3P2d
	acPmQ4bv3tEX2upqjSK6kjBbeN+01h2B4/FcfgluT5cSACuRBX0QJdYv4arleDXRag80irN9AOnD4
	hDiTFj4QE+vQKnyJdGWWgBB6efjsk1dQI341uyKMDig02xTjR/jEacb4a9JTOkMcthAOrhrq9Sp/6
	D8B1ZrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKpa-00000002bMC-355H;
	Mon, 14 Jul 2025 15:11:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKIQ-00000002UvX-03ju;
	Mon, 14 Jul 2025 14:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752503804;
	bh=CPBGw37uUOIUouSs+t086VvCKYv3aNz8eMWmHpwWGCE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1ZcdiF3ICiO4lfEo4vQzyUuiXCt1ZovW/3HrQ7qK35sWxvUtQ16xdekPWyv8zKAZ
	 7dM95beiMCFrkGbvVgBVXjMzQ2HjA8SrJdtYaGmdTJcAktXf6VBvGhn8vETWtXZ2Vs
	 6pZnqswVY7gteMDfXbpAcu302Qfq3WU2nbRh40CNxHmPO5sQsT0ITffJiTXOyRi33h
	 oixshOEdPM/fPinBefJY6YLKeiR4RARYN5vRSoAKOCfAyKtO+aBdpO0gLdrdfSCcCE
	 dqj+qhvzEMke/fFRrTBVkMkH4iNWfVBji+BY0rBRGGXUi/HpmDPXwk1B6T15ybKyrv
	 p7XxnXYdqGnRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6A8317E1008;
	Mon, 14 Jul 2025 16:36:43 +0200 (CEST)
Message-ID: <fb53a3e9-8673-4001-9a58-927bf01d6edd@collabora.com>
Date: Mon, 14 Jul 2025 16:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] cpufreq: mediatek-hw: Refactor match data into
 struct
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
 <20250714-mt8196-cpufreq-v2-2-cc85e78855c7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250714-mt8196-cpufreq-v2-2-cc85e78855c7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_073646_206001_374A6658 
X-CRM114-Status: GOOD (  12.43  )
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

Il 14/07/25 16:08, Nicolas Frattaroli ha scritto:
> While the driver could get away with having the per-compatible match
> data just be an array of the reg offsets, the only thing it used it for
> right now, this doesn't really allow it to be extended in any meaningful
> way if some other per-variant information needs to be communicated.
> 
> Refactor the code to make the DT match data a struct, which currently
> only contains a single member: the reg offsets. This will allow this
> struct to be extended with other members for other hardware variants.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

You could explicitly state, in the commit description, something like:
"In preparation to add support for new Hybrid "FDVFS" CPUFreq for MT8196,
refactor the code to make the DT match data...."

Regardless of that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


