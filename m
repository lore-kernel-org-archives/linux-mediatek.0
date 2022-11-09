Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B4AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZdl+0FLMg/yf3xgqCfFIGQVJgs8SBK+W714oBVX+sA=; b=QCbJNv55e48dwmKDTJoHAGw1Ut
	Sp2coSjqfi4WSZOy06D/lsYWsrLzMoUZZagDNGUoPUm/Vg9Yq7A2b3HW+EZJ102/KLJlyjL9wup2h
	z4WIatoKJ5x3sFyyR19PZrBh6yhOcHseZIjztH79la3IgLuQamHO206qZy9tyXMy+DAfxxx6BPCtL
	JCSw+lsuZYwKex3cwoVVcct6H/xa8QQQdboyUZZsVnApJd8Qk9eHjPaE66BJdmuxM6/uBTeTWFxvg
	h/lEQoGvwJNmwpU8iPueQypGmf4QExyzAiFgyUfP7V+f+i3lCJkA9b+T9h1dGnv8IR1oST9MtQL/g
	wk4S1Awg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osh0d-00C8Je-AG; Wed, 09 Nov 2022 09:04:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osh0O-00C853-5q; Wed, 09 Nov 2022 09:04:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D1698B81D1C;
	Wed,  9 Nov 2022 09:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B212C433D7;
	Wed,  9 Nov 2022 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667984655;
	bh=dH7Ry1CIVTZgyI9KDAD7GwQOyjSCd95V0RbPoon0Nc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aX27582WOVXNU1jj0FQfgLz8r3Yp9vvPY4KtxtEXh+a/GDU3sWTVgpeZfpqnW4tdk
	 KOrP4RnySArPB0V2V28mCiKe+K55D28CiZTS89Ip0pGDJRWR9wrJrJ4I1GPclPgmZa
	 JUjxjOPw+yA06lGWQcbEnstdabNQB3x0VKGsKa6wgtYWtx0EmSCeky7MKrUoHXdKq7
	 am7b1p9AnemOG9o/u96or6eQEu2BWfDnD1g3Opk8Dg+TEINLXc93XQBLBJkYVZmouO
	 CPOvHn0hi9wsPA+cd2/k3DsmbcqiDDOLRF54HAoHUjLzM1y+NzizH7lVpGV0ZvKotI
	 AgZW7YTKiy3QA==
Message-ID: <5758c2af-c2c5-dfbe-c7d8-036bbdaf71c7@kernel.org>
Date: Wed, 9 Nov 2022 10:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 5/7] dt-bindings: watchdog: mediatek: Convert mtk-wdt
 to json-schema
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
 <20221108033209.22751-6-allen-kh.cheng@mediatek.com>
 <585a9cbb-4df4-1c06-ecfa-3b9442f1a5e2@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <585a9cbb-4df4-1c06-ecfa-3b9442f1a5e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_010420_400368_7BD2A3D3 
X-CRM114-Status: GOOD (  14.08  )
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

On 08/11/2022 11:50, Matthias Brugger wrote:
> 
> 
> On 08/11/2022 04:32, Allen-KH Cheng wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Convert the MediaTek watchdog bindings to schema.
>>
>> The original binding only had 4 without a fallback but there is a reset
>> controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt",
>> "mediatek,mt8188-wdt" and "mediatek,mt8195-wdt" Since there is no reset
>> controller for the mt6589, we remove "mediatek,mt6589-wdt" as a
>> fallback.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> As I'm put as the maintainer:
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Shall I take that through my tree or shall it go through the watchdog tree?
> 

In general, bindings should go via subsystem trees (so watchdog), just
like drivers. However this got Guenter's review tag, so usually it means
also an ack... Dunno... :)

Best regards,
Krzysztof


