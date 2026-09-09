Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E875EC79F8C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqxDtu8Gms4S6UEHSEKFRVpy3oSo1XkOOC5Q0etB/7o=; b=t5fX2pV5I33FS65DoMHu0pwkIp
	Jo222nG4+JtrlA/wAj4HUB9fMkeYzK6lVRLjE++JNiOd5RYRtT/WGBHinZu3KlT5p8+X4UIMKBAQv
	wUQRSpnHbPHhPVh9E2Mmo+y7ltYqaXAIiqcdQmXsMRbmkdepB2tbozcoWIKu+6Tf5jiGzx/Iv4IVb
	JZWSN/sjA0zpbpMFagJqI1EJFrMLazsTFyEAfKaAIy8KQtK6J9nVD4FTpxmVjmIqcyD1/xzcErTLu
	1tUvrnjuM4AyHnuVklJY9sLkD1Hv1Y5TpKe/L9iq7hwvibpvW8piIHNdcf3mtVNCY1MPNRhvPOebf
	cifNLVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EP3-0000000BGD4-2mls;
	Wed, 09 Sep 2026 09:15:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EOu-0000000BG8y-1hGT;
	Wed, 09 Sep 2026 09:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788945326;
	bh=IXDU44H7iXBz5xhc0VLgNZho3AMoaHwKjtE0AooC7Yk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CS4eFhy/9Iso7Tu8z6DW92SgFfW5ZwJay9upAv8jy9gY4bSqDPXBFVuZZCJwcc57i
	 1+mFIrL1X/A9jm6k2uyHxEIRbXcI6le//LBevRa4JjmGzmr9adiR54VONdgwvH4qsU
	 QFvtoen7zV43XdZH5hZ/pyLIGLBrsUW/Sj+rc1MPLfZz+lwv9otANk0hNCufyo2ePa
	 MZdVnZ3ppUY9GUOzCcZTHIsgO0uRL6EMqsBnwVMFaSoSZzUicUMSYUx7LapDHbLgQV
	 878xW4UyXv3SbHingQYfXS9N2mnI3QznuQ3nU37Qwj8dqzCz4TKgoK5mMMaIeCPFjg
	 HrecH4NbMHriA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4D7717E0894;
	Wed, 09 Sep 2026 11:15:25 +0200 (CEST)
Message-ID: <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
Date: Wed, 9 Sep 2026 11:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kees Cook <kees@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Douglas Anderson
 <dianders@chromium.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_021528_646046_FB608393 
X-CRM114-Status: UNSURE (   8.40  )
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

On 9/7/26 14:03, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling in several parts of the MT8188 AFE
> driver.
> Propagate errors from clock, regmap, and runtime resume operations,
> remove redundant probe error messages, and fix clock cleanup on
> registration failure.
> 
> Compile-tested only.
> 
> Best regards,
> Phuc

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com


