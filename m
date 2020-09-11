Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1C5C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 16:47:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37709206A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 16:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/EBjtxV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmVPrRxb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37709206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r3kHkclocE6JMkC3oQWHrIc4oZFD8VVSb0NRgeQlmBo=; b=s/EBjtxVcekYBhtFNhJRCFxLX
	R0obJrkOghtRlozW80UkCHMB6dCp+HP9ZcV7J87vZe3O5JJOFG0giuQC+WTr0dWf00XK+CpVLcAcE
	YtnVfNQAxZ3Q2z9Fw3y9T3pkqd2Zo/9AQrNedSMyrcy3rmX+WLg/05nUJYmwImnFSeqoU8m5LbYG9
	4HNjfYqjyao0LIDgBwqYiyNUbMblswsXlZfrsuLBYtHFN8yRt8GWe2CRPAv0AxfKzN2uaWiRzVXco
	sCMV8Pz0bU+T89XTZliLAmJmgzPjGT19cTGJSrYqt6WJ0OtB6jt3HmtIj1vgin5WdYU+O53fnzmbK
	Px/K6MJ6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmCd-0002Hw-S2; Fri, 11 Sep 2020 16:47:11 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmCZ-0002G2-Jn; Fri, 11 Sep 2020 16:47:08 +0000
Received: by mail-ej1-x643.google.com with SMTP id o8so14642271ejb.10;
 Fri, 11 Sep 2020 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nOGJPFb8tqcisgKdNWRkr2oYMuaCds9kPjWo0o0S++g=;
 b=OmVPrRxbTjFVA8eJu6UseFiGVPhkZ9W5C607RsegD7zaZekS/T65r/vxggtvhdoDvF
 ZXZT8B7LvshdNN9TVMCL6LdDKewnsGAyIbEwtNBhN0OyQbb0mHxzWym5IUtId07kErMM
 zCUjfle1MPobR9Lemz6YvCYFeunAV6IRs2fLR79yml/+r2wQgZ+Q6YuPMd+DBhHjb6xW
 F0M2hS8MFGyEe9Su7dyjPlheIMCIpVbWnS1u87ff9QPCsR9fHOwP/WGJIYkhWK/N4BG6
 ktAPLsL+LudvLeGzQxhUPFNVdN4pB9byt52W+le5LVFhgrJXsbEm0iJQKtKXUU6zPB+j
 Q/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nOGJPFb8tqcisgKdNWRkr2oYMuaCds9kPjWo0o0S++g=;
 b=qOLG6lGFTq1uvhrZsQI5o6/6eBWt5xf6MshB/w7x0v4+o+TpFs8asPShxf005MpTHs
 umjxJg3mFCY4XiO6pWkWmRRaare7BkzY3gXf7fC73t9NgSjvriJvrPmlpW1N/OgSDSKs
 1pzZKCtKVYnw9ObPe+gPBDNL9C6uveKSlImSp8E3i+IABDjbcAnbIglUEKiu2K9M0f7F
 11wZ2nLP94nvXMqo8DlppjcLZzAQxAQ3zej0jrA7+Y/+IhJovRkMKqto5IPsuiFJxbW5
 HD9lgY+JM+NvHUxULNg74vryccYFdjSFXkYqg/vyPy5O+/4eUPGwpcj7fSPEENIurD1E
 TvmQ==
X-Gm-Message-State: AOAM531LBIvHNfswXEC/icwr7HGi7tbviYWR341yOcd0sKmhS9BJ+xP2
 EFDx/8NkB/AOf7DWPly+zDU=
X-Google-Smtp-Source: ABdhPJxLGtNY6xZ3UUPcj9fN2eK23dBa3FX7Aol194xPWU6GsHLK8Ppa0YW2W4BGAocAHdZP5Zn65g==
X-Received: by 2002:a17:906:b090:: with SMTP id
 x16mr2883008ejy.46.1599842825028; 
 Fri, 11 Sep 2020 09:47:05 -0700 (PDT)
Received: from skbuf ([188.25.217.212])
 by smtp.gmail.com with ESMTPSA id d24sm2088584edp.17.2020.09.11.09.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 09:47:04 -0700 (PDT)
Date: Fri, 11 Sep 2020 19:47:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v5 0/6] net-next: dsa: mt7530: add support for
 MT7531
Message-ID: <20200911164701.ozoj57pc6zmlsru7@skbuf>
References: <cover.1599829696.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1599829696.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_124707_685950_C65F0DAC 
X-CRM114-Status: GOOD (  18.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, frank-w@public-files.de,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, dqfext@gmail.com,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, opensource@vdorst.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 09:48:50PM +0800, Landen Chao wrote:
> This patch series adds support for MT7531.
>
> MT7531 is the next generation of MT7530 which could be found on Mediatek
> router platforms such as MT7622 or MT7629.
>
> It is also a 7-ports switch with 5 giga embedded phys, 2 cpu ports, and
> the same MAC logic of MT7530. Cpu port 6 only supports SGMII interface.
> Cpu port 5 supports either RGMII or SGMII in different HW SKU, but cannot
> be muxed to PHY of port 0/4 like mt7530. Due to support for SGMII
> interface, pll, and pad setting are different from MT7530.
>
> MT7531 SGMII interface can be configured in following mode:
> - 'SGMII AN mode' with in-band negotiation capability
>     which is compatible with PHY_INTERFACE_MODE_SGMII.
> - 'SGMII force mode' without in-band negotiation
>     which is compatible with 10B/8B encoding of
>     PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
> - 2.5 times faster clocked 'SGMII force mode' without in-band negotiation
>     which is compatible with 10B/8B encoding of
>     PHY_INTERFACE_MODE_2500BASEX with fixed full-duplex and fixed pause.
>
> v4 -> v5
> - Add fixed-link node to dsa cpu port in dts file by suggestion of
>   Vladimir Oltean.

Thank you!

-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
