Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F68C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFj57A1dkEonxuTlFi7yCyIlnD822B7afZi1QZK/ay4=; b=zrg+2TvNcFRF0SJEMARmGvF2Vm
	u4kNYVVnZWNdpnomkq/a21CxzuI66Q58DGMJ6CJiZwQrVyiyLGRI89zoX+q0hctFIb6LVtEdx7zLI
	bMUT+G1JnUqQUsptbtmK45kzmnr8H/MpBIMkbwJjWfoZ3gqgbNRLs6agWiM0aDWJwGyr8tgTJlH/b
	6/quQ51Bw/r0wsL3Qa9Gm3VwYlgL0voc8wX28+Iuus0K+q1iCuorkrm4lmh+xnUcUlfp7I7Lxjym7
	mK+snHVURpcFlPLA/fUrLd/TjDobapNQjy5graLjZ0kB0Diu9vkG5tVpRuZO3WNY3SUbs4Z3ss9C8
	l6Jec7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs3L-00000000foH-2Hcg;
	Wed, 19 Jun 2024 09:56:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs2a-00000000fNv-3xsV;
	Wed, 19 Jun 2024 09:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790943;
	bh=8Fb5oLq+wj7onkMLOYYldQHhtPuVpDgA5L+9vUTFoUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NqEf3yl5Mez/C70kftx/epL79UnYIMK1Sorzh+2wYsAOzJT73u+d4gL443z4PN+hH
	 69TRr5FYO1lJ01RL021soEJQJM0CH1LI2j/xwZAPmEEtPF3xdOiCb/NCaL15guWLtv
	 K4e1cpESaw87RbulnDMyue+D75P2NqZzpKwd00o/h9POlLdS9IkB0N0ptLxTLJ4qBF
	 hksf+ALzOiMVsrGNqeLsWZ00hqkuemZV0uK+A3pgV4mpf/X/ny+cQ3H6TWT3OxLUzL
	 dggsQ3PFTAcHaoDVb/i33HPpadNWuc81jRxfpaAmk19FwItHMRcPnzS4YimGgzb9Ts
	 jibMHxsUirvCw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0EB5937821D1;
	Wed, 19 Jun 2024 09:55:42 +0000 (UTC)
Message-ID: <584857e3-a1b9-4dd2-9d3b-f4d76ccf1cbd@collabora.com>
Date: Wed, 19 Jun 2024 11:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe:
 Add audio afe document
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025545_328159_1C7ADA59 
X-CRM114-Status: UNSURE (   6.04  )
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

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add MT8365 audio front-end bindings
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


