Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8E0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NzeYvRw4L7fNpO8dmcSvKN24Vk2U4+6N9BaI/mIxSg=; b=H0opiIzuo7/L0+rPQYmghUrow5
	+3n6HvhXxWyVZgO/pd/DfbnSshctJUZAqA/MAV1owCTQO5M3rm9qGNfWrRtvmWKgmKSxbmOc1oWAI
	vpOgkW8yITe4Wl9OGE3tpQNpEsw3eqszoqFJTpj0tz9s73b8pcP6Ko5MbFnG8AaQcC8Q84ojeUOeV
	UhUuWJvQ76YkEnez60ra0efuiWbsl0zP4oMPJ3Qf90kupdIDf977LIBu9V6FpKopszo/2H5NvRrjZ
	MGZBaJZc45fqyauKgAenmlTH4aiHm63d5k8PgGtoenRUCExg+a/84+E57UCmBvU5rle9aGa0auHTs
	rqcLraew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpnU-0025sb-Ql; Thu, 29 Sep 2022 09:25:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpnI-0025pM-FI; Thu, 29 Sep 2022 09:25:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8446366022B4;
	Thu, 29 Sep 2022 10:25:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664443523;
	bh=qCJlWCzZUOjlbWhUBr+CjY4sGdMeJ1qenSLOO28pr3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LO/GFqKuGCASvKu0rA1gy3hLof1Q7Ud3Oy1HSNPRtfDtnfSyP/cg6zkjBtI9uJJmH
	 b0+rhEmqlTR36W5AeatLZSTYpKtwXueOCXLuX2OCLIV6oF2I7GwcUi+G5tPxzSS96P
	 X7mnXMU766MFUsCwZSXr/IUjvD++RJy3h4EtWX+2K7AMjNX4az3cd5GuhTF7dHv4aj
	 Me9R0v8J2MdFArLgh928AQzFcfbf8owpK8jUFt1AWSWmubcK6NIolsse3jgVf2cUiX
	 ETRIdFG9wb7rkFWn3sEj+7ar2mJAf+iVYgSPt9o5dF/tQnrhB/GzzNabNSLeAMRXgZ
	 5Q0ICPrtRx1Zw==
Message-ID: <aed50d17-3010-a5ee-a19d-14bfe5e6ac3d@collabora.com>
Date: Thu, 29 Sep 2022 11:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix spelling mistake "slect" ->
 "select"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928220417.66799-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928220417.66799-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_022524_669802_B76BBE4C 
X-CRM114-Status: UNSURE (   7.38  )
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

Il 29/09/22 00:04, Colin Ian King ha scritto:
> There are some spelling mistakes in dev_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



