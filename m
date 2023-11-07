Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F69CC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQsqtxYosU6HyXGBLELQCfBPJnWU4xSvZZFXry7PfUQ=; b=kHSo2llXuR7QZRDFL1XMQh4wuN
	SUsbixDQSAyVy5NgRvXQhj58HiXXhkd/PqQvhwTePkfkhwXcG6qfPg3FjZhmTKM1umIjnwfPw41o9
	dlsCPBX1O4m9POm/X/djuWW/PpNwQDIpsK6GLUfLCd/qOlNq2lctrD4Ba+to34++3ZBTv+FNhAZbN
	O8QyVzGedpO1SiexuMIyYIajk/svkUMET7+BjpGQzJQN9o/IuOs9l5H6XEP+QIeJFXiatlsQvkCU5
	PRlydvNCUvII3GTAM96W5HJU+8NLDcvhmyBR8hdRKShgkw6IoWlK2VAthARPE9WjaGjsrV5b4lZcJ
	y0b5vfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0MY3-001g26-2c;
	Tue, 07 Nov 2023 13:55:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0MXv-001fz5-2t;
	Tue, 07 Nov 2023 13:55:16 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 918F966074D1;
	Tue,  7 Nov 2023 13:55:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699365309;
	bh=gD0fl91BJJYK3GHx/hIeJyQppl6gbLh4shexoNrIjjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QcqO2yXYIc5T2HT+gxP6HwXtEnNzcgSallJ2Z8xbss9ad3Obsd56gxp1SL4XSWAR/
	 m/u+Tf8mmUlmyo54ve2QktQ/8pYP6P8ztKS5xp1IyH5bpaH4za2b4yzLvqMMsHD2gZ
	 fb0il/thr9lD59BBj4ldFbXxLD35eWQT/TOzE7QrnYwUfLEi0qV2z1qqmBPh5OUoFm
	 8ddaNcMnI1D/6iG5W0KRHjXMYSOKxtiTJg8/ro+u9725fzDb5n/QPg+I7gMF7fktZy
	 hGEAR+zGjS6XLQgvzuX02uRnO37PUtcHkGX9AGyyfe3dc0820XhDLIKubR0RauVm8S
	 ulKBYnU5r423g==
Message-ID: <3b440a39-593d-4426-8268-979d12ae36f4@collabora.com>
Date: Tue, 7 Nov 2023 14:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: SOF: mediatek: mt8186: clean up unused code
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
 <20231103095433.10475-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103095433.10475-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_055512_113405_6CCADC87 
X-CRM114-Status: UNSURE (   7.17  )
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

Il 03/11/23 10:54, Trevor Wu ha scritto:
> Since there are some variables that are no longer being used, we remove
> the code that was implemented for those variables.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



