Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F71C43458
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=; b=ezNAXqXWXGT/nCaFYUNLSzE+bX
	ijWmjv9Wr/iNsqoZtNBdYzTlY/CGFW1B521uOViA3hOLoHYwgF4qu+tyCegyy49Sw8ofeYRBheUnl
	PHtUunbZF4W/yq7TsucD25hm6CN7R+g1Qz3URiNun1xlTa7iwsb2tZxLa76s2YuqumjuSvE8CDZ+M
	v0/TbTLyXzH6Q+fg/T1vObw9oJPNVCGldePZX/KzP/FaS6II+nFCH3t8y9vbdM69lIksVDy9ri3RN
	Nt+a4HN3yTYm8athBE/xs/Dr7RoDGFSelNQWqkWtwk5kCzVksMLEJYKE4+Hi9uD03ZAeao/ecZlNS
	56yYUQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgA26-00000008r35-0lid;
	Sat, 04 Jul 2026 23:44:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgA23-00000008r2P-11WY
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jul 2026 23:44:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c7cfa17fedso17191215ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2026 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208662; x=1783813462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=;
        b=j1a5KlUNHdY9MzOcWItsxi6PvaZxtGUQFK7q7kn7b9IxXeCgza4fUIEKqpqjQ1bQ3M
         NFxFpe1yyySz4Obm4vohCOVxoEXDw6SmAr587z2lcte5GbLTjBbBpU4qKZpE3HxWrVLb
         p563SsnlYX+PUnImTIjjPlTNsPpYM0+HMbG/tWLDAs/Gz6MbC5xxeg1weO3gZiOVsrsi
         jQ0tYUC7zXcUS7S3YIMNcbIsAhzhpRv0oZ4/kGTUWBobk8w54WFh2nEnfseDzLNW6IgP
         NtYWkJOq2lk9SeOO8fKztDUb/bWrIKL3XM/hQzc+sy8SO72lk3VFpr0T/nd5oU2+Y1D3
         d3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208662; x=1783813462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=;
        b=pe5olG5luNcuOBgVorJStfr+SXW0uiiNJ0JRwCkTzoi55pGG5BmU1U4RNZ2JHVoQ/Q
         lvY6XgcBxcIW/WdWehMflxWFKi1K4/Lar/EsLQC3LANT8b/WykXVtjI4IV3IAlxfrOCa
         YHQS75lQu2x+p+RV3v3UvfPMOuYGRptAI/l29nzli+Htx4pU0tuxAwBJmFVF4wPGIq0B
         dBrCQ61h9vHAj6ayROEjY4gG6Jc4Eip8qrtYtYM+NV3C3cptCGvxGdV9d9pzE+25+4bA
         aHIjVWx8d7s4XElZIGg1/EWnJNKlth4yV5SnySZDr/A0v8mrCrMRm1wiGjsMcOZXD65l
         0wCw==
X-Forwarded-Encrypted: i=1; AHgh+RpGjNr3t2RNXtutuXr6s8HT08LgeHlicz0iyCq/AwqZJJztlBaigK4Zd/iaMf3Y30wBSIoc9g7VNNrgzrqm2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1FXBueGUdpDX8tZCgRDuScUYfSpMaobLH3EwR3b/5byWpP2R9
	0zz/ZnW+tkwc4OYzFSigj+Sj70pLoPFT1CoqOo7lpUI2WDohqNuUSoDx
X-Gm-Gg: AfdE7cmAz+yy00yLK/Y4n/kGmY5J/rn2ogFINK1SFto1Xjh+B3Y47XJgDBWxVNWNkHX
	HcHFdhJBvbEqiy7RGk5c4Vomfny9d36LU1nR01MJVz54mn9cmYbxFJC+tkVkW7iq7tXdmUPXYzO
	IB6S7zvU8ua+BbZrXSjUv0lMiSdCKUonI+EsABFuGwRYweA9K5+KYGv5UCptlhoHYZIDmpDD/j3
	PXP+XEXf5zojRLSOJSQorVGt0LIxCzh2cT5ziVsxifC53Cu48l9JjiQSp4lwxk8PSEc3DoOkkWd
	omAMF+aDptKUSIxprY3LMRx2ST/cXBzYbR0BVCbZT2S9l9gQd+91rqAeFAz3w6E/jMCBh+gyGjV
	u5xK8u1HBuVd8kbjdn4mCCj7cIf6Q9zRsSs7xQ8rfQI0vCfhiWzDKybeobeIUmiCJEi3cHxJRDR
	XODok/8Qqb5bTMlCoOzpIvoEaxc/aJVqk9jOPo7NIl3MB/1u/6bz2OxE7dsAH+dYW/
X-Received: by 2002:a17:902:db05:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2cbb74ff24dmr43520125ad.12.1783208662110;
        Sat, 04 Jul 2026 16:44:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3f90:534a:314e:e11d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm34410696c88.2.2026.07.04.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:44:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 16:44:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
Message-ID: <akmZOC_J2ZTl4zLX@google.com>
References: <20260703115601.1323491-1-wenst@chromium.org>
 <20260703115601.1323491-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703115601.1323491-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_164423_288882_8E2DC7B7 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Chen-Yu,

On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> Elan trackpad controllers require some delay after enabling power to
> the controller for the hardware and firmware to initialize:
> 
>   - 2ms for hardware initialization
>   - 100ms for firmware initialization
> 
> Until then, the hardware will not respond to I2C transfers. This was
> observed on the MT8173 Chromebooks after the regulator supply for the
> trackpad was changed to "not always on".
> 
> Add proper delays after regulator_enable() calls. To avoid impacting
> the boot time of existing devices that have the power rails always on,
> skip the delay if the regulator supply was already enabled. In this
> case the regulator is either always on, was on by default at power up,
> or was left on by some other driver, such as the I2C OF component
> prober. Either way the controller has had ample time to initialize.

Unfortunately we do not know that [it had ample time]. For this code be
reliable we need to record the time at which given regulator was turned
on and then execute/adjust the delay as needed. Until we have it we need
to assume the regulator was enabled at the time of regulator_enable()
call.

I am not concerned with increased boot time too much given the driver is
set up for asynchronous probing.

Thanks.

-- 
Dmitry

