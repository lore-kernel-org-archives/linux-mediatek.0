Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58CAC021B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=; b=x8ZDZrUK/bC/o+N51Y+XdLoj8/
	QkgxMIVJl2TS1dLVmGKNVXczVn9y/VY3EyJqGO6WzesyCxt5o/Fr8l7jEPeYbjmg2jbKKf1QQb4TE
	b3EE1mGsE3SnijiK4+/PauVqPpP6bBN33veimmM9DMRk+hPRHMHC8S9z5ABh/mprEaEsRync5rsdJ
	xxXvjcMD+0e/B3S0aZ/ERfE+XJYXtiWr/eApeeZE2YSEaAK8hSh6Rg98HtgI57iN8HafWi+W12PJu
	X93ZYRMcl2xv/eBf6nykCkMwrU8eHtZQfBZtjQapyYfae3TEC148qW/U8mt2i03BlZEtsaN7cMVao
	YUPbqv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrVz-0000000Gfgx-3M40;
	Tue, 25 Feb 2025 09:46:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqz7-0000000GX3D-27B3
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Feb 2025 09:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740474732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=;
	b=MbtKSI2xQNk/V1HxCMrVWJ9W7oqf4wvFgsYbF8OazDcVU6pyNMi/2jqPPNz0/SsREasNM5
	2CQzIeZeU4+JqekhMKe9HZY7fCY0H76HShxF6FEHyao3CktoE7HxmC1GE4twD0Dhmojre6
	x3aQju7X6k6E0V1mI3l93z5gTLdyiL4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-vh8u3aUaOw67lZUenB-xdA-1; Tue, 25 Feb 2025 04:12:10 -0500
X-MC-Unique: vh8u3aUaOw67lZUenB-xdA-1
X-Mimecast-MFC-AGG-ID: vh8u3aUaOw67lZUenB-xdA_1740474729
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f4cce15c8so2513757f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 01:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474729; x=1741079529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=;
        b=s6j5cYPLhv8zfBKZsT+v3sCwY6RyUoao5ruLzhcMzKHHguEfUbAvoxOP18Y7a5v/K9
         M90yfWjxa8E1VelzKwrH31sbTGB3YiDWWN6XoTUaX/VA2NEZ4PrLtSpCUVoZd0gNlbiQ
         IIMLWESyq0xCQJ9VKbz4aAj7nYwjZmPwJTideYmy6nfR72vN6+rVRss/CQbC6JA1pag2
         SPybpfdKgtHL4idiSBc81MaURSHmQZ43OIPnVgMHG3LZDXJtSNoboAVk+6Fz+HvuESy7
         RAyZTsylJ8tVf3LoJLQMucb4fFyyXt/hGy591uMwYzlQov6dKY23hzZJPg8tHfpIKCoN
         tm9g==
X-Forwarded-Encrypted: i=1; AJvYcCVWaUsJUOJZyGz2HPBu7H/C882hutzgirREwRqS+o44ejSCj8fzz4NRIECXVCG3s8wgvIlttybdO9ArCDOQMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxps9aPQvrHrZAbD2xNH0DiRGhGosw9rBcZYoT0vIpwrqyMD3Fy
	rWcn0TSUBwzo0TnAYeMlIh7zhkRdLoJ1WvoMwMr6YGMmO5T0LdMmh8lOHCGeXyARFCx9jeNPOwe
	Gt/ipjrse5T+okor9RmLgQOVoQdcNuBtSVUrb248365fmNaceJWivjD3GN0wlL3Zw/zjEmA==
X-Gm-Gg: ASbGncsQy8SaZNGqVsHsQI6WZlERu5C0SriwQzqBR4LORW7qgIW4jNWcT9vlVRcfwB3
	YTH5vPQMvjV87VDVd9GhZcXIAHqkEZWP3zdI5OpGTbXI9+2zg7H0Q0tsXsc1+2atmEIWGDmMI9j
	gs2c8psSolH7j6ITeRDkaUWAzU7AnSjcwhY8h8Nri3RPZQ+6NhktftVK6wesfo/OG3y4Ds+MB0Q
	14QyaaIVPRc4hEKFuUtqy9mcLwFE2aFVZNKtu1JQFxivk/8I7zeLJZdre5LMTbA4kQxFrc2GI1i
	ZRcQ2jGY236e9pitzEQozMwGYvQIz4uY1T5I+ODdqn8=
X-Received: by 2002:a05:6000:1548:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-390cc63ccf0mr2071744f8f.48.1740474729260;
        Tue, 25 Feb 2025 01:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEolJkbGKjJj6h9uEQW/S7a4oRbKctMUQh95C2XKh9ehqDL16AcT96CB9ug5umxMfHDYCtt4w==
X-Received: by 2002:a05:6000:1548:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-390cc63ccf0mr2071706f8f.48.1740474728801;
        Tue, 25 Feb 2025 01:12:08 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd866dc4sm1624406f8f.11.2025.02.25.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:12:08 -0800 (PST)
Message-ID: <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Date: Tue, 25 Feb 2025 10:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
To: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
 <20250224180152.6e0d3a8b@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250224180152.6e0d3a8b@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sda8cQZyiVIEuN5zIDUWfsNaBJszOBn52_uk08zpH-w_1740474729
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011213_609551_26796B48 
X-CRM114-Status: UNSURE (   9.70  )
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

On 2/25/25 3:01 AM, Jakub Kicinski wrote:
> On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
>> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
>> +void *phy_package_shared_get_priv(struct phy_device *phydev);
> 
> A bit sad that none of the users can fit in a line with this naming.
> Isn't "shared" implied by "package" here ?
> How would you feel about phy_package_get_priv() ?

FWIW I personally agree the latter would be a better name.

@Heiner: could you please give that naming schema a shot here?

/P


