Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F821C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=; b=LfSN+C1NOFh7XImgJ6geoDJTUa
	yafsaUG20R5caUpgdy1aUL4MNGJGOlHS4ZL1ahM2T+n9ls2ZgrMjZGeD9cGRUUE6B73hPwVgBeFLG
	kHOCVd8nw2bqORrEtU9PCaltkrpujduwy7PHXDn7eIUfZvhdc1WU1L/4apwEE3wtlXM1Cy5tK+UaH
	PYZh+L8Gu8EhdxLueasuqG86sSPDe8G0cXHZNiRtQXeCtoKZPgr89FSHeMGxchAfWNqdyjyo5Sc8T
	fgRjOT+zGuZuojilfK5+fB3mUvLDG5O51yuyLRq6zHh2T3IMpS5m8+5tg/vdPZdoiljMb0ANJONCB
	1rK08B4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sl9-00AJBn-A3; Wed, 29 Jun 2022 08:09:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sl4-00AJ8z-3B
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 08:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656490149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
	b=Oxo53p/fRlsSMA3GK80B0wxaV+6dXETfzm7WdLOVZ6ix/DWgAC4nx09DRv2BO5T3ohmv20
	WFpRdwRzwIbXgLzlxSwbe0a0TGiN1FLVjwVL2nrpk7uL5xzPTqbhjom+lLFue6AafELb3x
	Mdn4CcLpWouX/V4cSNrOhKmZTH845mo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-jOt5PpSuPyy-kHM6XTd0zw-1; Wed, 29 Jun 2022 04:09:05 -0400
X-MC-Unique: jOt5PpSuPyy-kHM6XTd0zw-1
Received: by mail-wm1-f70.google.com with SMTP id r4-20020a1c4404000000b003a02fa133ceso2209086wma.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
        b=tWMxhFbIofNjE24+jNSa5G8Zca1fmDvPDErqg8uVat6s3wlQ8nkg5KrXb53JaDY7HS
         q0MiWxWHE7t+M1imErqtHUbuVzv562KmKlrPBesJjtOJezkCrhjFPYuG5Iy7zF/rLE4r
         BSXdaQPGcbWJ6mxOk5jkvV8j3dHURLC6oRcYlhrPsQINiWOIGQvEnMQ5GkDJSDa/MzdJ
         DdaGvKU0mVugbTt0QyR16+vFvg/E0wHwkhWp3AMEa0x4zU5YjDUUGBnYxIoL14MoJy1V
         d+X4GB7CQh1jcsxMCB46IHOXzqGFsvTrxuar47XKrELXj44vJWBHHOgTtsnKivjbizrt
         Y7Qw==
X-Gm-Message-State: AJIora/teZtdhGso8//9icJRWgpq6e/x6kLmYT1ArWLQtWUFOqyALwmK
	ah2fHsnvinQW21mErgazDmkD/Qxe/j8rvPt+rUA/d3D7dUS2DPfw+Jj2mKrE77nxepTls8ll9ou
	bSEUFa4a48y1c8nDCh/4yzdz2Z/ynzitF
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201667wmm.70.1656490144655;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usFW/96xeCeX9gWa5EcwEsowhB540yEb4Gaanj9433iMcJH3n1uDXhdEWzSLPQicn1TmuJ9w==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201616wmm.70.1656490144372;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003942a244f47sm2507134wmq.32.2022.06.29.01.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:09:03 -0700 (PDT)
Message-ID: <a5a3e2ca-030a-4838-296e-50dbb6d87330@redhat.com>
Date: Wed, 29 Jun 2022 10:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "acpi4asus-user@lists.sourceforge.net"
 <acpi4asus-user@lists.sourceforge.net>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
 <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_010910_330307_D9BD54CC 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On 6/29/22 09:55, Christophe Leroy wrote:
> 
> 
> Le 29/06/2022 à 09:23, Uwe Kleine-König a écrit :
>> Hello,
>>
>> [I dropped nearly all individuals from the Cc: list because various
>> bounces reported to be unhappy about the long (logical) line.]
> 
> Good idea, even patchwork made a mess of it, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220628140313.74984-7-u.kleine-koenig@pengutronix.de/
> 

FYI, for patches like these what I usually use is:

./scripts/get_maintainer.pl --nogit-fallback --no-m --no-r

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


