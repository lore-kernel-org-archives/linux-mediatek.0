Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7288C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGo2bdPcuQ7rDNXlxDOZ6mDEAQoWCm9pdLrcEmoI6SU=; b=zT3SScnXMr5GsMjkdfu2semX7+
	sbz6elmpADEP3RNy/yN30zZU09nqQ13T/AqwtDicYNHbHvpEY2vPR3TlVlPZqXdBdDl00uEKzIe4C
	7MGWLUZLJhVcpfgPDGFIIQtru9X9JM2kF7mdiv5eL15AaBo5uSdBHmz7bHRfSjGi2JKul0aqey9Yi
	1s1bLCEgaihy5LTs8R2QpIBxEhvZu3GPIKv1xx6+pO2A9isiaGoonGjdqtObruDUabo6P9fUPTQ32
	324hl8V8zqpfSoRpoeCnq2lvxcX91/zhfDKnzl4VtTKo9GsMBm+eJurn8wiyG7U2kcNCSg8rQRA9G
	nnB31ASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw1t-0000000CeVi-22Cm;
	Thu, 11 Apr 2024 15:07:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw1n-0000000CeRK-1eEf;
	Thu, 11 Apr 2024 15:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81A5B61D70;
	Thu, 11 Apr 2024 15:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2B0C113CD;
	Thu, 11 Apr 2024 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712848070;
	bh=CuTXFk8SVpH9bAwJ78Sr0NeaVIli6W0UqoQ/W4nDbpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpCxADfBRhPK3MYJZqIA7y+CjSDlrrefPUKuyM0WAgNZLPSdbGnO9jNRT/KvAWGsC
	 JbntGXbZ7oLL/lelO5KwfP8TxaL98Vns85TYtL5lUGxBBSWRuj/+zgxbYpNHj9w7uf
	 kD35iD0IvhNR9icnehYe18fRaQbhZ7mHF+6OeNLZnJwWOFbagOw0o9xPQLs3B6pJqw
	 N2g51Em6GroJ9xJtF1jhvzL3s57lv+6LlkBQVJWjAKzcAiA8rN+LDqD921Wy6QbKa1
	 fn1NIbL0ZAuoCaeRdNUUfPKa2gQT+8Urbgeazte/gMawz7w4P2L6ol8DXD0U7zRnAj
	 rKwcbLS2yb/nw==
Date: Thu, 11 Apr 2024 16:07:44 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, tools@kernel.org
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Add missing simple
 syscon compatibles
Message-ID: <20240411150744.GE2399047@google.com>
References: <20240402202413.757283-1-robh@kernel.org>
 <171283980874.2354899.3662943965972729204.b4-ty@kernel.org>
 <CAL_JsqL5M0gvjBa7VvRm9B3kRpj8=c6f8k2MnG7LbA-jZstB8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL5M0gvjBa7VvRm9B3kRpj8=c6f8k2MnG7LbA-jZstB8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_080751_682881_00C121C6 
X-CRM114-Status: GOOD (  18.42  )
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

+tools@kernel.org

On Thu, 11 Apr 2024, Rob Herring wrote:

> On Thu, Apr 11, 2024 at 7:50 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Tue, 02 Apr 2024 15:24:11 -0500, Rob Herring wrote:
> > > Add various "simple" syscon compatibles which were undocumented or
> > > still documented with old text bindings.
> > >
> > > apm,xgene-csw, apm,xgene-efuse, apm,xgene-mcb, apm,xgene-rb,
> > > fsl,ls1088a-reset, marvell,armada-3700-cpu-misc,
> > > mediatek,mt2712-pctl-a-syscfg, mediatek,mt6397-pctl-pmic-syscfg, and
> > > mediatek,mt8173-pctl-a-syscfg were all undocumented, but are in use
> > > already. Remove the old text binding docs for the others.
> > >
> > > [...]
> >
> > Applied, thanks!
> 
> Note that something is going haywire with b4 or you applied a subset
> of a single patch... I really wish b4 didn't change the subjects at
> all since Gmail is incapable of following standard threading.

I think "haywire" is a bit drastic. :)

It's to do with the way I fetch patches from the list:

    b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}

Where ${PATCHES}:

    if [ "${RANGE}" != "" ]; then
        PATCHES="-P ${RANGE}"
    elif [ "${SET}" == "" ]; then
        PATCHES="-P _"  # We need this to pluck patches from sets
    fi

`-P _` means cherry-pick, which doesn't appear to know whether we're
picking up an entire set containing only a single patch or pulling out
an individual patch from a larger set.

There is an option to add a new Mutt key binding to do it which drops
the `-P _` part in the former case, but I've ran out of free keys!

Present Mutt bindings for kernel maintenance:

macro index,pager  M         '<pipe-entry>~/bin/apply-patch.sh mfd-next<enter>'
macro index,pager  F         '<pipe-entry>~/bin/apply-patch.sh mfd-fixes<enter>'
macro index,pager  B         '<pipe-entry>~/bin/apply-patch.sh backlight-next<enter>'
macro index,pager  L         '<pipe-entry>~/bin/apply-patch.sh leds-next<enter>'
macro index,pager  T         '<pipe-entry>~/bin/apply-patch.sh toys<enter>'
- These all apply single patches (single submissions or cherry-picks from sets)

macro index,pager  S         '<pipe-entry>~/bin/apply-patch.sh set<enter>'
- This presents a menu of kernel repos, then applies the whole set to ${choice}

macro index,pager  R         '<pipe-entry>~/bin/apply-patch.sh range<enter>'
- This presents a prompt to enter a given range (e.g. 1-3,6,8)
- Followed by a menu of kernel repos, then applies the range to ${choice}

macro index,pager  A         '<copy-message>=patches-to-apply<enter><enter>'
- Manually applies patches from a mail folder (does not use b4)

-- 
Lee Jones [李琼斯]

