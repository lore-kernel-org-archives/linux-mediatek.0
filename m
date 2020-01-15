Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506ACC33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 14:52:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F2B2084D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 14:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFUocJ9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F2B2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iPiVEm71v2GB24YviDE1qihYmeL8NUVBVMccB39CEU=; b=bFUocJ9k7VFjDh
	lKvYxdFj2JX40Y9TEsRliDzgW8CjRdYrpNzes7nlz+fvV/nhpHbD+rUbj8Dkkhr/Hm8ULYgEFF4kF
	pRsXEjJ5Y3ADs1qwxPA6fbtygJ9Euy7VN3B8fOx/itlfGKRtKqGeS+LcjWHKT4Lf3u0ODdAPM+mb2
	SzNgCcDiPOOPsfNj5Ak/1KEik4ytAIyNmljxag70maAyatzvRJglukQsRRVGEizplkF6srgkhqs51
	kuQtlgZkCmJ19r240X1XrKVa+NTYvz6EyfTxEX/+ELRVOh7V70VCeyy1B2IuvN2IZr0YoYAFXAAfW
	+eFsBCwJz40h2KNGMJKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irk1j-0002Jw-7m; Wed, 15 Jan 2020 14:52:11 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irk1d-0002IO-Iq
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 14:52:10 +0000
Received: by mail-oi1-f193.google.com with SMTP id c16so15616142oic.3
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2020 06:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n8ZOYkpIoAOQdlGT8sz2BDJ8ZlJ/E1aAe+yKBj0gCtM=;
 b=RGJ0/aKT9kRlfv0MKAZ00rX7PEfDE8zJpmtlkDO38G9Y/xB3ddTsfGNDp598TalbWj
 oa3CGgE55gdyq3/17n+45kf80rBEcrGgrR5lT/twvqx7f2do02xsThvpkPEUhSg+e47w
 9+/EvDuoysYlIyU8bj5ukRdE9SHW6+9MIjdgXUSuFPRDNgejWTVV5e2zxyMMNXUTFCPt
 7sJD0c0CBzNvBB/hDR8Ps2uLcYnjCOSbXigFTX1i36DTo7trEn2y1tdlYz6HKAtlnXGA
 TM/UZoDdSTqXFCChjfOre32SFfGXj5CPk9Ll0yNaXEmpuzqmp2TxoPJ1zYHRr4NcjKu/
 o91g==
X-Gm-Message-State: APjAAAW8mlOGDDeqCb7fctaAUVylZrctrKdX/6aX+5DWnCdJJ26EUSRV
 YWtHNFAnc9ViLMG04ojJAHFpJuY=
X-Google-Smtp-Source: APXvYqyxVr4+PNclUZbamSFaKiRKZWa8B5+92qtki16qWMbPYBOY9YinQjG3xsi/Ud1tow6ToMTqpg==
X-Received: by 2002:a05:6808:486:: with SMTP id z6mr57191oid.117.1579099924241; 
 Wed, 15 Jan 2020 06:52:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m89sm6663486otc.41.2020.01.15.06.52.03
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:52:03 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220379
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 08:52:02 -0600
Date: Wed, 15 Jan 2020 08:52:02 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: Add mt8173 elm
 and hana
Message-ID: <20200115145202.GA27021@bogus>
References: <20200110073730.213789-1-hsinyi@chromium.org>
 <20200110073730.213789-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110073730.213789-2-hsinyi@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_065205_624446_4B9EC5A2 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jan 2020 15:37:29 +0800, Hsin-Yi Wang wrote:
> Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
> SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Changes in v2:
> - fix dtbs_check errors, use const instead of enum
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
