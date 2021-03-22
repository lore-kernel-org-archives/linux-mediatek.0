Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D87C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 12:34:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60F2C619A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 12:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60F2C619A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RWapw3vpZ4zBbDzpKHWjmoW1ZGcMkzLdXL0QN5uPRWQ=; b=Nf7a6Z33ms/kgz5pWvfwW9zXe
	IUPcKHFnRbFHry5Q7I/JeGqyYJuNo72o5oi/KOZE5hXBs2p7TVfE0tQpXCvgFnGq4I7M3dYyyqT5D
	6vHANSY1ved9D+6qMe7riIs1gnQVYHlRWFThmBtMO2cq6cYGVjgvQHGuDo09P5sFaeb/TG6CCgoHR
	gCuduoP7OQa++33qfTzzRJe1NaBmI1hlco5LP/Bgs+OU84+nOFfnQ2n/6bePw0Vnuu7g5efZZjwNY
	P3LiB8uOvtO2azhDjF4Vkj8xspMVzJVQFQAyuoaD71GOZQvz+91WjWXLk8XCYzGI7h41qw+1JOLRY
	uWu/fmWgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJkj-00Bawj-7R; Mon, 22 Mar 2021 12:33:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJkQ-00BatV-6c
 for linux-mediatek@lists.infradead.org; Mon, 22 Mar 2021 12:33:32 +0000
Received: by mail-ed1-x52a.google.com with SMTP id l18so10903774edc.9
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bFXSCk7jXzi1oDqUKnupFbkdc1ED5SojZj7S5YlWylo=;
 b=Nb6vq2/ii4Uu5XEatx9s0w0vyMHBFNdJ9XkyhRXQRTYCa2DlOgNpuMLBtGI32mU4LR
 mM7dCOyOsSQiBYx78D9Tou6WPJCLVJK2++P19JKJpLnY6jpQoN++z2bIdKzEKPwiTfB8
 flKUIx/jPAbEh+WGHPcfHxffQaeLfuKX6yZiKFKqfDTbAz9SFCQqpEeOUdO2QyBtYKaB
 Oaywbong+u/EvIZ1Ewmyy2wctKFSPqSSpRnb2lmoQ1pHGjZFL4kuL558WSZeqj9KAhZv
 uvC/l92Hw9hGqb+CsWq5oYBUh8+QoyxagBJkBo5OWb8T+4+67ScVqWdqIvHbdZ1sM5Rt
 FeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bFXSCk7jXzi1oDqUKnupFbkdc1ED5SojZj7S5YlWylo=;
 b=DPZLzgiZvcqBdRFCA4TiQO2So/8uFT+YYPLvU8f/omFzxvYmh9rN+87q7FQ9XcY9eW
 lSdk8QUvkhngxg4H20frHtsH8zLx59hUfHnl+FyAZfDmqRcVInf2o9rwqsKWRazokEu9
 fA0t+AmB+rABTs2za1EY0/ea1FDv9pwWWMwK4gksXLsGwzoR2qefp+Uj7gwh+QlrPj37
 eyXMr520e/CiHDcCoRCgkf8tjpwmL2QkhG0DL1wOjVwKhPgvsNnsDBBoyKNtcFnRwuhy
 Gt6MCqWUBtPCYulV0GsDxo1ycdJ0NDTnvTKnCeJUm7c5xMS5bIvzlOBOYcDqlW5uK4hb
 CVzw==
X-Gm-Message-State: AOAM532sbw7BK83wtlBtH+PUh9wMOrSSjXMwGjsd71C9OH/sCtriZTAV
 cUw3thO2vkRbJ5ejWDX3xG+86Q==
X-Google-Smtp-Source: ABdhPJxjAmo2ovKlm60IvoJxky+iKUF6BuDJdKXWp1pzrvgmxzgCNEarFOfUlp+DzNDRON+cPs/jug==
X-Received: by 2002:a50:fc94:: with SMTP id f20mr25432235edq.370.1616416409440; 
 Mon, 22 Mar 2021 05:33:29 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
 by smtp.gmail.com with ESMTPSA id q10sm11247181eds.67.2021.03.22.05.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 05:33:29 -0700 (PDT)
Subject: Re: [PATCH 03/13] PCI: xilinx: Convert to MSI domains
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Marc Zyngier <maz@kernel.org>
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
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-4-maz@kernel.org>
 <20210322122315.GB11469@e121166-lin.cambridge.arm.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <a9fee2d4-5810-7a16-78bc-4b192e1123dc@monstr.eu>
Date: Mon, 22 Mar 2021 13:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322122315.GB11469@e121166-lin.cambridge.arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_123330_670170_8F4AFA0C 
X-CRM114-Status: GOOD (  16.53  )
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



On 3/22/21 1:23 PM, Lorenzo Pieralisi wrote:
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
> 
> I'd agree with Bjorn that the MSI doorbell change is better split into
> a separate patch, I can do it myself at merge if you agree.

Thank you for doing it.

Thanks,
Michal

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
