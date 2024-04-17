Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EB9C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQLC9v3h3N3mrE7RtKcwtPenhEjfgTEs8uwqLI5YDOg=; b=FCcvz98Dy3UMb23DuHKS+aroxt
	0ulGrAy4HJCoYddrk9d2YQALF9chEz0PuRxxyeXJSsfq+/PC8snV8ZRPHcwUouTfwnb7V/bYTu88O
	6X0lHqXIJHUlo1EMHihH35SfldcQWwIRFTszTMijhhUIJzHuM5s03vsZwMQef1/bj0si7ukC5CUD+
	6JVnHGptNJyTx89OpGjSRpIlw0bLUgMHP91VV09wRhl0mb1tdIULvEHe0xOpTsclqp9ttAX4Sm+BH
	wjOcWqKgrzdohL4KgXv3YmsFbCPvhO1hy09z9GwZjQoa+FmS+4v8wVCBFCX+c0by3jnZRzMiJXKbt
	UwifmbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2OL-0000000FZ8o-1NMW;
	Wed, 17 Apr 2024 10:19:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2Nx-0000000FYpe-3B3T;
	Wed, 17 Apr 2024 10:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713349164;
	bh=qWuF7uLva8cRzxWDXt5dVkky/BlMUGkwVe4Kcq4+E1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QDMuA45sSktW1mpqP2aK+bVTQOv/hV2QPn8E+sNuIGkWUgDVV6pnL3uwlzYlvkggC
	 ZHygfI7iCqU7iRlrk9TILXVCoMusTQ+RqBhaisilG/widnvgffhiSmjfp3aHRs78pr
	 NSLdZ/XHMFItbwaO3TRXotitotAa/4IvRtuA3cp3WrgwtkgxEiIb1aF3e/HoayskzV
	 ogYamVjvcE2lKubU5XUKlax9RISp3p/023DhbYrpxWdqrfwtmgV3M6Out2FWyHnBk0
	 mHfkR3+miIcq1HIgfTqlMPjlrQLtunusxmY9eG2VGJGGW7L8K1cKGCzLGmAAAD1EBh
	 PWpFHMvLKivdQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1EF673782144;
	Wed, 17 Apr 2024 10:19:23 +0000 (UTC)
Message-ID: <7500e208-4d06-4116-836c-2e5a625ba38e@collabora.com>
Date: Wed, 17 Apr 2024 12:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_031926_078528_AB44C084 
X-CRM114-Status: UNSURE (   7.17  )
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> Document the display Overlay on MT8365, which is compatible
> with that of the MT8192.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



