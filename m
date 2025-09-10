Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7542FCA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmt8NRxXiTXIxxt7so4xgdOFQzQhtk1IBnRJvL5Y6wM=; b=0VCKBK5qw/8Lnq5cKSaLPM1epN
	eI71qDDrSmDvGc13AKdM72Vuu5yV0AJilq85FFmhv12s1ZFiRgnWGYW4/K3Zk4zZq/1Tq6TmWpSjQ
	SXjjkVTfh7luFBYSz6fbZnzMGtXt28djhvHR7G6FC8zupSVdtKe+Z9ySsPgVI4yZpUwHEjuMS9T50
	1BNDtl8TBqOUPJVvYgidM/YqaHCP0BYzN6V/3kl/ICkSzG/BbXAU5jdbZUWkJ2f7UdWLoZYiIB5NF
	/S0rZ9qmdqe40BgKRzdJq2lx81M9BifrJstyco+T2CwWnq5v74BqkzZiWX8TCU1VUAooNCr7zetOv
	G98eG7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGKR-0000000CyqI-2vfk;
	Wed, 10 Sep 2025 08:37:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGKN-0000000Cyo5-3SEX
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 08:37:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6285612382aso455794a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493438; x=1758098238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fmt8NRxXiTXIxxt7so4xgdOFQzQhtk1IBnRJvL5Y6wM=;
        b=cAyrCaqfs/gGx/K2GTdFwPj7xrzuZSFCSj8gBJE+5Ta36X8TMJTZoQhvocqGd24nus
         BW8NlUPAvVDrwX75uKZu7mqsymKIv7h/8/2P04r24BHW3v7S7DCRUnUheMiDC2REapKy
         rb76jJx6LhSs/xsXD1pbSlFfk3aWJjGI14rOzc1faDTEJKkTESFSRIjL8OBMAr2ai+3/
         pLM9FuqqwgZ+6kZyyX3SsaFet3807WnP4FyE2MgMw1H7KzMYhSAim+xVN1SA0tu14SYc
         +gly9+1Ygo5l783ruh3nUK+EP50tOqi02elUwLKvqwFKRz2JhgCcuZ0+GN1Ih/NMPX06
         hjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493438; x=1758098238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fmt8NRxXiTXIxxt7so4xgdOFQzQhtk1IBnRJvL5Y6wM=;
        b=wMBlgp0AIN1PaMQgQU119FuNE+m77mjErnIdfEMs5IDaQxRdmxRktk14crdXC0arS1
         rufxcFxt5OgvZJ1IMCgtFnUKDe8oI5uP+eu18eARGgpJxhHObnGR8zKH6P5lyN5/VqBl
         8StTDtzRL7Q9x50FJav3e+LdeHOvOYvILDG3pJ4DypJF9QHB+Qq081QSUkPYARUVWAq2
         mfb8zvNuCvq5Wu5ustpFyMWDeW+3Hv186miCZ/o463Uy7n29NaO2fom2NUUZ/GAYa88+
         OHzmvfJO4Z7j42wveGowgk6EdSWL83ik7ltc9j/eMHQLe0HdIYFWuDH/fbjDmGTtqVjY
         TShg==
X-Forwarded-Encrypted: i=1; AJvYcCWotdA1T+egCyrsv+mU1QV8fzrar+GEi29zHpeIHqNQVFa/gPtygOEg/bWyng3rIXpSNtsKqPLD78xhQ5+EmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUXjfmcJYejIIWwtxU+6EEajoHgnT4afUbBK8gH1Wjfxzu5ZoH
	nspdhne3B2fxNso11evqTNjAON4pCVn/E7eNmITmKBJHao/00TiKhuMa
X-Gm-Gg: ASbGncubI54zwkOouWWfl7WvgShrhaV7W6jsH+cR5bSUoR1ZTaDv6SJb3rQXpZKI/2a
	ZyqIwD3nJwr2fiJKcJMaRsnuVTfKVjs+vztkrUAC7BS5Rw0n5E5noDyeCagTB1PYOPALWxYrl2E
	WEFK6920clqsrvSpaDfQCPM/Y7tJ+Xl4pcrMxMwCc0KfWsSzDjnjdDVcILWvcFNRHz1slxSJHmN
	fzhcWedlfN2f+XuXoojCbn4DjtjqK22q1A1JuFpPdrlVMYslIvtbf4rJos+mfe8DCoM0G+vS3ZX
	6XYWI9/VbJXtK7q+nh6BSg0N2eytSXj9wt92oQoRiTgpjrU/ZAP/JZMSsyKKg46ZsaSqDtPHixp
	50N1CmuHn6AucVJkJJwTBydDmDQ==
X-Google-Smtp-Source: AGHT+IFidFPKBI8cS+d+4gYHVAlOYg3Lgm1sKTkF6r8WI6UG693yE4O5MLuodha7xFNpnvYnc+AT1w==
X-Received: by 2002:a05:6402:4486:b0:627:e2d8:459 with SMTP id 4fb4d7f45d1cf-627e2d80936mr4573364a12.6.1757493437828;
        Wed, 10 Sep 2025 01:37:17 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:6669:35e7:fc93:9b1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfe99ffcbsm2844962a12.3.2025.09.10.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:37:17 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:37:14 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v16 10/10] net: dsa: tag_mtk: add comments about
 Airoha usage of this TAG
Message-ID: <20250910083714.gfrhsco3e2q7adxt@skbuf>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250910082017.hjlq3664xvg5qjub@skbuf>
 <68c1376d.050a0220.2085dc.675b@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c1376d.050a0220.2085dc.675b@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013719_876393_D8510A37 
X-CRM114-Status: GOOD (  15.94  )
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

On Wed, Sep 10, 2025 at 10:31:35AM +0200, Christian Marangi wrote:
> > I think it would be good to present the AN8855 tag using a different
> > string, so that libpcap knows it shouldn't decode these bits. The code
> > can be reused for now.
> >
> 
> Do you think I can implement 2 tagger in the same driver or do I need to
> make a library of this driver? Just asking what is the correct way to
> generalize it.

Look at the uses of the module_dsa_tag_drivers() macro.

