Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FDEC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYSIFxWX6nXTZD0nQyfr5C81PpvoMsUkzUvTRYWGOz0=; b=LIdNMW9bSMpKUF00GJpT+rRqIP
	okJ25Nymh7v3Qxv4TpyHrqjRzHSgofSKL0EsDYBGGkPASHkH1cFUcSRk4ZxlvYMu6jZukzdXIzF8W
	PQsJf71hr9kcaP9yXF9C6EOIwRpAEqlWA29rDXkVYYkor+RrKTW4JRoI2ZMpToOEwhF1sq7qoWqON
	EtM7zb7BaKfOXUi0LERC2WRXpH70TyZ8+XyxR1nCN+OT5+Ht/65Nz0E65XmvcINpUkOFIt3hZdXwG
	Xell0Rrtdf9GW6EyLOMwXnDl8mOTtk9X+JKe06oJeHTB9GHgxwU7gqstaPDmYCX/MNvBirFntjiPY
	JRTWWGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxCt-00Cpg6-0O;
	Thu, 27 Jul 2023 09:22:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxCp-00Cpdo-29;
	Thu, 27 Jul 2023 09:22:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDFCB660702D;
	Thu, 27 Jul 2023 10:22:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690449763;
	bh=S/wbNwp3nrSfYIJnj3igDnsaM+YXoYwXtjo1HiG2GSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UeHMww9WHVwfwzRWImHwPNMGzQT6w3uY4WUBl3itguPwaAsQyhCIkLVcsr6LNGUCM
	 cq1yGASbKjo2bYM1LiERIssfgP8hq3Rnkk9eN+PkkH1jF+4uzTtwRcJhFvzPq/XI73
	 68Ht18QlmtjF18Y9oFcW+6fnDtO2Qcb2N4IskV8NPybKToDPUa7xmZgmjkm9+AAbTP
	 MP8lSR8AZnXzoMJ+ZbehchOXAn6ILdIo2KQN+XJCU8pT2F4ju7WbJd6dOeqifmBUvD
	 KvZDPQldI8hpv+rgj4FjSui5VWU82WzqMP+tDhn1Pc5mFERcn5wTnHgKyr4dLyVKG1
	 mZNkCK0gzT56Q==
Message-ID: <040c1db8-4ae1-2a6c-ff58-282ed938e565@collabora.com>
Date: Thu, 27 Jul 2023 11:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/mediatek: Fix potential memory leak if vmap() fail
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230706134000.130098-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706134000.130098-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_022247_923701_2524A546 
X-CRM114-Status: UNSURE (   8.12  )
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

Il 06/07/23 15:40, Sui Jingfeng ha scritto:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.
> 
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



