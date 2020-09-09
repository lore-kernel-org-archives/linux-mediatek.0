Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC86C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 19:34:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A63121D79
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 19:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gPfrQ75u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A63121D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j+6d4NYyHGij3E9jdFBJh5p5a1PPLCycGRNSXPU31m4=; b=gPfrQ75uyiYBX7jHChTQotpHZ
	OB6IiI/taEqeUh81jALlFWDk7K8dfph9Gx/01P44J2sHZBwWbQ348LkxGjzU450Woa9fw9vRYGBm4
	cHyq4z/Rmzuz7vmXV7Unc6gAvhwhM02u23mDRo1J9dUXVQIgosSr+1rfjqIFxVQNODoHy6Bh8Dbru
	R8Sz7PKcfROJ06mHo6sTxfLnS2ByZ9cnIZXm3uQyz8T2F7gEq96LZH62/tfUyWb7VyZaDfF2j+jcy
	5GY+USsW8htKkxyKMDsdPrHUDlT+EDYFgzQaVvdYbmzMtNJyfw3pkNrgTsCHwZzLVZyMtRKybmS3+
	vmMVICMnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG5qq-00068S-En; Wed, 09 Sep 2020 19:33:52 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG5qo-00067s-9J; Wed, 09 Sep 2020 19:33:50 +0000
Received: by mail-ed1-f66.google.com with SMTP id g4so3900488edk.0;
 Wed, 09 Sep 2020 12:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Sw9jWXv7ueCKGASAg1xofj4dYvmEqJQsQ3PAFeaA6O0=;
 b=AUaeUQTKrJ+wCvZXwjynIV2aOJdvdJMgBUOS5hzO1nD7R9YSg0qiniMd2rLoUkVcBX
 +h5pHzZ3EP9OcrfJeh5rBs1oFvD1l5lBZ+roVpUPUQ5GzhAKqS8Qko0Q/EPcqDRbt+7O
 m00UoHE0X6aOIyTWayAiyY9PQWpWFzWaZsrOmBr2o+vsRRCEwXAWUB6P4FBxxjhFxReg
 EWYDLIG97pNhUrBm844bzu+B8zRJtOq6mQ+JpUaUsNZx0JeepZBlsHToH3Kpm4AuzVlW
 oUajqDOlw+ypVFX7w8kJR6OLIuR/Kzu7AaxOIwmA9kUaVi2djmkckS26s8Xxw2wIVGL7
 2IMg==
X-Gm-Message-State: AOAM5315FFt3/ZTNXexgv44M8RlGjIdsZdMroOyLY0zcgCoyXxT9Oziq
 27Vn0rr8ZNzZ8ROnTMwtOTYINLYyoOU=
X-Google-Smtp-Source: ABdhPJydL+n5p7BlcUySs/kCrMXSVaq5M88wRrv1kwZpvcNlByzDTl2rURnTEE6Whm6aV3V+mEf4Bw==
X-Received: by 2002:a05:6402:1353:: with SMTP id
 y19mr5861188edw.71.1599680028975; 
 Wed, 09 Sep 2020 12:33:48 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id f10sm3805180edk.34.2020.09.09.12.33.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Sep 2020 12:33:48 -0700 (PDT)
Date: Wed, 9 Sep 2020 21:33:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 2/2] memory: mtk-smi: add support for MT8167
Message-ID: <20200909193343.GB15293@kozik-lap>
References: <20200906180938.1117526-1-fparent@baylibre.com>
 <20200906180938.1117526-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906180938.1117526-2-fparent@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_153350_336669_00EA9CD1 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Sep 06, 2020 at 08:09:38PM +0200, Fabien Parent wrote:
> Add support for the SMI IP on MT8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/memory/mtk-smi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
