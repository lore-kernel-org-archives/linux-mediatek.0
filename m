Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2701FC07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouM9NK6v7HXorjXI7uPiiL24rpA92ckse9JsdFTeSJc=; b=CqF3NDp2GyyI1l/1Onpdvl0zUc
	X7f1cnwX8+oFU8gn7DznS17jcpc7s71cE0bszpkI0Ey32SME/mVsfd5HBI1O3jD2P7CFmkQzLGdG5
	TyFqNlivkjDHfzSBTMejPxnwMRs8D7qUwXcleREidHgsYl5ySW0O4mkOE+A8ltlpogwIvRUXTU8qf
	NBzyYOxsY9T3Pmnyoh2MK08cmfZ5tG1OZtZrIXZF3g7BPjxgJBHHxdR26KqfJ8e0/KWTKHn62mYBY
	CzvmpgDzYeKk/jGLJSGkLDPkRst3SxwNTIwucnnppQxwXfCj4P3p6gIHTdmttNoqyEcP9mKHm50v6
	Anpl8DmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCnA-009BgL-0i;
	Tue, 24 Oct 2023 08:29:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCn7-009Bf9-08;
	Tue, 24 Oct 2023 08:29:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C5BB566072F1;
	Tue, 24 Oct 2023 09:29:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698136167;
	bh=y6VQewPIt6l+bjj3DnPMyynt5aWnCBl8s5jWO+bDUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRTXXfLVPezJQBP3em8vk4+lrxWFVXd5zmibFfHwIXDlZf39BQJN2dOLTfgIrgEvp
	 cVhfOszGsMBPHWlqYMva/TtD/IeXaQ5apoe3LG6eeZ+IfVD3SbjUllbqJpaBvWvO+A
	 TSSnpYz8XWANuuDznv25Syg9J76Sj32qvoUw/spfCsgoeVmroBv2ah48ACzLnJMi8x
	 tAVUqh3dspHH3CtjMnX1LX6S9UFxlRv2r2mWgjL5kQUPc0TLd/B4ef6bCOIO/P7s3i
	 FyIZPtXXG9xY3Armm3LLkbtWhI211fnYYNfpYM16co2gtGy6LVNYYZiwpp10K+y9bM
	 d8BsI4F+bDt6A==
Message-ID: <624ec4b3-1b0b-4880-a0dd-2379d3c3d0c0@collabora.com>
Date: Tue, 24 Oct 2023 10:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: mediatek: mt8186: remove redundant
 assignments to variable tdm_con
To: Colin Ian King <colin.i.king@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231023151704.670240-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023151704.670240-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_012933_231018_C9D11A74 
X-CRM114-Status: UNSURE (   7.24  )
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

Il 23/10/23 17:17, Colin Ian King ha scritto:
> There are two occurrences where variable tdm_con is being initialized
> to zero and the next statement re-assigns tdm_con to a new value. The
> initializations are redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



