Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B95C28B28
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYQV6ERBb2WkjSOl+NDN4hrkWB4ijETFO3HdmFk77fc=; b=ZIEl7PJgRE97/JuMYj8cSyn72/
	E9Wb0gzUq4nXSBVPJi5WurOxsZL44ycMvhig614BTYFqy1/gsgpDrWFvNB12XgBfryw4nVBa0Pw0G
	+MJiofG1QpA9v6wKZmvanI2rKKKB3GKmbt4/C18HVp0sr6q0JVG9in68nLVZ/3pYGDshyG+mKnrF+
	hoIv6n/7wDxJJmhpiRAdQtusl8S1/kFCizufPl/Xb6rC/ioqXCS7uf2juM7ohdDeFntsJd2mLV+Ys
	5n1YHrbY1BW5BTMjd8KzF9pyI6b4NHQEKIod5KuOA26zVsne90jVY5mFtx9asDUWDDAvqyHfgwT3B
	ksZJt9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZLR-0000000A0W6-3PSN;
	Thu, 13 Mar 2025 03:34:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZL5-0000000A0S0-3LJD
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 03:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741836868;
	bh=TNTg47qZROW0WppXAxZZzNCelLLyziUBjKjAdeuuDYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BPnJ1y7JxkNqwB5O9TwhT/tNs3RtxRBV0KHeFVtwlZe6+1lg0AksfSxutLRLNmv0L
	 N3d78EnC88eG/3JL4bizSLiZYlvmrLAzAZ8fOp045oSyr8ztO6Vr8pWtjlm6IYlkrO
	 TdjECDS9TGc2648yJCmokdHVF2Mbn3xW20JbtsX3Iag1vzfyjjv/RNoR8m4GVI+ol3
	 deFXdwLZEI8nSLI5yvVTMqeQkGBgT8yQATj1K+A/zvkN516n15frFK38NI8lh1SLaF
	 /P15qaRCPlW83UDp7p8ODwMKD+EfD2izKQExvFGtCMfy8c2AS0xoffxGehBk1xnpVD
	 3DIipChxDcYRw==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E5B817E0B46;
	Thu, 13 Mar 2025 04:34:25 +0100 (CET)
Message-ID: <7c39436c-3f23-41cf-97aa-06d9f9d20e61@collabora.com>
Date: Thu, 13 Mar 2025 09:04:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: mediatek: enable PHY drivers
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250312041943.25676-1-vignesh.raman@collabora.com>
 <5706c76e-7558-4405-a4c6-cab9cb5ddf65@notapiano>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <5706c76e-7558-4405-a4c6-cab9cb5ddf65@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_203431_993930_E6EDB5FE 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Nícolas,

On 12/03/25 19:55, Nícolas F. R. A. Prado wrote:
> On Wed, Mar 12, 2025 at 09:49:26AM +0530, Vignesh Raman wrote:
>> The mediatek display driver fails to probe on mt8173-elm-hana and
>> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
>> configurations.
>>
>> Enable the following PHY drivers for MediaTek platforms:
>> - CONFIG_PHY_MTK_HDMI=m for HDMI display
>> - CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
>> - CONFIG_PHY_MTK_XSPHY=m for USB
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Include board details in the commit message.
>>    - Sort newly added PHY configs in defconfig.
>>
>> ---
>>   arch/arm64/configs/defconfig | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 1f25423de383..87e8cbd3fd26 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1572,7 +1572,10 @@ CONFIG_PHY_HI6220_USB=y
>>   CONFIG_PHY_HISTB_COMBPHY=y
>>   CONFIG_PHY_HISI_INNO_USB2=y
>>   CONFIG_PHY_MVEBU_CP110_COMPHY=y
>> +CONFIG_PHY_MTK_HDMI=m
>> +CONFIG_PHY_MTK_MIPI_DSI=m
> 
> This isn't the expected ordering. I imagine you manually added these configs in
> the defconfig.

Yes, I added them manually.

> 
> To get the right ordering, after you've added the configs anywhere in this
> defconfig, do a 'make defconfig', then a 'make savedefconfig', and copy the
> generated 'defconfig' file at the root to this location, then you can add just
> this hunk to the commit, and it'll be in the correct order.

Thanks for the explanation. I will follow this approach.

Regards,
Vignesh

> 
> Thanks,
> Nícolas


