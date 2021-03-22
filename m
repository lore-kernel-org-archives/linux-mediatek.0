Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8AEC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 12:33:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8E76199E
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 12:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8E76199E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I3Y/kKYYa2N6qrMbWZkgBoxDxp9iZfFejXP3Pf3y78k=; b=L0GmonQAq7TkZUEFQk8R1Wotx
	2UCRMyyolDHKSePYV8cssEvD5k4wbdRoWmNsOKbQBqM3C6e5hLvDVdsu8KquSRJ4k5LaiJ603hv9k
	ubek4SLG0rBsTG+FOnlcOXfgCSWDq7NDpFLwcDKYlQu38ee8grs3qrXxpzME0Dgn82lkqiDHu4e4v
	pAXdzPbcwDEJeFJlCyjltg3qI+wzwUKzS8rG7/e4KwMSlx5rHFkIh90KMpDyamGjUFHecimWP0A89
	IE3m+hHSrmvJVCW/fABayAXcmWyhh8BgSv7guDsXLisv06fbJAHk1OxxgrM9lfiAx7RnNM86JqXya
	jfV12DOig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJkW-00Baue-8E; Mon, 22 Mar 2021 12:33:37 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJkC-00BaqR-4I
 for linux-mediatek@lists.infradead.org; Mon, 22 Mar 2021 12:33:19 +0000
Received: by mail-ed1-x535.google.com with SMTP id bf3so19121769edb.6
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SVanQr0nOKD358IYkjRAx3PCoRE9oI5X2zMEqx499hk=;
 b=In/2zB5DflwheyajBKF2sx8W9MNDzsh1OSXWuUfKtL/FRN8c9FQQ2cj+JpRaMJ8aAU
 XCEdMl5E1nKXsJ7LPr/dtmRUfPx5+I1x5doeJjGnHJs2u9wPfhjKCteG52TK/mXsWmp0
 r9Anh7nKKI7VMsuXAdYXcsCGpZElkzpp47nt0czliuc/sgnYDu/CCcQloeUW02Hubge7
 sWrpe/oCUN6WhcZa9kKsbPAqAXLDiS1XaNnARw1txUwxLHGsZeVRD+wmAVt2sQW9eS55
 UyTJMvhgC22uRmJJA3ffzwFbfulqEQ+Y37qGJg3epzU8Qv8Y9P3aSJ9V5kCcRG0/y2iv
 oQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SVanQr0nOKD358IYkjRAx3PCoRE9oI5X2zMEqx499hk=;
 b=oe74u2phh3DTa2Ah7QTQ0I0Kk0qgzZBaBN5+fuoKKS42TeOoQa59YglRHFRQBQh1t7
 F7HO+u3bGIxaovVCFP22+jULq6gZw06yyg4G59+QX+tJzZKqrozu57MDuj7QDtcC0toJ
 x2buV4a3uHP4bBkd7LloEFuLad2NhL3uZ49MrJSx6qodW7zB4CSKONxmdtA0NAnXWdB/
 4qKKjD1kaHwKOOhuKnIe1LAjuSqlZEofkqNtRdZtDbkRg/E5PS+FUNwI/riWfpNMxjNv
 WeuuoerUSnlo8QynbKhK+LAfN4EtmshCyo/IOGNMDQu5YTAwwOJ2e6EH+5cHdQTPIHHJ
 AxfQ==
X-Gm-Message-State: AOAM533HX5AmeCrPrkwqaatiZuxyN5s+DaK0HkfzDN9+IMHq+bnL6htL
 ByKSLw3w/8wZUaEYkKEJ7ua7kw==
X-Google-Smtp-Source: ABdhPJzU8lxBAEHdWAbezgHwbSa71swddR2DYb7EY4LfoVvJcbMJx1acYwfadWxsyNH4XNxBLRVo6A==
X-Received: by 2002:a50:f391:: with SMTP id g17mr25306211edm.26.1616416392520; 
 Mon, 22 Mar 2021 05:33:12 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
 by smtp.gmail.com with ESMTPSA id t27sm9618783ejc.62.2021.03.22.05.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 05:33:12 -0700 (PDT)
Subject: Re: [PATCH 03/13] PCI: xilinx: Convert to MSI domains
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Marc Zyngier <maz@kernel.org>, michal.simek@xilinx.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-4-maz@kernel.org>
 <20210322122100.GA11469@e121166-lin.cambridge.arm.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <74cffc38-df12-7d92-1bfe-20eed4b60e86@monstr.eu>
Date: Mon, 22 Mar 2021 13:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322122100.GA11469@e121166-lin.cambridge.arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_123316_624420_A9E37B6A 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 3/22/21 1:21 PM, Lorenzo Pieralisi wrote:
> On Thu, Feb 25, 2021 at 03:10:13PM +0000, Marc Zyngier wrote:
>> In anticipation of the removal of the msi_controller structure, convert
>> the ancient xilinx host controller driver to MSI domains.
>>
>> We end-up with the usual two domain structure, the top one being a
>> generic PCI/MSI domain, the bottom one being xilinx-specific and handling
>> the actual HW interrupt allocation.
>>
>> This allows us to fix some of the most appaling MSI programming, where
>> the message programmed in the device is the virtual IRQ number instead
>> of the allocated vector number. The allocator is also made safe with
>> a mutex. This should allow support for MultiMSI, but I decided not to
>> even try, since I cannot test it.
>>
>> Also take the opportunity to get rid of the cargo-culted memory allocation
>> for the MSI capture address. *ANY* sufficiently aligned address should
>> be good enough, so use the physical address of the xilinx_pcie_host
>> structure instead.
>>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/pci/controller/Kconfig       |   2 +-
>>  drivers/pci/controller/pcie-xilinx.c | 238 +++++++++++----------------
>>  2 files changed, 96 insertions(+), 144 deletions(-)
> 
> Michal,
> 
> can you please test these changes or make sure someone does and report
> back on the mailing list please ?
> 
> I would like to merge this series for v5.13.

I got just private response (not sure why) from Bharat March 5 that
changes are fine.
It means go ahead with it.

Thanks,
Michal


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
