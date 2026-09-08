Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6863DC79FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9ZB1spp3h7+CpcM3Fe2SJgsiyA6q6QfZSCOB8xwujA=; b=UjT38GOu79nGbmF1IoJxymmFd9
	BG+Zo70A+eyp+t7VuuEuekbuPdNT+0BGaqCo/u8TM3awmjI9JjWozE2JIgdyqAkH/aPzqQoZrcOtu
	aREGogKNxiI/c0bQst3YBaOuC/zrzOwd9850lbWnq9c0E7QHWJaiWPFYU0YX2jLUasdpLidFNSsDd
	1zwYVRtYR8R6YdFQv7yuMmqIjJaZt7kEdRdqxn3orSJj2RPV6AI2PcKKVEuWQcwO0cslP8h/XLQnB
	7IMhO4yeQ06kEKAOvlSUAnWP/Rux6D2UopeP1IqzKU+YuFx6CpmMFrvf4X5+J6nhaTipVk73g2+BB
	ZaemsXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3puu-00000008EPU-38lc;
	Tue, 08 Sep 2026 07:06:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pur-00000008ENr-1vDa;
	Tue, 08 Sep 2026 07:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851207;
	bh=5Jf+deF/Lqx2VHME5QZe491Y2Wh3liyfJzOwhqfDZSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YaF2+V0FjKJF8BjDjtN+258NuKmYLJSI4Yys6/ZGhFe7vrADnSaY6gNe30ffml8dQ
	 HbvFBALsE6cpmwy8TKR/QLeBUtuSeAMx6vTWJBSonjrJg4Gz4hjgy1Fen5CMB3BOQZ
	 MOHen78lIX4BEAXgMdvBJGXrrd/MDowrSLz1fY8Kah3yptF7WMwMqX3BTaFqoxYuWs
	 UR+1CNt8stA/vy1J8uMA0wQWK8WiFH56BpLPgfEjHEq2I8C/YTrMQczavNgVuSo6Bi
	 aqADMc4zKaetrAu+KyG7mC/qzyE1U6uHUSzB1gfc0xHuLXCKYn9hQOK4uFnLQS/D5z
	 dtddeLdwIWung==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5479E17E04D7;
	Tue, 08 Sep 2026 09:06:46 +0200 (CEST)
Message-ID: <14238208-7422-4542-b678-35fc322ff579@collabora.com>
Date: Tue, 8 Sep 2026 09:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Julien Massot <julien.massot@collabora.com>, Val Packett <val@packett.cool>,
 Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa
 <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260902193351.185771-1-l.scorcia@gmail.com>
 <20260902193351.185771-2-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260902193351.185771-2-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_000649_653893_34969FA5 
X-CRM114-Status: GOOD (  15.94  )
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

On 9/2/26 21:25, Luca Leonardo Scorcia wrote:
> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Previous version of this patch had the PMIC device declared with a
> fallback compatible to "mediatek,mt6323". Sashiko pointed out in [1]
> that it would have been wrong as the fallback device is not really
> compatible with the new PMIC.
> 
> Since the change is significant I have not included the Reviewed-by tag
> that Krzysztof Kozlowski kindly provided in v9 of this patch, I hope
> this is the right thing. I really want to get the bindings right as they
> are harder to fix in later commits if the need arises.
> 
> [1] https://sashiko.dev/#/message/20260820125850.3B34D1F000E9%40smtp.kernel.org
> 
>   .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 

