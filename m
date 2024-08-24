Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E0C5472C
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Aug 2024 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=114707c9TBN2Gihi0FV0kqjlbdnW0JCr+A5nsEfjtVU=; b=l4+b9fffVPcqLsokSiZ8iQR3O2
	dl2Gtg6azNnhfVB1YKPmVkwtr8Z7r1v514K+cAfq6DO6AMYV/YhXTIfnPmgnpo0THO7WIV/wlC1la
	GQ0eVrB77FGpI2siWxEWLkzEakkWGMIKHh23tFPiEeT+jOWwnBYQY/FriRhD18MrNWWWonwcuH67t
	uOQqduVNY9Dt4uV8vu/3Yl2OgHAhNsyB//jTT7BTkhOD6z73X0jYVa7u83cVHWBzQz1QlC3/Em2bO
	WNJImn3fOl2xk/60Rt+dKlUZmICCSFhGMrYgdxn/7oV9z/fNhoOH1wZ1h8vTqs54aOy4u/5dxiSkZ
	DacB9+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shqnV-00000002H0u-0YrS;
	Sat, 24 Aug 2024 13:27:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shqmi-00000002Gtm-1h5V;
	Sat, 24 Aug 2024 13:26:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37196681d3bso1625524f8f.3;
        Sat, 24 Aug 2024 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724505986; x=1725110786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=114707c9TBN2Gihi0FV0kqjlbdnW0JCr+A5nsEfjtVU=;
        b=VwA2kt3lUgbVOFeKk4L7a27HvSgGe9wAjRHXvtqQBt7VLOveD6KLdDhTI1eIxY4nol
         2tKG7NHi8HmN7WWby9/pnSDgYZbco0aruiGk5N41SOicMoexelNSBYoTF4yfj4vMyg2b
         N+uMIOS33IOHGizRpt219MTTOpzT10CtCa6WsVex6FbfWfYNXTsWQxJWrabpI/Ez/RYU
         e4E+HxWwJaWIQAJOwb+8DB6Wl1odXF1kPAA0Am6g+loLr6cPvX4W5sRK6lY0ZdQhre07
         IsotpR4/mVst50yvAt6lso7BN+baXsbwMOT3UMOf6dI3yvaUag6BV00FJep3yo8OaRBv
         Micg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724505986; x=1725110786;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=114707c9TBN2Gihi0FV0kqjlbdnW0JCr+A5nsEfjtVU=;
        b=Ch5amHuVXt4l3xP4FjxRrgaL7xd4j/nj8zwfhvtCsB1xbmCmYwVsk9VWEcGgI7rCiE
         nNn8xh5Zk/88FHsYl0P078ec2Pd/j5RggjE0q+vrNINwpgYbac7Y7msYZBPrTRTFcuCQ
         frRtVtlWkCeGoig2zuotM4h9XHh24w/b9hIMpL34SlI01lF0iFtmzWIjxmFJqrCzw8qQ
         6zx3bTE8tuWYk134sny8NYEN4tjMLZPsPTt39oGzsD1J9rhafnIBwTZATuo63vhbpvZw
         2h+SKqYe/nXDX6hOuzZ9RzYX2ucfHVdsfqtpKjw787uVtV5WFsVX1BDpx5667Peysln3
         ucIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcnSt7ifr6PkQ476WrtOMkh4ubTok0bpr1QxDN/hZRKxmpMTutkkT8M55SuI8EkpQywQBEMYKMOwtjNRLxRV12@lists.infradead.org, AJvYcCWmikVqhDlH2s3AwXCKUkiKW82q3eHq2ReaQFeHYT5IMDdx4ceKEvsJp5xsIi8gAcVtrzxZBuwHgVDP6KLO4J8=@lists.infradead.org
X-Gm-Message-State: AOJu0YykaXDMJiG1CXc1xVA67iBbF+xcFCmynF+g1EJaM2SYOJ86eP5D
	TIXSqujhIheDyKqwaGtuPrHIepu3ltchqQGqE603C+4KobzrENu6
X-Google-Smtp-Source: AGHT+IE97apoWLf+5ctckXkuIwyLEMMq8DzL8/wLznw24XrTkTZaFOgnINabsJwGyILMQnQ7VupSOQ==
X-Received: by 2002:a5d:6905:0:b0:373:b44:675 with SMTP id ffacd0b85a97d-3731189b12amr3706013f8f.20.1724505985477;
        Sat, 24 Aug 2024 06:26:25 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac514e269sm95104245e9.2.2024.08.24.06.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 06:26:24 -0700 (PDT)
Message-ID: <f11001d4-fac1-490d-988c-01c6b4b588db@gmail.com>
Date: Sat, 24 Aug 2024 16:26:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Disable DPI display
 interface
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 stable@vger.kernel.org
References: <20240821042836.2631815-1-wenst@chromium.org>
 <00aaa8ff-1344-48dd-b0cb-5e8f4518ff6b@notapiano>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <00aaa8ff-1344-48dd-b0cb-5e8f4518ff6b@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240824_062628_471276_912DE338 
X-CRM114-Status: GOOD (  15.17  )
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

Hi,

On 2024-08-22 18:25 +03:00, Nícolas F. R. A. Prado wrote:
> On Wed, Aug 21, 2024 at 12:28:34PM +0800, Chen-Yu Tsai wrote:
>> The DPI display interface feeds the external display pipeline. However
>> the pipeline representation is currently incomplete. Efforts are still
>> under way to come up with a way to represent the "creative" repurposing
>> of the DP bridge chip's internal output mux, which is meant to support
>> USB type-C orientation changes, to output to one of two type-C ports.
>>
>> Until that is finalized, the external display can't be fully described,
>> and thus won't work. Even worse, the half complete graph potentially
>> confuses the OS, breaking the internal display as well.
>>
>> Disable the external display interface across the whole Corsola family
>> until the DP / USB Type-C muxing graph binding is ready.
>>
>> Reported-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>> Closes: https://lore.kernel.org/linux-mediatek/38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com/
>> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Would be good to have Alper verify that with this change the internal display
> works again in their specific setup, although this change seems reasonable to me
> either way.

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Fixes that linked issue I had with internal display on my magneton. And
apparently I don't even need a custom kernel for it, I managed to get
the display working on Debian's v6.11-rc4 build with this dts change
(and `softdep mediatek-drm pre: mtk-iommu mt6358-regulator` iirc).

Thanks!

