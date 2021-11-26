Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F04AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTDxBTg5WW/Dn2H4zGMJNGAD6M5pLLvQgDrMJ4MlO/E=; b=bzej2R8eA7yEpk7khH1rZ3QYkM
	R0eH0Loi/qSJV3ddizPrtQQCqQhiYet1Visn2vgULPUmRZhYnFgHiGHzfbr/BUAgAztsxkqrv/6pt
	2xLpMUyveh31GGEmqpxmfXn/lFqwFquLKi/FhVVZlLzGQ2OOGL+jw6G60Xe9B3FSUxiEtom540KwV
	q9GUmaZ4xfy8zhaAgcu+ugr4KN3SHCqyY0gJNLs2O76qvW9gMMJFpCfZSeUJafdQbwwKYvSI/nHes
	WuJFM/KMEVJb45kmH3zndayOkbYOOzekcqe2LaQ7wMe9eskWpx1Q3IOe4GjK3KMsotPwT7J0GB7dp
	cu/ZtTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXun-009o3Q-OW; Fri, 26 Nov 2021 09:53:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXuH-009nry-D7; Fri, 26 Nov 2021 09:52:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 792001F4679C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637920356; bh=J8iIrBEHqGRvAu0pRdEOnxWRHiYQBg+NSmXWzt0Ut7g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nfL0inx1Vr5uqHHJZ0LYLXwFzP9VEIotaqUxW4yLID8EW9kkE7I0v63OhaWOx94q5
 lMmHuK6G97iNSbyL2NNHxG8agCTKbdhXJGdrXR7UrCyL6TSdAIpAOw8kelaR/9p6Gx
 o6kIVqQ2re1RYbM1KuYWyON4rS+lh5qG/2RQUX2dVljCcQrV7rEaaQkiGhfgi7EqVY
 YQD1scAuJMLD81ZoSFSfkOWY8dfVyS6D/yhAQClcZvUdCVAZrmVdqJtAS1n2kbE+n6
 qEzoxgWs4f7m6EjUvJ/67I4fguEraR0zM1Pojy3bUrHlEehvoDTuA0dt9leQAzAzGI
 M8R72POuodYkQ==
Subject: Re: [v6 3/5] soc: mediatek: pm-domains: Remove unused macro
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
 <20211116025045.5401-4-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d5a7ab04-bc42-8897-d549-a759f97bdd5b@collabora.com>
Date: Fri, 26 Nov 2021 10:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116025045.5401-4-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015237_630663_5A8E8B18 
X-CRM114-Status: UNSURE (   9.33  )
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

Il 16/11/21 03:50, Chun-Jie Chen ha scritto:
> Due to clk resource data will be allocated dynamically by
> searching parent count of clk in power domain node, so remove
> the unused marco MAX_SUBSYS_CLKS for static allocation.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
