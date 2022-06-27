Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F092CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHqLuEZj7j5Uar5jY7JRnQYD4vG2FpyhE6uRP0wAuSE=; b=ud3TMEzoW0j9oUOW3ONr30ueT4
	BTqvPVswW++MU45m0ZSc4D/5CpEy6lOV4Q+5v9cYdcFj56hqtcA6Azzqc6uXaXqzGiy9pvt/tYexi
	pcR0he5up/hPbU1VjC+UN2ZWzeyBbdhlrM5YXMDorsk5J4etK99TSyKgya0HdnhBbhq5sPY+Su1IB
	uK8B6RLUpe+FSdtq3DJWCA9fIeeX+hUCMbUOsKi6r9g8dFvrBNrXFPyBeFz/GMF8LrGCTF82oXPcU
	xIQaob13CRNAjrhU8aPNR0w4OikF5FAxx/KsHcoXtDluOFiDjxTVAXRS4esBDiQqhTLWsKl86tm86
	yNLAeyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mMQ-000HRr-CC; Mon, 27 Jun 2022 10:52:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mMA-000HHF-26; Mon, 27 Jun 2022 10:52:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 53F8B6601695;
	Mon, 27 Jun 2022 11:52:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656327156;
	bh=31OkOrWw1DO+tikKFkTVP/vIL3n46LNH7u7zf1VVoas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MRasHgN6imMVi+Ky842kdEK+bxObEBRRTatA44k84AXhPMGg05eYOWJbWgHD/TDqL
	 kYNd6ix6N4opgw0Qiu/Y+hYouCkqO/sh+bJrTqRR+xvnqC7PVw/6aEx/+4rKhhjCM8
	 gq0bTq9MY68dEk9kPWKeVyQPICrSzu2BEv22hTp+sSnGVw7VyU75o6/kGfZvOpv/sf
	 smoJJp1e2KaGhqmhGFpzr07/Tk8iFaIpEQSrirGm6RvWAeFtKmEXh39H79lbzxKcsV
	 Gi0KkvYbOGxOaojJMhoY3W/BDntZs80zZDWEAs9avTiVjwbAAG7Wwd/Ei/d5OKR6ee
	 sYrZl91FY0RZA==
Message-ID: <718cdb35-1d87-3900-6de2-690964ff991b@collabora.com>
Date: Mon, 27 Jun 2022 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 14/15] drm/mediatek: dpi: Add dp_intf support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-15-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220624030946.14961-15-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_035238_299940_BC023FE2 
X-CRM114-Status: GOOD (  16.45  )
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

Il 24/06/22 05:09, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - 4 pixels for one iteration for dp_intf while dpi is 1 pixel for one
>     iteration. Therefore, we add a new config "pixels_per_iter" to control
>     quantity of transferred pixels per iteration.
>   - Input of dp_intf is two pixels per iteration, so we add a new config
>     "input_2pixel" to control this.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jitao shi <jitao.shi@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


