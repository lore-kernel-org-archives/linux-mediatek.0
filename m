Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67973C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Pb6ja1hauemGx5Ips8F/hiGlbq7YK6dUNBCF6ISywU=; b=w2KaXktQ1euPp5HoPQ/ZG9R7i5
	TQszS0BqvXkvq8dwWhPaGm4c9DJ+GV1sQIauev+OZMlNKa3A0HV0Cg60KQ68fp5N69wnURogLfJ8n
	D+CKdHMYr5/yk2GCIWrdWuNuq4qFHC/TidcLfP2dfqF7QCS+cZelACw9hFS1DwII1Kxfdm2QC0qwo
	1nFWvPvK6KCYW8PDtV5x7JotVaaeeCyFD58dJEhRKxgRaC3XU6M3n+kgL+CpyMs0kX4GyA2zONoug
	zn5Yupe+7HTxrs8T/2sGvnbm5lVMV7HU31oIYGjHqVFCzlsfyyA93y/cbnJq5hfKIT+3fgv6klDsC
	owWDWP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N7U-00FFyi-6R; Thu, 07 Jul 2022 08:44:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N7I-00FFtc-PQ; Thu, 07 Jul 2022 08:44:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA9AC6601978;
	Thu,  7 Jul 2022 09:44:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657183441;
	bh=Iui62xJiXnekpXKddZNXoOu5K9qG6GiEA95Do2fh8bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VsUuU6eYEo4wfqH2UnLmR66l/fHF1wAEkqAzz2Hd4KGladtf0jPIwnxj1nXPqzzAR
	 23SSiilIY3sWRMIfgu6QrUJdWXAiABcGuA6xcoFBzQ2bZ1dpevomG+KQ4CqagHhlho
	 0Q8bqoWKaYi1PdxK/G4zB/6AD2f+NGzxPDc9cGbOcibYyk/3Dl5PI4vk6buLViqJDV
	 2YG4DjgtRpxQqfQw47Ac+9z1x6weQZIjXpw5bbAEVWhQWn+IZcVtIScnb4vht4vtWB
	 C5vqcvmVHULBIuS5wnsTn/xxmTjJG5IGL4OPp8h55htD50zaVAvdgNxO4YGPmJCjyw
	 wiBUKGKBkdt9A==
Message-ID: <fae6c582-ec65-47d8-548f-934e8e829daf@collabora.com>
Date: Thu, 7 Jul 2022 10:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8188
Content-Language: en-US
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
 housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
 david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
 <20220707054617.13583-3-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220707054617.13583-3-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_014408_999488_43795D8D 
X-CRM114-Status: GOOD (  14.85  )
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

Il 07/07/22 07:46, Kewei Xu ha scritto:
> Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
> The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 41 +++++++++++++++++++++++++++++++--
>   1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 8e6985354fd5..aa2e1cb87420 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -135,6 +135,7 @@ enum mtk_trans_op {
>   enum I2C_REGS_OFFSET {
>   	OFFSET_DATA_PORT,
>   	OFFSET_SLAVE_ADDR,
> +	OFFSET_SLAVE_ADDR1,
>   	OFFSET_INTR_MASK,
>   	OFFSET_INTR_STAT,
>   	OFFSET_CONTROL,
> @@ -203,6 +204,7 @@ static const u16 mt_i2c_regs_v1[] = {
>   static const u16 mt_i2c_regs_v2[] = {
>   	[OFFSET_DATA_PORT] = 0x0,
>   	[OFFSET_SLAVE_ADDR] = 0x4,
> +	[OFFSET_SLAVE_ADDR1] = 0x94,

Instead of adding a "slave addr version" entry... you can as well just define
a new array here with an appropriate name.

static const u16 mt_i2c_regs_v3[] = {

.......

}

This way, you don't have to change all of the platform data entries and you
also won't have to add checks in the do_transfer function, as that's one of
the actual points of having these arrays of register offsets in here.

Regards,
Angelo


