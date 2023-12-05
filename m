Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEC2C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtPODTHNMByw4rsHzSlvkWk3wVQbetWpeccUPj/d6as=; b=WihjEBc99Nj5ISkikpbQGjHL/q
	vAPEpv1Qof2tiW+NZdA4RUrRr3CA+tJnHuOKY51I8rXqW6tnvuDx8Btziwcppxb7/IlvKLqVl1xpH
	1pxqLLsVbyduXIEK5T7uo537RHTCofuQwN6sQXO2l4JoHmJ4CCk0GyIncj+nh5ecG49lG6J/Sw9/2
	hQT1b5bJUcUZ6u7u84hwIQhTk+vcshywM/6WZnyr4LFcqlMT7U5bZuBZGNqhBcxuQRD0GgW0O2z7I
	FFnlmK5KZGkoOwRFT2LzeGZNtQITTv8Kg/bzaZk23cHRlGioIPRvTMH9bdn7A/90+tP+x7ZZIpWw8
	f7NLCQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAdD8-008Sp4-18;
	Tue, 05 Dec 2023 21:44:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAdD4-008SoC-2T;
	Tue, 05 Dec 2023 21:44:08 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54cfb03f1a8so2198954a12.2;
        Tue, 05 Dec 2023 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701812644; x=1702417444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtPODTHNMByw4rsHzSlvkWk3wVQbetWpeccUPj/d6as=;
        b=RifcjM3ei0rJ+pt0rtRcJ+V0piBJ4MsrJ2+jCaMzZBT4jKj+OIuzt+mzpFThqOP0Wc
         r6qm2iIkAnMHxPVWbscA3A/x29Cik17vne1SJo0qKgF51q2tKBzAVneaCbyu4wnidkoE
         vRd1T7JYU2Bv+cJrNSR8+otMLH0IfgFV30mpGYaklpj3kRYMyQA8ICzLj1hJjzBj7oRR
         t9qT1Jz0+oBvzc/nIzbg+AfrKHaG/ZWdwkViSMEMcVt40zAxu4+qa+RLEogYZpY2Z8eR
         e35ro5tPNT9T8qVq242qEM3wrj2oezImHFwaEiAB+6deIRV0dkGJfjaLlce4uwf0V5ph
         CfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812644; x=1702417444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtPODTHNMByw4rsHzSlvkWk3wVQbetWpeccUPj/d6as=;
        b=DQtWmk+NMkY8IHN4vLhvkgQl5yVtSLHVuxfG61vAMVDF/9s5+VIdIvv5iz+aVu0HX0
         9DWKXMJrTDkKJ2lrwMRoh1ggUwd2ejIHck+4YmDVm/XvBqgKM4nqKrsTEJfh7YLjmwBl
         TLI6IPiuD+8YC+wrngxKVlJ/ubW2GlcpuNvZ7Z9RZS0Z26ANT3WqrdwgZfkxhpDRS/z0
         b67NoUDq3mfm6vNtXICQjB+ZDVKa42+f0kflUOGYqDTpaUpgVsXVadzCJA1qXZasxudA
         Qnp6wPDVk0iDrxz310KwGS2ck/phg+JTUNSgTyXd8r0UW01BNrqSftFyTEmVXlDNM7hX
         eZGA==
X-Gm-Message-State: AOJu0YxEzzr6W2v0o0b7BdXO1022j1Q6j8IawPw0NZtmZs6sqBaaRXb8
	YKyogqK+TtQxUh3U3boBwLU=
X-Google-Smtp-Source: AGHT+IF1vMo5ATjjFj0hYEASG1eV3bg6VLC9crTxdALyAIVt0wYlW+9/bW/mvqNlF1Ks3sbIjz8R2g==
X-Received: by 2002:a17:906:5992:b0:a19:a19a:eac7 with SMTP id m18-20020a170906599200b00a19a19aeac7mr818787ejs.128.1701812643685;
        Tue, 05 Dec 2023 13:44:03 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id g5-20020a170906198500b009c5c5c2c5a4sm7267888ejd.219.2023.12.05.13.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 13:44:03 -0800 (PST)
Message-ID: <708e46fb-5aaf-4c47-a8f5-4cd5171a8d76@gmail.com>
Date: Tue, 5 Dec 2023 22:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
To: kernel test robot <lkp@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231204200907.5687-3-zajec5@gmail.com>
 <202312060400.SeDMAMe7-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <202312060400.SeDMAMe7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_134406_807352_21DABABC 
X-CRM114-Status: GOOD (  15.28  )
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

On 5.12.2023 22:04, kernel test robot wrote:
> Hi Rafał,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.7-rc4 next-20231205]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Rafa-Mi-ecki/dt-bindings-arm64-dts-mediatek-Add-Acelink-EW-7886CAX-access-point/20231205-041120
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20231204200907.5687-3-zajec5%40gmail.com
> patch subject: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231206/202312060400.SeDMAMe7-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060400.SeDMAMe7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312060400.SeDMAMe7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts:103.3-4 syntax error
>     FATAL ERROR: Unable to parse input tree

Ahh, required change stayed right there in my "git diff". I noticed it,
fixed, but forgot to amend. Sorry, I'll send V3 shortly.

