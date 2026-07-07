Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4F8C43602
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=; b=aA+vnYHzWBZzBxnsOnthWT5V1U
	2LUu9r6tGLdiaVmQqoxfOQ01rkgAXYbviaC2bLppm2Qf5Rb/Yf47Gs30y4DIVSCq8SNfoUGobL5F8
	E4K+7o237HsseXjrCm8PbgeClNdotBeVZr99EYiJOu0NcmYwzCxRCKtuYpqYIs1SLX4X8eGdaR6oj
	FUz7k9DmA2LNaIRg/OLfSpKdNTFakqqYQug12clVhBqOdcklW3S46SJ6rj7dqqB9GctrZAgZ1nCzb
	Em+gnLpGWVQNrdofFIFYpTNBg/AeLr9aMooVE/1+lRrCWXjqNRwU3YW1s3VGryz9Lllx1W9y4VfI0
	nF5FADtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76T-0000000FD6o-3WUC;
	Tue, 07 Jul 2026 14:48:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76S-0000000FD5D-2gEg
	for linux-mediatek@bombadil.infradead.org;
	Tue, 07 Jul 2026 14:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=; b=KrBv1cwba2J69Ikxvwxru7RpAG
	HiTzPAgbD7QIhMqqIpqm/sGWBhrdB4ghO8k34oWM2nKEebvOWW9UFqxPS9RPDFonofyowO3OfQxhJ
	9sDu0hvEKJ4JEvK+oPoY4M1nFk8wJnXWBBw1/nihRsWoiftySviBmvUbjPIDH1SekEICHEy451nUE
	WJUa69vaqaopiw3ZhV/1slzG/eOKFwO6n55SVnfwluQA4S/54lVDrgrUu6BxY7Q63DkgVzjG4A7fS
	X6K2dV/0fVXiDgLlcBRDrjxf0rW61TdM4mwgNdCMVJqnF6atU9vOeC0SY4ZXNlu1eFjHv1StrVlVr
	Ewy/7u7Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh76P-00000007ZH3-3a8g
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
	b=D4RwYmFUqmLScJDTjhXOUfG2e0/0cE62nSuOrxBm/41rgYo3/geFnZ5kf0u7oSm6BTSNKu
	d8iLHjeVNU2mDIQV2DhMiyPv0shFnBgiZExUaF/WzwU0cDrc2RjxxzmEClbsZ+HexeMEnG
	zowZf/c1IpH9LoOthX4ieGaL58OijAs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
	b=D4RwYmFUqmLScJDTjhXOUfG2e0/0cE62nSuOrxBm/41rgYo3/geFnZ5kf0u7oSm6BTSNKu
	d8iLHjeVNU2mDIQV2DhMiyPv0shFnBgiZExUaF/WzwU0cDrc2RjxxzmEClbsZ+HexeMEnG
	zowZf/c1IpH9LoOthX4ieGaL58OijAs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-G6Y8ZdvOMc2-lK8sgiSEAQ-1; Tue, 07 Jul 2026 10:47:26 -0400
X-MC-Unique: G6Y8ZdvOMc2-lK8sgiSEAQ-1
X-Mimecast-MFC-AGG-ID: G6Y8ZdvOMc2-lK8sgiSEAQ_1783435645
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a17bd28f4bso6579850eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 07:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435645; x=1784040445;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFPv6f1DvPzvaf/+BF1GucAu1+JyaOuON0uoWlg9A54=;
        b=ZJCHkBZMjDTE7ScEJWNn6VANjgvVo3926j3LDZrImvhPEP+Ejkw5dOiyVsVNudQR9E
         3rD0cWYQlXmOdA2h86xk/sfwrY0kWjwdYxr+JlYLfpg/+gMrF6GvMSIbSeW8Sx+53wmh
         nOZEiD8B/oAba1UHiVLnrTv5dVzxbO9eSeovOG6BMotyhKaLX4x+xbpv+qLyip+gcJIl
         YuaIOI2s4Z7YuF5mc+pYBmLngND5bnHrJyPYxlG2ueUCrfsfpIf6yZUhdoE7bdbNIdoZ
         NGgTKWaFO6U/ckf69PnwsMBRsBa9uHzqhlLuMapylV2FyJ5bblKDQUdfSP0AodBYSkDU
         LrVw==
X-Forwarded-Encrypted: i=1; AFNElJ8FEmjH7bOPWwu2zEfcqO6qu+trA9iijfmJLmK4270LAZCBahl1vVEMrVVHLGaS4Y5jYCdfOU2xfomfcr1nFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeLbBh80JPSDHDoa4wtqhPWOArpXy3v2jXKHOxErzE/4NgzvCQ
	aZOfv00pW4Y5QceYLNynQM2Axo2TcAv0jmoQh8ljzUCWq+GWQv/zqR96/SUSRyLvbaU2wZbARDZ
	ratENyTcOoGI5/WeyqbHNOWKJJMS1IZeZbxhhFbK/JUrIabgeb7orotM/KoXF89dc5f/LFszI5A
	==
X-Gm-Gg: AfdE7ckxFFSJU+akGxQXB8sBa4D4XZLytFK4MXTH6URaeoKze0UfrhJFvKZXIAlbySF
	7jmUDSWZbRzHryZ8Spg76s0ICVqYII4Em3owp8wvwomJuNhkKsBeCFgE4OTjuBLHKTcGCtbFRij
	tQH11WBNK+lFNvrksl1mNJQdGRx1xfsk7l+Iw9/tpCB9h3dO3UQE/ld6QmzcpQOMmSeqE70IO4b
	/Rt/mvw8Be7xYLhmyOd3K3VpMQTcFklSBmtl/7/8QzI84C4v5y8RkUuXcHxAHEJpC2hcZaC8kSC
	9sh4bLQKB0fKOk/ufoSqttIjv4mGd08A7QR0vQzxj+R2Mzd2/bM/aUJmvINgpO7GU0CEJs/lqP5
	AdP9S+v1T
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3395673eaf.17.1783435644630;
        Tue, 07 Jul 2026 07:47:24 -0700 (PDT)
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3395595eaf.17.1783435642165;
        Tue, 07 Jul 2026 07:47:22 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544a1725sm13981552a34.16.2026.07.07.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:21 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 1/6] clk: mediatek: mt2712: fix memory leak on module
 removal
Message-ID: <ak0RdSkV71J1_1By@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-2-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-2-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oJjKph12ZodmjwlfjD_2GTng-aXjK6AMuWZBQ9d3Afs_1783435645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_154850_091060_FF2BF298 
X-CRM114-Status: GOOD (  11.11  )
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

On Tue, Jul 07, 2026 at 04:48:30PM +0900, Akari Tsuyukusa wrote:
> clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL, which leads to
> calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


