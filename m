Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03954C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB1QaSjwDtqnHuXnTmnG/qD2xpV9lF3Dgj/d/Raeo6w=; b=rkYM8V9Dj0JIjs
	oIHqrhsrUE3u4TZbklV6JF6lSYIDB0bJcT6pXIwGtJmbvAWosEkvEpAJZSVldaSspUpAzs5bggC2q
	qEuqBjAiGzxZSz37DJ5RoBplJPOSmNsxkGAJA9Ua/yjPubFlFT26JrpW4ygNw0j//wqdJHujk/zZ4
	kd3+4KS1NtKTCso/Q/3Gu6pPHwepdGGvCqh4Wd5oTMmdsmn9U7a4cSHk+bS6y7IlmXGzspbsG7FjO
	91SCyE6mhKGgjUG9t8rAqYkNkMEXupbTzrOOQIGyG0ZJGCGdOnWqyqCeWGwWWR/0BGeYak8IX8CAc
	6q0zBgxztl/JRTeo0u8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrmn-005pDd-8w; Tue, 03 May 2022 12:37:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrmb-005p6k-Kv; Tue, 03 May 2022 12:37:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 561251F4311A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651581456;
 bh=VcKWK2LsA65WsCzIX6kTsy9x8yTDsAjPHh9jmPBINM4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZbNk2biGWUaWmmxI1Rz8qdy0hMnDS5YzDivXqWBqPhAX0yubGSlq+4/TcTbWS0o+z
 +r8SIDRdbJGZ9DenfjxpYm7PhSD5PDhmgUvKeD/ZlpUKUwzy28V5Z+lvn74bNocuae
 SwjG9OtCKTEpakm7uCM/R5H+un+vgLE8kFAzSLImm898nhRAX9mvwdy6H+xfcziC0d
 HmXYAR+nnJ5K5B29Bt+gXuc6Vsm/XodHeHKbBpBGtLmlP8K40w7ctaqn6re513p9tW
 yeS1mR+FZwXkoH9FcAw3XugqB09rBfb92G+u51as44nRrh6UoFutQeXWs29fNfD/CS
 a3ehCKkySndjg==
Message-ID: <0f5f6db3-34cd-ccdd-9ec4-5ba21480df64@collabora.com>
Date: Tue, 3 May 2022 14:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 13/16] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8192/MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-14-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503093856.22250-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_053737_860909_077473A3 
X-CRM114-Status: UNSURE (   6.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/05/22 11:38, Rex-BC Chen ha scritto:
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs/pcei for MT8192 and thermal/svs for MT8195.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
