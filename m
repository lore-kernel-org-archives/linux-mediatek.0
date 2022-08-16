Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3BFC2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqC442gUt75HWeX2/Iph2kFowIDYl/zz22KjOQdXAlc=; b=yicWbx0HwFMVpn11q2uaTICB1m
	zl7zR7M232qTB0tgX2WsPhRzYR22LEHcyqrZrenkmVxQGvoxCeoJObDN1H+30I9w0nKBwVwxpaNaL
	bOU2NodOXbf2sGBWqEVjtU5U0DdrXGcDtLBhfuF0lABwD164PVD28OuJBeZhUKb3jFnLuaZoL6xAU
	l09ttq8qBk+FKliuxlQMDugQ/1PrlSA3BatlATEJxlGVxB7eOL+5Qowiz7Kr+0iY4oeyR496nC1rQ
	j23e00G9CvnImdheHgM8mO4spRxkWjbUMhUlarZ1qGEb/0Pelm9UH7xZHQPfdvARAi9cyl6bYN00C
	4G/2Q8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNtCV-000UG2-6v; Tue, 16 Aug 2022 09:49:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNtCJ-000UAl-G9; Tue, 16 Aug 2022 09:49:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 76013612BF;
	Tue, 16 Aug 2022 09:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89368C433C1;
	Tue, 16 Aug 2022 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660643357;
	bh=qhlPUMRzP1URLEWjxdv/4RbjfeJ6EtQ6TbWVy0D1eBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DQyUs0peFY8Ww+zsM3kmgA0sfw8rYI3y4bZOcrDwW4QJhrHJGMS+U7r+Bm4qHX9Wk
	 g2kwaozRfUtk1Ug+fx+Y/Q6C4gkVNoisU11JxR9nUjgnMs73AqIGCn5jQIgPjJJjix
	 rW/HpebVCkSKF429FQOBVFOxJtlTktzc65JowSu9/lfjEJm+ivdfO5bWTCe0YxDV2y
	 01wO206j0+eRT3F93KdYc/pE3JpNWmhRPkPON3qiBtcRRmY++qNoKHWBSlzk3hyZw2
	 vxF3g0nTAI1ZEmzOZ9qkFJY2+FnJW5EJcaKDWNY6gxzNJgeV8VhkPo8BfrbBQ44Gm8
	 C7tJv0v5FlVlg==
Message-ID: <0b17f336-5c04-e375-ef4a-3804f9702bf8@kernel.org>
Date: Tue, 16 Aug 2022 12:49:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add compatible for MediaTek
 MT8188
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220816065330.27570-1-Runyang.Chen@mediatek.com>
 <20220816065330.27570-2-Runyang.Chen@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220816065330.27570-2-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_024919_618627_53F5B70F 
X-CRM114-Status: UNSURE (   9.16  )
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

On 16/08/2022 09:53, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add dt-binding documentation of watchdog for MediaTek MT8188 Soc
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

