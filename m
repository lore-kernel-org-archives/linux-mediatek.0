Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D186C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFntV1bfW7JX4+UwQxyzMVXuGZ48jhWeHzoq8ru6h2o=; b=tLHqZk49Qp9ixQyaR4N8ymjKrU
	P2ncMzMt2Mi0RslV8zAZpL6N4zhfBKLYmhCvrSkpXNdCOeRBa+egO85HAuWJK1JcbmYDrRfn3gtpd
	O6lOphUnRT4SqZzDOdKx023+CMd2Z3jwLhEoUbHdSfksJ7eXBUVnm/EJu6A7vt4PJ9vztuISL/VCE
	02SokV7w7M2VQl370HtGjGP7MHpvGGgsdfdui4oxolP/V5H1KCWUYwYY84Q38UNRL2gyLV1tlkiZv
	9FBISNZBxWYenoLL4OJNZSTDIqwp6eRADoddDk53uEz9wt4UdGphfHF8+fW8/WDFzJrC1vVBUuCLy
	NFpNObpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDgD-009JKs-0D;
	Tue, 24 Oct 2023 09:26:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDg8-009JHR-1e;
	Tue, 24 Oct 2023 09:26:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C5976603102;
	Tue, 24 Oct 2023 10:26:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698139583;
	bh=x0hoEPrZVpDP8h39Ok3fCECmUX60IQWzTwTBbMbxSLw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Ce9179+qx9pPm44JUfD0tJRXYpicaelpwO+Odd61yCpYnmAZ5s9P02yZn5ttY+A6r
	 pCYS1artduAaa/0dE9tSDqjMf7pSaHXpmWNeMg3D2ZfQZXHujsHO5ISRxs7rGR/i+E
	 OfUHa22kpx1q/A1QwIIapWiQEFUBp/YWGMkAfUhaKxfdXuzdzAOgETnEhEr5fGqufk
	 QW2gIWyZMfQwE5Gjez6vguZJKU7iGitWb7of0eP32mONUEaHcIy1mu6ekaJ7s80mM9
	 fp4Cnk1nV6Tjx2Pv2gQtubXGK+thr1yqtk/s91r1LUoWjktfEmRBIMDgZanXhpEWIH
	 R1OyQbH721FXA==
Message-ID: <1b92e452-c325-4f6f-8ac3-22086c4a7b2e@collabora.com>
Date: Tue, 24 Oct 2023 11:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: mediatek: mt7986: drop the remove callback
 of mt7986_wm8960
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231024035019.11732-1-maso.huang@mediatek.com>
 <20231024035019.11732-2-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231024035019.11732-2-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022624_693596_1236AAD3 
X-CRM114-Status: UNSURE (   6.00  )
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

Il 24/10/23 05:50, Maso Huang ha scritto:
> Drop the remove callback of mt7986_wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



