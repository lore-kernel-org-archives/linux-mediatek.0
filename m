Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19054C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfZXVdNW0LXtwXyQfETCs56PLGkBPfvndJD9rvbklCw=; b=eGU8/fH91f76WiJ2n2wFmgfJt+
	yZee3SY2M+fkupy/67aHVhWX9amVVw3USDRX99jWUJts1ntCnk74puV7Y5H5VCd+zIKDshvqn+niF
	TflnSoJuMeejHsIGRyJiCuF0Hx4QETGBKHBNRmTe1rGqxWBytQS6+jOMqeNY511vVpkvsePrd9yiv
	JNEPcVvdU0AWaie7NXO8U09EiGWjpN5o93HSPGCaZlJtE1iUpv6YpF6dm5a1X2AQMPwFACkkdzb6a
	PO5i/r1kA9G3YDalSVqqujkSrWs87N2kDkJWgDaPbuXUtzT6g1yeLullPX1CTyPHWeeOBRCp9U0jT
	t+EqIwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw8w-0000000Cgnm-35eN;
	Thu, 11 Apr 2024 15:15:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw8o-0000000Cgkn-3JgX;
	Thu, 11 Apr 2024 15:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712848505;
	bh=JYFfYgPqUFb865Mf27i1hGQL9j2iqDH7TZlTJELDLRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FiqyGx3Bf9yVBYg3tO7PjAsHN5EgcUUShJZl7ueLYtfX3wIKj4COemgGompwfQ2TX
	 eHySSC4a5g6ktoxoKwTlQwUSaVxnkeM2+YjpgPMBGzdZ+tw+OnFaD8puJoF83WZvFv
	 uZIih6V4EqpdTio+ar1qzIHksWOsMgyMs+KZ9zSni+WsUXyx76Wxw3gzjrbUBxY2wK
	 AD/9E02Yb3pGjyj0wvWU344sMBSEs2AGalKt/0cEy145/bRHnMPcpB0QPvXq/SQx5R
	 62wawEgW8U+n6Zge6u6eY7MTPnSpU93xGj+HKdmFZJ4kRZxsNC1PVJYrE3F7uKmacQ
	 U0y7Lg45gxUBw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC7E037813C0;
	Thu, 11 Apr 2024 15:15:03 +0000 (UTC)
Message-ID: <de76dc16-8edd-4322-927e-61cdac374a3a@collabora.com>
Date: Thu, 11 Apr 2024 17:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] dt-bindings: ufs: mediatek,ufs: Document optional
 dvfsrc/va09 regulators
To: Conor Dooley <conor@kernel.org>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
 bvanassche@acm.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, peter.wang@mediatek.com, chu.stanley@gmail.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, lgirdwood@gmail.com,
 broonie@kernel.org, matthias.bgg@gmail.com, stanley.chu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-9-angelogioacchino.delregno@collabora.com>
 <20240411-oaf-stove-b291a21ef404@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411-oaf-stove-b291a21ef404@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081506_998755_D0E4B73C 
X-CRM114-Status: UNSURE (   7.19  )
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

Il 11/04/24 17:11, Conor Dooley ha scritto:
> On Thu, Apr 11, 2024 at 01:43:00PM +0200, AngeloGioacchino Del Regno wrote:
>> Document the optional dvfsrc-vcore and va09 regulators used for,
>> respectively, crypt boost and internal MPHY power management in
>> when powering on/off the (external) MediaTek UFS PHY.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> btw:
> <stanley.chu@mediatek.com>: host mailgw01.mediatek.com[216.200.240.184] said:
>      550 Relaying mail to stanley.chu@mediatek.com is not allowed (in reply to
>      RCPT TO command)
> 
> We should probably delete them from the binding (and maybe add yourself).

Yeah, count that done for v3 (tomorrow)!

Cheers

