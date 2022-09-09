Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD33C6FA89
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOorifKUuuF3jBJikjo/KDQINnhIVd0pJBfnC2f61Ao=; b=ICw3akBV77MX08HNteKgSXQjB7
	t9GqWRlySVssTlp/cMcl0AVa0ueR37qM7kl1xKx8xtZqN1RdBI88kzIli1vg2whHn35GL5byOPNt/
	3Osk3xCLaPl25CxQTJDyfD0BQRUM8Er1Oj0GUF6sPVmTd3MYTxAtFND8cfmbOTu38K4vvVDjKQFa7
	FzMY+QoShbFHZ6xYuHd1cjN9AoXfW3PArJhUTDVw5CWzfkjw+TuyMHDeJepuXooi909q0h7vG+s21
	jDyILoOqC32EqCJ1cWOrIVW/3cJaVAHrTOuBuF1iBYWxzxNo3fNyg8sErYoWQo7ND5lO5SBTezWso
	jIFNjQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYYh-00E02t-NP; Fri, 09 Sep 2022 07:36:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYX0-00DygE-Ag; Fri, 09 Sep 2022 07:34:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 650A96601FB5;
	Fri,  9 Sep 2022 08:34:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662708869;
	bh=ah+w7LaAqF28DnY7d+1O80L02oQa2kje4Gx6qQdSYsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ey+7xPgFMzl9qr9JrKqDdeQcrF8IZRaHem5Dc5V3sD2Wxc4YSqGhbLJonnI4RXXDE
	 UvapLlMIsbrGYzPnW6+L5p3pyeZHFHJhDRd0IFIG4QC9NyiTjn9B2QlawGCnIofBMT
	 Vc6Xu70QJ1oqnu/nbJnQ94ub5PfnibWZekFrTFmr0fzZq/kXohO0GN+xeU0Cfcot33
	 S5OECCIXd/GhQPRzQFmImZ1rn2Kce92O11iGE5O0ZXKSt+y2itKyvx5qN5+lLpRHO6
	 mi5fS8R2ei4jsmZWQX1Ex1QHcQRsV+sjy3Bv+4ubWY6a7YjLSkytGWOyZb6IPs+UrF
	 rvfKlJ4RsFlVw==
Message-ID: <29b332ee-cef9-28af-8f87-00a2e7e37f80@collabora.com>
Date: Fri, 9 Sep 2022 09:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/10] ASoC: mediatek: mt8186: Allow setting shared clocks
 from machine driver
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
 <20220908161154.648557-9-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-9-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003430_526566_7C861D6D 
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


