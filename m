Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CF9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ma57n2hovuMmpnMhw/nFuVFkbBpXdvxcVgqxJRuLZRI=; b=wGK+sLJRssT4fD
	nZwLoOF52VufMygtohBZ0f85p8dD9SUokFtC1ke09wn0k795pNbgXNtzmuMVhN1LpFxo7oTUVpGlI
	7EZczTepqfz8Q+h4jP80N8LXrvxmxUrC2T4hUSitNlde9xivTgNArR1LdHj4Zoj+XLMgYNTApvUBF
	K57xZH26bB1X6qg0j/9M1s/ZPAbJn8gAoFkkiqYx4KQL34YYCxRBPzXCgOvRtubehfufPNejR6dGB
	HYRrZCvIjKe+X2FXl72FGi6pYdzec4oonHoJcAXB+mXGbupIuZmoZ9CZmxPybjRiQaHY5fpQjKMoy
	oZQ4Tr+NINGHG3n+i9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbgoQ-000iDQ-Vg; Tue, 05 Apr 2022 10:53:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbgoE-000iAH-FN; Tue, 05 Apr 2022 10:53:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C6CB91F447BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649155990;
 bh=vbpJujH4YJwR8KBxqqHpYpR3xjSW2I3+dKENzMhmXpo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bQgisYcudgfxXVLV96zJHCYHmmfrOLvV61ygGV9/Id5oj1HIMKiMolrGD7QiXlr2I
 1JbjfvjB7eFW0kt2Zz3zuF08/KywQlzbF56SqgyfmuwVaA+UAJ4tCbzzyR2uSUsaKv
 pv+2iDrUpBwgxBo1xxrmf5ZkRjRiEWaD2VQiAhH6EMEI6s6SJHMyKLXoL8SZl9P+W3
 BPbwDERjNXU2OjAVBoraV3ETk8Elk4b2oUz3x32Bcr6i6ynrdKtlklxAw+8w6qZPkC
 H4vMOt585NWWGN5hqp7q7XZI4h0PzKBxYwggt5UDYVHGLvutWdHDrU+CWygNlRydB7
 HvpY8alUliJiw==
Message-ID: <c67bd1e5-19c9-55b3-5b79-e2e6ca0257f5@collabora.com>
Date: Tue, 5 Apr 2022 12:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/3] thermal: mediatek: Add LVTS drivers for SoC
 theraml zones
Content-Language: en-US
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>,
 Yu-Chia Chang <ethan.chang@mediatek.com>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
 <20210617114707.10618-3-ben.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210617114707.10618-3-ben.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_035314_766617_D7DCAAD5 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/06/21 13:47, Ben Tseng ha scritto:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add a LVTS (Low voltage thermal sensor) driver to report junction
> temperatures in Mediatek SoC and register the maximum temperature
> of sensors and each sensor as a thermal zone.
> 
> Signed-off-by: Yu-Chia Chang <ethan.chang@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>

Hello Ben,

are you still interested in upstreaming this driver?

Having thermal sensors is pretty much important to avoid damaging
the hardware, and MT8195 is being actively upstreamed right now.
Reading thermals is a must.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
