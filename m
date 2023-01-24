Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F098FC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEdHE2ZydSFT7Vn5vS4ZaSboIR6Cb0me/4vPc0InNd0=; b=t4sisX4TZzgRttnxD94XGvJCIo
	7rs/oobh8osPdTUIL3EBZRvytFGj1+oJZurRYLwNJZGVKqVyAiidq4h2PCaCW1c6qR00Jb8yUECME
	P5iZ+KSoYpJHldxMs40TB8F1x8cwYTJz7flIDGuGID2zelPzmA7UieCzW8j5kVKxS2p0U9PWqR/GV
	8gYYgGdxNKbPEsm7sv8PcgOmHqkqPGspDzN0q4wd30zSK7VA68gYmI70KPgStzNMGAljN2Ms1ORGR
	ik0IRFVb9s4xawlOQVUSo1LIqL+OP9E/0clwm/Xl16Id4m0nw0krC+rci1ZYDe5DpgBMoO4Kg6R8G
	HCPy1uXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKID4-003gva-DO; Tue, 24 Jan 2023 12:15:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKH9M-003LK7-0k; Tue, 24 Jan 2023 11:07:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E39CA6602E2A;
	Tue, 24 Jan 2023 11:07:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674558454;
	bh=PG9p3hfIL+K4/2yNHRx+al0RSrrruzJNcBDrW92zTuU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Ba1RiZt7X4htcm0CpC/IqpJQU8pk/2xI4PVC77aOU8wF1bO4NA0nulDgfU4kzKPYJ
	 FI1EnTahqBuzNrDetk9DaHDu6xY7ELazBz39TS92m8FiE1IiZNrGmwY1Rk4tPmB76+
	 IFRPFJd7WZq/hyhWmKUu4pykuT8qfUhuau/NfMTVcg/iu2jGn8f0hNpn0NSOtCFq3a
	 aslytSaw6P1WduAPMs2ksKB5fOQMZ4hpohv+xD53FEIZf28Jmwm679wUpyVak6qQps
	 y9IV7/U5KlLdju33t0cN8h4PC2M6xiH2EBeRCrtmAKcmHp+xHMP7qXYW+w2M3F8CHb
	 mTbmW8+IHc7Lg==
Message-ID: <2d073502-e1f0-8852-6f7e-c9f53fca6b16@collabora.com>
Date: Tue, 24 Jan 2023 12:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: drop serial clock-names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_030736_225450_AFBF40DA 
X-CRM114-Status: UNSURE (   7.85  )
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

Il 23/01/23 16:16, Krzysztof Kozlowski ha scritto:
> The serial node does not use clock-names:
> 
>    mt7622-bananapi-bpi-r64.dtb: serial@1100c000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


