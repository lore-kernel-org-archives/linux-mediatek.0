Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A624AC7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eqwxzvdes50O7xVVXGB5Xg/MLMwuhUKxctEayRK9Hto=; b=k55HpzzNQ2/R6Yw7iMKRyYGKkd
	WfPuKlULYtcWWXkf33kUZNgLrpKrrISrUsBn7iBgphImeyx/kCNaYer3ttQ6wiZw8J8J5bbB0rAC/
	S9O5CFVou79RFrmhfvTBcLQG9cCGSsn2n4Yns05al/gYWuWl336lAfdRmxsPOJWcH3tMqFBVZQ8bx
	PhXW9ylZc4WS0lrUpydY3DB3TCbRyVabqrUsFu/zBFVs6Vi7EHPeTL6rR2yq8Kg/bKHC/WFwgxD8K
	sDMxfiSem8oN2eHfLkbwzmenJUvh44TQ9EaTyAohRN4+WMeBeGjpFJnqG5ziucKZZRZ7dMAFGYXb0
	rdMBrnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GTr-009bW8-0q;
	Thu, 08 Jun 2023 14:19:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GTo-009bTr-0F;
	Thu, 08 Jun 2023 14:19:13 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BC1666606F1C;
	Thu,  8 Jun 2023 15:19:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686233948;
	bh=3Ay9KItCvB4tjPS0pabV6VBP6LlYMUrgGWWA7iE/XeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j+N3fGagIxl8zeYXgk4PexHnCzGUlfxskwHxuFYKZd6VGEzqsZu3h4HwG1mkPFCyZ
	 yGu8HwkyNDwr3IGDeZKLAlcD4HCEpbXznnpbZhUxATX66L4JOv2gN1YK9j1puHQC9s
	 YP8/p2g5d+9G1cCVIDpWYYIiToSjYHkjyXkCMfCqLqIZjcWYjNBbnnv0SGofo3Jlzj
	 rzp/0l27dtERWbNvAFGG60Ywn19j72J0FIJDx4qdkqWWPMZAWSdDfFhlxz/55QmfLr
	 fSgidUGj3R0OPtW63ObSdD0sN73dJcpO0lV0H/dP0j/0Z0JS1ZxwleV//44oVvgZ4Y
	 J73EKXqBT9eww==
Message-ID: <10daa0d3-951a-72b8-f8f4-48defbc42586@collabora.com>
Date: Thu, 8 Jun 2023 16:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8186: Add GPU speed bin NVMEM
 cells
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
 <20230607090653.2468317-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607090653.2468317-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_071912_247454_E59C2ABB 
X-CRM114-Status: UNSURE (   9.30  )
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

Il 07/06/23 11:06, Chen-Yu Tsai ha scritto:
> On the MT8186, the chip is binned for different GPU voltages at the
> highest OPPs. The binning value is stored in the efuse.
> 
> Add the NVMEM cell, and tie it to the GPU.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



