Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105EFECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuziE5q31bqr9f09MWfgZTfL1KsgRdtV6aUSKXLBmPk=; b=KcuyvBI1Url41TnxjY5S69SSdB
	HuswBqYaQBdcy0yHu9Irf34gZxZFbz2J5XO1Yq6mIyL4RzxqhprVEQnDSxLcT6M2R0Ty8qkJDLLwR
	dNhpq6hFwIu4MaBQugSEmQYTIq3RpXnYZpIDYdoYBEHb/7GChciaO6awc6EVFgcY6eGb61btppPqR
	2cehzwsNO5sd0YJ8f+yZYiVwin8pml2Yhr3PIP3KcNtxrPxmVDtIbip88JFOWGmYBjQ5PzTvr/9lR
	eS6M4U2QhADkXXHCFasEAToLI08tSrKCy7pB1kcKrJZfhvx4NVWf9bwFu/PU43tl5wWX2Rsryxybt
	ZmioqZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYay-00E1nO-1b; Fri, 09 Sep 2022 07:38:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYX8-00Dyje-74; Fri, 09 Sep 2022 07:34:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A7A06601FAE;
	Fri,  9 Sep 2022 08:34:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662708877;
	bh=5VvwnbXofTSVecEzap842tdZGEPaG2MhXLhAO0Qr1uE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DR8eG5rO8nqbt0vO7cWvvbgPnu4vs92+CAEGSKvmgoD7++/LVTMNQ2RjTJeUwl0fQ
	 bW87Q0NELXwTBKeKPx7pb41Lyrd71itLmxs+RduZqOaEMmvjlj6/l5y1ZV5p398kdh
	 o+1pxbi7K4y9rch1ufgvPVrWJpOh5yXwuwBZNYsyP7GFmUUfbd72x9yofdd6tAroyj
	 yPicSUfMmnR+055S1tCcFOi2sYENo8/aMVQRiuykI1vLoWPYckH0OHvWaXWTLskFqs
	 lqvSgA0MGZue42utV+SAv1KfyoXaz9gKzgbtYaHcqNGri0rrv1pgP6rLaVULDVAFz7
	 1lPmdZuUxJI4A==
Message-ID: <ecb5fb65-9e87-aeaa-48f4-f825646b5228@collabora.com>
Date: Fri, 9 Sep 2022 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 06/10] ASoC: mediatek: mt8183: Remove clock share parsing
 from DT
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003438_427279_33602DC6 
X-CRM114-Status: UNSURE (   9.56  )
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

Il 08/09/22 18:11, Nícolas F. R. A. Prado ha scritto:
> Now that the clock sharing for i2s ports can be configured from the
> sound machine driver, remove the logic that was used to parse the
> properties from the devicetree.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



