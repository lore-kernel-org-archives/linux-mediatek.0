Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2842C43458
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2026 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=; b=lQQCk02rIEZgLMqUkg/Lb9ipiz
	VgnJVO28kljAIpT7TDSxkcr9L8FLQlcTdE7LSQsdaL12k6qyAjWOj0wWgBln9x8p5dOqgwhUX9nXC
	n2+/CE9fQA5c31AF+5WOaxRN0ct9qAb1raFYTWt5m/a4MMjdEiYgk68DjWi6sXZaHc7YeFuvtFaQJ
	axjm+G2JcxU2BuOQQLe5gVPMX9l3QEsaocfxkpRCU+zOWxYl+9p/i/zzx4hZD5kTcFMQIeoYPFdy/
	e25NcyFIITWAJv7yKLIvb9LWNK1OPgbXl2qp3vxMODF9nAUTVPF3Qp/B7/vLUS819G57/aUfqEPcg
	6x8Wz/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtOk-0000000DFLo-2a9i;
	Sun, 28 Jun 2026 17:34:26 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtOg-0000000DFLC-44t1
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jun 2026 17:34:25 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e9c5cacf1aso425603a34.1
        for <linux-mediatek@lists.infradead.org>; Sun, 28 Jun 2026 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782668061; x=1783272861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=;
        b=E6pKRkeovoxaLAY9IjGHf30vDChuY6bH9Vv3wRpRoaXmlH/Yn+jmLw5ZpFZyGSAMKb
         R+N5scyBDS6MwXAjtaa0wxeMUFjBXtJYDnBJWM+sOCzw29tR4Pd87AjH8YURHLpj8sPW
         VePk5IKoR9wXjtM8qgBgqjHS8mNyHDhLqcpa6mLi83ly85KlbF2KBzs0ryLBGJ5Wt1oL
         zkTOHVe/GSrZrVaY3faw0tTkITwtfcbrcl1dBvesjRPEH4JZREVfHfoSxnBGNY9wC82w
         Gy+fHBAgn1KnHs7CgTBXGlS1Dx+5VUQJvfY+xa5s1mvTBl43/TK+iHMTUoHguqhlYyL3
         +Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782668061; x=1783272861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=;
        b=o5K683yoWMI3YJHnatRfL36mTmtPtrr6BtILwJx/Mmr+Jsh6cWUOQQ/faV+DBVeOi9
         8ys2MdSh9G9Cu+Es2XZX046nRJSEOByKx/yB7cg3a5DB5hjP/DXCNYU5Y2wi3p1+UizS
         f2+1fWNEf4nG2x0egel8XUwrSTaMOZFw5apQbyp88GB3L1k+PUSCCHdj0WxXdm578azy
         TJGDaxyaz8kynyPrtgHW8C9uGCMLrLiIGfJT0X+pLOc5owksz5abLUwG9SlopBWaw/n2
         gtDmTpI2rU/CE0ixStLk6SHvPPNwf4ygsZRP9E/OSKgd5Kf0+2dSVMGIViPu1LM3GVwL
         6WDg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ye5uoa1qot2t82GD+V355tCjoTAJ9Msa9by3q6yoEg83Yu/dvY0DLYwj0QmRb0lWoXRheHrlGyCyZLL8m2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYLMFBO3Ng+pXHmGktnX8tVkA+KQWDwEfE1XS3sYD4irvpiOLV
	1+8Bb0NgR0uvjCtojv2UAhpyx+IgvLY7T+3xuDbmRMSD51chhTATWouKuaDz2B35NnA=
X-Gm-Gg: AfdE7cl0gUPbkTxJ54DVjhFwePYhCjd8l+9uyJWzBjvuJNctqnJjghDKkQnb+Vfo7rw
	6ZmZpSugtk1aJvfTqRKB9ItXGulBZ7IXrJOEgr76Q35g9kfRMz18LBfnsGFCTYijLEo5LmMOxTs
	/H0aQeQxgbOeaRCjzfr52fzGWCM2NIqABO06nh7BSYQZVNwzpFAGiK5/qVaVeq7gl7OO07QjcjQ
	QwyQdWvRQTxY+yOpIs54+4N3tBuVyHclpwUAC2KYQoVIQBwT6k4eNNYyZ0jIcGs0woFx7cyV4wn
	xPGPyrfIxwhM0iB+OXsLUFv3GGD5Tx0S51RkJdcon6JYVYy5jnpssg0rZmaHp2Nv5uvg1HWi7Fk
	7p2wOW6fL8nqB6AcjD29YpVqrjvsOk+HRA6tokZLA3f67OkoNjjVKMnymwc1vU453o4kRcjRjwj
	FpGFmgaDpRRsjc/rX9EjZU5h92ugqWzvzJLriGuPxIWD76fpAnjcXd9gs5st7SUCI=
X-Received: by 2002:a05:6830:4998:b0:7e6:f083:130e with SMTP id 46e09a7af769-7e99bfef82bmr13002333a34.4.1782668061288;
        Sun, 28 Jun 2026 10:34:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa7eb558sm6725566a34.24.2026.06.28.10.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:34:20 -0700 (PDT)
Message-ID: <3f914030-44e8-4f63-ae72-7fde7d843325@baylibre.com>
Date: Sun, 28 Jun 2026 12:34:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] AUXADC driver for the MediaTek mt6323 PMIC
To: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_103423_017563_8947984B 
X-CRM114-Status: UNSURE (   9.83  )
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

On 6/23/26 3:16 AM, Roman Vivchar via B4 Relay wrote:
> This series adds support for the 15-bit AUXADC hardware block found on
> the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


