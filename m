Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C0CAC597
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmfG0W1IgkOwpfZLkT8EPqhqG/KPrr8NPJycy9t8jkY=; b=uTVqw/viTHg1GFRnDUf3syWvQM
	4IMXOzCZaS05NKDdAgRCfxriWrj0sSGPtYqpv5vwDqv/3f72xGAyMig6GnX3McIchJrpKmg2Q+fO8
	S01JzbW21I+Z87VIXmA/eMyOorLUdlh3xgH3S31wVm3/9/bt2GLLY0QhRVafeDwTS4q24f4pAXHUD
	KM9XeKURBHcN/VS8ghoEwrSVW4BGGJD3FhhuQ5Z63mqtPOWnbC5kxS128LwoOhKv1SUWIbnBPUY4E
	45my6LHMeLnMnyaN8ryWMwsg9lpRhPLGX5zja4RWgpUxCT0TeX4wrOqa8vG5wWkgFuIt6KpAF5Dma
	tImuW4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyJ0t-00000005vxv-0k9c;
	Mon, 15 Sep 2025 23:53:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyJ0q-00000005vx5-09uU
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Sep 2025 23:53:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dec026c78so48991275e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Sep 2025 16:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757980414; x=1758585214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BmfG0W1IgkOwpfZLkT8EPqhqG/KPrr8NPJycy9t8jkY=;
        b=Es40T3SSM33dxvI/nyVtJZiumjILYFInU6pousuvw408htY7pWuxvhU8ADU0N4LwuZ
         EwZIRijS5OAeS4XrvJbZtAep3w/LUSiaqpLGg3/Bl8SAQtowdx1FxZ0t5Adh1OffcYuB
         V+ioYaYyUJrbL8zK/zu4Vlck7JW5Vwy0dTI0ABbGQ2sMjRqMWCpOcHTiLFHjhYBVtubh
         PwGiZ4HNB3tQKhSjxNmTeOmq6SJ5aCwsllvDLCUh7qChDXw0Tbk/SP8dWqCwPFhk2MRg
         0PtHeBXFCSQAYf4NMVQ13CfbaaA7kkucG9cBjxs/ayodDylbvo1A3d1H7flRytRvoL5L
         R1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757980414; x=1758585214;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmfG0W1IgkOwpfZLkT8EPqhqG/KPrr8NPJycy9t8jkY=;
        b=moYJn++2xzcRq11JvmWzl/wELr5ZazrgcuUOgigF6/B1fLMYuzdRGXYVmEIobjiT/S
         3Ai4T7iiAR86t4kt7t4N1Q457XLAqd/ny8p1JGn+dnHA4sqS8hJee+QFakM3z34J+imo
         RFX00jtoRHI8IIehElICjmCwCinNVjXAzWfPd93MY/sikh+SmTy1UlK2wVM4YhjMnFOy
         0OCGkiWkGjdw/g1F115aeUdLueJuiwEqOm5XgAuyj1+vkUE7Ei7oHqak3GU7Nvzt1Jtv
         OX+5lWBXOwP0SKD3cqVULtq7b37HqdOKsf9F9pbx/gB9Fy813WEnEYHzVndXROMAqyRU
         pogw==
X-Forwarded-Encrypted: i=1; AJvYcCXRXXXqipT0Ky+B1fu1ZlYFtG87cBnwn6/jf69RVnOlXQYv9UQ+Sfy7uCd3TR2QqEaAQ+aDP3WrSjWuCOeQjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaXxGJ3QnHxYCCEQ0F0Gp8BMkvgNtJXiSPeRhkd1hTM2AUF1/n
	ziwI+s1mvAveHDghMc+4BZnBepZM5SGdi7RDf7lKYe18BSi5mMBt5jfZ
X-Gm-Gg: ASbGncvU7EyND5uHPZEqiWoNADDTngJJD3O4MaoCvSo//Zf0JxIg8QlJgKcX564QH+X
	RXCB1EJQ/XJF8NHwAFGw6+PA0ESD7KKJuD4l115mp4jTGX9cjSKZ0lUmsFuPBpQFejV4rF+uFC2
	EyUq5fZb8uiLNZ3eY5ayfEGF+6NlvQX6+AU2lq/mEC+wXzNrU18MldX/cveRip8yu9zByjo8SV+
	zhRhURWfRafeCG13xd4wcPADop0oSb24H+KqLl13HbOHD+/K/hk+v8duYu7/1bZTdCdnmF4Eo7f
	5TeN9td6nUXq8SrfphxC28CXYC0HFMsa/c3t9ulJmCRp2HIR+SL3IU8Av3viZf/uY4pX7pi4qvb
	cFws2RGtkPCWnkv464azVG+Mw0p7FFUayI2FC5GnkXrIJ0ELBEGneLu/RsoKKgNF/2HNBTw==
X-Google-Smtp-Source: AGHT+IHLVAgIWoi+HRjIu3glVhna2GE9VgX3EjwtlAMYebMBvwok+xVV62qMLLci45mipK73hQudIA==
X-Received: by 2002:a05:600c:4f83:b0:458:bf0a:6061 with SMTP id 5b1f17b1804b1-45f211f87c8mr150676285e9.24.1757980413716;
        Mon, 15 Sep 2025 16:53:33 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f28c193f9sm118455135e9.2.2025.09.15.16.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:53:33 -0700 (PDT)
Message-ID: <68c8a6fd.050a0220.26bdf7.871a@mx.google.com>
X-Google-Original-Message-ID: <aMim97cvziXHysYI@Ansuel-XPS.>
Date: Tue, 16 Sep 2025 01:53:27 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	DENG Qingfang <dqfext@gmail.com>, Lee Jones <lee@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [net-next PATCH v18 3/8] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-4-ansuelsmth@gmail.com>
 <175795551518.2905345.11331954231627495466.robh@kernel.org>
 <20250915201938.GA3326233-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915201938.GA3326233-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_165336_105466_42D90B6C 
X-CRM114-Status: GOOD (  23.56  )
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

On Mon, Sep 15, 2025 at 03:19:38PM -0500, Rob Herring wrote:
> On Mon, Sep 15, 2025 at 12:01:47PM -0500, Rob Herring (Arm) wrote:
> > 
> > On Mon, 15 Sep 2025 12:45:39 +0200, Christian Marangi wrote:
> > > Document support for Airoha AN8855 Switch SoC. This SoC expose various
> > > peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> > > 
> > > It does also support i2c and timers but those are not currently
> > > supported/used.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
> > >  1 file changed, 173 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml:
> > 	Error in referenced schema matching $id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml
> > 	Tried these paths (check schema $id if path is wrong):
> > 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
> > 	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/nvmem/airoha,an8855-efuse.yaml
> > 
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): efuse: {'compatible': ['airoha,an8855-efuse'], '#nvmem-cell-cells': 0, 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'shift-sel-port0-tx-a@c': {'reg': [[12, 4]], 'phandle': 3}, 'shift-sel-port0-tx-b@10': {'reg': [[16, 4]], 'phandle': 4}, 'shift-sel-port0-tx-c@14': {'reg': [[20, 4]], 'phandle': 5}, 'shift-sel-port0-tx-d@18': {'reg': [[24, 4]], 'phandle': 6}, 'shift-sel-port1-tx-a@1c': {'reg': [[28, 4]], 'phandle': 7}, 'shift-sel-port1-tx-b@20': {'reg': [[32, 4]], 'phandle': 8}, 'shift-sel-port1-tx-c@24': {'reg': [[36, 4]], 'phandle': 9}, 'shift-sel-port1-tx-d@28': {'reg': [[40, 4]], 'phandle': 10}}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#"}
> > 	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
> > Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/efuse: failed to match any schema with compatible: ['airoha,an8855-efuse']
> 
> Why are we on v18 and still getting errors? I only review patches 
> without errors.

Hi Rob,

the problem is that the MFD driver and the schema patch subset of this
series has been picked separately and are now in linux-next.

I tried to make the bot happy by using base-commit but it doesn't seem
to work. Any hint for this? 

The errors comes from the missing efuse schema.

-- 
	Ansuel

