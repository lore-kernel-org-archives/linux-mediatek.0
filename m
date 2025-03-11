Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782A4C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VebOt7eakeM7O5EFjZv36HAailZE14Ug6tWVf26nsyY=; b=JxOKwA7RtYG1d/skyypyOd5MHS
	ujJhc1ssgaNEKq2IMTsASyiMoElfr9kxmEoq/8+5vVmrZU1fHqwo5nm3vwrF/Mym3s27KCDIYLu4l
	zcVPA7T/j17tV2GnMr5CpF96CaCho0GnCW3M5rXFpNLJJZLWiZ9dk+b3Ih9cg3vu+n8BuU/jSkBOz
	bBWg65V+KZWohsGU8L1zVy33Wtj9vrQU1kAXnu8F1amLqA72W797Tr8TVoycZCEaMVgDftfOaGibM
	eSg7pszxqX9MOB7k8X3vADNl3An/qNVhBZHfQEqjzbfQ64n3S6U9/kfqq5xDhoyIAl/Zyi/Zc+zcS
	41/rqrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryEy-00000005Xmr-3z5n;
	Tue, 11 Mar 2025 11:57:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryE1-00000005Xe0-1Bdl
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 11:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741694202;
	bh=oJdU3+ooCjDHVuYhhwqBKzx0i6eCKL9c3ARobA2BNDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RZErmzD5hR6eBaNCp3Ra952zZqHpfdYpxB/QT515Jm1n74Cay6gDxrhgE9emAwaz/
	 6FdGJ0YWE9p6DkYmdCEvgCj286rMwe3kGuOLX89U7nx5H6+8VuEyu+UT394erUfgVu
	 DZxDk03R2UYg44KbWMsa7vmHMecYtOXtkos9XzuJXAEpEVJqWWpE3WbjEUucwZvqHn
	 llWloNx5Pt/RZfTgSKcusiTV4n5y/gu0MHVqiNDVIBMjIkf2UmJmA2cmVPuUfdYlrM
	 4LEIrWnEfRhuD1vjaoVmmIO8mZYVW/0vHFatGw3tVFHP/ZjiQo2tVv2hP6r8aIUyHJ
	 yp0STOd+W5xAA==
Received: from [10.20.66.114] (unknown [103.163.65.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2368717E0B25;
	Tue, 11 Mar 2025 12:56:39 +0100 (CET)
Message-ID: <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
Date: Tue, 11 Mar 2025 17:26:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com,
 angelogioacchino.delregno@collabora.com, daniels@collabora.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250311061703.16850-1-vignesh.raman@collabora.com>
 <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_045645_477635_839EF0A8 
X-CRM114-Status: UNSURE (   8.85  )
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

Hi Krzysztof,

On 11/03/25 12:54, Krzysztof Kozlowski wrote:
> On 11/03/2025 07:16, Vignesh Raman wrote:
>> The mediatek display driver fails to probe on mt8173 and mt8183 in
>> v6.14-rc4, with the following errors:
> 
> Which boards?

These are the boards,
https://lava.pages.collabora.com/docs/boards/chromebooks/boards/hana/
https://lava.pages.collabora.com/docs/boards/chromebooks/boards/jacuzzi/

> 
>>
>> mt8173:
>> platform 1401b000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
>> platform 14025000.hdmi: deferred probe pending: (reason unknown)
>> i2c 1-0008: deferred probe pending: (reason unknown)
>>
>> mt8183:
>> platform 14014000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
>> i2c 4-0058: deferred probe pending: anx7625: fail to find dsi host.
>>
>> Enabling CONFIG_PHY_MTK_MIPI_DSI=y in drm-ci resolves this error,
>> but mt8173 still fails with,
>>
>> [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
>> panel-simple-dp-aux aux-1-0008: DP AUX done_probing() can't defer
>> panel-simple-dp-aux aux-1-0008: probe with driver panel-simple-dp-aux failed with error -22
>>
>> Enabling CONFIG_PHY_MTK_XSPHY=y and CONFIG_PHY_MTK_HDMI=y in drm-ci
>> resolves this issue for mt8173.
>>
>> So enable these PHY configs for mediatek platforms.
> 
> Just say which boards need it for which functionality/features. Three
> sentences are enough.

Sure, will update the commit message. Thanks.

Regards,
Vignesh

> 
> Best regards,
> Krzysztof


