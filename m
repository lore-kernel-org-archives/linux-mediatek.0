Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86B4C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gFdzX42TQ/hJ6Q3pkd0rhDLhepWI5KklKEUzURFLwY=; b=zU3nZ6wI4yEp/8HzvNP740GJmM
	Gksck4A/6DCedZwvE4PEwo2qmAeWoGtKu/Wgb8bW+9aKHp/UTDKg7UZwH0QBorKDi3VIcbdfN6dCc
	m1c09W20EZRxHPlbWYALjybznOjydQ2tT3lpijKvZCHpM1DKYD2yNcwTtgeHJvI1M+YjN0KYopPJm
	KpPXT7HE9zK2Li6niVzQoIuDkb4vJHdTA5+q5xPcth/MuJpt/8EywO9WKxqqMl4z/Qo7JCWnDXHVk
	sqbDEINYRkMQNnr8VVQ7+a8kF4qbGSK2d6gvtsh+FiFceKk4hSgdcC5QiPOvBcoVyCK32xIF91rg5
	AxAfMuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjig-0000000GXTb-2Pkj;
	Thu, 13 Jun 2024 12:38:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjic-0000000GXQm-0kSq;
	Thu, 13 Jun 2024 12:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13EEA61B23;
	Thu, 13 Jun 2024 12:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED15C4AF1A;
	Thu, 13 Jun 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282296;
	bh=+Ps/m5LPCrr12cKf+1TsG+NGfRkskSxaIu7J2ih4u9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dWNBZiOK0WNhGJx5cvEsKkOoqN3c89QhYzBrfgIaR8sqDH6md4bbGOMuXhxszIYcD
	 yG3tnrBxi0Eat5n7E3yCGm/gqH2yVXKAVbFfSh6v021Yt4k5wJFsd45XqYbWX2U4Fr
	 Pgt4r5bvQnojgSpjHvd09IFfRA8hZUPpB7jgfyJwPen1Wpzm5FpY+9Tz8rxsxaMywD
	 9vHUeTXA6gMGerIiV+NSXUshO2uAmz8rH+nbrek8yYKZhbkk4qs5R0/0ZpU1EDlLOy
	 RNIg8DXGeD4nK/zFj255Oxt7DrIK41x1415r46zWv3bQVDKC1HpOE9dHP7d8sql8QD
	 Y3MtnY2fENwCw==
Message-ID: <e0a5690a-2c88-4154-9bec-441d22197468@kernel.org>
Date: Thu, 13 Jun 2024 15:38:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] soc: mediatek: Add MediaTek DVFS Resource
 Collector (DVFSRC) driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, amergnat@baylibre.com,
 Dawei Chien <dawei.chien@mediatek.com>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <20240610085735.147134-5-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20240610085735.147134-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_053818_293783_C87DA9D2 
X-CRM114-Status: UNSURE (   7.69  )
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

On 10.06.24 11:57, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
> Hardware module used to collect all the requests from both software and the
> various remote processors embedded into the SoC and decide about a minimum
> operating voltage and a minimum DRAM frequency to fulfill those requests in
> an effort to provide the best achievable performance per watt.
> 
> This hardware IP is capable of transparently performing direct register R/W
> on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> 
> This driver includes support for MT8183, MT8192 and MT8195.
> 
> Co-Developed-by: Dawei Chien <dawei.chien@mediatek.com>
> [Angelo: Partial refactoring and cleanups]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Georgi Djakov <djakov@kerenl.org>


