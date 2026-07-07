Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31BEC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=; b=ti1n/OuziHVUaFclhjfITcBuxd
	uvISwsYnWHnflVRTn9g4w0BtZy0upa+qFN2wta5sNu/cHt9lpJPzHDOf+MSby+rWTiqqdpXf6EjeP
	ygdxjL4hJRdFfBT9AnPGAtvY3nkf4KBAeDS9e/ZCI8g0BFp9pCdTy98a81KRxhczgajMb8JUd8V7/
	KtFOJRcsp2CTiPrbKf7nfozF6yCVI5kbv4GrJsAn6eR41oJ4BLIdnZinW33xAPR4IDVLp52w8c87M
	GQF1Sh1hV8UW73XhrDoi7BG/4Sq7CT+rMkkFH5I9fnOPY0/8n6+ovmHvxn5RfE3KkbfZBBkmCp6Dp
	SyMsAQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76L-0000000FD0w-2pME;
	Tue, 07 Jul 2026 14:48:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76J-0000000FCyp-2gQ9
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
	b=Ay/6FBonifhOZVCrnhuIm13bEyWzTvphdEtGscors/x5YdbPEwJTc+5Syo35zwd4vpyQAO
	1lPcyqGfDGZ/gJBj7ItOgbKwx0oUq76Nx4OZaZmCaNq+de87jCsFwq4e+nOcns8rFv4vJL
	Asd+cl2y859d/h8+M+Wb84KSdkjUDQE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-vqWd9cadMdG5k7CYTjBNMA-1; Tue, 07 Jul 2026 10:48:42 -0400
X-MC-Unique: vqWd9cadMdG5k7CYTjBNMA-1
X-Mimecast-MFC-AGG-ID: vqWd9cadMdG5k7CYTjBNMA_1783435721
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9f1ee3ce4so1041341a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435721; x=1784040521;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
        b=bHa0R7nStfH8Omy0k2K2aRBdu82wl/zOzqqjuK1kKnfW1VjrAaH6lG/jN0ZAQXIks/
         7oQIAjy6z5EhBOvFNnFWHWSfvqAtKhXSX7FTy9vcCUJU9r/jpmcfPmceXjl2FvlmO0RT
         E4uH3eYNHx6oKTyZHTv2GmqGQVOaV7ro5gKQpLh07E+JRy5N41cGddJacI0gOM9UhLls
         23P9HINbrcRnTtqQ6Rl0U2iOBHgPmsplmdya1wkuefMuoHRsSPNciFCfYVDVYR23nZlq
         O25yvk6uBEDlM8F1xeOp0iQxhnVdmek5iHkHI2twM6PXhit9LzBKWP6N4I2Qc+sUbV6+
         YQrA==
X-Forwarded-Encrypted: i=1; AFNElJ8//BZqEBlAELuvv0efpyWAigv+7nJRI9dSGl0QExg2psMdOe6HmDEsxo7a9IRnfH0Bb1LzNMSjIht3UqW5Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJlMGXzsS9mT9l5q0Fj9htsdxIalILe+IdlRHE7xlloIM305zi
	62RE15mjlTPqE3EFVssE0hYy+wZhpl7Q/NQNIzKzmU9eoiRvcnhwaTCQqK0/St9RFMlOF/UQubh
	RQWuPNWY8L5/EDKfWlp5prRl8DoyK5X6HT3Ft9sc6+2CyW9dfiFDumJYqzkk5k3PQSRr9WHblcg
	==
X-Gm-Gg: AfdE7cmnl5OvUR+UYzWVYHMH3L/MxGW3DwZRPTJqEboBe+6g5Xwfo7agRhvFKQ5fNKo
	WBpAQ24MrkYDDe9fk0aziTd4VV/CGZ3sbmWQwGkwhrbJaH14f0XI+4Xr+AqDdcwtI4EgLy+Jnsr
	nOQsBB5SHZz7nCLM6jKePjyfvyWNgZtuwH7SXJ6JHfPKdmKNMOrfL05/q0KjWorL6dCP9/of5OZ
	XAhjy8XA6908G/ttTmTdCoUo5RsKVJZVbd/g/KIOIBbOOwFX7u0M6tQDwOJfATqEf3aZMATPPgT
	+Kp9UHGZjc7+EEZUyUdRk9TczVqPfwHX3evOcucmTjNHK5IRRTXyX4x5tv8A5cWLYTvPsIhOZdE
	MBMKxS3tM
X-Received: by 2002:a05:6830:828e:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ebba10d518mr1910824a34.3.1783435721191;
        Tue, 07 Jul 2026 07:48:41 -0700 (PDT)
X-Received: by 2002:a05:6830:828e:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ebba10d518mr1910777a34.3.1783435719482;
        Tue, 07 Jul 2026 07:48:39 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544fcb06sm14123177a34.22.2026.07.07.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:48:38 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:35 -0400
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
Subject: Re: [PATCH v2 6/6] clk: mediatek: mt8192: fix memory leak on module
 removal
Message-ID: <ak0Rw5krDlc_ZXQn@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-7-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-7-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Cw4AEX4bS0C1_GkZFbDFgKVuWhKcEKde41MWC7md_k_1783435721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074843_852267_804FE9B3 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, Jul 07, 2026 at 04:48:35PM +0900, Akari Tsuyukusa wrote:
> clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


