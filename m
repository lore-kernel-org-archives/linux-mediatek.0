Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB94D0E6C5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XK7rjGRc2Nc677jOtGjLy/E3OT/7UlqQeU7obCac8QQ=; b=ALL488k6JE2K5P
	BcUWhneeGrY4DvEkloXp+D1ummitCq5Acamp6tSAwSvzjKux/kqRugbedQzdpu7WDzNthc3nj+cMS
	z+K4iV316U2WBVbWZBxufXQPHH1w0mGtBx0W551k5Z0FcCMcdFjpFLNJ55vec76UGofnIPLkdmLVe
	w25xshZcStpgzGAt+viG1FRjgLxLcJABTUFNxo4bRwh9+SAUpPQa5zAgkXGHtaSPazV+r9FK0vIuq
	SalxLAzGt038ALpGUM1fXzmz3yeyeLUmkefdjh64VSaxeuoxS/IcIBDaESNhllyQl5+22jNVSzT9J
	myqqzX3NY5R8MPsmfqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqwu-0000000DBve-3vv5;
	Tue, 25 Nov 2025 11:11:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqws-0000000DBvB-0yl1;
	Tue, 25 Nov 2025 11:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764069063;
	bh=XK7rjGRc2Nc677jOtGjLy/E3OT/7UlqQeU7obCac8QQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hyO0EVwMYvTohlPbkccYriFZiWQP5OSCoysj9zU8rbpkAyUEDmhe1+1gaWUvsF4UT
	 j+1HqOq0X67tDMPWj+j5B6AZYQ2Mm7mYevhaTuRG9pIeC0pFOu8cLFmpLd4ejCFi1X
	 vl5gLss3pMM/PsOr130vRdhTvTwzfnHjWLpg2y6pXQ7BXWz/bp38YoKYK/7Mq+ChQY
	 9xXgWFuKayQ8CIQEiLMDThnQrwiUG7qNVKkwtpF3+sgUVsKopds2u5yN/QcOquLRDd
	 hog/LddLBeHX9I6ecPDJi/TnS6/v8GJuT/vL+gmPwjOF4cAg3dSyjZCv7R8rnHaG5i
	 GMkHRQgObP3Aw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:657b:ae76:a0f8:4811])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26B7117E12D5;
	Tue, 25 Nov 2025 12:11:02 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: frank-w@public-files.de
Subject: Re: [PATCH v4 4/9] thermal: mediatek: lvts: Add platform ops to support alternative conversion logic
Date: Tue, 25 Nov 2025 12:10:46 +0100
Message-Id: <20251125111046.23680-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <19D052E6-7E81-455B-AB31-C805AD65F96A@public-files.de>
References: <19D052E6-7E81-455B-AB31-C805AD65F96A@public-files.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_031106_419333_26CFC44E 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, laura.nao@collabora.com, kernel@collabora.com, bchihi@baylibre.com, robh@kernel.org, nfraprado@collabora.com, daniel.lezcano@linaro.org, wenst@chromium.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, rafael@kernel.org, u.kleine-koenig@baylibre.com, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/21/25 14:02, Frank Wunderlich wrote:
> Am 21. November 2025 14:00:29 MEZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 21/11/25 12:16, Laura Nao ha scritto:
>>> Introduce lvts_platform_ops struct to support SoC-specific versions of
>>> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
>>>
>>> This is in preparation for supporting SoCs like MT8196/MT6991, which
>>> require a different lvts_temp_to_raw() implementation.
>>>
>>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>
>
> Should this patch not have same prefix like the others?
>
>

Whoops, that's right. I'll fix this, thanks for the heads up!

Best,

Laura


