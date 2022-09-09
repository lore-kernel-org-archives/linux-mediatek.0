Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A38ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuziE5q31bqr9f09MWfgZTfL1KsgRdtV6aUSKXLBmPk=; b=2vV+q2DS1kl5U/Um8GapF1DkDS
	257U67t2cZLzcvi2/fz5JYzT8paGzkSrw7IzRLpWYNs4/3ol20xORRl3MTOPEa9bZ4FDscEnhRPCT
	chRbVW+OIzYqonaWw61EExr3qXCXA1fy42J+dym+Cy6kSR1tRoHU0Gbapno1QAA316ZXtaiq5/R8h
	6D3fgp3fvTV2ZND6W4Rdnn8wetMZfGBEc945OCEUlBOVY8ROeHJ3BRhOrhUi4wbyKKZWbfe2SwUQ3
	IvcXgPw2nsKGUzxt+6yBRKjn1JFphnfD+JctOd64Y8+XcG0kEx6KCqEmrYAsJkgRcDVTWlJN6BPad
	BjowL3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYX5-00DyiK-CJ; Fri, 09 Sep 2022 07:34:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYWr-00Dycb-Pz; Fri, 09 Sep 2022 07:34:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A06196601F9D;
	Fri,  9 Sep 2022 08:34:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662708859;
	bh=5VvwnbXofTSVecEzap842tdZGEPaG2MhXLhAO0Qr1uE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lW89EY4aJ1eVZPFDlLcJbiY7aMi1pW1MfbFb5qV7LHA2vwyz0wB8tM3jLVkG9iJSu
	 L9t1WVM5JudnYNeflvKwmC9G1+DE7J4PPfHe3YGyXWoMIUmix6Ql8vFOPzeSVj5E1e
	 OLTqNqhyHrlK73YknZY5XTiZB4izUpq0RDvK/KCX+DAnIAbN92o+ARW5pTZ9doiTlG
	 V4363hwwUO/ftJ/EGyIJl6dMrzZi0Voce20DxA82Ne0jMmVUUFvnz/OH0DSwNcpXYR
	 S8mvOP/zztacZn5lUcS/niCQqsrIbc3L8vFbT6WCHQoBYCOs3bdnsI1E8k2ukwQCwG
	 KAh7F/sL9KYZA==
Message-ID: <fb1d20f2-2ea4-613c-a79b-f2d309943540@collabora.com>
Date: Fri, 9 Sep 2022 09:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/10] ASoC: mediatek: mt8186: Remove clock share parsing
 from DT
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chunxu Li <chunxu.li@mediatek.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jaroslav Kysela <perex@perex.cz>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-11-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-11-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003422_080002_EBD197D6 
X-CRM114-Status: UNSURE (   9.39  )
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



