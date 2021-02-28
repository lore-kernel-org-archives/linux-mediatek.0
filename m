Return-Path: <SRS0=0KCq=H6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7535C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Feb 2021 18:48:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2BC64E83
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Feb 2021 18:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2BC64E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zmWJYznY4hiuZi0mHWGjTCXHnxNx0qEw6BBuWY81FLo=; b=15I+fxzDGJqgxf65S7oF3c5JA
	4Oik1OiMyUM3tzGaDlerXSvR8qgSNwr9q8U/CYhLaMHpf0eHKOSz4DyBzJQR4bSdbEeNCyTm0TMMK
	RKCIAn4NpsAFUiB3zIrlOFwCQPE6NSRGjMKgDwYzub5btTCbEVkdQD+wSptn8EjNDQ3gTyQSEO6Ga
	uPy/s6b8oDy796c8CPXCoqz79UzJzT5dnG5kEd/fbXqR8yu2LKxHsa0MsuMyNw+3KrYaMC1kUw8r8
	ANBF7E1gaAo4YbiL9ayx2xXt6ffJ08LbXWpn41eheCfOBXG7mMQqxI0OwGqoKDZis7R8+bTuS4pRX
	linjIx4UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGR73-00054V-C9; Sun, 28 Feb 2021 18:48:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGR6z-000548-2x; Sun, 28 Feb 2021 18:48:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id c6so17829730ede.0;
 Sun, 28 Feb 2021 10:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6FN28+EGwV52y5fLBmFdolcmGnuxL558/53m8V0+MHs=;
 b=PuwnMKZfF9jVmm8oa8y3QjE7JCwENco3bvbHskHMb3lb0hCkpHCrfv5oB/+tl45q1r
 ZHDfY06rcWoX+6WMekZ9ezBMVVkUn/R7F2/6VDeXorStJJv5pwPOHQ7Llnwf9w3I4ubd
 9V3/vRCvqJahnk4JIO1RRwiLSf9Zs/HlhxMGUfYdkH516u37+LgOsRkqoGC1qXARYrgM
 HlmW1jIqUvg5vLyfvv1Fpz2EXuL/ILv2uNUgxP2xDb+f+NZXzQj51tBhdn1xWquiKvL8
 xds4df9amNmFsI8+KGeKEBQjYACEfjtqetU85PW/kjIotDeFloSLcyIN1IGcqwxIj9Tp
 ODQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6FN28+EGwV52y5fLBmFdolcmGnuxL558/53m8V0+MHs=;
 b=UYJRO45LJ2HX3k9AKak15u71XqQSpYYemj6bx0EA5AQEk8XxX7MgBJ6K8ekfNUZshB
 zc2VW/1/mYRPXnold1daNF30Lf84IDdGg0B8MPrcIjXhbq2vcrZl2j3kaGZJ/R+dd10x
 +n+dDZCdskKeyfcDY4shVmttEop7qJ3csQehbCZ+5n8cfiPmgR4MgWI85ev9yxJwnIiF
 cu9LDG/QwJmOETZon6epTNmeOU/eFh3Ul4jEtliB1Dfzaq5fhLKvCYVOT9Vk9wcj6H/y
 Bs9NzZpGOHVBhHrHVHeyQacgLCYWIDaifyG9gSA6vndyUo2JV8skkEjZ+F7/OBOcEZmu
 uoNw==
X-Gm-Message-State: AOAM5303npJ3/HnW+ESb+vQaKB2O+xOK2yLdmpOyFCgNM2NGDrjf9uQH
 D4SdDh5IXwdln9QKexFGmlQ=
X-Google-Smtp-Source: ABdhPJyvjekRu+I/lGwxqSoORkOQNSsmlj+tMS3vgn/nZmYclX07Y31NzYvg3A/TchA4e9wvrpkp5g==
X-Received: by 2002:a50:da4f:: with SMTP id a15mr12866517edk.301.1614538089407; 
 Sun, 28 Feb 2021 10:48:09 -0800 (PST)
Received: from [192.168.1.4] (ip-89-176-112-137.net.upcbroadband.cz.
 [89.176.112.137])
 by smtp.gmail.com with ESMTPSA id g25sm1425341edp.95.2021.02.28.10.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 10:48:08 -0800 (PST)
Subject: Re: [PATCH 02/13] PCI: rcar: Convert to MSI domains
To: Marc Zyngier <maz@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-3-maz@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <91e327df-49de-e0b5-34bc-eae8b62e88ee@gmail.com>
Date: Sun, 28 Feb 2021 19:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225151023.3642391-3-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_134813_149704_0580D75F 
X-CRM114-Status: GOOD (  13.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <treding@nvidia.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/25/21 4:10 PM, Marc Zyngier wrote:
> In anticipation of the removal of the msi_controller structure, convert
> the Rcar host controller driver to MSI domains.
> 
> We end-up with the usual two domain structure, the top one being a
> generic PCI/MSI domain, the bottom one being Rcar-specific and handling
> the actual HW interrupt allocation.
> 
> Also take the opportunity to get rid of the cargo-culted memory allocation
> for the MSI capture address. *ANY* sufficiently aligned address should
> be good enough, so use the physical address of the msi structure instead.

On R8A7795 with Intel 600p NVMe SSD and IWLwifi 6235 card,
Tested-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
