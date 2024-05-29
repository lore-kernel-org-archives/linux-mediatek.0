Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E08C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYDKNq5oHDJPqT2fwk/PyjSv5ixUCaVfO5lkJLA54XY=; b=4KqlFwvJgaREN60g5UDZl88cZT
	7DZZH+sX7iNw9fWwuZ0clGO5Z7HzU9nfBK74tDJOuhO/8kvGHcKXd6RPtpIR84pdBITvVRC3POJMu
	zOSVHr7nFSCqg+JamSz5fcR1OeMQX2wpJb/iq69+wVFpdG/aPtC4rW0VGECSfKsRarQLJ9/DUOHDk
	2ihEgF1wrqH0VaLQRdVB3kmIkUY00Lwcr+cATbdvrxwDcp9NtyVpSxtN49gwWaBB0w1WmCdo7Hpdj
	g5Oo2RacqQHEiQSULjTfSOmJnMyZBmSAcFn3pcdsdrSbUpDEZmPL4HG8IIMfjdP3TJQIgKRvrTqvZ
	i3Zo416w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEUD-00000003Kl4-2hrl;
	Wed, 29 May 2024 08:16:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCETw-00000003KZg-2JgI;
	Wed, 29 May 2024 08:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716970583;
	bh=oSk3SYtQaPiocu1KldOp/z0QMNO1CKxus862pBLLiu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTnhcggR/aTkIWPr4EjsRN1TLFaejQWIO4UpTDCGoGHQs1uy/kQnRug7VHQjf3JVs
	 A7ZmhZKByBOC/Q0P5zdkuzPoemQCWMFwXLYQttGFP9OwAG5oWGS1UFhDgJaPd64Uv5
	 UrAf8P0KUQ/WXH4lM6VSGxsOJN/DId7v4VO8CRn2mHXhIBzsIrLsNXm/C8VNbx2ucC
	 yi68VzFiq9C1KwM6WcEIbJrE56M/G22g10jD7YkEvxR3iwPrqO6E2gnhfJpRmoHGp0
	 Bc1XH4QvpOm/Grqwa5Dq9Rt3nmRpm618+XYsL8j0kD9UQXBn0iUo34limkL4fAXu7A
	 w3NkUNs9d+mQA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 514F43782162;
	Wed, 29 May 2024 08:16:22 +0000 (UTC)
Message-ID: <dc34429f-a4bc-45dd-87af-a7c31533a845@collabora.com>
Date: Wed, 29 May 2024 10:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definition for MT8186
To: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-1-0c71478a9c37@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-1-0c71478a9c37@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_011624_778629_6F4BA142 
X-CRM114-Status: GOOD (  10.43  )
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

Il 29/05/24 07:57, Julien Panis ha scritto:
> Fix a thermal zone name for consistency with the other SoCs:
> MFG contains GPU, the latter is more specific and must be used here.
> 
> The naming must be fixed "atomically" so compilation does not break.
> As a result, the change is made in the dt-bindings and in the LVTS
> driver within a single commit, despite the checkpatch warning.
> 
> The definition can be modified safely here because it is used only
> in the LVTS driver, which is modified accordingly.
> 
> Fixes: a2ca202350f9 ("dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8186")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



