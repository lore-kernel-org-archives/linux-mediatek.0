Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C65CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC8Du4epwNUklESqZoh+/x1hd1udT3TakdTgJwrSKb8=; b=asdLkhyUS734LeYn0kQW+de0JP
	dsVSK5Bo5p5vmPuchhp4im+sl8zEsvsKdyXEyihpMkdu0TDn+zhkkYiCcCalXeVnTKfgQ4xDfyoQC
	l9iWAQS7oRMukos14x81vQyTi4KSjMR+rLUwuMh2IWvEwXdH6Rxlhstjwo+UXY1lhAQ8GKgaku9q5
	HVAhv/ljLaPjR2hPs1r5vs3sQLPO9pudVG6rrIftb4sbrmmxaog6OJ0gvLrbrkKGtUDyo38FpTLde
	9MEkG701RHc3c0ZfdhQMNE2jVHrLr35C5bfWal2mlymcunVXZ2js7Fet3L+Dmvomtdo+4c+Ro5Ztm
	P+tU8irQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZvQ-00000007nJJ-0N0O;
	Wed, 10 Apr 2024 15:31:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZvM-00000007nFb-2RlN;
	Wed, 10 Apr 2024 15:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712763101;
	bh=lIsydFjFH4O9qDXir41/xW9OeB9uWOqhgAX0I0+gXwA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AXHMNKKJiOSU/tdBw4/2X1abTJziNFfLrJ0WPsFVhWhFpzvVvgTtGpWQRiPDjWhU4
	 SD5xSVCTP9nIiCiHuQGg8Ybzl8RZrX1JJQj1q1Qkjrke70A2O0bHw+M0Jbo4SUTJh4
	 U70rJcFPOwnq6sDB7a8rhnFpZiBwbRKCUfOKvDBBiGf17BGWQJyFxNH6OwZlU3a4CC
	 if2yRkZejcTVwaq7knns5AxucP3j6XEnrIGLW+AqXD5C/DZ+99ANbtCFVF9S4MCFfN
	 vUMlS7Aq7ZhQvjijK6QZmnH/DY3EvRzUOt+CF8dcfIIqKgQSm+cvBxCrrj9CQtAUpc
	 5GpZdkTzX7ZsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6871B3780C13;
	Wed, 10 Apr 2024 15:31:41 +0000 (UTC)
Message-ID: <40feb89d-732c-4bc9-bab3-939896f13248@collabora.com>
Date: Wed, 10 Apr 2024 17:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-cmdq-mailbox: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240410152534.190326-1-krzk@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240410152534.190326-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_083144_813559_088E4B5D 
X-CRM114-Status: UNSURE (   5.47  )
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

Il 10/04/24 17:25, Krzysztof Kozlowski ha scritto:
> Add MODULE_DEVICE_TABLE(), so this module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



