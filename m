Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D598ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jz5vm2YaapemwoSJhLba/w/znSz6qfV4EVBhxelwwNc=; b=F/NhaoPcJMAyIsdusN3/HaFUSV
	7GKJoaZhfFFnfNylY7ma3/9z4rQ7WJTO8I68WL8rC+JhveKldpV9JHXyHiES1Tvwqzk7BNfua+WmM
	LH4tDDsejs3Cp0oJ6AHst8zDu/oGcC7ujw5sFVEQHqGkmD+HZgldIPRpxTLhLkScU8M85NuLKdMWz
	pSh+1oDfy6Iazt0CbhjhyVkR8ArdHS0hrT54unu0xr5iqHNVWQtC3xBe2fNHDEGa6Eb6Ycm6Itq3m
	srR4GEUN/KABD7BcJ7ZJm8pJ59tVN1GwaXHLFujToM0N2tCZlwDzZa5UtCPTyG7FpynwlBHZj0jz3
	cZxwt/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaUQN-000ED0-Id; Tue, 20 Sep 2022 03:59:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaUPD-000DJ9-BS; Tue, 20 Sep 2022 03:58:45 +0000
X-UUID: c36b21e27d594c3e998d783cc38e2d6c-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID; bh=Jz5vm2YaapemwoSJhLba/w/znSz6qfV4EVBhxelwwNc=;
	b=cPWs2WvQKlXWgMXQZ7URz/5Ul/lT14pjEf+gWWOkQdamxn3288slKEjcVqOka4BIeFZNWdbGcKhyaE7dKyfVL41RjKGYxUn/A8CT5QODHZ2nsr9W/16dZmCM31ppcqfDP5bmo467xy/rhkCD3TlSw3YuA946OmMhnz6heQtDKTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:80fbe234-5891-4ce2-a3b0-e17d34cc2fd5,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:39a5ff1,CLOUDID:ea0c5c70-dafa-4a42-b716-cf2cd4845592,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c36b21e27d594c3e998d783cc38e2d6c-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 851872057; Mon, 19 Sep 2022 20:58:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 11:47:54 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 11:47:54 +0800
Message-ID: <42aebe49-1419-c474-ec7d-9bfcc15162eb@mediatek.com>
Date: Tue, 20 Sep 2022 11:47:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm: mediatek: Fix display vblank timeout when disable
 dsi
Content-Language: en-US
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, DRI Development
	<dri-devel@lists.freedesktop.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>
References: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
 <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
 <7ef4e4c6-e8e6-74a9-8211-bff90ad2d9fb@mediatek.com>
In-Reply-To: <7ef4e4c6-e8e6-74a9-8211-bff90ad2d9fb@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_205843_409566_F2B29556 
X-CRM114-Status: GOOD (  17.50  )
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

Hi CK,

We can use [1] in mt8186. Please ignore this PATCH.

Thanks,
Allen

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2022-August/046713.html

On 9/19/22 11:01, Allen-KH Cheng wrote:
> Hi CK,
> 
> We will test this fix on the mt8186/mt8183.
> Maybe our fix is not necessary.
> 
> I appreciate your suggestion.
> 
> BRs,
> Allen
> 
> On 9/18/22 12:32, Chun-Kuang Hu wrote:
>> Hi, Allen:
>>
>> Allen-KH Cheng <allen-kh.cheng@mediatek.com> 於 2022年9月14日 週三 晚上10:00寫道：
>>>
>>> From: Xinlei Lee <xinlei.lee@mediatek.com>
>>>
>>> Dsi is turned off at bridge.disable, causing crtc to wait for vblank
>>> timeout. It is necessary to add count protection to turn off dsi and
>>> turn off at post_disable.
>>
>> If turn off dsi in post_disable(), you should turn on dsi in pre_enable().
>>
>> There is another patch fix this problem [1], do you have any comment
>> on that patch?
>>
>> [1] http://lists.infradead.org/pipermail/linux-mediatek/2022-August/046713.html
>>
>> Regards,
>> Chun-Kuang.
>>
>>>
>>> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
>>> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
>>> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> ---
>>> Change in v1:
>>>   * Rebase to kernel/git/chunkuang.hu/linux.git, mediatek-drm-fixes
>>>     [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
>>> ---
>>> ---
>>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
>>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 5b624e0f5b0a..e30f4244c001 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -768,14 +768,6 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
>>>         drm_display_mode_to_videomode(adjusted, &dsi->vm);
>>>  }
>>>
>>> -static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
>>> -                                         struct drm_bridge_state *old_bridge_state)
>>> -{
>>> -       struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>>> -
>>> -       mtk_output_dsi_disable(dsi);
>>> -}
>>> -
>>>  static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>>>                                          struct drm_bridge_state *old_bridge_state)
>>>  {
>>> @@ -803,13 +795,15 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>>  {
>>>         struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>>>
>>> +       if (dsi->refcount == 1)
>>> +               mtk_output_dsi_disable(dsi);
>>> +
>>>         mtk_dsi_poweroff(dsi);
>>>  }
>>>
>>>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>>>         .attach = mtk_dsi_bridge_attach,
>>>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>> -       .atomic_disable = mtk_dsi_bridge_atomic_disable,
>>>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>>         .atomic_enable = mtk_dsi_bridge_atomic_enable,
>>>         .atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
>>> @@ -829,6 +823,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
>>>  {
>>>         struct mtk_dsi *dsi = dev_get_drvdata(dev);
>>>
>>> +       if (dsi->refcount == 1)
>>> +               mtk_output_dsi_disable(dsi);
>>> +
>>>         mtk_dsi_poweroff(dsi);
>>>  }
>>>
>>> --
>>> 2.18.0
>>>

