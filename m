Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F41C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1HERBvQgIFKFBZJOX3aD2ZRztMqd22eKvv3Lxo2G1s=; b=gFJNWDdfC1iGfhL6b2j0UrUR4a
	CxtFhkwM5u+uFQtzZu3cM7C1gWncf2iUhESimAh8tqoFHlYPx6ZI1CRenh13DEbpBt5KXVCLNXNpE
	/xpLejbo0Nm69di0oVuDkUdh4mT3yYO+uT102lDid1Uq4sR+jxl9IY1ZHq2L6Vy+W5SWdDI9PlfPU
	5F4521ViYwAyYgTekwlKDDUUJgqCdnsgGE+DagHenQ0IBF+0O7+fJp0a7smE7EQDJqLDhf0Wp6pSt
	D9roosRS6k6UjlrNv+lMAu4FOaSisxvq0r/ExwxO3MsDzmFHtN5u94jKjZ63l0xMWPZ4Rn6BpdVZO
	2M0E8OMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXSp-001WTX-3H; Wed, 13 Jul 2022 08:11:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXSV-001WNJ-8O; Wed, 13 Jul 2022 08:11:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 113716601A35;
	Wed, 13 Jul 2022 09:10:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657699856;
	bh=bfIujEOki1yuUGd6x5fkRe+aKgyb6nD5m2cVNJCVehM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R1WTP/ZrMwjrTvOSheku3PT+6MN83kh/xNIj0LETI8oua5VwHhJEtzUuAxvpiPKIw
	 IDAtDE3hNwzAvwFiv7Y6qyWE02BQvxEq/ds8in/1xZ0JlHsg2Z0jLTpsV8giyj62eZ
	 JcUWUYG4FRm9UHYdOV9a8kCPqzeP5CrJjvExUMV0HfXFLypTzkm6PIoDVJV61fpOhf
	 rIoJk+/17X0bNld+6A8K76HzDO9L25vKvdqc06rmFI/FO7DuqzOdY4hBQy9GsG+OoE
	 +CcFllRBch2zT1eiW7MybwUnJQHpK+rXfUAEQ7ocid3Lo1KlnwWU3GmhYJbBeG1jrA
	 zicDn/r+FK3EA==
Message-ID: <f27ccce1-23bd-203a-4cf7-88e27baaea0c@collabora.com>
Date: Wed, 13 Jul 2022 10:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] arm64: dts: mt8192: Add display nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
 <20220712114046.15574-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712114046.15574-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_011059_479455_298FABB8 
X-CRM114-Status: UNSURE (   9.51  )
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

Il 12/07/22 13:40, Allen-KH Cheng ha scritto:
> Add display nodes and gce info for mt8192 SoC.
> 
> GCE (Global Command Engine) properties to the display nodes in order to
> enable the usage of the CMDQ (Command Queue), which is required for
> operating the display.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


