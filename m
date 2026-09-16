Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C852DC88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqFU5BpLPG1Ad79y0zq7m4k9RGfhTKwi6mVEHKHgkMk=; b=pCBosl1bmdjtAIQNlhARfNEB15
	dnYGCCxSic+0oyWVZgifv2YXpWFy/uwFu2QKYSnSlbNe8Ey/3rbgHFQxR1tHHhCzITHrJv6ukMwog
	RDvfxp5TGmv3SSJjaZpb7zgrDJFw+3L6J6f4qbe9BtUCtgS+v8BBpV0pPom4yN/E40uGsKMqtpG6W
	oJfRY4tja/GZQ5k8twS7AhYmdL4frCj43PSUWSZ6ynY/FrKzvMMSmyMObDoHpEKmotNA4OlHndq9V
	37+lWOKR62vOAp/8OFFWNVLUwOJvhCX6FNU6vi2wDdSWcOq72pXEkjn/IYmbz0ZNSKVDuaf1a+1Y8
	wqo7WEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ice-00000008QWW-1IFO;
	Wed, 16 Sep 2026 05:55:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6icb-00000008QVt-2ubH
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MqFU5BpLPG1Ad79y0zq7m4k9RGfhTKwi6mVEHKHgkMk=; b=f+AE9t5IcA3Fs+QG7oU3+RmbpP
	fBrImqBuRlB2CiG6m75uMUxOjw0LDGHH1LEmQMVm7AnbpFgkYUcgZiNJ/uxrxT3XlR2WgmyZnN+OU
	i3C2geKbBJV6kOusT8TY6ZfOPe6CzzqjZDlqvVjy/QdWwrKwT/CN6QGBJDdE5gjmI4oj562v/REpK
	i0B8Zl+gBztc71GsWdKgnNIyLteWbsQFooVa1IxOPENPu1JFBb69PWQ3O502fRgkFI6ZeiffgO+e9
	NE2Xcy9MPK4K1p9iYO5zEVFnsmXF4YMiTMzYBjzxlKZJx41PWCsAMkvse+iBf32v9+YuB67Z6htFQ
	3YTbZkZw==;
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6ibv-00000007VzK-0cVk
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:55:52 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 006d021491bc7-6aaf6076546so2802337eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538109; x=1790142909; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqFU5BpLPG1Ad79y0zq7m4k9RGfhTKwi6mVEHKHgkMk=;
        b=rsoJejBB8Hg+dcVmjB8mDPSHYFlJo/GnFdy3sYRZyfbH6BOG338EEyV8vDwyxj25hs
         /IRUrLA2GHDyqB7y/MjBaCLdUIgPAK83FlATJv8oiEfqrYhIG/UWZVDhhUioNTJK19TR
         q/ZAPmpUVDowLta2ENj0OjnJa4+b/fSUXEq07LkkA6ikq1//LiotGQasJvNqRIGyBT9K
         XgiEqqk5MfAd+5pdoYo1Dij5m3ghOL7tIG952wMzpg2zhkjxQkobEWPHeXF04boy5hls
         LP+9mQLz9Por2tV9vUc9YGXAFqb07pdM5/ffa4DReTpkry8xNHwtunSEj2NrK0Yd2KU3
         zL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538109; x=1790142909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqFU5BpLPG1Ad79y0zq7m4k9RGfhTKwi6mVEHKHgkMk=;
        b=RU4JawEMqd6EkkxpGUdGhQ2PS4leAA2+Il9FRTHfA6V9G1UTXGveNnQvc/aCkxhU4G
         rA1343kkZ9fB7aDccfvGMVgneC/HtQq6VOjQ0BCxbHmnthXqCoX4ovwQkOyYLQC9QDJx
         oFex7nlUYjWyitDor8UQ/Yk3N4+UDMZZ+vGFmSXzJNHQQssMdDv6Sv30k8FQAJW95RlS
         /FzO4cWscLJYp0Wnaz3P/JNiQGx7pHv+YNnbYmaq4XDpHWjWK2DYo3lFeY/okWq2IrwG
         oBnSkh7pHiHtcpZatOGH4hO7P8Kpy7htRUhCpMjMWZeZKnPTEVfxEDMPM1wnL3M1t3Df
         Yi7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgzKiQQoBSwxP1TgkcEcjBwFmM/TLubdd9nOL5Fpl+D6hl2miySD3u7u6alixkM6SN3CrP4jq3ULMsmqoq8Q==@lists.infradead.org
X-Gm-Message-State: AFuF++l4SrRXkTG75aTGImZMmCP0Rg6bjdpo/E76GQ5UWb5aGPwkwH3R
	jc3bExof/at9At3iBUaxfPpPLjr/fXvEPUJuQzEoW1X4rVxR9Tb+zQOT
X-Gm-Gg: AYBFou0Supw0XggHaIU/r6l0hBv8js4OL8yKXhIU2BvU1TbZfufMie0hC34qeTRMwce
	9bRDSoZHPtJ/QttBTccL393X783I7nHrnWMa5XIVjt4i5ZGqeHSCpRlGFiR+tD+LmUgHcArU/WB
	uvkvTajrNTTl7+rVHKaATlZ0fzb/m/56C+We/A2tSnyoyPT1hUtDEcoaHLoYigLfEAf5KySHcso
	Txe61VoGgqM25MCuJMEHFw0Tj6ze57mZoufNOBNb7fw2wH2g7xc7vffbuWLUsD/lSWeJB7jMDnC
	u5pYpk7UKr9z+0iBzXJZTeN0rsA4kGOA/630mPOtrfGkP8XAOR0Do14g+mcJQQsQkE9hHMVZ0rj
	MiLyFfnZ/iGAcyTHgCvUKP347awuCzY/AlVex9D7j6Uzt+TQDU76yyZZd4P1RZXGEEPZ+hz/wrF
	pdZvl8Cg0namlEmsVZR6Zrb8V6a1yW6j5uMsWAP8yCNZyu6vsHqyHCVwZbtEcIMo8pvwwk5i9Bv
	Ahd3EgqS+qZtiKr
X-Received: by 2002:a05:6820:188e:b0:6b3:f4b8:bb86 with SMTP id 006d021491bc7-6c7d1bc852cmr1410414eaf.22.1789538108821;
        Tue, 15 Sep 2026 22:55:08 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a78ac1c6sm1949699eaf.13.2026.09.15.22.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:55:07 -0700 (PDT)
Message-ID: <b9a58aac-4a49-43ed-93f9-32c295609312@gmail.com>
Date: Wed, 16 Sep 2026 00:55:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <20260913-qcom-novatek-nt51021-panels-v3-2-266bc5d7e8c9@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-2-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_065511_388245_828FEA4D 
X-CRM114-Status: UNSURE (   7.52  )
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

Not sure if I was supposed to reply with the trailer again, but to the 
individual patch, or if I should leave it since I already messed it up 
in the thread, so I hope I'm not doing this wrong:

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 
(2017), boe,tv101wum-nm0

Best regards,
Ryan

