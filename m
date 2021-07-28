Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1881C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 09:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710256056B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 09:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 710256056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLuME8ALoa1aDbYfviJopApzG0Ow1FQCF78n0KIwxiQ=; b=HugtAJCWdfGH+swRO3Fh8dVwop
	68VCeg1+IAqf8/zN6S0qxpa6zn2Rsk/tgKqhEVY6JuoQPmQcx59Ak/Qblo3YM0A9JwnlAmCpOfBfP
	jub6EHdsM2mrNoCebs+Fsf3UO8E+ls2QlYQrBUA5x9pomDQdErkXChvU/XOJpX73Dcm4LOjN3eV/j
	59H/7tO75Q6TS5Ww9yX2hIIJ3vtaujw0NNuue/tC1irKe/KNBfn0A9gGWYuFofl7E/9GpPJ5INe3Y
	RRIe6Tc3fpKzQdbvoGENExL+p782ewfo6B4X+5droUSEjXe8QfvXmf4kWiLTuifIm3oON6ESiPTfe
	wowfh7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8gLo-000Ioq-Uf; Wed, 28 Jul 2021 09:59:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8gLb-000IlE-4U; Wed, 28 Jul 2021 09:59:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC2731B;
 Wed, 28 Jul 2021 02:59:28 -0700 (PDT)
Received: from [10.57.85.218] (unknown [10.57.85.218])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC1A33F73D;
 Wed, 28 Jul 2021 02:59:25 -0700 (PDT)
Subject: Re: [PATCH 1/1] arm64/cpufeature: Add option to disable mte support
To: yee.lee@mediatek.com, linux-kernel@vger.kernel.org
Cc: nicholas.Tang@mediatek.com, Kuan-Ying.lee@mediatek.com,
 chinwen.chang@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Marc Zyngier <maz@kernel.org>, David Brazdil <dbrazdil@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ionela Voinescu <ionela.voinescu@arm.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Quentin Perret <qperret@google.com>, Andrew Scull <ascull@google.com>,
 James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20210728094302.9949-1-yee.lee@mediatek.com>
 <20210728094302.9949-2-yee.lee@mediatek.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <88cded87-bc06-4aeb-4996-76a5faa58afe@arm.com>
Date: Wed, 28 Jul 2021 10:59:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728094302.9949-2-yee.lee@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_025931_274596_3DB1CB4A 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/07/2021 10:42, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Add a static key to exapnd the logic of system_supports_mte().
> This function controls mte enablement in both EL1 and EL0.
> 
> The static key, "arm64_mte_support" is default true and can
> be disabled via the early_param.

Please could we use the id-reg override mechanism and give it
an alias ?

See :

arch/arm64/kernel/idreg-override.c

And could add something along the lines of :

arm64.nomte


Cheers
Suzuki


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
