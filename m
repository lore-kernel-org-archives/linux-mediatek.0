Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A3606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=znQpp0OT;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RmUQRZZt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RTqHAtDYMug8aKNf43ueqF5OhBLCVSRjCf9NzHVcOFs=; b=znQpp0OTaun7hm
	fpHvDfCSoiXKjzXLrTpuPilTw8SZL2hsJAJz3NiF8w1MhYEvaOiwq6w/ieKn+aXcCAkIWUaND1UHB
	4GbhHXBXILdh8jdMFbKMa9xpFxZbEnTYjE7U6jOOawRKzhSJazMUFThOfE2ZA7h5k2nYAPCzFCBed
	/HJwrqAU0nMieHLenXr+Sh69W6OppisLAPB2NHvAokPSzTuBc4B7pLHHy2xsaIKKYIN545Bz45HMl
	zdYzN87d3jQYD1oqq4qSNMlthxzawYB1w7nfqk/XyxLjnZcWBM1hGnv211YktVQi4kqj49cnRz0yC
	v5yUPNpcgWF7h0fnyygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKF5-000000069IS-0BpV;
	Tue, 17 Nov 2026 14:33:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEv-000000069CW-2uDh;
	Tue, 17 Nov 2026 14:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925971;
	bh=8JLKK52+o0i2JFWndjt7ZicRjZjcb4Br+OPe2B8YcKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RmUQRZZt1rxxETA+jlDkX8XADuYk6uwWqBssrHsHIbnNZCzD8bHvkD6bNDBu2npgG
	 +vZ2IA2GYHqKm9MQ0ZHAbfFfreCfoXKgEivQC/UzYjmFnLSmFIsZbCtq3qU/ZPxQl5
	 W66zm1vRWwuxvYQr2LVAzHnVdM7jKY1IEhtKLPuJ/ezL+5z1z8fMhCjTkZTQJP5agQ
	 z6p2Iw13qab37PgcVczXG7eLaVB7zueEwKZlqcMxf5Mlqyd59FtYpiOhuIQODzqxNP
	 FH4gbnzyy7qG232wfJk/oo/gDgAIZHeSXsgf4Qa6FsgpuV9IYZ8tp69hZT/m/pwG5H
	 2IsroE+VCNJCw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D20E17E07B5;
	Tue, 17 Nov 2026 15:32:51 +0100 (CET)
Message-ID: <ed484d74-98e8-4590-8466-17ca5a292025@collabora.com>
Date: Tue, 17 Nov 2026 15:32:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: mediatek: pwrap: Add support for MT8163
To: bengris32@protonmail.ch, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
 <20261117-mt8163-pwrap-support-v1-2-b00fa10035a5@protonmail.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-mt8163-pwrap-support-v1-2-b00fa10035a5@protonmail.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_063253_882088_B5EC0E6C 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 14:28, Ben Grisdale via B4 Relay wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add support for the PMIC wrapper on the MediaTek MT8163 SoC.
> 
> The register layout is identical to MT8516, so re-use its array.
> 
> Additionally, as all known MT8163 devices use the MT6323 PMIC,
> re-use the reg clock init from MT2701.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


