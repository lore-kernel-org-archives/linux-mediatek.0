Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4514C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3PS8oCTC0T8khYPwT83Jj7kHLpgGcV6x5RfIeobaxmU=; b=Pj5wqJL7dV6EVWPdmw1LavIyoI
	taefevxP+IGk6ZzhZAYcEfa/e7jsUYHoKkTukv5Hvqryx5cQlb6WBNeDRdSgvENgN0sBZHGtQ7Hom
	Dc7oIdmpqwjFI07z88fWoQrNr0zlgVVR57yYo4P5zanEcjQwTBb4PxVxlEChzneYcQ5JVItOfSdZk
	lqvTRf+jDzwmIG0hv87kUD9pH34jJW4Dc2non9v/2JsoMPDXRRJaR1fSXiQxtaBU5NejVAJh3zC5v
	GCkrvDoCtAQUo9Du/HhdYJZYo9cR55x1eqFV4Vs+9DBHumGg7J93yLOGqMgNwtZgpivS9/z1RLL96
	r7xPm7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCLY-00CjNS-LO; Tue, 12 Apr 2022 08:58:00 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCLU-00CjJq-8Z
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 08:57:59 +0000
Received: by mail-oi1-x22f.google.com with SMTP id e4so18383381oif.2
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=4FpzyyLj/OdDU3ZmpUpstG+y8CAFSWZd/AR4b2PM65Y=;
 b=O4uumP51JcV7qBCLnK0EA1pkMY6sGD/pTvzvNjou2PgcdwHOFuibGIptBgZ3zJNPCO
 HNcpOraxajhSfH6FKpX+oohFsR9+cAmNzr3raUAIRjIXsDz70WJRGRPe0sBzCtIorZSn
 jwU9hlWq8nhRQgCL+0BDauOseU08SQ6kHBE39slH9gyCacBPIRunwbgJFwT4MEAkgB4u
 XOLgBEcCs1r6ODorwmX7IF0ZhAGaeOSeAxRCXAcIUN8mXCyKnW+FU3R/7MlScEWkf0VY
 ZvjB33mZDqS56xB5bdfVu9Bjy/qdU0l0vvxbk6G4z6AorUZE6E2dkUcfig1wxL70aOEU
 PS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=4FpzyyLj/OdDU3ZmpUpstG+y8CAFSWZd/AR4b2PM65Y=;
 b=DFskgT4XG5X8NJ5LLwHoy7ARYf2JSsiNlJ5vGlYNfqFf6D3iH8NuNhipaAACSpTsWz
 CqP8x77Hxy8Y0PQxpHsyp0yzzjXF6Xa7DRQF3AhhUqFL85Skku9Pe7NfH1i7BIxlp/jq
 Ecy0kpFEyz9J/7lZQmLW9I/uQfuUJKfnqhDBLQud453Cjqx1cWjKi92KRqezUQ8BWxBP
 Wy+loiBIVRnpxRDGrXjjdA9G52ZkIeyGeAP5sKgVNg1Rs8edWafv+SM7J/EWnDQ6CVqm
 X6mLNZObeZe7QiuJBG3wNiksz6jb9/I1O2hvdrnx2FUT6LSwxokzYuO+fdXW6LxA5WTi
 X+7g==
X-Gm-Message-State: AOAM5328ScsgOQ5hIwRY9WBRHQaBDRuzRT8DplMKtvn2ucVpUgNYE4zN
 7vL4xg9Ce73Q6QySKNgbF+2BAU35EkzqCGU3X5+vcg==
X-Google-Smtp-Source: ABdhPJyGsXSnBb0OrYJzuxK+lplYEUvtBMZUA3XN/6JoCjC1Dfht5xOEuqQ6v8izMrWtfTdYVEwhffLY26AWeFbXjVU=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1258843oiw.248.1649753874382; Tue, 12
 Apr 2022 01:57:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 01:57:53 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-5-granquet@baylibre.com>
 <0c523ad5-6a71-5c71-17b8-1f15c1860d89@collabora.com>
In-Reply-To: <0c523ad5-6a71-5c71-17b8-1f15c1860d89@collabora.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 01:57:53 -0700
Message-ID: <CABnWg9vxnLqAsoLOSHekwa9q3v=atLJEXpXADMc-bj+z1mkQHA@mail.gmail.com>
Subject: Re: [PATCH v9 04/22] drm/edid: Convert cea_sad helper struct to
 kernelDoc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org, 
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, 
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, markyacoub@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_015756_550472_35B6EA53 
X-CRM114-Status: UNSURE (   9.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 28 Mar 2022 10:04, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   include/drm/drm_edid.h | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 144c495b99c4..5d4d840b9904 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -359,12 +359,17 @@ struct edid {
>>
>>   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>>
>> -/* Short Audio Descriptor */
>
>Hello Guillaume,
>
>> +/* struct cea_sad - Short Audio Descriptor.
>> +	@format: See HDMI_AUDIO_CODING_TYPE_*.
>> +	@channels: max number of channels - 1.
>> +	@freq: See CEA_SAD_FREQ_*.
>> +	@byte2: meaning depends on format.
>> +*/
>
>I appreciate the effort, but this is not valid kerneldoc.
>
>Please refer to https://docs.kernel.org/doc-guide/kernel-doc.html
>
>Regards,
>Angelo

Hello Angelo,

Thx for your review.
I'm sorry I posted this v9 in a bit of a rush...
but I promise we will get there... eventually :D

Thx,
Guillaume.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
