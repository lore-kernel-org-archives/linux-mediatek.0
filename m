Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBZTB9NElGDK9oKRNHiUvUGtI7SOuHLVlV4xFJg0gIo=; b=OZBpkg4RBaYezR
	gSOEUfayiqZyxosEqDXd2BxtOMXQebOoYRTXy6U6NmKTBU6BeXLMqLHjkYOUQvf+NZhSdm3r8JsRM
	Z8PNxMEACQ06ljS+mnrM2TST7etSQUuU9JQsPEFV8SW1T31ZOPqjC6NkRq4pEJR9aIZwoKBbWYN0m
	paM0rwWfq7IXseXYYUdCUFmvB7Cr7oydJO1sX9wDGD9E4pJKfTT5nveyVegNLR2om6XQgQm35j1dg
	i3LVAjFT7audFNEleBdJpWj3fqZMnagcWC3EO2WfEjp2karEBfOSjNUvH7vww1Md4vk092gaUnekW
	Yrbkf4SGPQ/3+GCLdJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdu3-001o7p-Px; Thu, 03 Feb 2022 15:20:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdto-001o0l-S4; Thu, 03 Feb 2022 15:19:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F3CBD1F45DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901591;
 bh=Y4Zm4KPyB1FOH77ABF0K2197miav+doaaGPC3u1pF5U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OmtdcCSb+NWBtEoOk+BBKVDRqD/brB5MQcY6Ib4oYAh/mDhk65lWIWIqj/ieBuv0z
 Nx6xv/YSQ377h9yqbZKrmtxS/TcWdnbBIhVHiQ3uIWA6+U+FPDqpi5xPIIWriXiQpB
 rLeA+yJ7fnQy3RWRWquuEJlvY2j/APVvS6jkJ7TogXmv/MlyggaqVVG6D5pYPG8t8c
 Om+R0riRN7uxkLGqGpExk/hQrKcX19Dr9NrE3tTF4R1hEw96HR31W8XCSKDV6B91IM
 g9r8IjsFDwGdWKJSJS8BSnOJ4dCDNBP8nNgoGizccZKl1m6fTv/LggURd+eezK+GaR
 OEppq7mfwakdg==
Message-ID: <90d4713c-cfac-3c1a-7680-d6a5f7d6ec21@collabora.com>
Date: Thu, 3 Feb 2022 16:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11,PATCH 13/19] interconnect: mediatek: add support for mt8195
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-14-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-14-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_071953_077072_84CD9695 
X-CRM114-Status: UNSURE (   6.45  )
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

Il 12/08/21 10:58, Dawei Chien ha scritto:
> add platform data of mt8195
> 
> Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>

Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
