Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27542C47DDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI0qz/Jag29CDPjGlmZ+rAVhTYk69+7CIhbu2Grvp/M=; b=fdtOi5JcE0DVQs38sumR4nB1xO
	rHlHO0pfAgkZrbTeoAry3erRU4ur5i2VH7DeJLadUClvvVAV+FT4BuUXOOjU7cMXb8d+h+etx6b3t
	Lz10lpYfW27vG6yO9E8qDufOniCaiMX5ufNOE86n3gXRNvmvJE5nmwIKNy36HMuaBNRRZ5hJr6ed8
	R22fw/3bule3oacAstSti8G/wlJt+XPCPPo3eT3z3koxZ6iHZ2yayXFUumIvqrT/FK12Rmsgl2Lx4
	Jr2rCtmbHR1g00/0jqs9lZd+tzMclXhKHbdloLeaorQrHHrhoQ9YK/nAFKkgchaFWvKfaQOPDHlBB
	UD9xpN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUm9R-0000000GOqQ-3EVg;
	Tue, 30 Jan 2024 11:19:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUm9O-0000000GOoW-1vsx;
	Tue, 30 Jan 2024 11:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706613573;
	bh=QsmMvdygEzykc/sigoFHqJXzg33HVkZ+pgYlsBhHams=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qafc92t5mUfWNoHkO4pzlKcIqlcsJSEfVnIvGZCqMXYCTHgibJYm/XEGYWztFAtz4
	 H23b7iwyyg3hrRS/UWcKZTt3mhs2kAAwzMcNZjPaKqCTSPRwoYCPT2pox0pujSH63i
	 bupyE3ezU/ylG/r8jQV4f57N29GqleERwqh9ocn+Y0QeamVWFyMkPVNi7kr2oEXvsV
	 Ssj3B406/aGsy402OJsC1hDkkNXn0xyQ/nSzqk4PU6sDk+OOGTLmboyIwMUOK6/0CJ
	 eHCgvsn3EPZDgakogJil9lWDCEYlix1alHZlHyn/N9MQVCMaiVphqTeRdyZtAW+C1W
	 URIHohc3FZ7VQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8DCDE3782051;
	Tue, 30 Jan 2024 11:19:32 +0000 (UTC)
Message-ID: <98c8da0f-efe8-4ce0-8534-106114141cba@collabora.com>
Date: Tue, 30 Jan 2024 12:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: mediatek: mtk-socinfo: Add extra entry for
 MT8183
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 William-tw Lin <william-tw.lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 William-tw Lin <william-tw.lin@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20240130095656.3712469-1-wenst@chromium.org>
 <20240130095656.3712469-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240130095656.3712469-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_031934_652999_13AD23C1 
X-CRM114-Status: GOOD (  15.29  )
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

Il 30/01/24 10:56, Chen-Yu Tsai ha scritto:
> The MT8183 has another socinfo match, with the second cell only
> differing by one bit. Add it to the driver.
> 
> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/soc/mediatek/mtk-socinfo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
> index 3909d22062ce..42572e8c1520 100644
> --- a/drivers/soc/mediatek/mtk-socinfo.c
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -45,6 +45,7 @@ static const char *cell_names[MAX_CELLS] = {"socinfo-data1", "socinfo-data2"};
>   static struct socinfo_data socinfo_data_table[] = {
>   	MTK_SOCINFO_ENTRY("MT8173", "MT8173V/AC", "MT8173", 0x6CA20004, 0x10000000),
>   	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000840),
> +	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000940),

Are you sure that 0x940 is the same MT8183V/AZA?

Added William-tw to the loop; MediaTek, can you please confirm, and please say why,
there are two MT8183V/AZA with two different ChipIDs?

Thanks,
Angelo

>   	MTK_SOCINFO_ENTRY("MT8186", "MT8186GV/AZA", "Kompanio 520", 0x81861001, CELL_NOT_USED),
>   	MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81862001, CELL_NOT_USED),
>   	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 830", 0x81880000, 0x00000010),



