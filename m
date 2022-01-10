Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2793C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JChGmS9Rk7vho3XbxzNCO+vCw5c6rp6UO5GtiKbFBI=; b=H7knQ1KHkQ8PeR2Xw5r1jwajyY
	ZL5Q/L+mszm5RHpYhQOkKrvzMYhmlJ/tm/gktBJ6zvbSSirmB2EGPFrz0cXDK15pHeEEZNSb1g7IL
	Tj8hdaS1JqxRFNhcIz8p+3wsmslVOMdUZ8YL6Z9CSrKUNc/p6+HQxT9DsJSkCyg5PmkO49ZcpzTnN
	RbGGltoiWFeWTXEn+//RhbxBrHLXtScxu42brvxe4V6fUqh5KI24pgErp8WtaTPqiNUSkyUjU0aLP
	tuDd+hEM+LQE4ElgKhWV+10exExQhJSHnRk5UfmS1/nR8fgeOSmTdBUtTrG13SK6aen6c2C8vnGQ0
	HTHU14fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wxJ-00CA9c-92; Mon, 10 Jan 2022 15:51:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvt-00C93x-8E; Mon, 10 Jan 2022 15:50:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 695701F431F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829804;
 bh=fsorzp0YVrrY1i4AgrQYCYpKgX6zUw3DeqZ2DK8mo5M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mvkffmslm8NRTxtMna6MbqSux/4MirI/NC5TDkduR1Xu+VXbacK9pzEjCdXaliV3U
 JFSpP7+MDRDh+psTEbUjYpwtk5mbdeGlTtuG/z6fXfO0C02xvw9bQBSF8vKZ43GaFa
 zwIwxdDWEAojpROlxo2xKAo93G2Q5XtKYlUj3ZiovIMP4O9FtEGo/ryB4GSh7I4PN6
 ueziIWHLa74FNXdtmpHv7mwpezMPjGJKJ1TZM1qkU41NJr9bB3Pw/P+uxTTzF/2QnX
 onnrDQPUXpFJa9u8AsvijARN0OJHWp0RHuHc+QgD87EJLrkpbd4qZ24EgAgSu0s1ZP
 TVCVXE7do22hQ==
Subject: Re: [v1 10/16] clk: mediatek: Add MT8186 wpesys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-11-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <26f4a15b-423c-ebc4-b50a-038cfb4b42fb@collabora.com>
Date: Mon, 10 Jan 2022 16:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-11-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075005_464322_B014C10D 
X-CRM114-Status: UNSURE (   8.56  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
