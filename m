Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC190C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 14:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCFB220709
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 14:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZoz5pae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCFB220709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ3TOk6+RLRcE4KZAPNXO2zmKDlYoOYRbQvlfL7EWWQ=; b=ZZoz5paeWRcdBN
	C7apgwC7jLPx9PZanilXeE0BbP7ddnBZG0Jj2AcIq/AhkfgN4kwiWWE66Hs/Dpfx6FIw7liYZqwGK
	+r2IccqMJRP8nJlCaijmo95qOOET3wLGv186Oy11IfNXEFywJ/SQw5XZM673ix/8FHmitmJa8WFHC
	eLHa22Z/afTytxgSf0/TZHaOsZr+BJEMXgrLoDOMRm3C9w3a0NURVqvlyMd1ioaeBUDb9ak6RSArx
	QA0e+n6OHu9cQ7B4wOALGfWo4EwhxR8+O8aEConOKjv6GCFxisBq9555M4r7Un0mwCwVvnVnJUEEe
	xSx/HCvMEQWzcQS/f0tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijOgw-0007Sp-2v; Mon, 23 Dec 2019 14:28:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijOgh-00076P-JN; Mon, 23 Dec 2019 14:28:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 8D11B292129
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
 <CANMq1KBHsc8oqcjWnjLPCpRToyOm16X6EcQqmqPjZf=D7wA2-Q@mail.gmail.com>
 <05db638b-02a6-0e3a-43ed-44a0a1458d87@collabora.com>
 <CANMq1KA4mp648p1LicOzAyra6tdgN2qdDY=N0XyDYhgt6BP26w@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <1c68fa67-c4c4-ea78-bfe4-6344799bbf46@collabora.com>
Date: Mon, 23 Dec 2019 15:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KA4mp648p1LicOzAyra6tdgN2qdDY=N0XyDYhgt6BP26w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_062759_792943_1D04954E 
X-CRM114-Status: GOOD (  15.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

On 23/12/19 10:14, Nicolas Boichat wrote:
> On Mon, Dec 23, 2019 at 3:10 PM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> Hi Nicolas,
>>
>> Many thanks for you review. Just preparing a new version with your comments
>> addressed.
>>
>> On 20/12/19 9:44, Nicolas Boichat wrote:
>>> On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
>>> <enric.balletbo@collabora.com> wrote:
>>>>
>>>> From: Jitao Shi <jitao.shi@mediatek.com>
>>>>
>>>> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
>>>>
>>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>>> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
>>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> [uli: followed API changes, removed FW update feature]
>>>> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> ---
>> [snip]
>>>> +       ret = i2c_smbus_write_byte_data(client, PAGE2_MCS_EN,
>>>> +                                       status & ~MCS_EN);
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
>>>> +               goto err_regulators_disable;
>>>> +       }
>>>> +
>>>> +       ret = ps8640_bridge_unmute(ps_bridge);
>>>> +       if (ret)
>>>> +               DRM_ERROR("failed to enable unmutevideo: %d\n", ret);
>>>
>>> failed to unmute? Or failed to enable?
>>>
>>
>> failed to unmute sound more clear to me.
> 
> I may be wrong, but I have the feeling that the functions
> "mute/unmute" video/display, actually... And that the function naming
> is strange...
> 

Yes, that's strange.

> You could just try to remove the calls, as there is no audio on the
> board you have (elm), so if video still works, maybe this is actually
> audio ,-)
> 

And without those the display doesn't work. So I suspect that what is wrong and
confusing is the message, instead of mute/unmute, and based on the register
names this looks more like an internal regulator that you need to enable and
disable, so I'll change the error message accordingly.

Thanks,
 Enric

> Thanks,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
