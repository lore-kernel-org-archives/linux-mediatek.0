Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87771C44500
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=; b=vtdpYipsMmikFqEk28iJKCl5bW
	GfOa+ybJvLo458+uxUvuLOdV1Y3ixIvSYFBLC9hp8dQFj6uKpzbseIuPOf9AtjfzV6VnIFLPzoaVK
	VFq7BnAfaYry5yymgyiZmEOQFQt0Xk0J8IgKoPp9w5YhAIF7Y8LubQOpE3kTlnjUc9HQvnWbQJxjo
	dPQEt5DIrmzzOgOCm+hlwzuTCYatOH2xMaikvmz1/E6oD7EVYbIchepAruae60Gyk4kEsoqZmbTA7
	uTW3n1+HT9xJScUYLG8uxdSm1FRnkx3UEXOhkF99uM/1RNZh2geV0iaPRJ6YGLc9OLJpC3J8zF803
	4EM37Iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMK-0000000CtzG-1U2u;
	Mon, 06 Jul 2026 15:35:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMH-0000000Ctwi-1QF1
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
	b=VDlxitduT2hpoPuDSXDMhTDQPkpLQ9il7p2jxYaSclKrruGjbCOmlXW+l6Srjt0JCi/c9t
	Zv2S2DZldkDD2Gz4lNBWmFSGIuSNBqxszL76Hefi6e1PhVql7bdrMO89YtINs2QK6RztHM
	kjiQrh8KVsy6ANrvn3QzIpqtR1aiECE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-Tdpfzg6KMBeiyAOO6AAUSg-1; Mon, 06 Jul 2026 11:35:41 -0400
X-MC-Unique: Tdpfzg6KMBeiyAOO6AAUSg-1
X-Mimecast-MFC-AGG-ID: Tdpfzg6KMBeiyAOO6AAUSg_1783352141
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-80e910ddbc6so91746197b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352141; x=1783956941;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
        b=g12JcGWpycHXNKiIjaiYhMwhM5xMeq9+2j/hIeHANqb3i6ZO2iEXTNFPTdKTn498Oz
         sZ6H16QgiKvCfb0zHFrnNp7Xm7XyqT+VqA0C3VQyjvgJbsavEsgOfe20bq4B3n1sxqMD
         oePMPxqICFtVybMl/cUi4YB5WYVWBQ4g6srT7YzO1iGEoX7nKxilZufb+sAPCbWLZd3F
         75JTGh4EK8VQZwqTJ/lWKFlJO7B+mBPMu5BT8FBU2q/X5Ie0CMbnplq3uUnIz0BuSHe1
         togUTfAdFMeNPtAr0JJDCA1AfCZSzr/LwADbqVcwYm/cJkABhGKA/BHE+Z5iBF6BC77d
         /pSA==
X-Forwarded-Encrypted: i=1; AHgh+RoehW8IeimyOe1gNrRkT/3DheB9WWgoKOJCnjot7YI1X8B0HKpq1xFvZ3owifR/EgZCEuS69cuYlVnMhdqdLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEo+lSop7p5L77hDHAQR2j09BnjZ6UJ8IWiFPYVZr/5hUvDyt
	Edkc7CFn8HpXKFDSXoytV4FT2HdoZq0wlmfiJclOKleSKYSb2ho33GiLciUE/6LG7is0rftnt3V
	I70oAosP5VO3Gb++k+UNWT25QUkRCNlbH/eGTGZdWUDy3rI9UB5z0S/zO5le/gqoDHBOst1gkNA
	==
X-Gm-Gg: AfdE7cngOWdM+6wB09kBaRrH1Bu5mxUr+l7g9UUwWOx10RJdWgtybZPRaEKURLo/Wn+
	pqtSb57OZcApDzkmc4Nne4c4FY8c/7DVDrq6yrp1KXw2ufC9ymcmuoI6NI/VfNUr3j/oLx+6x5T
	p0HBOccqQ5H5GPNplbXXwXwQxPCBb5/8Eq4SuXg6EIuJMuy5VefCKmn6hmvi6oqIxuvcGnBLDEO
	r9qi7PKONrHVtTo7R6KbJz+r724kn9noLp9fnCGAXUO7/0zqOcNNtJ24eIwvijDuKdbfLWyBqZH
	xukro1znIOPIoo9jgCCwlZMqqaKed3AYyV58E+BdsNjr+GyyQ36YUIya90yh6YQkluZqXLsP/1Q
	ZlNX7ybdOoP3dNtUbx3+L57yBbPLEDWLJh52HCWGe9HcDPQ==
X-Received: by 2002:a05:690c:3601:b0:80c:85e5:8759 with SMTP id 00721157ae682-81be38b8fe5mr5792547b3.66.1783352140776;
        Mon, 06 Jul 2026 08:35:40 -0700 (PDT)
X-Received: by 2002:a05:690c:3601:b0:80c:85e5:8759 with SMTP id 00721157ae682-81be38b8fe5mr5792387b3.66.1783352140419;
        Mon, 06 Jul 2026 08:35:40 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783fa21sm58952937b3.2.2026.07.06.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:35:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:35:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-vdecsys: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <akvLSe4WOXpxgbO3@redhat.com>
References: <20260704124450.11035-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260704124450.11035-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2NlrHvIlTlVSzSXGrnN5NwWZXPF4Fdfr0BeWI8ItRmE_1783352141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083545_461015_CB07D712 
X-CRM114-Status: GOOD (  11.28  )
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

On Sat, Jul 04, 2026 at 08:44:50PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


