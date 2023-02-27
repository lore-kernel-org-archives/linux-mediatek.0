Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15813C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNicUjWoB4ItErV9gI3XoXNNWnCCVwUURMMIFJDaOKo=; b=yeP7id9h7ReHF2Z10jyZYpUmDc
	NlNtW6qv0ZhMqwOaTqCmvprqarp7uoum4GCoBym2zlHMkojGzjTaEWFB306VL9NRNR41CjHVXmF9D
	NkywTpeHw0RyW/H3PCGWLM8VTdNMHwJCthrRZ/CqWi+3HPTMPlYd7Et2Yr/rh1GyOmpAqxcN9Rxrd
	sZJqb1Sw3PBTbLRRifjrAxaPKe5D9y0k8RgnDOhdfMaT8C11odo1oFo15N+kYZ0hr5BT88bPeLtn1
	WGJh+6bJE0aPe1HrjsCSeFnKJBRv3DYglh9w6AjAqeT4VIc6DD3of2zrPRQk4SJR3yKNq0pJZb5WB
	GPEwRcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZJW-008wpA-8d; Mon, 27 Feb 2023 08:56:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZHz-008vzf-FV; Mon, 27 Feb 2023 08:55:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAA256602E52;
	Mon, 27 Feb 2023 08:55:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488118;
	bh=Nabh2V3OhfcdWUDcOgtZ+8q4mnBT1gOqHJmj56Q2ln8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lAK/EojY2B0ppNnfEoiGIf9axgtiRFTXBhAKa2/osAwrX5sP6PdRA/Hv/q3mSeo9v
	 FcDO4DpeZlSS4Mo3I6myLQkVra0p7nTbp4juLNy9S3u5/ifgOMLudLfU+wxvcZPbeq
	 GjXAdxILZULTkUTUMLGnY2KBvWbZcD7hMdI0zzLGUEnGlLHjkdgjKyx8JHldeVq34D
	 MlHiq/GKV9nSAZTFJCu0uGFKLWAkbBze3Pm940zcYSuyVxmljSy1DwIKmbGq/p11+u
	 qxxnUfq3ewwFTW3+uuhXYsKS/Xi7bbfb9397ovnBEHvxk8HxJNBouItqpo0lXiy0rw
	 TEQKod/dDxN5Q==
Message-ID: <68feed7a-a416-c1d6-7564-173313792ff0@collabora.com>
Date: Mon, 27 Feb 2023 09:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] ASoC: mt6358: Fix event generation for wake on voice
 stage 2 switch
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
 <20230224-asoc-mt6358-quick-fixes-v1-1-747d9186be4b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-1-747d9186be4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005519_736864_D5CBCB02 
X-CRM114-Status: UNSURE (   8.38  )
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
> ALSA control put() operations should return 0 if the value changed so that
> events can be generated appropriately for userspace but the custom control
> for wake on voice stage 2 doesn't do this, fix it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



