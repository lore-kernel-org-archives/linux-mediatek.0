Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F638C282EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEMOSqpO8feDZJE6RDdiMN0MmO7SBwGuGI7VGbGKJr8=; b=cc2psXGirvOZYOHUeaHUQx9Ah0
	CqtZgv5cOHXV/NNylHbPPYrMZopppdMVX5T1/JbP1itzu330tyIUEmxHRtuYaiSX+TwH8aiZHZiCn
	GXIuSKO/vD0D5cfeQj5aRgIBCFdWP8ULhJLBol5l+jcfS0qXL3euGIUG7SFxrkwcNaSJe6v3rOTxd
	4zYCFPJK+fCgurO/k6y6GDBScX8KW6IJLCfLi98ssNsm+0x3bLY7isPvuLO7/X2AuNjrLFjKkW/P5
	v1BO4shwMRHo1jvcl99kxD1DKBQ/VDsWQPX04IO7+wxSCRAprzkhsAlMnfnm2NyooaR0hjIe4nF45
	AosQOHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6I1-00000001plY-356z;
	Mon, 17 Mar 2025 08:57:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Al-00000001oHA-1ix6;
	Mon, 17 Mar 2025 08:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742201410;
	bh=xPRG7e60Wh++Rc+1rnNarHDDzFlkv4gGvxJsAnyQKxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FPITYZqMJZ/LYCF561Uaslt2ZGdpqCw9xW5RgjvvmQjXay9Mr7x5YlpR/UMmyXo3u
	 SlAvf2ecNAJvPOdsZvvO9S4OthGOOlEGJsul8CHtUvXQO9TC+reRX1dW50a8RM4AM8
	 a1Yb5vU9JJ6UEJBPpucZnRuDU/a6RWM5KPZ1blZ8vQa4n3I5wnCgjL4edSVofx3W44
	 7dshqu5PjWjhzPYeEgGLtuOqEWULBr66xxLdmp54Y/koXEWkxYnkm9BjCxMVSDix5A
	 FNEUsCju82X+XXGKmCKJSjJycfPdeXTUEroMYza703apj8X9w9pG0ktR6m5MokhLNO
	 LZa4+uOqV+gEQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DABA17E0B12;
	Mon, 17 Mar 2025 09:50:09 +0100 (CET)
Message-ID: <1a98bd80-5ce9-4085-95d9-9faa93293647@collabora.com>
Date: Mon, 17 Mar 2025 09:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS
 macros
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-3-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314173858.212264-3-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_015011_601673_4632E7F7 
X-CRM114-Status: UNSURE (   6.54  )
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

Il 14/03/25 18:38, Ariel D'Alessandro ha scritto:
> As done in panthor, define and use these GPU_MMU_FEATURES_* macros,
> which makes code easier to read and reuse.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



