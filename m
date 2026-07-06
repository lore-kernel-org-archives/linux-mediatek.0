Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0744C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 20:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=; b=2uTK1frMQxppc71LGe/ZIszK67
	QNCH/fi1V0mTE9gvs3x/xqlCWPmjlPayufDm3VmKV5g7ijW1+9t9y/EChtRxIUsKWSDRZdx9+w6OM
	DDCITmCjqV0H3RwyUo/Cur9L6ccd1rcAFgsYTSW/hJ6LhN2vNsFEGeONpl4iZ0kihb70SuygNL7Iw
	aa1fCumf7KagHogp+J6+fT6hd5yRmm4hLipoNPQysPw4y1ght5aABLKQFYqjQq9Gg8NdFEJR7DSx9
	EUA0OF9dvVYPIOBcklUFF3NKBKndYSNt/0vtRZWAJaUuhv8sS1Zp6Dpg7O9IkPjAHPUqkiMEx+hyo
	PqzB7F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpug-0000000DYON-39IM;
	Mon, 06 Jul 2026 20:27:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpue-0000000DYNd-1riR
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 20:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783369651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
	b=asnuNf1NAsZvJs46jpeXFQUVjWi6OuKgpNz2c8p37YyvJQBQHpPQPZ0urN3kXxBa8f0tOB
	SI5GUtSOCn25uaI/Xi9mDJGeHt/MOpkGD4h1Dp1dQg0IX9zaAVW+gVnp57I5WbER5gptOX
	M5K9XpJ/7B4tW1loB/ZERQe7VYOJ2q4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-FuGiR5mYPqeFlY2mJRJ42g-1; Mon, 06 Jul 2026 16:27:30 -0400
X-MC-Unique: FuGiR5mYPqeFlY2mJRJ42g-1
X-Mimecast-MFC-AGG-ID: FuGiR5mYPqeFlY2mJRJ42g_1783369649
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so42539391cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 13:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369649; x=1783974449;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
        b=o67Jxsf3hvrX4mSfwzaUrjY8RTnasrdNqSlZam4iArh+5AIRL8O77T/F3fBNxOcRJc
         wNYwHuNdLcq4FVX55lXeO1NwMBiFnzhey9BTZw967qcRszb5ERwSKh+0XUl70qr2Qq36
         8DjdF+VBALGIOoUXpZTdVPEFWCW6BE7vXz1dcGlGgVJFRbZnb3WoxIWNlH4tmJGeQluU
         uFsfE5uHWWJHbmdHiRL/IJy2MLmE/FGkyoTaWtuhAWfq4MJBieZrBmv3YnKmVR+mheMm
         p59/GPfk9b6e55OQ11D+WC0K4E5WqT3Uo/vlALWNWJtexMNMHlJVXVvIH3FTMEWavPKN
         Nphg==
X-Forwarded-Encrypted: i=1; AHgh+RpvgGDo27VHaaAiHbGL6beGrmCl1qZb5g6JNcsZmIIS0kfA4Q2PU63DsJ9Tcb9q0a2PoR0Z0T35I3f1/BkpsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNOoeTjqccJra8QbSe0sthP82/pj6bEBYECTrqODwAObnzY3Qp
	3sABzFdblKciO4OvQFoomF3JoNmp1eUVHck5a3TmDgYcQFVMDo11W/OTG0Isd/1iM896fu70vjP
	sSrxLEqZxuCJ+iYDoLsgmOr7lQowee3PxftHDjuuqVA1G/TDcQXYxS8613Z2lz/b3cx3YIRa9kv
	zreR3a2g==
X-Gm-Gg: AfdE7cnXhbXLV/0G8Yr7UY7Ae6YYhL825hVuuGAt3C239DSSgylpdYNCLzWDB3C0T8J
	KhNAflxaMtMCFXa3FXUk6AGhRw2CM8ULJSAgnkOMSvf2CXAm3ChrIYOZHZQWCMjD05QeMFCi9Zq
	j87HVGTSkb+RJropU3r7gZPaMFQWSDautfEQFPA9XJDhJahwi9omuiKkwrJvwhCIV4IeLzjVY2c
	pCyZGTM1tMKGEi5gs3UdPFuwKOJS4b97UWLBUVeHfrX6lcl5wt/1X0Umj8NmoI7j60EFtX676io
	VI4c6aGNNXj8w8nvM4uTOWkkK1sCbFUd8ZkpIZ9ptqioDLRP5cizH7lGk8aL13FQNSlXfTXExSJ
	mDknP6HFraI+hlEWX57sc1jbpACk/Zbv4hU78g+uDKEB4CA==
X-Received: by 2002:ac8:7c4f:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-51c7485370amr25568691cf.47.1783369646961;
        Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
X-Received: by 2002:ac8:7c4f:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-51c7485370amr25568441cf.47.1783369646512;
        Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e371f44sm152788386d6.2.2026.07.06.13.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:27:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:27:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: mt6735: Unregister PLLs on probe
 failure
Message-ID: <akwPq7TlOnu2ExKk@redhat.com>
References: <20260624062409.45678-1-mhun512@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260624062409.45678-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: awTIab_b8CGB8eHoFMEvq6D85FR8sZeqDhvYnY5jti8_1783369649
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_132732_555845_3A53F765 
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

On Wed, Jun 24, 2026 at 03:23:55PM +0900, Myeonghun Pak wrote:
> mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
> clk_mt6735_apmixed_remove() unregisters them on driver removal.
> 
> If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
> probe returns the error directly and the remove callback is not run. This
> leaves the registered PLL clocks behind on the probe failure path.
> 
> Unregister the PLLs in that failure branch before returning the error.
> 
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


