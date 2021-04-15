Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2049C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:29:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A689611AC
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A689611AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n8LBGifGJpGYSnXh40JvKrjhAmfaWIZIim8QEo0L+W0=; b=hISSHr3r3mhcWX+Qk0eqgxEvc
	iUiHSOVAYFE9T4QFr24eT6ySuHDdYyxUit0Y43ZrdhnjO6hzTe6mJC5/LE9sFP5Eh7r0BX2G38vmk
	tifQc0dlZI7CleyXSjm4x3ueAjoIYoiQU36Mad9iq+fUojLFKJ+KiLDKzMrvFH0zsEf+dfrI6vZOK
	jwrg1gYur/QAuzvoJy4kW36sLFcgMQQ9qj4Q+I2Y7LGLVEaJInyFZNO6/+EnVkA1y9yMGwrVwb0JV
	Y9QaedNoN5XdVcJjK9Op8qngrxkkc3M1etbljqcJoEy2PmYoDNQGK6XeljfmWAMnfT/Q4Y/RwXx1S
	TVchgWhOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX23e-00GG4W-1u; Thu, 15 Apr 2021 13:29:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX23Y-00GG3V-VG; Thu, 15 Apr 2021 13:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=iRMfRLnB5bROoHYofqRSJiqLYS8/RC6ZA4ZH0uSYqlQ=; b=VfHE9H6txVTTDxDuXR/D5S5wiX
 W5SwYW/wi5nowYucLAyByfngeBw/K9YjHqELSdKbfvS4Lnb0lXO8f7wuld436QYjarmAoxEo+AWpl
 jznn869e5gYwlr5nGShFvnHNdQunz032I8hgy5XGXxlhvQcsCcieaCPe+RT1lx8koeMGTEIqL+DO2
 IiKSxKqACh14NTFX2pxm0MQKcFOrL1/3iMzuDJb6brEFLj8Fp975hPgIFM6zDpN8hGgho9RIwWcqi
 rhTtKE5IwQpNc/hsLCDP9utzgwQKUUAeo0EsGkyl6xQlyjN7B1TSJA3qG8rw1nJDTQsGRwgtEN83u
 h2J3w8bA==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX23W-008bdA-8b; Thu, 15 Apr 2021 13:29:15 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso20628940otb.13; 
 Thu, 15 Apr 2021 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRMfRLnB5bROoHYofqRSJiqLYS8/RC6ZA4ZH0uSYqlQ=;
 b=fvW4NurmWafjYa2IemJVvF5rfOs0y4DCrNTHRDYRTITJIFgkXdjlc8/zbWm1iYDr6S
 jsIGVCQAW5KW8ZHCSf5uo7QCTafYDVT8VrrhSG9wbvlcZYlCDE3reGDc35zzW57eHJhO
 8OSh4WeaeeHV7IkUKaypDrhgmHS06K1qZuQqWG9m3NFz2MV3w8A32QIIWazHSCmi9Ch/
 JMGao/4/voPxLl7VaAfD9B4Opcqb/ruVE2acD89yTnDzOrv7xo3bDrZMQATIVpOafZta
 SWvh1MtESwF//BaAcX6B4fVfEyZooVQ5zIQMv0GhFt5vMoNNyBX0VgNAG2d6JDFqxXl2
 yJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iRMfRLnB5bROoHYofqRSJiqLYS8/RC6ZA4ZH0uSYqlQ=;
 b=dHYz8TsMJ+5IxtpycKl6QbFxvmiNbtxwVMp3dtAYeq8UroN7AvasmHow/6utcQ97sZ
 zBZpbox9NKiDg6ZcO893vq4TxFlFpueiCjeRPyKYHvd9kJonXe128QPeGo5TAySUfp/B
 M5UJD1NDZ9OSaLE2522y9A7edC5qwBNfPvt1B91NsbKNdYJAsviykVphAxYtBAq/nUOF
 dVzIYjA7eyz+7AyENu5GBeBe3mLPUVZJ/fksQnkTBTLvGU4fM0tNvoPpdGncMHlxd4bj
 M5zWiGBbz/TWT2REWVwef6Svod+dA8nbtpR9EOOxv02X/J/820Px+D+CSA3hcnwSxezW
 UibQ==
X-Gm-Message-State: AOAM53114nW4M/nSD2GQGH9jfhEJ4A6T7PQRCXqIb0uNsWEiD1fA0e7O
 nfjvmTxiYnQ7uAzahpl+uUk=
X-Google-Smtp-Source: ABdhPJwHKws/1quGGeAvrACadQrqk4XwlOhufWeSn6/M3hVqwyMiig6CZiCVU16+z9ud6f8Iv73TQQ==
X-Received: by 2002:a9d:761a:: with SMTP id k26mr2651635otl.193.1618493352731; 
 Thu, 15 Apr 2021 06:29:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 64sm543571oob.12.2021.04.15.06.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 06:29:11 -0700 (PDT)
Subject: Re: [PATCH V3] watchdog: mtk: support pre-timeout when the bark irq
 is available
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <AAgApgCdDjCicbWFGpPmeaor.3.1618479605424.Hmail.wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7555c705-a12d-5d51-3881-68feb5d078c1@roeck-us.net>
Date: Thu, 15 Apr 2021 06:29:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AAgApgCdDjCicbWFGpPmeaor.3.1618479605424.Hmail.wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_062914_349511_6A3B47E5 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gNC8xNS8yMSAyOjQwIEFNLCDnjovmk44gd3JvdGU6Cgo+IAo+IFllcywgYXMgbWVudGlvbmVk
IGJlZm9yZSwgdGhlIGJlaGF2aW9yIG9mIFdEVF9NT0RFX0lSUV9FTiBpcyB1c2UgaXJxIGluc3Rl
YWQgb2YKPiByZXNldCwgc28gd2UgbXVzdCB1c2UgV0RUX01PREVfSVJRX0VOIHwgV0RUX01PREVf
RFVBTF9FTiBpZiBsaWtlIHlvdSBzYWlkCj4gInRoZSBmaXJzdCB0aW1lIGdlbmVyYXRpbmcgYW4g
aW50ZXJydXB0IGFuZCB0aGUgc2Vjb25kIHRpbWUgcmVzZXR0aW5nIHRoZSBzeXN0ZW0iIC4gCj4g
Cj4gVGhlIER1YWwgbW9kZSBpcyBtZW50aW9uZWQgaW4gdGhlIE1USyBkYXRhc2hlZXQ6Cj4gSW4g
dGhpcyBtb2RlLCB0aGUgd2F0Y2hkb2cgd2lsbCBiZSBBVVRPLVJFU1RBUlQgYWZ0ZXIgaW50ZXJy
dXB0IGlzIHRyaWdnZXJlZC4gCj4gQVAgbmVlZCB0byBjbGVhciBXRFRfU1RBIGFmdGVyIHJlY2Vp
dmluZyBpbnRlcnJ1cHQgZnJvbSBUT1BSR1UsIG9yIHN5c3RlbSByZXNldAo+IHdpbGwgYmUgdHJp
Z2dlcmVkIGFmdGVyIHdhdGNoZG9nIHRpbWVyIGV4cGlyZXMuCj4gSW5zdHJ1Y3Rpb25zIGZvciB1
c2XvvJoKPiBTZXQgd2R0X2VuID0gMSdiMS4KPiBTZXQgZHVhbF9tb2RlID0gMSdiMS4KPiBTZXQg
d2R0X2lycSA9IDEnYjEuCj4gCj4gV2UgY2FuIHVzZSBEdWFsIG1vZGUgdG8gYWNoaWV2ZSBwcmV0
aW1lb3V0IGJlaGF2aW9yLCBvbmx5IGluIHRoaXMgd2F5IGNhbiB3ZQo+IGdldCBtb3JlIGluZm9y
bWF0aW9uIGR1cmluZyBwcmV0aW1lb3V0IHByb2Nlc3NpbmcsIGluc3RlYWQgb2YgZGlyZWN0bHkg
cmVzZXR0aW5nLgo+IAoKSWYgc28sIHRoZSBwcmV0aW1lb3V0IHdvdWxkIGFsd2F5cyBiZSBoYWxm
IG9mIHRoZSBmdWxsIHRpbWVvdXQsIGFuZCB0aGUgdGltZW91dAp0byBjb25maWd1cmUgd291bGQg
YmUgdGltZW91dCAvIDIuIFRoZSBjb2RlIHdvdWxkIGhhdmUgdG8gYWRqdXN0IHRoZSBwcmV0aW1l
b3V0CnRpbWUgYWNjb3JkaW5nbHkuIEFsc28sIHRvIGF2b2lkIHVuZXhwZWN0ZWQgYW5kIGNoYW5n
ZWQgYmVoYXZpb3IsIHRoZSBwcmVmaW1lb3V0CnNob3VsZCBieSBkZWZhdWx0IGJlIGRpc2FibGVk
LgoKR3VlbnRlcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
