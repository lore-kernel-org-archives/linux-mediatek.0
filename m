Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE814C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIz+bR159MaUWvCBFXD/5frP5Z4MyDEhnfL/U4aN1fU=; b=nm9dsC5ldxuEOfJCtbGfCPjfqV
	gR69vtAPxlBZBJ273NLQNi4/RyLr2UazbF3raboCKRBG+FIuGJmtACvzYR4oErrBbH2LXMPADfu7z
	5SAOsJU9Vg0o5Gk2NAt3YlN1lE/8sMcDo7tTfYX0kysyFfk6sdiqXUfFkG5nT7rCEd3+20ha6RS8s
	+wVyHvChVHo+qD7ySAMK8cEOd5WHKjrVG62DYfRp+YuIenUqkHo4qB8pM+gIGA7Vy1VZCZeo7qO8h
	QKR2ImcL0vGbBUIq2TxHCtRUM7Hs1iQM3nVDR+ou4aojnls1SGGQOI3TZY2p77qOcF48m2WG0xjrE
	+u97bg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ5v-0000000Bdjp-0lme;
	Wed, 12 Jun 2024 08:12:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ5q-0000000Bdhn-3rEH;
	Wed, 12 Jun 2024 08:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718179949;
	bh=rLJunDbeQeAUOd1JejIPRVqX35zvCbzWB9CqhTOod/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q0RWbMR9uA0R0gEmNo/Y42AKdEY0c8S2LtxkiNObYUUoOkwdu26EjDos8f9ExotJ1
	 pv7VbPZZDqiBgjCuO3kHA3+PdUXqj1G1N0dIGS2D5UyRZgvm0AyOsUIwLLbX6s7xjx
	 7vusY0GZrdJdkzFMks1JOJ83fMKjFYUwCiZ4VWPOiWs1r2S3tu/gyN6itwc7U9ksDK
	 Pm+02wXMtSckWKMOUuD/K1ZquWNrilL7dr7UzW2Nbl3ldSAshzuzyJknCp4TiNfZVW
	 clvAMte8TGX23djR8BpQ9hpyiAALcGMkdHtywsbf6SpRT4To25jen3L0Gvepm5aKXo
	 8zRzswiHzBYgQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EC54D37820A9;
	Wed, 12 Jun 2024 08:12:27 +0000 (UTC)
Message-ID: <ea604d75-e571-4d63-a7e2-aa1393588c75@collabora.com>
Date: Wed, 12 Jun 2024 10:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: neil.armstrong@linaro.org, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
 <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_011231_111308_2A1A354C 
X-CRM114-Status: GOOD (  11.51  )
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

Il 12/06/24 09:58, Neil Armstrong ha scritto:
> On 12/06/2024 07:50, Jeff Johnson wrote:
>> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> drivers/soc/mediatek/mtk-cmdq-helper.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> drivers/soc/amlogic/meson-clk-measure.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> This is the last of the issues that I see in the soc directory
>> ---
>>   drivers/soc/amlogic/meson-clk-measure.c | 1 +
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # for 
> amlogic/meson-clk-measure.c
> 
>>   drivers/soc/imx/soc-imx8m.c             | 1 +
>>   drivers/soc/ixp4xx/ixp4xx-npe.c         | 1 +
>>   drivers/soc/ixp4xx/ixp4xx-qmgr.c        | 1 +
>>   drivers/soc/mediatek/mtk-cmdq-helper.c  | 1 +
>>   5 files changed, 5 insertions(+)
>>

MediaTek:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but I'm not sure how we should apply this? :-)

Either Arnd takes it directly, or you split it per-soc... and I don't have any
preference anyway.

(P.S.: Added Arnd to the loop)

Cheers,
Angelo

>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c 
>> b/drivers/soc/mediatek/mtk-cmdq-helper.c
>> index 046522664dc1..dd70d4d2bed7 100644
>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>> @@ -526,4 +526,5 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>>   }
>>   EXPORT_SYMBOL(cmdq_pkt_finalize);
>> +MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
>>   MODULE_LICENSE("GPL v2");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240611-md-drivers-soc-1780b1939627
>>
> 



