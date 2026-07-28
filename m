Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233B0C54F4C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=; b=Q5AdR9cMsig+CaoeY+nJWZBIfM
	eRZiW4eoik1t6qeEOH35uHjwexdQ0OYW31QU49PiQMj88F2F/lUydVsF6/0N8oB/DDUO8OmDTWLNl
	W0kGtfrpHkXduvAdn4xcBK/SkYxKGFg0NtXuuCGMS3cwVQl7IbG8XAYYJLlisexUepp8PxlSRTZIw
	zkBdn/NMrpaMWe1h7IixpcxQ6rCVx0a2Br+fG2OUINAebmBz0Gc6O6UpBNelE333POqaKZRWMWzH/
	ZOusx0Gj8eLAneelGOJl3yNQ8OHtnkMSj32dMmTKbgbkIeIET4Bhr7wJHpKF1SlOExzdH5YIf9rA9
	M3uXOvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojB7-00000005YhD-30PM;
	Tue, 28 Jul 2026 14:53:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojB4-00000005YgX-25Cx
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 14:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785250385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
	b=bOOyT157e7hDv/jUXflhkbA6pj/lq9H9up/zs99z7BQvFjWF3i928eH1boEO4gR03qYupj
	cu7g3n0mEgPHgYyZP7oXfRg3PR9cISIag3+4l6Nn50prT4F94hSwavrogVQ8PeDpnTzZ6e
	E/wKPwujFJmnTfOeUvkCzyFEbR7d0WY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-fLoqvE_UPQOmiYQlZ9lFMQ-1; Tue, 28 Jul 2026 10:53:04 -0400
X-MC-Unique: fLoqvE_UPQOmiYQlZ9lFMQ-1
X-Mimecast-MFC-AGG-ID: fLoqvE_UPQOmiYQlZ9lFMQ_1785250384
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec91dc265so361239885a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250384; x=1785855184;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
        b=M5ihsmGImcjQYcxcedvWXG1Xqc0Q0QJNv4/1LNjpUGHvdeaD8hCL6Bf3P48EvNqvOd
         xcdAcgP/LmRHHam1zn9W7QdXDvj7/+/NA1xG/mpEVLBhinYmIPjyyz+/yT70b6I0hhUO
         PAp4BQUhwbqy3CVuxNb/orBPhNB5SH4FcGFlVLhQ7ugu6NBfXkuXOak4fdUUBZ3M6KLh
         /foHKbKgQl/nc1uQSVhycy+5OPcwNmE4ySkb+8oydAvvBCYI8ahSrsi1exIl69Rb1twc
         gMkkj/vQQUm8zVdIrqZ71wDD9ZjzdQimMZnMu3LgGOQVKZR97LbrfcalSB2sXRUm/fak
         Okdw==
X-Forwarded-Encrypted: i=1; AHgh+RqiGYKitZI8nXf8SMFneImyzTMX89Oaq2Sqy8SVvCyreLL11Ui6TQqIRw9NHbuTIu4jywFXNa6yFWbQkUdd4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpnC+D+h05ElAvtWKmFtp5M95EkWwsgLupnEjDPqRL0nVGRnAE
	8+Hc0SGJQiLqXT37jnWg7MR+dPBwLOA7ah5e50pwXubEZAfQaqUxrPj5aINSZXhFyTTfq912NbO
	ptc5Q4bR+rPSpFgqHIswy/dVAw/RvZ2ZraLTkvr8W0QBPK+T1Vz0TfaxhLZZsuPG1xVVDp8EckQ
	==
X-Gm-Gg: AR+sD10NXcrTsL0l/6KLt/JTmFwTsbjYNf9sQNyP6tFCGkp60Vtra4lK6wOKgb1a5bh
	8yB/WntTDZ6KEIR8zRhUkaEg6kODJL/MFDY9mF8voMyf4IspY9wT0wftT6tkGebht6Fw6nPsc1P
	TWMd66HNi8bLAU6SuJmB3ITQheTzoM9ziMmzyqvhFhY3kP6GfKSf5+dNbuMaWgisNpwcLcTIS9C
	BJKQuj0IyR3AFSe4oSUfgAji2Ilp/q70P8X7hnkByn9sm9xeKCO9ebWSeue6DBgijfKBKaBk4K1
	XSg+mkPlc8hzgnO0vdaoBU/Oynfo726bDxIdsg8/3sDn+Oq0wX/pVtCMz3yEoNmKu89vXf9FRDd
	qs1KH1kNarCTWr/ij8d466/CXuicSyj8Nivk=
X-Received: by 2002:a05:620a:2781:b0:92e:8ad6:210f with SMTP id af79cd13be357-93302640d97mr253739685a.8.1785250383651;
        Tue, 28 Jul 2026 07:53:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2781:b0:92e:8ad6:210f with SMTP id af79cd13be357-93302640d97mr253735385a.8.1785250383149;
        Tue, 28 Jul 2026 07:53:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de541ac8sm864956085a.16.2026.07.28.07.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:53:02 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:53:00 -0400
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
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amjCTJguiANLY0vj@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-6-akkun11.open@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 20MJjq4NJVgfPXEU-NFT3abnvzhVboSNdvblFuxsX9Q_1785250384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_075306_614495_0586858E 
X-CRM114-Status: GOOD (  19.45  )
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

Hi Akari,

On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
>  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab3..65dc4489a09c 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_ref2usb;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index fa2d1d557e04..8b69009e1965 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_clk_hw;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +

This patch doesn't compile.

    drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
    drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?

Brian


