Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EA8C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:41:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B907E221EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B907E221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KLjQwAXVA75UBnvcnK7mSn4c/S4MVwRPMT2TYVKIZNA=; b=C6+8xULSo+4qiL2Z5jo8y/rIh
	uimLFk7OxkGBtpZMiGqserJv2vYqsCi66gVsvIj9+RTeEQFWN3+jXk4ctYg13wvwinOaPnzTI6JXg
	k+XdAQdVrIKdoAJW3tPKsLhBwfkxTA97fH4kzM5k/W905m3vhJFjdsAzRZxpdQlty7K3xTRLyp4iv
	+coNfb36Hma1Ja6hGizu4Uci3tONHcInY1iFmh2xUuF8nYA/ptie86+FW/vqiCOIQNBsrGR+A/0Jm
	Q6ogvraJLZQoGgGNON6EAmOPZENhVVch5zFz2aWeSqMVZC3f5RFG9vjsiAjepcuaT4hFIe0oTWo/y
	HVHvphLDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyxRX-00081Y-Tu; Mon, 11 Jan 2021 13:41:12 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyxQR-0007Lb-2w; Mon, 11 Jan 2021 13:40:04 +0000
Received: by mail-io1-xd29.google.com with SMTP id w18so17842760iot.0;
 Mon, 11 Jan 2021 05:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPX+TWLUVWMLDjFiSnhOZGL+SWYosAkfqkHnqdSxUAM=;
 b=oYpWOHIwy6XftMFufPxgO9fchZbGj2sitlgT6yrncOYW3o+rDnEaoDdEBgXbnIkNeX
 BRgMVzfxXtPehTLtxH6/A+/pCGEJ3rhhXAiCTmRByGxtCcl8HuLLDc4BXZpAV55H3biZ
 0yDuJ/sOHEfW0HPXS5Fkcy+xtw+eO8Vz+ABu8n7XEudo17TUNCRfI2C5ZA6PpHF0HWLe
 Lx7Pjc40cr4XA321nE1pFq1IE4Pg7cHaco2k4hd0nh2MkbN3i8tPv7ypcjFqWMR7xBRv
 c3Bd9zDm7FaaHKwWj0GVydeK7Us4jjDSjh2RO7254w2P/sPOk9WCkIF5XTrXgUCTwGu8
 z98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPX+TWLUVWMLDjFiSnhOZGL+SWYosAkfqkHnqdSxUAM=;
 b=m6ca22xp/IQGetvQVXomcbhG7x3pt2HxMy3G4yeDQj2iJq0CcafHmgbLV44cXU1tC3
 +eeB8BL7GQ8IvIJTLnYweniHXL7aIBdWvbS1imGBdvF75EoI1vRPqIA4ah1y/e/DZI1o
 z6xyj/KnNJm9VAcxDTtrE6xl5/ozN8a8hwA4iY1ztWbZgly1BI8WOveaoRyqz4IjDkSA
 ggDs0L5ViLzDxcVw0/xdBhhr9JMjCOyY8T/W0outqOF7GynSJLXQRCSe7SPdVx6n6pHF
 bkNBshlnSw8frgsMYb1o4ADoCnEz3P4xK5v2mfY/xBNW8NQCJRc8Wa2fD/enb99IaGrY
 W8Kw==
X-Gm-Message-State: AOAM531bIujj0dkK+nSV5Mr4pS1ivynWvUS2lhjYEDvt9AM4wESDMeHc
 XmHvrTpzz8zSNezh2K+6sui6T2/T/OLuY4IMFcI=
X-Google-Smtp-Source: ABdhPJxdIHd1jmADjrtYp3Zsp0l/yfn12bjpz+qSZpWV+XVteUVCntZjcfHonB6Q9MK8aoe7wB6LwfSgeU+sRkaghGs=
X-Received: by 2002:a02:c8c7:: with SMTP id q7mr14527159jao.7.1610372400687;
 Mon, 11 Jan 2021 05:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-3-dqfext@gmail.com>
 <20210111110407.GR1551@shell.armlinux.org.uk>
In-Reply-To: <20210111110407.GR1551@shell.armlinux.org.uk>
From: DENG Qingfang <dqfext@gmail.com>
Date: Mon, 11 Jan 2021 21:40:00 +0800
Message-ID: <CALW65jaqciOiRxJxzPiEADgpmKa7-q2QfQnBdaVMcOa5YDHjRA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional
 GPIO support
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_084003_228752_2895BE54 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 7:04 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> FYI, Documentation/driver-api/gpio/consumer.rst says:
>
>   For output GPIOs, the value provided becomes the initial output value.
>   This helps avoid signal glitching during system startup.
>
> Setting the pin to be an output, and then setting its initial value
> does not avoid the glitch. You may wish to investigate whether you
> can set the value before setting the pin as an output to avoid this
> issue.
>

So, setting the Output Enable bit _after_ setting the direction and
initial value should avoid this issue. Right?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
