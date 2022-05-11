Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B18C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zkmDn3JInIZ6VPD3CyS4GrsRM3p8B9DoPWZayR409UA=; b=ftJ1J4hz7oFYj1NPpdEYRE4duN
	gpV9RbG+YzpeR9AmNHsDz8bUebyFNUH73IWEBqR16iNj5EdOKMN0IEzIMIdrSfpUEtyxofTK7aX+N
	5kOTMnEoCsLWEV6ERlLKzxpAMhsR0UYCfbOMP2dYzygQ/qXNQPj1ztN2wDfW0Q7lYij4VOAGrzTUq
	7+FZopT2B1rlPwZVqO0B9kDorqOpL+tqixtvknsnzkQsmRteUjkvCggSWl/EetAZM0AwsMmM1d6Jy
	Bl8+lDks4zrkyuQV48ln5Vs30Wh4Z5aSrcUhnpI6LbrOhWIGgWR08vgfYDRRpDdeLfrVpKNVkZcbX
	Io44LP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nolak-006nXF-5I; Wed, 11 May 2022 12:37:22 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolaf-006nVa-OP
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 12:37:20 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id b81so1093639vkf.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=v9Th8rxPiWf3ZnzxeLk5F4SGsw0EdAo79OtQwsPtPNc=;
 b=qZGqNwBdtTPSsXJ4TudOdVSft1cn0crk+rUA+BXcaAtlIIcDlbrBzGZl1G6ZvqtL0/
 52aPzGjkDjxenmbtmqIx6HbPYriuF0amTOjLWM4rtPHVTv/9qzizlClERaRHxX71D0ie
 /JuDIGifRPC2mJZsXUpCyTfdP6nLePIyl87T0VN3BU/AWzRxgidSFlfa9LPoAfc+5GxY
 LpL/W8t6FtVAAJclUgCOS+NJAgUpE/918VqAruLfHfgduNmM7bpqSwYcGW0lFDx6KmLh
 z/P+C9mYP3Rw8n+JWR2eJ+XXz039AdpnO9kvyDW1SbdY7w98B+1jppF+iMFrluk/aUcT
 y8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=v9Th8rxPiWf3ZnzxeLk5F4SGsw0EdAo79OtQwsPtPNc=;
 b=kbKD9tZhFROE956ORQg70ALbHJ8Qqgz/wwSS+7C9tLjczOYt8JpyUBFQPhnD3QY+69
 XKzjlsVOtmNIF3z7NYqriezD26txbtOgXxI6jmRofuqLAss/6oFDzS9RqCitCsRUEOxl
 xv8c4JQlhZvdMXkDONq3JjLjVHyjPiV2cETuJp4hC7PKfBhNDIknTUfEnl8y3uN9wSoH
 JhAKkiCpXogubks87gfFjs9XhEmtaCTAsRuY1wnAVXCMCWbl0qA3v+CuE6nSCfv92YkF
 9U8RtdnxmMENpGuvPjtCcDOSdPFYhUiHe5iQboibqmUfhA/jrGR4rPSkIZ0ZXhn1rliw
 oq8w==
X-Gm-Message-State: AOAM531Ia7BM3GsyoK7qMtCC946dx9xybAiIf8sFjbYxn8xUnclfWew4
 kSQcQI2f0LmcBBWjRtZVKmF1FVitQd7ViygRG0GZMw==
X-Google-Smtp-Source: ABdhPJxBn9ixvONga67IFvsidm0urKpQCjlwF7V0itqftu5rkpNVWoXNuJCCn1qTxzlSqdUM84jEJ4VrTbu4KEramCk=
X-Received: by 2002:a05:6122:511:b0:34e:e406:a66d with SMTP id
 x17-20020a056122051100b0034ee406a66dmr14033939vko.6.1652272634992; Wed, 11
 May 2022 05:37:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 05:37:13 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-2-granquet@baylibre.com>
 <20220422105712.bdpbwliificvon4j@houat>
In-Reply-To: <20220422105712.bdpbwliificvon4j@houat>
MIME-Version: 1.0
Date: Wed, 11 May 2022 05:37:13 -0700
Message-ID: <CABnWg9uwMN6yK-xfCPtRsLif5yC7AU5b+OKc0xaHjLKzQ__gJA@mail.gmail.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,
 dpi: Add DP_INTF compatible
To: Maxime Ripard <maxime@cerno.tech>
Cc: airlied@linux.ie, angelogioacchino.delregno@collabora.com, 
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com, 
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de, 
 vkoul@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, markyacoub@google.com, 
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_053718_037396_AB169906 
X-CRM114-Status: GOOD (  14.90  )
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

On Fri, 22 Apr 2022 12:57, Maxime Ripard <maxime@cerno.tech> wrote:
>Hi,
>
>On Mon, Mar 28, 2022 at 12:39:06AM +0200, Guillaume Ranquet wrote:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> DP_INTF is similar to DPI but does not have the exact same feature set
>> or register layouts.
>>
>> DP_INTF is the sink of the display pipeline that is connected to the
>> DisplayPort controller and encoder unit. It takes the same clocks as
>> DPI.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index dd2896a40ff0..2dba80ad3b18 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -4,16 +4,16 @@
>>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> -title: mediatek DPI Controller Device Tree Bindings
>> +title: mediatek DPI/DP_INTF Controller
>>
>>  maintainers:
>>    - CK Hu <ck.hu@mediatek.com>
>>    - Jitao shi <jitao.shi@mediatek.com>
>>
>>  description: |
>> -  The Mediatek DPI function block is a sink of the display subsystem and
>> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
>> -  output bus.
>> +  The Mediatek DPI and DP_INTF function blocks are a sink of the display
>> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
>> +  parallel output bus.
>>
>>  properties:
>>    compatible:
>> @@ -23,6 +23,7 @@ properties:
>>        - mediatek,mt8173-dpi
>>        - mediatek,mt8183-dpi
>>        - mediatek,mt8192-dpi
>> +      - mediatek,mt8195-dpintf
>
>It seems a bit weird to have all instances of DP_INTF with a separator
>but the compatible doesn't have one?
>
>Is there a reason to not use dp-intf?

None that I know of, It was taken as is from the vendor tree.
I'll use dp-intf in v10 for the sake of consistency.

Thx,
Guillaume.

>
>Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
