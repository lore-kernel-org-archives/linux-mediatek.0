Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793D3C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 21:07:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8CF8208B3
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 21:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzN/OVRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CF8208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4Aw/JJctteIdwZG56JA67bp5JmKzx+Xqic4FEixRUc=; b=rzN/OVRyzjxl97fcDeLSmKGic
	wkye4nWjVHxlek7i8EuFEPtwCk9oAXY1rWTS9Ln3eFlKCvFoihIV1moLsBCDSXOj/V4jebIUZbai2
	a7OlIfEvrh1gbmPgxbBZTUwJaNuIoZHWonk37PVBAQjMbHIPBbizHUOl8xuIcnNlbbQ7fvzdWMlX7
	qsYLpYkgukpVNgUG1XI8YyHwjzBj+GY1gTy4GlE0mN0IJSCWkJboRgVTjPzuXaPsbX9hzsKYnz/sU
	+0PomSkyv0CenYcld/6LKq29vDDL6ezulr+jJhtMH+FCpGjsgPQLNq9Asw2RZIFYs3TEsj6vr4jMp
	hxe6NsqVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHvgl-00082J-RT; Mon, 14 Sep 2020 21:07:03 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHvga-000805-29; Mon, 14 Sep 2020 21:06:59 +0000
Received: by mail-il1-f193.google.com with SMTP id s88so956450ilb.6;
 Mon, 14 Sep 2020 14:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FRJbFV8TtlGV/fuyCW0Lk1ZSMLH7Q700y+hxSQgxsfo=;
 b=SBGSHyOrMlucn/8aCvKP+/FYYVeJNJ03Y1Bk7DPqntFex0JWZ2Ka7z8NUrwwXmhNnd
 0O/lKbziakGUPO8/Fb/PJ7aLE7SjOsklNJg2S1rOwbV2H5rNotmZbPbTQM356hE7iwr4
 52WKzz1AAOXVd3hbvunEOsKkBg73QBnSjNJPDHEa/5DNu6exl2bfrflRfBiCxLuCdUcI
 dRol8MTsUFfq5qtIdBePY3m/wr8bBTuA2pnuslpE8iSfKyWd6/AdsLX9ptX+oqr2QBWB
 ycaF05qJ13FyurOq/bwlrAxKAQuePEqL1raq4OakdRrPFot2AOYXPfSORbztfqUrwqj5
 RcMQ==
X-Gm-Message-State: AOAM530R1OycOTPiNChAL3GBHfEw2c7U446HL7LP5osGFYkaDa63w7sJ
 1B3LGrscP9XKA/sItAAy5Q==
X-Google-Smtp-Source: ABdhPJy1UZ4bKOaDZXU8JkHivfNSgDajTheO8EfjgjoB1lHsSZqfP+N6vIe6wRPTQ8EPihst8YK4WQ==
X-Received: by 2002:a92:910a:: with SMTP id t10mr13679580ild.256.1600117611352; 
 Mon, 14 Sep 2020 14:06:51 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w15sm7488380ilq.46.2020.09.14.14.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 14:06:50 -0700 (PDT)
Received: (nullmailer pid 249445 invoked by uid 1000);
 Mon, 14 Sep 2020 21:06:48 -0000
Date: Mon, 14 Sep 2020 15:06:48 -0600
From: Rob Herring <robh@kernel.org>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: Add MT8192 power dt-bindings
Message-ID: <20200914210648.GA249407@bogus>
References: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
 <1599201895-11013-2-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599201895-11013-2-git-send-email-weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_170658_118017_335FF47E 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Sep 2020 14:44:53 +0800, Weiyi Lu wrote:
> Add power dt-bindings of MT8192
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |  5 ++++
>  include/dt-bindings/power/mt8192-power.h           | 32 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8192-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
