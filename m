Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8BBCA0FED
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=; b=GrZu6E95rmFBxUOAnDilnsxMW0
	35ZMsLB/QlkmQTxtlB0q31m3ZAHq53aqmoXoGNy2SblncpLI7aJ/54cwPvRXP9V69503azc9UqAk3
	6BhuT05Fe4Mn0qYuUjBG5tDErJ/IxgSvqO4hYnkfhi94ByyUZOPhMgSLE3tE6r7yhZCKu3QJDLoqW
	jqRj6nhy5zu8uBp8omp8NN9MDgcPWvu6H0sXlEwPGnXhBoPgahAcC97Amat4cj+uVvEmuI7KvQNo8
	Nd2z4spoD+9FcFUB273duKKNyqQIhrzmf3fRbYFK80Fqn5ytNMLECkAQTgaURzBbvHgpmmIyIw+5/
	2XhpoKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSwL-0000000H0Oc-3JGx;
	Wed, 10 Sep 2025 22:05:21 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSwI-0000000H0Md-2eW6
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 22:05:20 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so101611a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541917; x=1758146717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=ZwGMHrP4v58Ynb5kF9LQl8MlBiK+0047a8fb/uCJHVwZGQo6uNHHp86M+0tOePB5n1
         wi+jAksAhHXx5g1mZ0F9bfj5HbOJkLo3ZPakdu+C4e/9A5up5ovK2TSXJC5PB9+lBKqi
         G07H+RxTjkJSpM4TNNI3/DA+GKbCoycsFGB5J0xRuoruUQZp87JLRtK2PFpp6pkDQeE2
         EUqwD12Guy+Ws4KHwC4h2BlybPef8Ty9hm9LkcJC/ptWqUO6p9ZLTap0vUt51hnh3xN+
         a6GfQLXldll8JMoizTR3ywRkPhVlRWhG/p00vzWQTBbl15j50Fk9pLkhYQY0VCOlcl0q
         D6xA==
X-Forwarded-Encrypted: i=1; AJvYcCW4myNknQ1utYoIKZfUZBpjDgwAqOcqisMa2nEV2CMhyBSinofu8GqUOifDNI+vj9a5YU0yi6amfu3oxcVStQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhF3iyfNQpaLlJcLvJkNqXrGsJ5WseR0UnLplMJy/TyP75e5k
	HRDaJktFf7AP+DyTf46/DXwoyGsz/ckhPyFKzrtHEPBtaNSRFnvIsIrt3d/xN6y7IWIOEg7tOYG
	wSQY+CB6yBe2kApEDAq9wv2vOt5GPfCH9ZY932KObRc/g/M3h11Hy9mODXW9jrxtNkvSqUkzdlJ
	Z8dLu5KScmBtHMYR/pRBMztHu5Bi5uFTJoLFQnO7yBdCf4FEJMwcRSji72DkL7gJr6p4+gaf0Fy
	dMIjXQm1no6LmF1eQv5xJ2f6NL8Vlb3
X-Gm-Gg: ASbGncto/0zpkHoZu6tgWeF5ODIPiq2EzC3c38HzHUH5Suuj2PeO+i/taaUt+0m6mxM
	LY/p/+QBdFUVIlvbYKr/bGBU4FKYNYtLLXBB08AlrIxj2iM+shS95QeZ8k8kmZYejpPBaSFVpFL
	UXRZFkhp5fx+xcwj5S7nGRULo1iBGk9JWFac7GBRtp67a8DWho4c0tVNlxPbqfcPHfKna6iX2jK
	zpH5JSfiBDMgz2LZcOhYZomJxZAIq7NVIbaI3pq1OeyYXMhJ8/sOF1mDVU1iNCh0jQ4c7yBUi9X
	vWtRq2zSsiVrSpUJZptHk03fYObidjm2G73JT0fpQiiBypLIew2sqlnYGcCXTGfJWZ9v+xDi9L1
	I8gOR2bf4Z2OUfCVslevj16NvnCR8uqFrK+SB/WvoXgQMh7zguLe/GYYEssst4Gv7ONqE2hIeb9
	TRq4W4SoQ=
X-Google-Smtp-Source: AGHT+IEBwSDi0hGq6GUJXBSL85b2WIBISxuTbbo0pGFYmHl4Nh3fw6bvD2upDpwZFEFs7ghh5/vrkDw7rz3B
X-Received: by 2002:a17:902:e746:b0:252:1d6e:df79 with SMTP id d9443c01a7336-2521d6ee152mr247761585ad.54.1757541917029;
        Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-25a29a899c1sm3187335ad.42.2025.09.10.15.05.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-25177b75e38so498535ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757541915; x=1758146715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=Ksz+ksdGQH5TBbZMiCAnBgKXq0oQE+G31vpH37YeqrtBMe9iEddxx4MhhImcUIc3n1
         oLBEp2YNHfdPxsAYsuauZBT+VbBrjrexWytMpL5j8j4TKyLVv5labjc/Um/V/iHuILhY
         k4144rxc8wIIPWPPVxh7t7Up9a4eBeGCLP3bs=
X-Forwarded-Encrypted: i=1; AJvYcCUZL7egoyq+swRH8Yiamo6NsLlnbONUwkz8HYNgrwAWXHVTQG+RA8iorFKeTmjGdjiJI7ODCJ8l6BO2e8n5+Q==@lists.infradead.org
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726855ad.45.1757541915320;
        Wed, 10 Sep 2025 15:05:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726435ad.45.1757541914912;
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25bf675b77fsm1714715ad.43.2025.09.10.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Message-ID: <f72733cf-cf96-4960-b07f-ed0d9efbbb03@broadcom.com>
Date: Wed, 10 Sep 2025 15:05:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_150518_718981_6FE8C81D 
X-CRM114-Status: UNSURE (   8.19  )
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

On 9/10/25 00:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


