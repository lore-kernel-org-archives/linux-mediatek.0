Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F1C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sd+Fxwzp7bxeXD28OoMGK9mSgc3f6o0UFW/iNLtc8BI=; b=m9NcPIHB3xalI6YjEGekqLyfMT
	zwJqNptLEwTaFBBbJT+GgA+9vH0XmiJSqbXmbIJmxAk3barpEv/u8oJxFGcWJA1G/aYdZu/3vP4bR
	MvUqkth15bFiHqLoz4merHlorP7rMrTkjE/5T0XD4ifrycxy8qBuEc/zGGTZmFr0EYDFCtC4AYGSa
	t2pKOahXtrMrmjSG55rEdMt9mnWFfU1vR5irlId3gCHVTAbN5nqRG0bsKHLEHs1J44GqJfzQp69BN
	iSU3cmfz03jTsCj9PR5OAFgdDZq9CbRnrv0CLlDrccmSPDmdK2jaBuxhLXxmUEeDyWsn9VnxGbTuZ
	kr1xqSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaxFy-00Awd6-CY; Wed, 21 Sep 2022 10:47:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw3V-00APsP-4w; Wed, 21 Sep 2022 09:30:14 +0000
X-UUID: 4bb0a1b0ec9741578d550a4e843a7a6f-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=Sd+Fxwzp7bxeXD28OoMGK9mSgc3f6o0UFW/iNLtc8BI=;
	b=CSJ0NDh69Lvh5yBCzzowyzfIFyXDnRZHZRNlIM+MBi9VBvaGWgcYKzQBH+RFCya/JoFfCqcqM7i9sK3h48j/OUKz34g0rK4RBuQleK/FOJJcFPGDHRazq8DUVjZqDnG1iXUsT7mVzadY2A0aQ8i0tHiXwpA6gaGA1iEnJ7H4hds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:31b2964c-0063-4e63-b2f6-f723e3088fc3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:f73328f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4bb0a1b0ec9741578d550a4e843a7a6f-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1280906182; Wed, 21 Sep 2022 02:30:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 16:49:26 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 16:49:26 +0800
Message-ID: <0bf7b7d5-087b-912e-412e-2b3b742448bd@mediatek.com>
Date: Wed, 21 Sep 2022 16:49:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to
 mtk_dsi_poweroff()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <kernel@collabora.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jitao Shi
	<jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
References: <20220804194325.1596554-1-nfraprado@collabora.com>
 <CAJMQK-hOxxvkjgOxA6KLLUJxxBehHDQvRo-Y_FLMPLEfkoVMzA@mail.gmail.com>
 <227bce07-37cc-da1d-fc99-065a12cdf3f5@collabora.com>
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
In-Reply-To: <227bce07-37cc-da1d-fc99-065a12cdf3f5@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_023009_295373_EFB55629 
X-CRM114-Status: UNSURE (   9.36  )
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



On 9/19/22 21:32, AngeloGioacchino Del Regno wrote:
> Il 19/09/22 10:40, Hsin-Yi Wang ha scritto:
>> On Mon, Sep 19, 2022 at 4:39 PM Nícolas F. R. A. Prado
>> <nfraprado@collabora.com> wrote:
>>>
>>> As the comment right before the mtk_dsi_stop() call advises,
>>> mtk_dsi_stop() should only be called after
>>> mtk_drm_crtc_atomic_disable(). That's because that function calls
>>> drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.
>>>
>>> Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
>>> refcount, would only be called at the end of
>>> mtk_drm_crtc_atomic_disable(), through the call to
>>> mtk_crtc_ddp_hw_fini().
>>> Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
>>> enable/disable and define new funcs") moved the mtk_dsi_stop() call to
>>> mtk_output_dsi_disable(), causing it to be called before
>>> mtk_drm_crtc_atomic_disable(), and consequently generating vblank
>>> timeout warnings during suspend.
>>>
>>> Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
>>> a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
>>> getting vblank timeout warnings.
>>>
>>> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
>>> enable/disable and define new funcs")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>
> 
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> 
> 

Tested suspend/resume work properly on mt8188 and mt8186  .

Tested-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

