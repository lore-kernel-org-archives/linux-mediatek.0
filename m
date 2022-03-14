Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A238C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exREo5KRT2EB3Ufl5w8ccCrL3r8TcwCxIjblTh9F8go=; b=UgH2FY0XnEryPj
	3Dvf92fci/gNnhe8u4b8pPQptBtLsH4AdjVkuqRSH7LMGs7xjua0CMsnPFMLk/LpNfOU78rR6ubkL
	ZiDa67mbsi059DXpTkyADiHwFEZ5lE5e67nPulno6R1M+koasoKxMrFY/sPBpcQYd4FJVKzrAAnYH
	EHImr4EQxEYuSPdDQTlutCPn0xvBX0MZUappv+Th6obS9DATpAtdGCR2j+/uM2D2lLrn3oavcNL+j
	xAg6v91bXarFsJnFMI5+1KNsVb2XN8TvpgaKuZJlkLP+YSnUGU5LyQNRgVIol9PZHoaLkYF0ECVyG
	YAvbj6C3o0q/wsMkqcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThmn-004uPb-3B; Mon, 14 Mar 2022 10:18:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThmX-004uJO-Dp; Mon, 14 Mar 2022 10:18:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9BB481F43E42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253108;
 bh=Xhm3zTCf6fMF/1xTFWS49KczB8qcaMTMqtJUqaWvAOQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HebpY9GHsh4/EF1tb4cHCYjdHjqFoVaMStCWf+GYjxlRAznKIX3amuZoiYtQxjE8M
 IIUk+s1KDRkDTFgsSTXfphKdFlww+OayPkTXu+Jf3EYt5xxqmqgguuIIvvuTOVcZVZ
 ln9nTOWYrtlF0uoLsEngQLKneKZsZQUE6nB4ez+0c6/gAsrYLdxLLcF9B2yaj47abM
 Qn150wl9SlffmS6MUiRrpGFpuTBJctTNO79R6IRtJtPfKlyg377hLtWqpE3kLermgu
 3YlGn4WBRNl4DkHPKZuUZmVqhXH219FD3YThf3h7kDgqzlJkB08my6jvOx9f7vHvdV
 Hx/+EuJRSsfLQ==
Message-ID: <5f79e76b-1333-159c-2dc7-0f7e8927e4df@collabora.com>
Date: Mon, 14 Mar 2022 11:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 03/19] ASoC: mediatek: mt8186: support audsys clock control
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_031829_637642_CCA1F52D 
X-CRM114-Status: UNSURE (   7.72  )
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 audio cg control. Audio clock gates are registered to
> CCF for reference count and clock parent management.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8186/mt8186-audsys-clk.c | 150 ++++++++++++++++++
>   sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |  15 ++
>   .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |  45 ++++++
>   3 files changed, 210 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
