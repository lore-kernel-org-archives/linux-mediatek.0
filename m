Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6A1C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhTjlw5HIOBzhFwNP4MvoZSprL2r8QnjFyaHSu0orLY=; b=CzrDc90ZFUzwAG68b73XT1euKN
	Tu/fHV+Y5K1uro4eNT9NlYFmrB93klc9Zw9I0ong2pTysoFW95yyKdhkuXyq0xIjJZqsFd0lMLniN
	6HMo2oa0olS9EEIsWOeSzZTSz01JLUmqFKG8lOcikQn6Oe63EzaQuCcsb4wQ+ybO1TZIIAn/pwXZf
	7BEP0wYv50lp8Z8Qd8CWOXzQQTwqz0yZFCsc9Zs1Kk/2ADpkLnooPFdbO1rROFvRFWk5TmIQ8T5eb
	ouwf3+Wksk8m8SpnShv2YLKVqjg+Ti8nTVjL9rzGG6bIU4I6folWa8RR3vOIo3IdJgcb6Sq047MXf
	cL8QvOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7bR-000qHW-4C; Wed, 18 Jan 2023 12:31:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7Zn-000pUs-If; Wed, 18 Jan 2023 12:30:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD6956602DFF;
	Wed, 18 Jan 2023 12:29:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674044995;
	bh=pum+JmCfAkepIxkkNByMAkyC1GI2OMonhqfRFmshYoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZhfNYhIleSeEWuzQ9i+JdDvgI+2h6Zj9MBAIESDo8pycH1bhSQDar1C4xs+KYnnY
	 S/ASTqTVVz4PvrmUaMJc0mm+AmsFRPtoNZwEBBmYP9K7im093NiUtTPAOQRn/2B9kz
	 V94PHbnh6/z2WwxDP95syv+Kei/05ONru95kr79WbSXC+tTgZUg/vCrMzTeJ16m4Ll
	 62SpPbAkfiAwnpz9A1Sy/Z+N/hG5ryUiEfZHN0giXLlhF0tDJwp7SX9oBB/zHXdyTS
	 axHPdeVmOqsbZXWr+WWgjx74lEbyaFjcQKwvMQSBsXRNiudUbCAIe6MXC9oIT/05vK
	 Ue1u7eSer/i8Q==
Message-ID: <e970a634-2d54-4a79-12ec-10da7a2f0e6e@collabora.com>
Date: Wed, 18 Jan 2023 13:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 1/3] phy: mediatek: remove temporary variable @mask_
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Eddie Hung <eddie.hung@mediatek.com>,
 kernel test robot <lkp@intel.com>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_042959_878162_8F475404 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 18/01/23 09:43, Chunfeng Yun ha scritto:
> Remove the temporary @mask_, this may cause build warning when use clang
> compiler for powerpc, but can't reproduce it when compile for arm64.
> the build warning is caused by:
> 
> "warning: result of comparison of constant 18446744073709551615 with
> expression of type (aka 'unsigned long') is always false
> [-Wtautological-constant-out-of-range-compare]"
> 
> More information provided in below lore link.
> 
> After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
> checkpatch.pl, but due to @mask is constant, no reuse problem will happen.
> 
> Link: https://lore.kernel.org/lkml/202212160357.jJuesD8n-lkp@intel.com/t/
> Fixes: 84513eccd678 ("phy: mediatek: fix build warning of FIELD_PREP()")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



