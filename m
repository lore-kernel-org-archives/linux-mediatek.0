Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD85C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6AMrm4HFPrlVZ3Tn/YDHJIA1G6uhpyJotuDWd7qSBc=; b=Ri0IneQrlrNf8QMvv9H4nXV9NT
	8EDkrI9LA7dJwzbTrLU6h+HXADNAyObG9BEpxQBBLbfg/Ic1c6CNX+8Wf0hullqxMzV05MoZQ5zAv
	+9A5dp4fnSrTn1iBja4Q3DBHph/9Opo8+aVU9eB4Ut+aQJ4aK7UVQu6NHZrDzkM5XcRZrP9m0itOE
	1qxXG0wlG6D3/IXj9E/c+aqspe/rZ7kd61LaWVIg4n+sCB7H2Upo1F0nNJf96s/4rqOUNitNGvMMA
	/528PSyJ6dCFUcncVdLOSa1+lVsBwNl1tGLSiGjfOw0D+emFX8ZfpzS57TWtdg0tMRKv52pZhZgg+
	eKb4PrlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZJ9-008wZI-7Q; Mon, 27 Feb 2023 08:56:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZHy-008vz6-3O; Mon, 27 Feb 2023 08:55:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F3C56602E18;
	Mon, 27 Feb 2023 08:55:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488116;
	bh=taQhUxaOsGhHCfOQ95dCcLkENRbmjmYKLoYAD5LNXW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gGaOdL5dKQXEAcGurCbekn69w0lAAUeW+kaXbM3b5k/JB6dftwOLovhfChJiIIc9/
	 wxTYv8hMF3ThFE84763OZI1+HB/yzrqfKyZqXcDWYCjJNtnQIj4Ed3WchjouLekcpu
	 SMMJwWn2eq8BD3h4OVvy6LGNnhNpu2rITZaFC5VlOFT1xRnvj0MxbG6e/9sSuTMjpj
	 7NgmWlS54202XIaKHwjNS49yp+DpTnv4w8dm7ffnAjn3RtGvkE1p+s9bKzeAi9vMqr
	 IsyeDtfbEsTk9KuQRbB1U93EGUcNc6Wfgu3iAQyfVdJcNSmnjLUkTSQgHKR/E/B78X
	 5IiAhx7uMNLrQ==
Message-ID: <867761ec-6209-b2fb-6cfd-0052698a357d@collabora.com>
Date: Mon, 27 Feb 2023 09:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] ASoC: mt6358: Validate Wake on Voice 2 writes
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
 <20230224-asoc-mt6358-quick-fixes-v1-2-747d9186be4b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-2-747d9186be4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005518_373812_339CA72C 
X-CRM114-Status: UNSURE (   7.74  )
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

Il 26/02/23 13:47, Mark Brown ha scritto:
> Currently the Wake on Voice 2 control accepts and stores any value written
> but it reports that only 0 and 1 are valid values. Reject any out of range
> values written by userspace.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



