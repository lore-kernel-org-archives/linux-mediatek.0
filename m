Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6D1C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:18:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9614B255A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TrgaJPj4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTduClYO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9614B255A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VR7KZ7/qcSqeqMAaNfgRmHfg2K9rCW8tlLpIoZpWnvM=; b=TrgaJPj4x2zuBEcjsBknfYLt1
	r411AHe1Imgsn3TSq2io8kYYjMufz+z3JyQrEGdUP+ozkvER5ptG8MY06jALyi7dN9byQx5nEH1eq
	JjTKdqkRBNgtiMbrrp3X46Vq2wG8GT64Ng9QcIbzpPLLx4oaiKrp2cvGh/5h4HjllG6ye9qy/yhxr
	FSWzhyv1P8cR9MmteAaf5K7KzaNn+tf7wzzxu0reuDVztDkqm4artYEiAcs/H5+9zus74PlvqJ/Z/
	X4Q2sW0nouu+kirim7G2MT+ODICnBdvV/YvbuvrnS6ytDosVoR4giO6tKQ0wsViN0iaS76JgIjmsz
	+TJ7atDYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpxPz-0001vk-MW; Mon, 29 Jun 2020 17:18:08 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpxPx-0001v7-7h; Mon, 29 Jun 2020 17:18:06 +0000
Received: by mail-pg1-x541.google.com with SMTP id e8so8608368pgc.5;
 Mon, 29 Jun 2020 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s8XhE/yeiReS0OBvf4zDHqlAiG3UaGBgMUzuoNaO1KE=;
 b=gTduClYOv3wkN8/Ems3erM2NjqG+IiEFnHEF+DYl1V3rbPISmjz8B7FpBrrvpDUZrG
 M1J1mLnoS6uCKgjfJe03t1F8d/Lg2kp3DTuQSut6DXI284WMKgClD4OZcJVGi0jqf6eJ
 WAUfLBNnfQS+R9PmloXTpINYo7G/DwJ8+URWVF9M/lcxgV8YlaYBPOE+3exkD2yx6A3w
 zzbBvMwa8C8CRClbtBumT2L/FgJ1dsUHROG5SdrfHHCgQN7DXQfce2WqxOQ2SyMkbAjT
 rBMOa0m6hL9mcSmp5vJQpoCvcSEn+Hq5RMK5gDTuP3R8JQ9ef99O49k0L6W6lQ/YDWvx
 QVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s8XhE/yeiReS0OBvf4zDHqlAiG3UaGBgMUzuoNaO1KE=;
 b=k58Ln3+Dna060Qj83y+cWOVNcRIYDkKgzm6D25WXJBJ+8cANl/DLj1no0CHhlTYqwl
 hauya4rMj14dUXmwdmLfHJG673o4GEtpwCMrD9WZ0Y7iWV8/Ya0+UwAyA5nDbr4TjVRx
 JKLMiDGIG3AF4b8/VgmNDzXTCfqw1dKPojM05XHyuKQb416zih+3EUT5C6yZThWui/3k
 SShGF1DDEGnDIpK8Fzg+Hg+I6N/6+gC/QNMkbMXb6yuBKFg7YfnZliPqIz6VxdvR9NRK
 TylJPdHyfbQx3ATI+4epN9a77Hk3NfAKEWGsTmEgdbfWN5lPUsqiGJ7tXwgZ6+ARsVgC
 kAMw==
X-Gm-Message-State: AOAM533IizeON8imh60vGUi8v0iRVIFqco0qIg52NqAH+38JEAwdTYpP
 dy7QAQaaw+Pm8qDVTgiffp8=
X-Google-Smtp-Source: ABdhPJyUXxKy09lWItf88ToMo5k+WiBGp+UfOAXoak95PYU4T6yrCI1AHmQzoFZDsEJL5LvJKRPfGQ==
X-Received: by 2002:a63:ab0d:: with SMTP id p13mr11147237pgf.327.1593451082661; 
 Mon, 29 Jun 2020 10:18:02 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id s30sm342589pgn.34.2020.06.29.10.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 10:18:01 -0700 (PDT)
Subject: Re: [PATCH v2 03/10] net: devres: rename the release callback of
 devm_register_netdev()
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
 <20200629120346.4382-4-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <91a59f41-6e82-6fc8-e35c-8be948dca158@gmail.com>
Date: Mon, 29 Jun 2020 10:17:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-4-brgl@bgdev.pl>
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
> Make it an explicit counterpart to devm_register_netdev() just like we
> do with devm_free_netdev() for better clarity.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
