Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAF4C49EA7
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 19:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 094F3610C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 19:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 094F3610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNpgnGBgU4cRlq073PnXOjzCYcD5VCqj/hAku5IgGus=; b=sORDkIj86IUOQb
	Q6Y8u7AAlAWCdUGdJgNUhVM4RxVegS+5Ufu19gKmUEsaa+xWpHQcZeyzqcrjFv94BzTNs3dYjFRHP
	6cnJ3Q65TqHcbktDVU3urV+NUillmNR8Ou6k1mVUHi6rdxX2yiA0I1LjIDrt+Qpd6WoRCEK/vZRmG
	f6D2tPhUurbihiDAVuQMMj1X8kZiI/NunVwv6j8Ig52RumOxw1y/pD18Izo2XdpEbZ/eFzAGE2Y66
	WK4fK2PWbslTcOIDO59WKzrqu3kDwU77t6M/jLxFWn8WxOLWHyS7PPi6mwF42iyPj7gOl/HY0b6fD
	VFcZZlRtA1gGwU8aWttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwUzL-00G22B-Nx; Thu, 24 Jun 2021 19:26:11 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwUzE-00G20i-VZ; Thu, 24 Jun 2021 19:26:06 +0000
Received: by mail-io1-f50.google.com with SMTP id b14so9612108iow.13;
 Thu, 24 Jun 2021 12:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8eJH9Kzucu1Ik6hPDZiexVBLT3UFFKRlBapPfDjYMik=;
 b=B70UU/v6Nqfdm+K6oJtubHoXFt5MzwyfnawvgxH09NBPJth4p6ey4f0XEWFnucMX5M
 hwPUUxYtBADJNfwGfWz/eq4kuPwptZd/ptYR3N654VEuEqPsleCetdSSJIPRIhCvJx7j
 0BAExvpOnTxM8v2lqvru3hrqiuuUzwZknKuCM8jHPHlIe0M3MBp0RhnzRK/bZ2h2ANV8
 xfAoGBHijnPle6pKsYZojY8ODiSLMC8xktrudF85KOgRvI/n91aANpToELCgHCU/Z3Db
 R4GBd4q9qxBz7IIkqW0Eh2352ULUZVKVPO8nU/XPsZnxLg0ozpeHf2Op+0UI9un1KjRP
 xvmw==
X-Gm-Message-State: AOAM531CmIbcYtoO5iPntDIwGCwF3uuP8iJ7X9nDpupPyWiHjWCM33WI
 DqoAj9w4erjCI7yJadr5FQ==
X-Google-Smtp-Source: ABdhPJynEp8iidB0Ms4zMtG+7pm348cqKAyaVz5781K5HDDj72Nwl2G5wVst5E0aL87+JgqA7hhUsg==
X-Received: by 2002:a02:5d0a:: with SMTP id w10mr5971532jaa.82.1624562764524; 
 Thu, 24 Jun 2021 12:26:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m2sm2225616ilf.6.2021.06.24.12.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 12:26:03 -0700 (PDT)
Received: (nullmailer pid 1846282 invoked by uid 1000);
 Thu, 24 Jun 2021 19:26:00 -0000
Date: Thu, 24 Jun 2021 13:26:00 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-mediatek@lists.infradead.org, maoguang.meng@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 yong.wu@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: mediatek: Add mediatek, mt8183-jpgenc
 compatible
Message-ID: <20210624192600.GA1846233@robh.at.kernel.org>
References: <20210612031853.3115482-1-hsinyi@chromium.org>
 <20210612031853.3115482-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210612031853.3115482-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_122605_082569_19677C1E 
X-CRM114-Status: UNSURE (   9.50  )
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

On Sat, 12 Jun 2021 11:18:52 +0800, Hsin-Yi Wang wrote:
> Add mediatek,mt8183-jpgenc compatible to binding document.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
