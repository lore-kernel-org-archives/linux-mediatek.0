Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7724C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcQ4SCUyFb9LJgJUjn4/16IXq333L45dcmRwDGQHdv0=; b=rYS7YkJsFvt5lMzorwoe+bOpm5
	4xsrhdyId3IU/AwCS7ulalMha07AnyrYn5SqQbnF93sV2+cQKW8/yZdxk/6Y3W3Kb/eFuEKZzaqkl
	BBR4RkexoiwuNhmC/7YbhbEXli98bM11EvqPpm7z0ykf9AHxf3Y2mi5DOoYxuDi2t1Wrkp0cgbAVT
	tz1YSetULcqOeON9n8eLgGNOw6r/VobhOMcZjPC+5/nH8uDZRlfRWNLqkkv+Th3rublN0C+MoZuoe
	WymPXrVYkjjFtaNWvaQqBKlk0QpsiuddQIVabCw1WvKw6mE4dOQ1+EgtdGVDAlP1NJsk4kx+p+fIU
	wJ6Agcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFos-004UgT-GB; Mon, 06 Dec 2021 15:22:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFod-004Uco-SM; Mon, 06 Dec 2021 15:22:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D414B1F448BD
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638804126; bh=ux40/LC0D3LdxvH8CUOyRevnqGZQpDWpUZPhHgMMiiU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UNGhVTAxhT2aSUwjSANNqykn4+1GineOgwgoSHquBuYDW5iqjva5ToheZb47waOxk
 Tqd5NtT2NhHBAMAWoWhwRMERBN//nwuuewSMD2V6f/EOHffUZs43Bt9yBsGCgrDTYW
 w4Hh0SOKRfML6f5wtAIf7bOgE30QvCGVKpfxt87xifBuc14jj7GVMef9YCNWjhtFhh
 xp3nr5bizuUgCUlK69CNW595ZkFNsOUO/uqNbEQoax+qtsX1vkCPaMY8fz8PyZHhzH
 C46q+hPllY0i1z8AeleH1/vQh7mB2Rcrt5YFEg5wm6gSaG1aDiiClYMGlvcayEuykv
 /guBZe13EOy2w==
Subject: Re: [PATCH v4 5/7] net-next: stmmac: dwmac-mediatek: add support for
 mt8195
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, dkirjanov@suse.de
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-6-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0efc7cfd-f048-3c69-0ef3-5904c245f914@collabora.com>
Date: Mon, 6 Dec 2021 16:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211203063418.14892-6-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_072208_095279_142E580F 
X-CRM114-Status: UNSURE (   8.52  )
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

Il 03/12/21 07:34, Biao Huang ha scritto:
> Add Ethernet support for MediaTek SoCs from the mt8195 family.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
