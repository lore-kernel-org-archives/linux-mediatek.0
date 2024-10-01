Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383E1CE8374
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI6vIBaenjmeV4v1LJ8TZd0bodccIG5VVCIvDBNwP+8=; b=LatrNO2HL16MQn/FabfwAWvaSG
	kKGCNkSkCe01m3ie6pKy+1L90rn4u/m4MAscbsK7iPratQaAFL9UaFhs+5EyVuKh8O53pWN6IW7zi
	a0iWwThlknfMLA1EJtoClNkDLAv2ZMzrgRJgUu8EGkDgP+u6HpG7Sj5u/q3zORfh666eQkhRsuYEL
	1bm6Ply1csQlp09OqUAPghkczItYnfzYm+I7WksZ8tT4UO00h4UWUdHYvafI1ocZUq8MUINREQGbG
	JpJMqxeUeojW65TnxhngfLoALrLpFXnFx2VQ5+EvnDQ3Exl2sZNd23/gM0t/1qAvLbFEQ3Cq5QrCT
	BWMf4jHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcT2-00000002qNP-3pAd;
	Tue, 01 Oct 2024 12:59:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcT0-00000002qN4-3T9w
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 12:59:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e0be1afa85so3859275a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727787541; x=1728392341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PI6vIBaenjmeV4v1LJ8TZd0bodccIG5VVCIvDBNwP+8=;
        b=B62B+fnkui7gtp5Xhb28djPoH0IhEkb+p51y2vDnvPuU1KNUZL99omCxFS3FCK8+qr
         YUJYRyB/pLTHS7n9zBKcXfkGEry0bJopQeVx6XBJBbg89U++oE3AKgeC5f4dVkJcgiHU
         IGuGV5Eg4kR/T/2WXg/4RGgRRNbwaLcVzkKgMJitBgait2sksZIHNzdphTVnGszsvqi2
         5QxuE/0umGCFdGv/5wRbeAShfyBXIr25cQrxnNH4W9RFCCDMqvlRnAvTgtY8lOL0lVAB
         kiJKPxh5EB4XS6fPwkhs9j67woK6UY4gFKvNXTuWqi14PLM5jp/dJGlyZn+5cL8sqPHr
         YQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787541; x=1728392341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PI6vIBaenjmeV4v1LJ8TZd0bodccIG5VVCIvDBNwP+8=;
        b=m2x3JkxtVqjPd4K8c/j0ZOvJtyFyfygND1j/Z9EEk4OgN3hceI54cuobxVsdSgLJwZ
         qFv2v8VyJdxelTil9FP1g16T7acom9+2ub2Vu8Koo6p4gMYJOh8zX2Jkk8B1ncfvpw8/
         lV96pQ1Wn9nlAfT7in3uGvB2qL1j7HG59ktNAwWNPsXMwu4T+4I6Jx4QvscR7Ng3qsMy
         hAT3MAIwqV00XtPXklGk/WuTKRr/4uqugBSibvb1RWJqjzt+/ou9Hj5ijG6/zeDGgD/m
         Q+/gDp77/oksIUI3YOK/hN2CU+8hYy9+H6mAvXr+L2AjK0FFlAPIL0/JxsrTBxsUofNi
         YdEA==
X-Forwarded-Encrypted: i=1; AJvYcCUaue/pGZQdoBEDmtvTmgMp9hHQugqgx0PQtP1DG+wwwwfZPqFpJAJBgHv1k3KDr09V2vfkegC1DyDPeP1+2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQCZJpMlmvWXl+Ixn/o+6Tf0V8aKBwlU29Yd2HKVsrgGUoiLLQ
	1tXw5WMBj6G0GMeARst+PmcBkhE7rOZitAKxqgTuP4qr/vESLb7J
X-Google-Smtp-Source: AGHT+IHfbDOoRKb2RjyhDoGXQii6tGheSnORtm8ulp45jdAOglPSMwHTdjuxMPGJSgsSXaDt2reBQA==
X-Received: by 2002:a17:90a:ec0d:b0:2d8:7edb:fd2 with SMTP id 98e67ed59e1d1-2e0b8b49913mr18979395a91.22.1727787541160;
        Tue, 01 Oct 2024 05:59:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e0fbf6sm10048795a91.40.2024.10.01.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:59:00 -0700 (PDT)
Date: Tue, 1 Oct 2024 05:58:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <ZvvyEux8f2ylRQOn@google.com>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_055902_889762_A1890C37 
X-CRM114-Status: GOOD (  17.11  )
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

On Tue, Oct 01, 2024 at 12:07:16PM +0100, Mark Brown wrote:
> On Tue, Oct 01, 2024 at 02:57:10AM -0700, Dmitry Torokhov wrote:
> 
> > This will add an unwanted delay on ACPI systems that handle power
> > sequencing in firmware. However use of "optional" regulators is frowned
> > upon in this case as the supply in reality is not optional.
> 
> > Mark, has there been any developments that would help reconciling
> > difference in behavior between ACPI and DT systems. Ideally we'd need to
> > know when supply was turned on, and adjust the wait accordingly.
> 
> There's not been any changes here, but there's always been an event
> availalbe when a regulator is turned on?  There's also no difference
> between DT and ACPI systems here, both could have the regulator fixed on
> and I'd certainly not want to rely on an ACPI system implementing a
> device specific delay after power on given the sort of stuff they like
> to put into machine specific drivers.

Well with Elan in native mode ACPI FW does do proper power sequencing,
that is why this commit mentions failures observed on Mediatek devices.

Thanks.

-- 
Dmitry

