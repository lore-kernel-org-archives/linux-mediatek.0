Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8490C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=; b=XdeSo87LrmWL9vOrE7ow+/2yO6
	K5Qxh+JNmsd7tSn+hAHYc2dPAdbwvphu9Xg9W3RME0mI3s7InXrdmpj29RRNnFqgXKHaPgIh5xlrp
	8/ggBqlqItZ8C3DoOmqCQmapdhzfAqYWttBRzef5j+dACiFOErmA+FfwBZR8RPhIxSaE7sxo+etYX
	37HA99dPGC1Ud21lKhqBIxvx0ok6O6P8k2vm+C4AXtKRtQP4BlEUvAKUHWcW/gs6tAeAa4N092GYY
	8bP6CiypezC31+JQijw2ajWcs7oP6S8B9fybxotS+Bktm33alxfSsgIdVA1uzMYloCSMGTYEo3Q8f
	/n4/3IPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErXH-0000000Cmht-2ahd;
	Tue, 13 May 2025 15:27:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErWO-0000000CmXl-1gXV
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 15:26:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so59840475e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 May 2025 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747149979; x=1747754779; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=;
        b=tQzDCRde3jA22ehReuJ7+KUtGTOOs1qNkTZ4G1m5VlUWTYuSXLbWIBd5cN8JqTp0fj
         2XtoPvnCbWweuzLjmpZJik6TvBO67D7D+oEpvpwx3cbKjWukFA744P/ki8CwyySQn98J
         TXI6O9BmZe8hvVX8hMlHVidJIvQPu1Okdp+M8AtK24iflysx1W30rbSqCY1g6HRjX+nA
         MR/j8Za//MpFYfecwDmPmIPC+GQmzHBFkgKmAk5Z0upO+lVw16ecYj7KYgOPtA5IL37I
         h+1xhDr1uVRLfGlaq9wr+OzKOHZ+KVQruYnALvkpU5Lb/iFjSE/HlN+8dYEUvHgBaP0x
         iPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149979; x=1747754779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=;
        b=NdJ2C/wiihIWiKAx9rlC50NWs8i9rSqNkTZPrWHcegTLS1kGsfCx0Ky1cSZpI9iR1q
         juiPcpM496doGkPv+Pp2iLs84KfZD22BVOH92fejSgLxx1K0ivFDv5rtvJbuchSPV350
         JhhLVmY0oDwWkHLcN7Auli0zW30/CTb8mRtDHbzbcYjMXaIul8l1NC/PGccyGz38eTCj
         P3EsxXF4NNMCRYBmFygl+QVikvuxG7veOXozoj4LoEhWeNUvW5MxUeXP3exbmIGKGU5q
         KouRWHmylb8OVl8yKlzXcfa18teKJpxOL8rjhlIIUbjMpSiyFK+T9Z54yV4Zl5xjzXUT
         4sow==
X-Forwarded-Encrypted: i=1; AJvYcCUFVxg4Esuy3PWqKp56c7UFnCpgX5U0KNp28GtLA9puz4Kyn5OdxuGqAemYsocmoZUvks1x7uiFaRHfY6kvJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysltPtKFtpnN6wVLDpmw51reTGOAmXpZ6tl3QU/bHqBDaynN2G
	aBjLKoC+KbZifx8Mg2CA8KRRzuyolJl8IyXl6PtowJ7vC2r99VLVbYW4pqzMvJc=
X-Gm-Gg: ASbGncuKJPphSpF1yh1ERbJ6riV+4sv1dbJR2bmf5r0Zz37gBczEwFux/FsFwInFHp+
	//3XDHR6b80yQfhSI/sYAymA+HG50WXcpQeh0mngg2z/DhIb6uiqfqP6OwiCe9g6zFQ7snBXVuM
	q2WKoyZPvqmOnxBgqnj4OZx+BtHOmX12HkDGjX7wZR4hWH/p5645O1areiSFxprgaIaPv4lIfpE
	VM0ORJ9pGwb9T9T7isLsYIXhgSLmcfM5ymSH57ZiFpJ8ra4wJXBwag2MpkVxoguUxsqdFfDnwP7
	E/csFately3UeKbDdbKRKV6a1NiM/q5G1VVLKWB68ey1LN3EVU2icWv7XhuNbMRI3d+7vB2hkGm
	YEsDeoLuG88ehtA==
X-Google-Smtp-Source: AGHT+IHATfn9TRTLOTAhavKu9D+jbJzqaZe2/6qO1pPzjKVbpE+un6V0tEdk13nda5FV4+6YBmrqUA==
X-Received: by 2002:a05:600c:34d5:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442d6d3e243mr178053375e9.10.1747149978722;
        Tue, 13 May 2025 08:26:18 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ac8csm167068485e9.33.2025.05.13.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:26:18 -0700 (PDT)
Date: Tue, 13 May 2025 17:26:16 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNkmCJK1wOLGmgy@mai.linaro.org>
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
 <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_082620_462003_21FE7922 
X-CRM114-Status: GOOD (  23.46  )
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

On Tue, May 13, 2025 at 04:31:05PM +0200, Caleb James DeLisle wrote:
> 
> On 13/05/2025 16:24, Daniel Lezcano wrote:
> > On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> > > EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> > > processors. They are found in xDSL and xPON modems, and contain PCM
> > > (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> > > 
> > > The EcoNet MIPS SoCs are divided broadly into two families, the
> > > EN751221 family based on the 34Kc, and the EN751627 family based on
> > > the 1004Kc. Individual SoCs within a family are very similar, only
> > > with different peripherals.
> > > 
> > > This patchset adds basic "boots to a console" support for the EN751221
> > > family and adds SmartFiber XP8421-B, a low cost commercially available
> > > board that is useful for testing and development.
> > > 
> > > Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> > > peripherals, and for historical reasons Airoha chips are sometimes
> > > referred to with the EN75xx prefix. However this is a different
> > > platform because Airoha chips are ARM based.
> > > 
> > > This patchset is against mips-next.
> > > 
> > > v4 -> v5
> > > * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
> > >    * Improve explanation of HPT timer in changelog
> > >    * Move pr_info to pr_debug per recommendation
> > >    * Remove pointless debug on spurious interrupt
> > >    * Small code-style change
> > Shall I pick the clocksource + bindings changes through my tree ?
> > 
> I'm new here so I don't know what that means for the merges which
> will happen later, but I don't see any reason to do otherwise.

The series introduces a new platform. The patches are touching
different susystems managed by different maintainers.

Usually, the changes are per subsystem, except when they are
interdependant.

Here you can choose to merge all the patches through the mips tree or
let the different maintainers to pick the changes related to the
subsystems they handle. You should clarify that in the cover
letter. If you choose the first alternative, then before merging the
changes, all maintainer should have blessed the patches with their
acked-by.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

