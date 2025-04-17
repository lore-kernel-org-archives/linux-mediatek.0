Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB7EC369C9
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=; b=ooCHmQHr2kwVOsOoH2svQbHDc7
	X0VekCwyu04Sk4TQqOGdya167fV6eQD9CgITtngBuItjs/oR79KNCK94ASc9XWAul917OXIbQPSLl
	FcYft/C3Ot4o35CeoJgo0bYtlzTWeheF6u0YXtltEYJInj6SyEUAKb/SIYWl84nRaxxmmUmYjnDnu
	9qCtTgB7I4URzkF7kdVq5aBN/8i3gmHhebKG59JTZCHxktSzU3yZDvC+DS95E/halsN7MncQmr7zJ
	xm9EPa2SmzH3l52Ecg/CDb/tW0wfEWgst4FnSGrlsLnGiG8xra1U412s3SrMxSwInEhZFejsVIG/L
	EEJmgPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TOk-0000000DvCo-1vvH;
	Thu, 17 Apr 2025 17:51:38 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sr9-0000000DoDZ-290b
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Apr 2025 17:16:57 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-72c27166ab3so649312a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Apr 2025 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744910214; x=1745515014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=;
        b=z1G0j5N610mfJPCmlZoNBXDZzgpxLs5q+Mi1rCuFmYGwg8z/S/1PoYN3Lu7uL7Ed5S
         Q30xRVk1btr00u7xKY16Hrciuv9cllDXI827K/J49YhlPjzSdpn+f0ulwh9c0ezw0AL4
         88C8ux1AKd10I9NzeMlSZhD2QgrzXwBxwVtwXydm7Uu3XLMGG+Dsq5YwHk7Smg1xC+gk
         r7FGS208xdCx4RM5myt3sSPTT3YGoSQa0ttyCS72KG8M22sm3QV2eAopkt+8Alcg+EWx
         kRauAURVTK00g57YnLaVmSGR92rWbbWvXjI6+wIRyJr4nX4tFI+j3TYio3DAaglXPDG+
         IHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744910214; x=1745515014;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=;
        b=hczh9w439CPDOV6W1CzMW2SB1LBag/oju1Xlc+kgykc5MsFOfSTNnMbspm95OGPtoh
         jvWSxunu0DE4u9Al9hyONn/xHH4ODzKkkVdxJXtmOixTR3iSFRV1ioOfdYVeWnmX9/L6
         5/4TBK7Ip3F5DUr8J5sJAyCTdwAvf4rbSgCVdCiNluGWc3pfLH2Y7Sz2AORBrPeIaYwa
         KF5Jv7cJz3/ZDwEwH3o4sSYfvLLAtWRcXubWfGhqlglVncyelEMXQh7vH4lnjoa3JSCY
         lRz0hZhDKFVSbkg1ezZSN4yEf5bg6AXBh+q96FjG6kDlcv86fdetpiCxF7efMxIZIJP8
         7QNA==
X-Forwarded-Encrypted: i=1; AJvYcCV+RIArW+8iX25mFW8Qdo8K6fgaraZdFEmM7yuFB0F8nEv4OZJ5OiChHxYyPe8vBo3ZMluuvj04psy2wZX4aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb6VlkjDg0/HlthciXV0EgmbtTFh1zTmf6o4vsttwFtQpOddKX
	onMtKEumzz0e/tisXq7Ly+1NFt90dydiYKl493ZULTkFxnI09xcJLiSJGFG9tIM=
X-Gm-Gg: ASbGncvPEvu+e/t7oKkvZh1Xv9dqKgKtGCAk0DYAYfQsJFD+XQQct2ddS9MVTT+g1+O
	4i/BVvjKN428+R/CEinQB8bba8V7RBSirpiE75OJy3CnFg67YmyTNE7yScr7I25nEvS41ZVwEZ4
	RGWmRLNyfp7IwboraTtCRFZStRo90c4je+8e5ju2svXurYtlJnUbBKBocqAxZyiDoEMaQopKbeQ
	d71fN0xtA5jbQAe1uZ/bTIGJrKBUs31ImhPSrB5VsF3YCGEdiXhRMRBZdo9c6ZHVGxQJ7mC9XLC
	KuNv6zuv3Vpv35wHOUaeT0eVGwpC7jjrw1PDcj5szYsZnf+i7JivhVs5IwEYQVpbOzLKNZoxEHE
	hPWxMXl42sA+73ISJTw==
X-Google-Smtp-Source: AGHT+IG2ya+SWKqWkEWn8r9JpbAOf9gOHMhtRFWZIjuKx4wF7uh2Oa75D8nMaKP4BJF4mMuOP+61ew==
X-Received: by 2002:a05:6830:61cc:b0:727:3f3e:53bb with SMTP id 46e09a7af769-72ec6d200d9mr4250103a34.24.1744910214661;
        Thu, 17 Apr 2025 10:16:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047caf24sm22509a34.38.2025.04.17.10.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:16:54 -0700 (PDT)
Message-ID: <6ff6e3be-6193-4977-977b-24de89c09153@baylibre.com>
Date: Thu, 17 Apr 2025 12:16:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_101655_558294_73021299 
X-CRM114-Status: UNSURE (   9.94  )
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

On 4/17/25 12:01 PM, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:
>> Wile reviewing [1], I noticed a few more cases where we can use
>> aligned_s64 or need __aligned(8) on data structures used with
>> iio_push_to_buffers_with_timestamp().
>>
>> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/
> 
> 
> Link: URL [1] :-)
> 
> This will help to maintainer with b4 as it manages tags.

In this case, I don't want b4 to add this Link: to all patches, it is just
context for the cover letter and not so useful long-term.

> 
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for non-commented patches.
> 


