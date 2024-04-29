Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X1a76M/xbSN+GYuelbfnu6/Fjadq75CFB42mPCgAr4=; b=f5mT5k9NcyaiLKa8IeBs45LZai
	ejqdsOZ6Ji5ovXHUfFkZsyXdWz3uyAlNmgFNP5hlqHRarARJtt/vZ/LjVW9E5oBaenmEpWrSrRGPJ
	sQJnQ8lM7ufEH37ENmpaFb1v8EBNgPLyO+YSgKrPU/c6O7RFBgjT26S+SFcxbv77u/ktA9mZT6LEz
	vfGGndLpi24DxqLtHKs8QsP6sxJcCjqCt96mGm5y5Q9tQS4x5GLQNrCJIiZ3zFQh0kFBFvFbOfuOD
	g/s68nzSZZkO2gJW9n5SLb3uo6rt6buCwAY0ii1541ZY8tAvQkKhw/K/34F6zQuiSQIzIOCNvwdcF
	lBvCqc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1M5z-00000001uuG-3ZK8;
	Mon, 29 Apr 2024 08:10:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1M5w-00000001utl-0TVN;
	Mon, 29 Apr 2024 08:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714378238;
	bh=GSA7VNiSy9Y8LaNBcTBgfNorGDuUnpcHLRqx3xohZXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hSrk45FHZwVMl/H1e+7/9Ww+vW5aa9nMp6fCnYzFGR70P7UOOG1hgrUTRyh/hfMn+
	 Jrti+tJeho/e8J3CPtX7xoW3aZ3e2lGvuqmd8ba/9pvmIbOFXw36zzJ74oBZSR3wyU
	 mILRIonO7tCmC4lBPzC6VYKLTYInNB6iJ/tiUyKqw5/jSX7Uq3WPQxzPSrTL469kK6
	 ys/pefgAFLN4MkkzWDg5MhI12DdT3v1li8Mnkr5L3WP14uNXO8Q9AFAgPDvoNZL0pe
	 Ic9WuSv3Hv3TLIDcR4Ky2iqAiAs2P/RYzugZu+ZMM4gyZJ4r+AqoZjojQ8NACSZJ0C
	 kBfNlUy659vQQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 199CC378134F;
	Mon, 29 Apr 2024 08:10:38 +0000 (UTC)
Message-ID: <a6adaddd-733a-4cfb-ac73-1648f54babb9@collabora.com>
Date: Mon, 29 Apr 2024 10:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: Drop unnecessary quotes
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240426195404.2771046-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240426195404.2771046-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_011040_395654_2438610A 
X-CRM114-Status: UNSURE (   6.90  )
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

Il 26/04/24 21:54, Rob Herring (Arm) ha scritto:
> Drop unnecessary quotes which aren't needed in yaml. This is checked by
> yamllint, but this case was excluded due to the comma and yamllint's
> mishandling of some cases with commas. That's now fixed in yamllint
> 1.34.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



