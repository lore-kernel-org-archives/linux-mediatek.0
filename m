Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C66C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgsRJrBMtT7M2U5aGwPLnTmRfZteIubZ6kuZ/lvvziY=; b=H/QIVRyx1rmcK/k5SMXljZUFuC
	/KQHPGMyTC4yZ+MsZ6EoJh0BATdvd5f8w4vev4ZoibfEu5GS38TVor5QYQPoFDr+I4Yop/Fzu0qdo
	KLpn1hvvyjvLm7rI8TCBV7Icuf83YG0phLPQi9DJoQuQ6SopARbCJUAU9B5k9gJOL6QPW1P1DTIS0
	ighvApXfnypB/sQrjGEmz68MeooUhvw6M7FcYLC9YfrtWjIEhA5qBnmcvNArjMQq3H3Ue2V/xqI1v
	uIUuAYHEv3vJijo55D4vtTl0pcDHN+96b/CU3xZ4vQaVuSpx02tt3a+mWMYILKO2cmAbPSbxVRyh+
	FTPbBysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzabh-00000003sku-2JFI;
	Wed, 24 Apr 2024 11:16:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZUo-00000003cgQ-3Z2Y;
	Wed, 24 Apr 2024 10:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713953096;
	bh=Dttdz89FIcwSI+qU5QOqEj7dsUHDKBbSrFIK3xtH5GI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=0eGGlTX2P4iDYJDDhzfSb/E3Ax5+NobVXVUIICoaLko7Nxr5TajiNpS69ohdVVWIg
	 uL1nOqKdgQhj1JdK/yryl1h9Et2TgROJH7d/WXYUb4hkbAfm0Yk2HXrAi1vUHlp6r7
	 mgNm7rSEUfc88c5ZIWg3u5NaYmdbLC6tIav9PT+xLpRcYCJxOH40V4OGy+uRfY4oUB
	 BZX/8gKT3vWwKVo/mv+xtqlAZ5LJtfEpayziBiGqPjf4RjuYUETkAWBMw/iCQgzICM
	 N6inOyg7qnPxIHhNtRu28OADXtOwsuSx8eNfNVnwUdM6qoygiXp17hGVxsajvAmeVT
	 kDhuV7bAXSRYQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6882A378107C;
	Wed, 24 Apr 2024 10:04:55 +0000 (UTC)
Message-ID: <fd24398f-a915-4e9a-9c19-4eb644178987@collabora.com>
Date: Wed, 24 Apr 2024 12:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: mediatek: imgsys: Support image processing
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240424030351.5294-1-olivia.wen@mediatek.com>
 <20240424030351.5294-5-olivia.wen@mediatek.com>
 <ba25cb7b-ff93-4fcb-b943-154e960d45a0@collabora.com>
Content-Language: en-US
In-Reply-To: <ba25cb7b-ff93-4fcb-b943-154e960d45a0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_030459_965006_9531FEC3 
X-CRM114-Status: GOOD (  14.58  )
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

Il 24/04/24 12:02, AngeloGioacchino Del Regno ha scritto:
> Il 24/04/24 05:03, Olivia Wen ha scritto:
>> Integrate the imgsys core architecture driver for image processing on
>> the MT8188 platform.
>>
>> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> 
> This should be reordered before introducing the 8188 scp core 1 support commit,
> but let's check with Mathieu before sending a v4.
> 
> With that reordered,
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Wait, no. Sorry. I just noticed that the commit message is totally wrong.

This is not a media commit, but remoteproc, and you're not adding support for
image processing with this commit - not in media at least.
Also, you're not adding any imgsys core architecture driver.

Please fix both commit description and title.

Regards,
Angelo

> 
>> ---
>>   include/linux/remoteproc/mtk_scp.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
>> index 7c2b7cc9..344ff41 100644
>> --- a/include/linux/remoteproc/mtk_scp.h
>> +++ b/include/linux/remoteproc/mtk_scp.h
>> @@ -43,6 +43,7 @@ enum scp_ipi_id {
>>       SCP_IPI_CROS_HOST_CMD,
>>       SCP_IPI_VDEC_LAT,
>>       SCP_IPI_VDEC_CORE,
>> +    SCP_IPI_IMGSYS_CMD,
>>       SCP_IPI_NS_SERVICE = 0xFF,
>>       SCP_IPI_MAX = 0x100,
>>   };
> 


