Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ADE109E552
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 05:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=; b=tLBCSx5DEYddMeAWuqrdnYuwHg
	LV4fCUbF9dE/NBj0x/mJIvkBLGBBozEyEx2zf3OCU+lwUFpn475aiXcl/at7n9q8hvYc5JOzJxe86
	FuJg/vO7n9xmKCoR6dvOkiWg3Ln7MKWeLKVQWbxlpHseH+Iskr83xHmAPx8M+phlOmB3t9kwyfBuo
	mNG+eALMXu7JGdQ015+WCnNaLXyPWlTMC0kcYuH8+XMzkb6WfqmpSgZ4Y0UpXsrCPn2kwq5p8m931
	VyRAyGkGXJIijhdrz3/p8NPzfQdgMRnzL3uWDsHP0IweTE96iG3OJoh0BHa8ZmlxIiBQfHb6tF+Xj
	TOTGNn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dMw-00000004kLi-3qHW;
	Thu, 26 Mar 2026 05:34:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dMt-00000004kKm-4ALl
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 05:34:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8299f1ca894so292606b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 22:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503295; x=1775108095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=;
        b=QjkJNP5l2/nqkvmdYiEHeAkkc7PKDjzWrmvvLlsmQ+waIMilrw7maBrbp6Zc2AMUWI
         QavjQ5xPzozVDg3Jw9IM78sDeP6RdGHFO3n58B9Eb6hmexr8Qjz6SAiZ6xJPKZapuu5B
         WBAo11t/OsG/Oo7J4Fc/KWmIS8oaHdzx/2ZTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503295; x=1775108095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=;
        b=eJQncg6MSu+G1eZUfmaY2/vy8LVCXcVHw50v75ankF6V5GJ+TS6wg/Ag1T/Adx2O3/
         YwAAMyeNkrRjR9UVrkV88D1CWTNDYZGW0S9zONa3naTMUxmqj9oknMO6e3l7Xze03xGY
         8UTcbROPlAnsufE3a3NvZ3+PUPnsVbuFJgrvuVvhGyGN8Oirs8q/KqE5SW67/CNPH1p0
         AV7BxGBqe4QG3pBFuMaBc8TbM44s+/NGmaDdSft6asmllp9nZjZBoU6K00fM2FaIognc
         gxm9xyI4e0oq5nBqNt9+Df7sKWyqLv+PLnbP6anf80zjpg8ypFpiU4Axa4gsg3ygUgw1
         3kDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoZWg6+dkGjCa7+FOljtvK+VMFjeHDSRqV2pny4/lnyINiixISmpWTNWkRyV3ZYjRxqRKC55D1bK0jxLBgsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIc/7srMzakfOiYnxuOll719mA4vSA8OVYS2sn04l3cPXDgA47
	atYyVOOfeXfyCbZEumcim74MUEUt5Mk4PDZpezZYlDxPr8Pb6PRcgwKy80/K7NY/Qw==
X-Gm-Gg: ATEYQzylKqwfCIZU7EaOd3QklbuIGGlUPtWvrPOf34RCuhgSd33Sn254G5vABFz3890
	UdW4aEeTWC/BwZTvnjpYLPLOLfpz2o7ERJDNrh0BxkMTQV2xnq4JPiSKHihvInHV9QsGKJq/Exu
	zKdp/ktl8Td9MaWVuN94Y3iL6zNvMX/0y+zRzl2nAT6xqd99VrvmuUki2dU3ETSCySM+h1IZ2CJ
	k59eiuJltDgAByK/N0QRaw4t0ewr/upxJXG2fOQnrI58tSqlrons5FWwzkx/5RmZTO/NwoFKPbT
	RuG6NVCw/yiLqnmbgy8dQearKemT+OhbJ5nIaVAahVJNNpeAeqmvtvDIfwdNbEI9kW/REyec+QR
	cjz+yQA7yEX5U8YeRLz3Z7etot6WMFWP7+8nZX1TZ/WQZ1dq94pYOTICsk6SWJX3bpnIEEIrbs+
	idOf0XCSUsPzL24MEvRsOHqvPm+kvF3BkevoWM0THMztp8lP6w3muNhNgCj73+GFejbA==
X-Received: by 2002:a05:6a00:4304:b0:827:3976:3232 with SMTP id d2e1a72fcca58-82c6de8be34mr6221037b3a.5.1774503294866;
        Wed, 25 Mar 2026 22:34:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d388d11sm1401322b3a.28.2026.03.25.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:34:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:34:49 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
Message-ID: <20260326053449.GA910813@google.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251106161149.GU8064@google.com>
 <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_223456_147752_E468A34B 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, Nov 07, 2025 at 10:01:56AM +0100, AngeloGioacchino Del Regno wrote:
> Il 06/11/25 17:11, Lee Jones ha scritto:
> > On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:
> > 
> > > Changes in v11:
> > >   - Removed unnecessary #address-cells in all mt6316 bindings
> > > 
> > > Changes in v10:
> > >   - Added "struct" prefix to structs kerneldoc
> > >   - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
> > >   - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
> > >   - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
> > >   - Some rewording of comments as suggested, addition of more comments
> > >   - Refactored IRQ domain handling due to deprecation of function
> > >     irq_domain_add_tree() to use the new irq_domain_create_tree()
> > >   - Fixed to use generic_handle_domain_irq_safe() to avoid races
> > >   - Added support for two interrupt cells in translation
> > >   - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
> > >   - Added support for handling PMICs without IRQ Group register for
> > >     upcoming MT6685 implementation
> > 
> > The MFD part looks okay.
> > 
> > Let me know when you have all the Acks and the set is ready to be merged.
> > 
> 
> 
> Lee, the regulators part was picked by Mark, so I guess you can take the MFD part
> through your tree.
> 
> I'm not sure if you can also take patch [7/9] (auxadc binding), but it would be
> great if you could, because there is an auxadc example in the mfd binding that
> needs that commit in order to succeed the binding check.

Friendly ping. You might want to resend the remaining patches. Looks
like they are all ready to be merged?


ChenYu

