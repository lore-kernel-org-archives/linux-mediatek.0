Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688D4C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XQkse1gO4qMi0OJUprloD5ZX9fP0DB77/HXJGnMyIQ=; b=UZ5EXAyF0FIKEOcCmGUcVpvJUR
	oaeZgRRK9IY1nPPE0jiqa8HW+fT4mxZAdu7Xwpjt8j1DLsC4Ac63r0DVR9yFlqWACep9iedTN4yLC
	8enXjFqLhEVKRzVZP9xqoUIli/Lmz0qBs/40TpXwJY6WisO/NTwSBXhi7RbcSHBBdrXeUMn5uVlWL
	2UKtsIQ1X04wt/qBt8hcObujqRDENKvWfulhVPpdOEttIw9GZL6bjGq9sIiIhLPNmrBHbTLXgQ5ZP
	4cBIByw+IEkg/MOoPz8pDsGzrZvZeAQsyujsBqCKhXIwpY+98mQ1hD72zorKb2P4g4JrV2CVlLT42
	4kaMFzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNts6-00HZlu-10;
	Thu, 11 Jan 2024 12:09:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNts3-00HZjK-0T;
	Thu, 11 Jan 2024 12:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704974950;
	bh=eZahT2rDuCpxGaxjQ0g1JBIf/O3DF9bTmSWTwmZEQco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WwFaddtkJJu7jPZYnHCPG/N6e4prkzO+Gu9Qw9P81aKmJQxyuQCYIXjImX3YoGb1n
	 HP8wobgYkBR95NKbpkw18krJRqRwGBpUo1uL2+j2MyUY4cuMUvQdPUEKKy/wWAksLH
	 0K/rfQU7ifpiAcY0wyz1pYY6n2M8CgvYOMgIzaIpS0vjPR2B6REitQwwcpkAaOecsk
	 Q9KgW3ocGcqqiufREDJq9p9ks37nX/ThwWupsLHS7x/giZnmOZiMwiSMxMRpMOBjvi
	 V6MgfIs1T4kciPxkPgdwdDQoQjbgqvCe5w7RxrN3Bv/YTBn0KQiVCRu14tuBhbUX00
	 AliBy58fCgVEw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C42ED3781FCD;
	Thu, 11 Jan 2024 12:09:09 +0000 (UTC)
Message-ID: <09de860e-224b-4ed5-a6f3-da4f336d2dd7@collabora.com>
Date: Thu, 11 Jan 2024 13:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, Louis Kuo
 <louis.kuo@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20240111101738.468916-1-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240111101738.468916-1-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_040915_316369_CFBAD974 
X-CRM114-Status: UNSURE (   9.54  )
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

Il 11/01/24 11:17, Julien Stephan ha scritto:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This is a new driver that supports the MIPI CSI CD-PHY version 0.5
> 
> The number of PHYs depend on the SoC.
> Each PHY can support D-PHY only or CD-PHY configuration.
> The driver supports only D-PHY mode, so CD-PHY
> compatible PHY are configured in D-PHY mode.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: refactor code]
> [Julien Stephan: simplify driver model: one instance per phy vs
> one instance for all phys]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



