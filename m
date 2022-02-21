Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED993C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuJQyVLLqfVthKzgb71RRyiSsKt90aLZk5f1qZ0/0nE=; b=V+2AEw4uvfIOXq
	lDxzho3n6O5vD88pWVB6VSLj3X8bo4IH3UN/XNoQyPZ+4zcbmgIgAnNzJavdeB8n4u7UduEZ1/YpC
	XOKcH71y6cxqFndOT8yhzdcW9JD7vgmRvNWLLGsTtHeJ1AJ8NTXN6m2XW2fcRSjihzdjhReWIDNHw
	5XZjsAW7DDAbMibC8o4NFcNuQTbpyqNSypSK/rVARPpVaSg4mAcvtSkEWes+QMwyx1UdT8PksbQlc
	ipjCC6zHwcI3SZLPBBwUdNx97Ok0yoWa6eGNn3t/+I3r9Lgrou4vALXjxlZ3ThHF0TtAam2DY7GId
	9kYHHHlO3HX6Z4QZOYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMAUR-006MMt-Ib; Mon, 21 Feb 2022 15:20:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMAUF-006MLT-Bl; Mon, 21 Feb 2022 15:20:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 055AA1F41EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645456820;
 bh=AEBHpU/YbpjVEE8sZ5e3auTLaK6lJUMCcaPJ3UkaE2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jZecYRDSM0F1Bp2byQMHOXaZ+4j0RYg3NQ9SGon82I9nC4mXy4ZC9g3Ko3n8Ulwnq
 IxwJhIh9bAvdLEqiiq/MwLRTYK6f3sys6ayrZi32wwZvjGYx7Gg8pJ4AhcEiFkIDLS
 85PS9J+KBAk/VtY2il5I5+/0AqM74nUwR3x/NKNYUuOY354iWDvKeqLwUTrT2CxhN4
 5NZ+dbKDh2ILefofSluV6/SVfbj62+cSIFIYqX/Rzt+qjBAHFp5lNElCRl4XicKtDT
 Y352CifU41aaojSbv45BlylJVUzStY1cXPklAKqXonJKvwuIPuBpT6qWNdEzIyjRU6
 4qviYDH4uqGXw==
Message-ID: <d4e27af2-0f64-9c7f-489d-0f7dfcdd9ee5@collabora.com>
Date: Mon, 21 Feb 2022 16:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 09/23] arm64: dts: mt8192: Add infracfg_rst node
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-10-allen-kh.cheng@mediatek.com>
 <c84ec638-3134-fc1c-4761-7f1ec8381a39@collabora.com>
 <8a3a6167450bdd51bdff2e9b12a15522a18dd38e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8a3a6167450bdd51bdff2e9b12a15522a18dd38e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_072027_594053_A714E8DB 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/02/22 14:05, allen-kh.cheng ha scritto:
> On Fri, 2022-02-18 at 13:55 +0100, AngeloGioacchino Del Regno wrote:
>> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
>>> add infracfg_rst node for mt8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>
>> For v3, please mention that you're adding simple-mfd to allow probing
>> the
>> ti,syscon-reset node.
>>
>> After the commit description fix:
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
> 
> Hi Angelo,
> 
> Thanks for reminding, I will update commit message.
> 
> Do I need to also change the commit title ?
> 
> Best regards,
> Allen
> 

Hi Allen,

Please update only the description; the title is fine.

Thank you,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
