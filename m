Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC558C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B4461D03
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B4461D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wm8cvKb1Y+ZF7s5PWDiFr5rqznSkHIKMbMmKC8epjMM=; b=2kFkNk48Bgmx9Me0bgffBoXzfX
	NHSAe1J5fjQfQNSNdyLiT7COPEP+K3S2YEvflNqtSV/peAS42nr0VhVOi2tQreFOYukd6qM/tRyU7
	vxUynRsHDMPP55BS1IJ+xYe4tUavJJk+DknM7mw+eVdQvVlZj76Ndo6SXSM+arAmC17NA8AO6aQh5
	a4RjNa0X/ik1qmFS7+1WRnD8aZMy5p3EP3FWa8QXPTX9aTSY8SDlOXcuKRi21kRn1jaW0gqGH8IVS
	6INxVQ0Z9k2c/+4lp7PBIPTNYdFfGubhWbTxQz1AwtZG8+yDWC5tnaMNjXOqOB4Z5d3GU8Xqv4K8b
	zYSLCApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUgS-00D3xF-6v; Wed, 30 Jun 2021 07:30:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUg0-00D3he-FP; Wed, 30 Jun 2021 07:30:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i94so2335123wri.4;
 Wed, 30 Jun 2021 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uoZ1WUDVsO5j3L2A6UWVibKKbNiZxvu5yviY4+gTGYE=;
 b=mFuTu8cYCRpK3WTmN3U8cUjLxF/qqH88tWNgT3OW99U+AP6Xrl5GcbQLBPRuI02ghQ
 +fKyCwn6cCcIg8JgusBRsQIlEfmRDD32UpKPr773y+SkvNwJEbxkrp8In/rjkbzoKPTN
 tSLZ53Y3dlSxpENFVCn5ry61XSWCMmMXaZBfnJdS6xBbSAbA1Wrab+QjsfjphzBYE2X1
 TYrsOdzSGE6p4OZKKwzNw3xdBglqqW3QttcTanSTWim8oOIGBaSi0XlXv4j917xaV8zg
 Zo3JTHDthJp5ttmbtZZwkhnKWCAiUUsp9XjsBNlRUnh0zIwQtmXD+B7nPK0tKR/mtcbl
 eprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uoZ1WUDVsO5j3L2A6UWVibKKbNiZxvu5yviY4+gTGYE=;
 b=gVWO5gGkbhlJevgkMAVPp7zljSY2CRk8UaY4PlZx5sD2HJsiqydwWqOqKkeaAhTTOX
 rH6DVjIkOHq/4eo8r9zWqKTHQ1Yb+bqxlZS9DvoH4BLllIqd1WOGDEcVFVBGFJSPldYB
 69XdTXECHLqQf5B2nFOiQ2ooQgo/YIjWbGV+fTBtzEnPiOcmRb0saXreBsY7pj6+bnwl
 NF/Pr2JkAxAfcCF1tMEMTTF+TpYAh/2kFDNrDsx1VMkPN8iuHUiWeEbH8OgKYO2vceMq
 OeflI3NVpnwjoLSfT3/QuaSblrqcQHjNLYtZuMKJw0bkUoFfSU7c+yIDx6h8twqvVMee
 aiow==
X-Gm-Message-State: AOAM530aqAue9HTQXRjELNgoDcFGFpNgqmoXgSpku2/rfIB5tEVMAPrx
 LLABXcvH3F7tTwAo6WncPpgrh2sycoylUw==
X-Google-Smtp-Source: ABdhPJyb2cGN1cO7izSl2X+8WDXgoRdmSnJOHMtU5fYrIdSIakCFTb4UVZ4YbAWEIt1l/VFjXEwrCg==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr15355083wrv.353.1625038225339; 
 Wed, 30 Jun 2021 00:30:25 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id 204sm20918177wma.30.2021.06.30.00.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 00:30:24 -0700 (PDT)
Subject: Re: [PATCH] soc: mediatek: mmsys: Fix missing UFOE component in
 mt8173 table routing
To: Eizan Miyamoto <eizan@google.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, drinkcat@chromium.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
References: <20210625062448.3462177-1-enric.balletbo@collabora.com>
 <CAOak1e_z2Mr-OR3+ECvA_6VToMVptGczoMwsWpfJLVvkvJsDow@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <57fcd8ca-68de-9fc1-35c6-1ed0da42ad09@gmail.com>
Date: Wed, 30 Jun 2021 09:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAOak1e_z2Mr-OR3+ECvA_6VToMVptGczoMwsWpfJLVvkvJsDow@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003028_621829_D6FBD1D7 
X-CRM114-Status: GOOD (  21.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/06/2021 02:16, Eizan Miyamoto wrote:
> Dear Enric,
> 
> Thanks so much for your hard work bisecting and crafting this patch.
> 
> I have verified that it fixes the DRM issues we were seeing on MT8173 with
> Linux 5.12.
> 
> Tested: Eizan Miyamoto <eizan@chromium.org>
> 

Applied to v5.13-next/fixes

Thanks!

> On Fri, Jun 25, 2021 at 4:24 PM Enric Balletbo i Serra <
> enric.balletbo@collabora.com> wrote:
> 
>> The UFOE (data compression engine) component needs to be enabled to have
>> the imgtec gpu driver working. If we don't enable it we see a black screen.
>> Looks like when we switched to use and array for setting the routing
>> registers in commit 440147639ac7 ("soc: mediatek: mmsys: Use an array for
>> setting the routing registers") we missed to add this component in the new
>> routing table, it was present before taht commit, so fix it by adding
>> this component in the mt8173 routing table.
>>
>> Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the
>> routing registers")
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>>  drivers/soc/mediatek/mtk-mmsys.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
>> b/drivers/soc/mediatek/mtk-mmsys.h
>> index a760a34e6eca..11388961dded 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.h
>> +++ b/drivers/soc/mediatek/mtk-mmsys.h
>> @@ -209,6 +209,9 @@ static const struct mtk_mmsys_routes
>> mmsys_default_routing_table[] = {
>>         }, {
>>                 DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
>>                 DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA2
>> +       }, {
>> +               DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
>> +               DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
>>         }
>>  };
>>
>> --
>> 2.30.2
>>
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
