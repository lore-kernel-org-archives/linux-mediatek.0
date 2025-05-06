Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C3C3ABBF
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3HhwL24gCp4HJq/1nlbAlN7LC6HzF57a+7QpGaCpLk=; b=sxkJ1aF89Vti/eGgs7GWvp/jzB
	K4w8MnEgteLddSxQij4f1kKubKiucKV+xOu4r6F9/zsD44h/74DAC11riMoPA+IGJKXklo41zG5fr
	rqARigMkY7vfiBDioTOpTzCkOZ2ohHYa6mgCvnM2AdujZTi2Nr6Ffh2nPaEfox4Y8c0FjH7ZztifZ
	23+ZeBNpST71ZN9sXDu/yXp5YANRVnl1IfnPJM7714JgX8482UNT/XI0C3KyydmKT/5UPAGlGn0CF
	0IKZNcNtLbV2iq2f89DRTa+GQHEM6HvE6Ucdw0OOlNKMjT2YgsCMIQ0YK3W6zV38Ca6Es2KVdfkD6
	YhrH4hqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCELT-0000000BIpD-0oCa;
	Tue, 06 May 2025 09:12:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDli-0000000BBNq-1emi;
	Tue, 06 May 2025 08:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520512;
	bh=BBvdAXMVgEYi0oX9WlS56l3+uwG46FFNRdWkyntyIAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S75PqnQON21L7VWvIiIoKVtbwBvSGSJicBXe9VfLej5E/hviUQSQb/dWf97hEIbLL
	 Iw6Yc2xRDhObkruFqOqgK/7Z4UZPdFNSMLF7m3wVmVOn0y9UdFulpmJAum32SuunFE
	 4qvMu62nRe/b/kzbMWexbKgACwk1TepUV5pY7ubnJp3PXFy9xWosNmboIF8FumCEnv
	 mtwme0Dve6DJbDG2Ao3XeMzrf52/DrA7LxUmadKtzO6sPB0fyD59732wCehzIx2nKV
	 zYUpmfbzDfzxjkIn8MtE0LFlQO39Lr0WVlD7CT9btgcPiJ3vUCPMd8d6yfqD9tKFzE
	 /KdO4ZeNUjKsg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5DA917E049F;
	Tue,  6 May 2025 10:35:11 +0200 (CEST)
Message-ID: <97ceba0b-2a66-4366-8d2e-34dbef0866ea@collabora.com>
Date: Tue, 6 May 2025 10:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mt6359: Rename RTC node to match binding
 expectations
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
 <20250505-mt8395-dtb-errors-v1-4-9c4714dcdcdb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250505-mt8395-dtb-errors-v1-4-9c4714dcdcdb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013514_608638_4F4C074B 
X-CRM114-Status: UNSURE (   7.61  )
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

Il 05/05/25 15:23, Julien Massot ha scritto:
> Rename the node 'mt6359rtc' to 'rtc', as required by the binding.
> 
> Fix the following dtb-check error:
> 
> mediatek/mt8395-radxa-nio-12l.dtb: pmic: 'mt6359rtc' do not match
> any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")

Your S-o-B is missing....

Cheers,
Angelo

