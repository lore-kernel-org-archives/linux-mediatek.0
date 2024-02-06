Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678AEC4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAh/Xln+YAVG5lL4JB2QuzaRVGDziorbg6WeqhL3icA=; b=Gqi37Fs9++uZYpFdjo2NKvLvrL
	FMbHw0T9KgHlrsbzGGdCmg2FhOctRqo0HtHGp/MVVNxiPVBtZpO2qZqtcwb82BL2MfBH/i7KSUjcL
	rMlgkMyFIS2P6ttnS7DyG7BuxIW28T8SlNaqPCk2tkmTZphkOXyNDgBg/GGCeykAqHilF86NY4Oxt
	wKgbKhP4SHUjzmdK9JmbkLacrRNfjVSRzZ+pHlJNgEO4eiK6gmO2eCcc7K8Rl7YmZD7Z4pV1CQKQn
	i4JdOVnjqGKQlVI/QQuhli8dUszgzFGwYQxH+DISaIaLWaRzpw6/S+EGvmDSnMvPkn6/XyyW+8I3a
	xcmD8EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLTp-00000007iQd-2Iep;
	Tue, 06 Feb 2024 13:27:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLTn-00000007iQ7-0X51;
	Tue, 06 Feb 2024 13:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707226033;
	bh=hQ+QP63TDympmBm6f1787+x8JkcNvVe7bh5SVgAcn5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iYWDzEEnv1nWRcUIeci/q5vSYZZ9aUERduKYgiTOqA/Kd60fzZRLg84hRqzdEewZh
	 ZFSXZPdOHreGQCVnMMudxUFLJuT/6V+AA7WialF6TuGeV0lUtV5I4f1m0k12ipSrSJ
	 pzlUIjNbWWX2NDZSwoXRuOZqLwWhQ8Kc90oohMV+Qw8dXBoD/1ZDLkiv1WuR6vBw6y
	 L63+4nUOmSSH4qTZlG76DWRn81skPu0ZaCKYI2MclYNREMPdHmOjc06yGoWq8UZi93
	 I+KNZaAEroMP2M5BNfaCtvpHpZuNUQQGoidab5TVMPXbcp1k+dgsoRF2fXCWfbjzdU
	 i4HRrDMGCssEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 69A233782072;
	Tue,  6 Feb 2024 13:27:12 +0000 (UTC)
Message-ID: <4fe9947f-b190-4dcc-8d1e-f532e6dcb827@collabora.com>
Date: Tue, 6 Feb 2024 14:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
 <20240131113434.241929-2-angelogioacchino.delregno@collabora.com>
 <082bc4d9efd0746d7ec25eab0b3bf96018e997e5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <082bc4d9efd0746d7ec25eab0b3bf96018e997e5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_052715_328425_CD453731 
X-CRM114-Status: GOOD (  14.02  )
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

Il 06/02/24 09:57, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-01-31 at 12:34 +0100, AngeloGioacchino Del Regno wrote:
>> Change magic numerical masks with usage of the GENMASK() macro
>> to improve readability.
>>
>> While at it, also fix the DSI_PS_SEL mask to include all bits instead
>> of just a subset of them.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++-------------
>> --
>>   1 file changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index a2fdfc8ddb15..3b7392c03b4d 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -58,18 +58,18 @@
>>   
>>   #define DSI_TXRX_CTRL		0x18
>>   #define VC_NUM				BIT(1)
>> -#define LANE_NUM			(0xf << 2)
>> +#define LANE_NUM			GENMASK(5, 2)
>>   #define DIS_EOT				BIT(6)
>>   #define NULL_EN				BIT(7)
>>   #define TE_FREERUN			BIT(8)
>>   #define EXT_TE_EN			BIT(9)
>>   #define EXT_TE_EDGE			BIT(10)
>> -#define MAX_RTN_SIZE			(0xf << 12)
>> +#define MAX_RTN_SIZE			GENMASK(15, 12)
>>   #define HSTX_CKLP_EN			BIT(16)
>>   
>>   #define DSI_PSCTRL		0x1c
>> -#define DSI_PS_WC			0x3fff
>> -#define DSI_PS_SEL			(3 << 16)
>> +#define DSI_PS_WC			GENMASK(14, 0)
>> +#define DSI_PS_SEL			GENMASK(19, 16)
> 
> The original definition of DSI_PS_WC/DSI_PS_SEL is correct in MT8173.
> So both need two definition and let each SoC select its own definition.
> 

The additional bits are unused on older SoCs and, if set, will be simply ignored;
if we want to prevent setting bits that don't exist on the old ones, that should
be done as a later commit introducing SoC capabilities for those and when the new
capabilities for the new SoCs are introduced anyway.

As of now, this doesn't break anything.

Regards,
Angelo



