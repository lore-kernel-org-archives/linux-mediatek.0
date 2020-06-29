Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963DAC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62FC7255A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gUmx9o5M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU3gMqGQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62FC7255A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EaMf8wGDMp1W5G5WD2uJMeTJlAj2J6Y/hw/5P2CQ6QQ=; b=gUmx9o5MZOmIzWaMlPcEfsiW6
	4+02IiPi9yYttuFKEo1N92EgOmxylc2/+u57U5sQbuiC+n+RPMdT1eJIVnZj537T25wq/2MO40GvE
	T4R6G3Xs0gDUdU7Zc+IjnaUSBuEJRSRV4YxQem3B7MS5ux8TRBa/1ZRpzAOD7sGIPvuqBHauQ6my1
	21a+yBRjYi1srRFnNNn0immUlnIsiyPSHonCRYYdJw0nwpbtYZFMlVuK5MBWdynZ/9i+I4Y5grV2i
	QbyoLhIq+dA5uUZRSAXBEtE+sm9udQZxCq/kG8Cqfh2trCvRKCeFYzwgLp4LP6vjBTUcR1cYMzu7Q
	l3MfCa9KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpx6O-0007zF-GX; Mon, 29 Jun 2020 16:57:52 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpx6M-0007yY-Qg; Mon, 29 Jun 2020 16:57:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id g10so2722633wmc.1;
 Mon, 29 Jun 2020 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BQzFhhy4PPK+wORzA0eq8X7nCm3stS5K4TwJi9mD/OU=;
 b=UU3gMqGQIDDI4aV0Xe5aM83CVRlvInAiCH7amNVA9uDmhXzVxpFuk1FmMYKZM7OCPq
 a4tPy0pbznEdYQw55lRvmJjvgWSsIc7aOxVebt9kZHI03PxoJP4moiQaIKd2tsdTOA/U
 JnNxFFUR43OLdXU4VvUpzlUX8gBrFgskl8tYwFfefmN/6EVob1pxAVGGSjb+l0vDpJoE
 1a0DQSEFESYn08TPLpotPXvSKci9hmgYmBodhIaYks6pt7ykXGzVHeNT2li7jOYsBXKz
 48agFyMb16F0QjcuV8o6yQ9F0zbAjdFAwxQPL1C9mdfV583zS7X0Ou6E3pbFcUKXGDOC
 eQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BQzFhhy4PPK+wORzA0eq8X7nCm3stS5K4TwJi9mD/OU=;
 b=KQ9til/WP3+xqzdyiVDXeGgN0vPt7ZP0qFF/3jijQUtFN2lsJ4/lahi8+QehoVrHlT
 ygGkPHPFv7O19mtphng3yQUzUNsPlwJrW4CBgMluaJYy2SfN4n2VaVbQ65CZV4oQfWMu
 6lTiPrrx8fvdYzRJMfu8D2yXmKYlCjRzoGzTiSNhcA00aKS73VEUH7dxCX2OXMHk1UBY
 Yj/exGpL8f92zROjpK7+NUrf/DSJYFN9VjzrN0cBjOE1I0jWvqhj1ldnYLbu+QPP+Sou
 u3AynIZZfuwmWFXpe8XChBX/z5k565iDHtsih4N0czueLb1Mc43o0svuQ6C7ntfBHNSd
 etoQ==
X-Gm-Message-State: AOAM533d+4GKQmF4E/GUU5IyuvkQNRcqDx/hNGBi71Etnx2I8besn1Hs
 UJukEue4cfR9AtxJizG2RtU=
X-Google-Smtp-Source: ABdhPJwfZU06pq3cZr3NXQLT/Ki5iwUmKfY9cklbAHtcV0HoBVmGm8eeONMeuclh5OLF4878sWZCdQ==
X-Received: by 2002:a1c:19c5:: with SMTP id 188mr3212232wmz.124.1593449869667; 
 Mon, 29 Jun 2020 09:57:49 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id t4sm510754wmf.4.2020.06.29.09.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 09:57:49 -0700 (PDT)
Subject: Re: [PATCH v2 01/10] net: ethernet: ixgbe: check the return value of
 ixgbe_mii_bus_init()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-2-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7e30d5fc-b6db-1c09-3515-e309da1eb0f5@gmail.com>
Date: Mon, 29 Jun 2020 09:57:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-2-brgl@bgdev.pl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/29/2020 5:03 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This function may fail. Check its return value and propagate the error
> code.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
