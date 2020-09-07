Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8709DC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CEF207C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvCyNiAF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1NqE+sdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07CEF207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JQiC7MfzyzaWhPdgNqbc0nKD4hzeEuOfW3bxMgtg5lU=; b=UvCyNiAFi9oTr6iLM8SL5Bjps
	3eQBpMM+33cOu43SZ4VvgAU6vT6fauivwZv/g19IBZPSjd6dGlG8G0LZzyOJ5n1OjAR9X/2vcJpAZ
	jpMEn0bsc/7Neeh49abbHVHtcljxiwV/b3iRzR9umqBMVAyVtecV/ZoJI149FIuFgbMtEo+Gf78zP
	kqn8arlMkDGhyowjdHaD4gxWzvVCQVXQgC+yjazp/eD7PM2o+8RRsQVOUVjPDwk/24fkKBkIvPhJC
	Kbey/+0NkYGLUwA4YMRo7u1SNKCPY2eAzp6P8gC0jbKZPBRFiXADgaDEwFcoiPH1vwHvNdKt+xhrv
	N0yKpP4iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFE2V-0008KG-V7; Mon, 07 Sep 2020 10:06:20 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFE2T-0008J8-S8
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 10:06:19 +0000
Received: by mail-io1-xd43.google.com with SMTP id u126so13348148iod.12
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 03:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0OvTuxE+/iMswMQTjQb/bjlIs084TlMlRT8WNmVF+Y=;
 b=1NqE+sdR4ONCLnZ5XhFqnlHSfQVFov4iy/cT+yyxmAzy5+YCr/Ul9KigmS858zeHof
 veerpBJ8XhqPoT84DSedPKvLdYY3GqAGqRsEkjV+NU9bChBpBNA1NZNkxENzA7KPM1cJ
 YbNZSDGYeZOwNGjxpWRPNef161HXLK7nWTU8e4wLNPz62F/si1Y2ll6mGdGWppAmk1hR
 XDf6BujzOkpGItyYi/ysU1ESNG0WrA8+8+xAtGfGZlmB8cW9STc/iJZZuljVuRxIfSg+
 PhJx7H8iMDclSVWwaOTyu7KmLReNaaaD0MY9P/+s2Gt3YrLzIKH9AUN2tCQZJViElB9G
 Vc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0OvTuxE+/iMswMQTjQb/bjlIs084TlMlRT8WNmVF+Y=;
 b=KeCDBY/+tJRexQdHa18d9MEBKsvuyyB8NMDoFe8gwTmy6iYCnjLiPs/AsKWumfz6QP
 OnkD+CkEB0U5Uq5AXwYtAqZS3L2+pE0C7TdVDaktjLRg/dMmb24GAEwrPJKE+VlTUhda
 YBuHZGGsxUgOd06BAymn705is6VKdgpPFyJH7cd05dhkjrOwFZsKRjLhJ5/Cjo447R3G
 LwQDhE/nxlLmukn+GcicLzt4ZX6EEAy3go4vS0t++P5vpEZCEvu4O0QinrvlyVITY4C+
 abAdklWoOstIl0vERCEXIuH9W1NMaV2ATlqMkOuP/Hu2bOqr/UMBBLrc5oAv3DtP9bCI
 fbTg==
X-Gm-Message-State: AOAM5310jzsWAH4F08EcDoFLlSW+bFbIRvz52YCWKWCki6yVuHLJrFg1
 yZ9aa1mWkpMaBjIZ81Ft/2zu0Uqj9iJuO4LTZiEjTA==
X-Google-Smtp-Source: ABdhPJw52QuX8XyBkW5w5YSCJbnGbo22v3h5joTjE50AnRXJMICHttb6i5OzXghJCZwUuJmPrBvIE2wQCbUxcbTWSzI=
X-Received: by 2002:a5d:80d6:: with SMTP id h22mr2869058ior.154.1599473174144; 
 Mon, 07 Sep 2020 03:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200906151928.881209-1-fparent@baylibre.com>
 <20200906151928.881209-3-fparent@baylibre.com>
 <1599450232.27773.13.camel@mhfsdcap03>
In-Reply-To: <1599450232.27773.13.camel@mhfsdcap03>
From: Fabien Parent <fparent@baylibre.com>
Date: Mon, 7 Sep 2020 12:06:03 +0200
Message-ID: <CAOwMV_wXM9Tt-NhKQ05juvj06reD70AXUNzqWTEMeAgqcmnO0g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iommu/mediatek: add support for MT8167
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_060617_939074_A2A432C0 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: DTML <devicetree@vger.kernel.org>, joro@8bytes.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 miles.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > +static const struct mtk_iommu_plat_data mt8167_data = {
> > +     .m4u_plat     = M4U_MT8167,
> > +     .flags        = HAS_4GB_MODE | RESET_AXI | HAS_LEGACY_IVRP_PADDR,
>
> The 4GB mode flow was improved at[1] which has just been applied.
>
> If you add 4gb_mode flag but don't have "mt8167-infracfg", the probe may
> be failed.

Looking back at the datasheet I don't think HAS_4GB_MODE should have
been enabled for MT8167 anyway. I just removed it and retested the
patch. I will fix it in v4. Thanks

> [1]
> https://lore.kernel.org/linux-iommu/20200904112117.GC16609@8bytes.org/T/#m613e9926735d07ad004fddbbcedaa50b5afacca1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
