Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A0CF34CE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP5+xFCwvIfgdPuM2uoWieb2IVBCdlsyGhb48u2injk=; b=LFDDhdVMBknJTV0D+ru8A2D/XQ
	Kd68g9Jik+aKwMPIYCiF21AJfZ5yLHCNfo/pcRRdoaoz2LmOxTUfI8KM7HjJs0rg8bq0DAo3K8fZM
	wDQA1sO9ocOuWivqwe2bEfGWN2INGrcX/O0ljj/kaohJNZriy4X7nfjdQoNy1IaBtoiMO/ggjo4qQ
	COy+nLP8PcfDHzv3Itqgu3+1Qe+Do0q4GclMXuiLqIDwE5txlgBz9EQIYgzFkTWq1wMFHFYutU0xV
	OCy2xKv9V/DlVJNvCeYx0okXCcHnU/eENeBjnc/vb4AgDfpDN4p7PoncC02+vqqODT+L+j5FJL6tb
	snIct5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swUIi-0000000AW6H-0viX;
	Thu, 03 Oct 2024 22:28:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swUIe-0000000AW5o-3kTv
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 22:27:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so14409755e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727994475; x=1728599275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sP5+xFCwvIfgdPuM2uoWieb2IVBCdlsyGhb48u2injk=;
        b=AMuVlG/JBRtLshFrbhvjeKx8+5YNIl+Gkb8cVA4NhDL2fbUNdpxOAytxTMldzL+oIV
         i1CsCZK2w5PDgGFtgeZDAsRRAYqBBcv7eslMhK5eM0rmGj4Vd8TsRTWr/yqU1m/AzeSn
         oQF4pfhs18ZxRKXgPOi2dIEOY4WO8c+2aLlafgD79Yin/YZIfyrC41sUSDM1gW2rfAW3
         Vl+4Kx+PJqw7Pqu2+QC85/Uq91Z2uVIX/IkzUtbqnphWdTEyWxryEDwYxj7mI7oAYAs+
         RNhOdiYSpSVVwrdAMpznFCUEhB+uYSv+t+lZ0lrzu0A/MozhJKgRUrtQg7ToEhHr+ahZ
         JuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727994475; x=1728599275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sP5+xFCwvIfgdPuM2uoWieb2IVBCdlsyGhb48u2injk=;
        b=IUyzJ8NBiizqdxf99eDDOi9ZV0h6zocsz131+Q/V0jSqhvHFYQT+9Gb3U7yoKAJtup
         +Ix9kDwLHzbfYSyllhilgAWSxIY8HirwvwWM3B83zWvkg2BEvCrUP+YKr0KHxKAGTImN
         4BZJSjlkj0MwKZiMkDoziQgogtTcuI7D/O8k1McgQqWK/Y0iYQ1A8wL0gwOTIIRt7ENd
         ZklSm+2Acyus9gjlbYVFi6rgjlsSkOfGZan2B3oSzila+6t3Gzi7NgDUKAvXCqgwEeeD
         PbTyVrxpkR/5+2SgpiUpi2E3F5IF9uBtGpgStQ9xiae+q2B1jjzwk8XOCArYPYsRjLtr
         nKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8tyi6qKb9PIp96YzgikYh38BULfC3diessDhRxRSX69P7F8aRK5dxb7N2GX+rhNTgRSmHcFKyRlvZaI4Lvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5t2dtbzJE49pEs6lkb8+xgCfs7McpfjJRi5vx3ajc6md8ETy3
	ZpgrFzdvxO+xl1Dd3yGfrTw1nJ0xAMUSc/iTYpD6bxmnyh/3+WQXd1zTX3t2
X-Google-Smtp-Source: AGHT+IHDKi8be1luFvFObKCgtE8dWUy8+2N6ax404drWFKWhO05Bsyimgoa7KQJsvRhzNjmZfQyg/w==
X-Received: by 2002:a05:600c:3b8a:b0:42c:b95c:65ba with SMTP id 5b1f17b1804b1-42f85a6ca96mr3117955e9.6.1727994474417;
        Thu, 03 Oct 2024 15:27:54 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a1f6b4sm355535e9.6.2024.10.03.15.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 15:27:53 -0700 (PDT)
Message-ID: <ae30adc7-8bcf-4daa-923a-d4a12e2404ea@gmail.com>
Date: Fri, 4 Oct 2024 01:27:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Erroneous sbs-battery sysfs info a MT8173 Chromebook
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Pin-yen Lin <treapking@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <6e341522-70f6-413c-b9ba-8ac86a19b5f3@gmail.com>
 <a83e80f7-2bb8-423d-b24e-e793ce5da988@notapiano>
Content-Language: en-US, tr, en-GB
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <a83e80f7-2bb8-423d-b24e-e793ce5da988@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_152756_958805_92D21746 
X-CRM114-Status: GOOD (  17.50  )
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

On 2024-10-03 19:08 +03:00, Nícolas F. R. A. Prado wrote:
> On Thu, Oct 03, 2024 at 06:15:49PM +0300, Alper Nebi Yasak wrote:
>> Hello,
>>
>> I have a MT8173 Chromebook ("Lenovo 300e") where I'm getting a lot of 
>> battery-related errors:
>>
>> [   34.678473] sbs-battery 6-000b: sbs_read_string_data_fallback: Returned block_length is longer than 0x20
>> [   34.702079] power_supply_show_property: 5 callbacks suppressed
>> [   34.702096] power_supply sbs-6-000b: driver failed to report `technology' property: -22
>> 
>> [...]
>>
>> I have _another_ MT8173 Chromebook ("ASUS C202X") where things work 
>> fine. But I couldn't find a good mainline kernel version for this one.
>> Anyone have any idea what is going on?
> 
> FWIW, I have also experienced issues reading properties from the SBS batteries
> before on chromebooks:
> 
> https://lore.kernel.org/all/924db470-8163-4454-8f59-f7372a132186@notapiano/
> 
> In those cases it was due to the EC firmware not implementing the SBS commands,
> but that had already been fixed in the latest EC firmware release, so simply
> updating the firmware fixed it.

(Replied there as well for a different board: cozmo)

> I don't know how ectool works, but it might be fetching the battery properties
> through a different mechanism (ie not SBS commands), so this might also be a bug
> in the EC FW despite ectool working.

AFAICT, ectool talks to /dev/cros_ec with EC commands, which makes EC 
send SBS commands to the battery on its own; whereas in the kernel 
driver case it passes kernel's SBS commands through the i2c tunnel.

But never mind all that, I should've looked into ChromeOS kernel 
sources. There's a limited i2c passthrough [1] that's implemented there. 
And this specific battery is failing to recognize a read command due to 
a stop bit or something, so they use this limited passthrough [2]. I've 
managed to apply those on top of linux-next and it makes things work, 
but I have no idea how I'd go about upstreaming it (comments on [1] 
point out it's quite hacky and not used in later boards).

[1] CHROMIUM: i2c: wire a limited smart battery passthrough
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2230594

[2] CHROMIUM: arm64: dts: mt8173-hana: Add google,limited-passthrough property
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/422609


