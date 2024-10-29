Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE7D3A661
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=; b=A9XY6EVHpnM5IMDQU4dlrnGnZA
	wF6j4zGX7Uz1bN4VtFv9XYb6DwAeHEe72Uto3e2sYK6fzbp6Ku/vGxqEYJ8lNqoUB36uZtq1pcxYt
	T2w73coinVBEOMUOn5/3rpoKC5pwopQOMAiFKK6dbD5J2fc5ZG6Uxeld+w2RSrvdw55HhDhMlI3aV
	4FYhJcVeztPwF2Ws9MWTWRUGXaF7InZtiDskZ5QdJWlcXHhdhcPPUKVjMUsG1rK+zHc0E4fNZbwKv
	u87fNBORFY5Y9yg1Ib4WFwW5abRryKlCeMNSZ52f5BTsurZn35ctNIAMpMpCBgmSELKWWESXYo1aW
	BwWwNygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oQo-0000000EzOd-1IDr;
	Tue, 29 Oct 2024 15:46:54 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oEY-0000000EwQm-1578;
	Tue, 29 Oct 2024 15:34:15 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b157c9ad12so354756185a.1;
        Tue, 29 Oct 2024 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730216051; x=1730820851; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
        b=HupSAgx0dN8LztrAJ6UgD6k79vhn3Ip8woptfWiP1fMUC/VRlc6NQsIuhfBdDBlj3v
         E7E7JzAEvVA+XhrbntFucZp7PJxBjXTY6in1H4irgAlxsUzKJenficHp3kAwdp6HvWwR
         FO/pmGqW+KonUag/Csf9skVIB3W6Hr7N+zbJKF+zqBxhmsiK4eRP+Gr12Y9vaJVemxnC
         9ORQrsStVidKrMBGoy0r7Up4LLq3uSQI/GzT2OEduAGa3zn9fh70UfMPx1/4zbvonV9V
         VlDdY7xHxrp5tgV873y2Tyuu0XgSe3vQAOnpDuCLd79smsFr+A98KEBsrxbaHYgS291I
         VWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216051; x=1730820851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
        b=j0tcmpqnlYBMQO9Innk2hkkNozVgsohaFnoRCRa0J3AfG0L87Bk5RwxVItNgqXKvfD
         rpFG+1schd2u+AvywGlTUsrm/+g9fXa8JJciiuHBQmexaozcmHwvdw2Cbc5T0HeFqeD3
         T/l0ZUqr2E6JdblwTU9SfNGkocfA45Do0ci+SSKOsbuXb4FI0WOdEWcYLJoqzg68jwpy
         JulrhFE5gzb7z3fUGw0qyO/T5iI1rwbiprszkB5NaltTpObjApoeor0v/MXyJsJoQV1I
         hdtDTKxtbWEYYp6+/N96+CIsP4S2pXxSSqqfCI1o0Cj8qpBZmBe8m2uk8335ZLvbP53K
         MOmg==
X-Forwarded-Encrypted: i=1; AJvYcCV52Mdm+3lHadbku8nHrN7GK0YIXN72MIU1ry7hBonFKgsJxotHC1+m36bHQ4v1I+IhKnVMXIjilMZybzXlBCYA@lists.infradead.org, AJvYcCWhfWkt8RPyVpEnvt2sJkiXlhoDVzA5yigee8dbjDWf70dQxCevaBfYjKXl9QtwkIFZnWELVqzvoLToyF4rQts=@lists.infradead.org, AJvYcCXUm9RxQOsINd4aDjI08OCdIeos1QDxtSi4DM3kLtWSWemRsFJBvjAACXwdS9dhu9cjqyj5yS07WD3Jr46qoOg=@lists.infradead.org, AJvYcCXsYyGHzKmozLnTcQoJcdG98Bf5IymfohEsQjtAdl4e+Cj4GHek6HGxqI7gZJ4gEp4Ud3dSnjAcdD+DXyA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxI3O1em5B/xd/roUDTwZiRkdsgLA2w4UTtt3FDDPOR73pVnW24
	5ehUVEFARuhp5E3sQDJcIkl63JlSiDNqY5uRvSzqyRNCFUeM9ptz
X-Google-Smtp-Source: AGHT+IFEK1Lj+KgPR7qF2SZIPbGWb1EluUys2IzUezoVVlhCBBeUjMF3gYTnyYnzfqeZ8MKMdnnF7w==
X-Received: by 2002:a05:620a:4456:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7b193eff5camr1988254585a.30.1730216051027;
        Tue, 29 Oct 2024 08:34:11 -0700 (PDT)
Received: from crash.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d292c88sm429507285a.30.2024.10.29.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:34:10 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:34:08 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Huisong Li <lihuisong@huawei.com>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Mark Brown <broonie@kernel.org>, David Wu <david.wu@rock-chips.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>,
	Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <ZyEAcHVC3gXujNa9@crash.wifi.local.cmu.edu>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083414_327157_69F63E65 
X-CRM114-Status: GOOD (  13.26  )
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

On Tue, Oct 29, 2024 at 08:48:58AM +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

for LiteX,

Acked-by: Gabriel Somlo <gsomlo@gmail.com>

Thanks,
--Gabriel

