Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnJyDMsQxOzMmAKM+lWduZdl+8RjAH1vJnc2OJSjxBw=; b=OOfcrdjksYhTMJ
	wvf07PVO0I2GB01q8rO9u3MZeHMUzkbGBeGwglRLdMZSewrw48GMMXTLhNGWrVVCdDRER+8gNKC3L
	fH9Dv+XzLlSvZolYgXXj8KOMoDHDOjjYdCImHpJZw4ShcX/Dugzd870l0og3ZJTZDKygMNmNdZ3oB
	enh1qTLLZt/uz2jW59bZKS+3RrYo6VE2123vYRYh2Tx9kmWscGo9AZJzyv8FlZMRamC/r1ftZpUjZ
	ITH3X29tTOG97+Rnono68zS/m8+60k7VXvpqmwLifUi/eHRSJ5jC0Fwnu9yJrn/4f4UnQsEToVCmt
	FR0VSjr67NUDSfic4A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPM0f-002GqU-1S; Wed, 02 Mar 2022 10:15:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPM0K-002Ggd-Ra; Wed, 02 Mar 2022 10:14:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D18B01F44C93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646216083;
 bh=CRz1hl04S7o5hFhSfEJ8l4P0iLKv8xFFSD4PLarV2g4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gNDI0v4pUxf2bQQJJvn9Vuebv0Z+f5T03H5csv0tVva6ordHyKgokbRavmSAGxWjB
 q6yx+vho1qMuhf9ON8MvdKwYpQMym2QUm4x5r1ojCIxtMDHsf3gz0TNhiPlXYYW2+S
 L0tmUkYMfPLMxSsdfu7UM3UfmPPWxGEYfHiBJHNxzk0fUdSOVslyQMbgY0PxtKekkY
 SkqJ4uRpsKbbWLdYm+3pxEGbR/nOrRE4cjTZ/0jQkkFETbngW0F/nEyIZgK6/Ab8Fp
 nNw2adEw/r+TcioMZEFl9Lae5hmJyejfsDbik37z8fB/CAicFgN6Nu/HDOgowuj3js
 t3LhNxxJQVCpw==
Message-ID: <909f6957-86c5-1ebc-47b2-73085dd7399a@collabora.com>
Date: Wed, 2 Mar 2022 11:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 04/23] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-5-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222100741.30138-5-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_021445_088205_A16C7C4B 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/02/22 11:07, Nancy.Lin ha scritto:
> Add vdosys1 reset control bit for MT8195 platform.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
