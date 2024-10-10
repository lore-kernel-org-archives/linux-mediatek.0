Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57212D24456
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=; b=0y5SqoZIzRi8oEqE6BxqQoj/Ck
	lTm2FwSQWUPBFeHrE82jh1u3hVoG0z4QWHOPQidUDYmh+25M5J3brVx4Pr5l81Zu8shOyrx+i+y3V
	Xz4nWpmlzOnstxVbxpmDotolIgPi7zsRNvrzLLnvGI3OpXJPBAzdp9Zk9iEZ/DpMgaghilZ8ezMGj
	yiSBOJaSCyX3Yok3okrcT7rdRZT6rSX7qv6N35HyE1wyDHsjTXEkQyuv7unGPvk5yi95bQbBPiTGW
	E5tEgBydR91hwzqR+6WxFHqm+RC74A4E9gZvFmfjhBO6nOdOz3/mstZc3jfvek28TpzWVB4FBHfRW
	EIyEVtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1f8-0000000EXxP-2fgt;
	Thu, 10 Oct 2024 22:29:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1dm-0000000EXq3-1j2s;
	Thu, 10 Oct 2024 22:28:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d4c482844so618737f8f.0;
        Thu, 10 Oct 2024 15:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728599292; x=1729204092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=;
        b=gBDcw8F1nkGeYzSUBtEecTdigFY+W6SaFTssLA6A+W7sb8gRc6ufBXD6FNasXyDYUT
         rtLKeCucwChLhflgLmS2i/4RWvKgFWtg132Ombn97rguRVEknzwEVFVE91N0OIIwZBej
         BW4nkpN6hyMHkfty7kcM+AvSYGk8UrYAx0KPYYbnYqmlXeETYI841Ix+iFD+WsmUP7hN
         6uN+tQn/zljbFKG0VZscYLAcA2YMChGOp8NW3hpXVbH6SKdpKC8gsX8+rIKypSTV4KDm
         7H1Ae8ymhyf26sw3T+TmV3rSkZ0OO2v6wMg/X7+lQSqp5J42bKEEteHn3j/LTYm9RgSs
         Z5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599292; x=1729204092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=;
        b=pqhi/43FY2GvDHI60qHl4uisfCT7os3wmFSF+haJa18ixvpf+o0aABgrjsgqXApMGR
         KORVqiNAZ9FyhDPOIVk/3vg7p7dPDa/e7vHBkvU0gRfaXQbWFDO+xLOFEniOXGc8JGTV
         ktSzoMWtAyqCkRc/GgU1LY2wgYP1Avv8f0bwUln3SNM9MXASF2JHAtO068YAWCcsLNlp
         fXdgWG/Ir1qV/3Cz3HgwbWnKcKdnx0uXCjXbLkCt/smfp4SwbKaKqBXcdIjbFeRWl+N0
         Fx+75A5GNiDQusMNkr6eIkCfGwccaaS5J8mkaRXkmYAufqhxYTDq0HCTIbsmrgK1T2tk
         AAbA==
X-Forwarded-Encrypted: i=1; AJvYcCUaVg5xjjS5dLU24QqtD1KXbERakaU3r9LX7Qxzms/oKco9n2bvOej4Mul4WBuSVuHSOC6LcBNzg+ZenBG4PMmG@lists.infradead.org, AJvYcCVnx2ieyHcgjatgkaJeN1QIeOO1LOwVBfh2jEgsm9kQRrpeBXeFmAhxomZLxomNMnO2EWvn32WeXtbqWDoG4jM=@lists.infradead.org, AJvYcCWmmIvQ40VB8fll0LiwE5BHRWcbYY0zRaUGXKBoVMp2kVQMXzhBPFnvx0iZ8tdUHKwVBY5cEtdTFsaJv0Z30K4KZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6QMQ4WMLz0BSyKgTLH7ToQKOfw5CnJ89lgFZNtJbZk+c0rXtr
	8E8rwiH3eDUrbyRwEMS4GSfoyeappWcBHn2AbUo6m+3rBNAXPS7q
X-Google-Smtp-Source: AGHT+IEyhCb2gEHddkiaFk7no88fWWHUHs3t/T3X7uZbjBAibc4VOLvPsp4gP7X9WOW0E9zcoNOljQ==
X-Received: by 2002:adf:a31d:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-37d551ab52fmr366574f8f.1.1728599292378;
        Thu, 10 Oct 2024 15:28:12 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6ce001sm2472885f8f.47.2024.10.10.15.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:28:11 -0700 (PDT)
Message-ID: <56d74806-93f4-4e31-9b21-925b8deb5d3a@gmail.com>
Date: Fri, 11 Oct 2024 00:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
 <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
 <20241010222240.GE4017910@ZenIV>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241010222240.GE4017910@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_152814_500683_04502499 
X-CRM114-Status: GOOD (  21.12  )
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

On 11/10/2024 00:22, Al Viro wrote:
> On Fri, Oct 11, 2024 at 12:09:01AM +0200, Javier Carrasco wrote:
> 
>> I think that the issue you are talking about is that the goto will
>> trigger the cleanup function of the device_node, which will not be
>> initialized at that point.
> 
> ... and gcc will compile that without an error.  Clang will not, but
> you need to watch out for build coverage in arch-specific code -
> clang doesn't cover every architecture (and won't cover some of them,
> no matter what - alpha, for example).
> 
> As for the scope changes... note that you've delayed the moment of
> of_node_put() in some of those.  It's harmless for device_node, but
> try something of that sort with e.g.
> 
> 	mutex_lock(&lock);
> 	something();
> 	mutex_unlock(&lock);
> 	foo();
> 	return 0;
> 
> where foo() itself grabs the same lock and it's not harmless at all -
> 
> 	guard(mutex)(&lock);
> 	something();
> 	foo();
> 	return 0;
> 
> is equivalent to moving mutex_unlock() to the end of scope, i.e. past
> the call of foo(), resulting in
> 
> 	mutex_lock(&lock);
> 	something();
> 	foo();			// deadlock
> 	mutex_unlock(&lock);
> 	return 0;
> 
> __cleanup *is* a useful tool, when used carefully, but you really
> have to watch out for crap of that sort.

For cases like the one you are mentioning, scoped_guard() is the real
one to be used, but I get your point.

I just overlooked the goto as it just goes to a return, and I processed
in my mind as a direct return, which is not! I have even reviewed such
issues in the past... karma.

The goto in that case is meaningless anyway, and a direct return would
be more readable anyway.

Thanks again.

