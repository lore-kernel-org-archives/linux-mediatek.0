Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3161C6FA89
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOorifKUuuF3jBJikjo/KDQINnhIVd0pJBfnC2f61Ao=; b=m2NKFgurU9KdKd1qamWLKzrjLM
	T94uUgDZ7SNlvF7l02MwU2+kfEvwLVHlX2mi15+FUO5OsFPGBIaJVWGLw5jCNrzAhSRFHdfscORVV
	q8ZCsWRiPs7W2Lq9v72J+ma0CSUD7U4Q2VeqF03tLMApMWbVdmw2+S5OqB+BKdI2w6+62xMRPdsBn
	Bu4OL5t6SGe2T7WDtTzM5VsYKaBb5ChNTvRtE0jxC8nlAZ4Le5WpbN33XmmrhXYeVp0FDnUxGRzTI
	32sSw1Unk6UO5o6qh6WLr1xE8g3s8E2SRWcIrwJeOFgf+uSJ9BXjzqmNEfqCjoAFEP8d18zLJvBjd
	TCKlOPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYZb-00E0qj-Et; Fri, 09 Sep 2022 07:37:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYX1-00Dygu-Kt; Fri, 09 Sep 2022 07:34:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6DC76601FAF;
	Fri,  9 Sep 2022 08:34:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662708870;
	bh=ah+w7LaAqF28DnY7d+1O80L02oQa2kje4Gx6qQdSYsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hSMjL05cktd3dA3ArbZ2KpEb9I5LRtTsjLI4sJFT/V9Vc9hq1BC8+5KeJt6OelSTk
	 9yK18IDVvdZ24w0tIHdqtNOAa2x6kRQGbC2xqY9oBlKpqU4jaOhpxh5epEyaR0A0TY
	 SKRvcsPqHwVj+VgpnPfMX/axKIHVsarMNppsD+bXq7xMBqJR1RstLUfuYTNHwIZeZs
	 y6+tjLrVzXByyRGF08EpIq3bRCd2P9RwZoTiSbwcYR8wf6JPea3n1Vh0qd8tGcWAd/
	 K0lHVZbSYTdo1SM5Z9wver5sCCSJ0FnDT2hwWCU7VKuuOuEl369zNYsoMTU3BOZDDN
	 u1VFWimaFNmog==
Message-ID: <b71a88e2-ef22-c015-43e8-096e3b838d66@collabora.com>
Date: Fri, 9 Sep 2022 09:34:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 04/10] ASoC: mediatek: mt8183: Allow setting shared clocks
 from machine driver
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003431_852638_03B91A5E 
X-CRM114-Status: GOOD (  10.27  )
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

Il 08/09/22 18:11, Nícolas F. R. A. Prado ha scritto:
> Add a new function to configure the shared clock between two i2s ports,
> and export it. This will allow the clock sharing to be set from the
> machine driver instead of the devicetree.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



