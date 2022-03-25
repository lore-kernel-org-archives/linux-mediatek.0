Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gESs1bm8Jx5pREbT1LcfGHQ6yghwQzA64Grc/Kkn1Ao=; b=Q5OotEVzfFQ2bPs20Nhh4q4e1b
	BtfDzuMPpHmf85dbQ49bQZGscaEqYzfk+EE2F1Qqib/cbv93pby1ijEUCk+i7t1Zeat4KftPAoaNv
	3s4C4W2krOD4ogbPHUW5s+U4/o5h8IXaXMcw2/eccieuNGg+2X4T+c+mCJIy50x5jKJsFhT0nfiRq
	bIqmKu4sMNDFdxnzNi2JQMwqw+tGDx2Yqn6bEGE0JErvfFonFawd5T7JQ1ldsZFgGblOhkC9V/tRr
	Zt4qxG2L38U59oGz+ERaRoqhmW7/KooyfWGbRyVxSlgJiBJYNb/Bf9MNO5sZhZV1QqSwuJMQ9yib6
	6yC+UUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnz7-002u7d-QS; Fri, 25 Mar 2022 17:44:25 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnyN-002tp5-5y
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:43:41 +0000
Received: by mail-oi1-x235.google.com with SMTP id t21so4031706oie.11
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=30HnVT2o3reQZo63OrltbI+OfYNP2j0YqcMmacNl+p0=;
 b=o7VUwpdrsAT9+dZRq7E7nbHA3vtSO4Zb3PikloQPss2pIBW60nVaMdcLkclXCSfOnk
 qc7wr65NRit/egcPCcwnvIO1UkzmSY6Y4QT+lq1OOvJ5uabY/EGOmhBRly02/Mg0Cezp
 ADk7WZJvqIptO8KeNhkNBRwb+TooeHesT6NVl7QZNmU5Vsvb8u5YtnNiGq3u5Egwe0fN
 dPHULLWMtNyj61PdB0ANxfFH34zk8E0/W84nklF85pqL4wjLOG8XC7d4JDJSLB6nlSDD
 i8SPNdLnNQI4Ydr1SM02AlPjMlttGqx++wFQJU+uRQhxQDjY1dtGeMBTNX+6OJaPgCz0
 +ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=30HnVT2o3reQZo63OrltbI+OfYNP2j0YqcMmacNl+p0=;
 b=lKdClNez9pwPR0EY8a0QKR/JvdhOI4IhhTe0Re884NIvC99BBO/nsqfNBUoIwdxyTy
 Arl4uZGs3S7VmmOkJurdnqikej4BFUSR7jXGkVTFdeqi/A6gRMvfJwljsTqUylZG3Lf7
 /UpSPnlhzCfUe/4rZALKw1Y6YYvZnLpIkXwH1y/vqy7Ce2EXJllVfRmUyO7ODZrT1hmb
 hHCDr4vBfwtSmHTdpjLZQDsosXve0TVACC1zXuqva254VzMtWSjVifnlTeJucIWQtO3A
 yoZjFO8W+B0xY3JE6HIYHxPTosfDtQaDAT9M3g6P3XmyXD6Gi1oz5kLUgUV8Qli0AQ/7
 aZNQ==
X-Gm-Message-State: AOAM530yr5qPHYH0hGTuleweGiscqdcsjDSVkAPxH/QXhs4ql+ZKWqFo
 B672KgcfE1o9AUuFkHDNlkGAgS+P9rXAhAsZaDjjuQ==
X-Google-Smtp-Source: ABdhPJzkv3FApupEr6ZcvHiyizzGLadsyrPXz2DnM470Hnd1ln6bsvI6D5r0lg6iZSsst6EnF/KlN2WTBVJUE+zMqsQ=
X-Received: by 2002:aca:1712:0:b0:2ec:e1a4:1ad1 with SMTP id
 j18-20020aca1712000000b002ece1a41ad1mr10538652oii.78.1648230216155; Fri, 25
 Mar 2022 10:43:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 12:43:35 -0500
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-2-granquet@baylibre.com>
 <8baedbe6-eb60-02b4-a6b8-fe3abc566335@kernel.org>
In-Reply-To: <8baedbe6-eb60-02b4-a6b8-fe3abc566335@kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Mar 2022 12:43:35 -0500
Message-ID: <CABnWg9s3vmpCFFai_BMjagqHehk2vbP0ST_tfWvOxmtubPm14g@mail.gmail.com>
Subject: Re: [PATCH 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 angelogioacchino.delregno@collabora.com, 
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, 
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com, 
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, markyacoub@google.com, 
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_104339_276362_948963DB 
X-CRM114-Status: GOOD (  12.89  )
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

On Fri, 25 Mar 2022 18:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>On 25/03/2022 18:14, Guillaume Ranquet wrote:
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
>
>This is v1, how did you get Rob's review already?
>

Because this is not v1... I'm not really good at this... this is actually v9...
I just didn't pay attention enough before sending the series.

What's the standard thing to do? resend with the proper versionning?

Sorry for the confusion,
Guillaume.

>> ---
>>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index dd2896a40ff0..53acf9a84f7f 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -4,16 +4,16 @@
>>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> -title: mediatek DPI Controller Device Tree Bindings
>> +title: mediatek DPI/DP_INTF Controller Device Tree Bindings
>
>While at it, remove "Device Tree Bindings". It's about hardware.
>
>
>Please also rebase your tree as you use my old email address.
>
>Best regards,
>Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
