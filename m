Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C73D10F28
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbn5Y9u8Ph5GVO2b2VngmUC8e6xiu0acalV/Af8CmJA=; b=OBcQh/tK7xaISov9dSDob5fbM/
	DA9R4bS14LkjJPS6FRdneHZjRpEobuFbfmrngg7hkrIh72UN5XvOOy7ZesvoEk+kmXCAx0fx9iZth
	ftLzbgkAPZ3dMRuvVXkc9RO/xgaBJ5ZuBMFvd12Yw2+/bj00I5Y9peDJbn+CulnnzKDsw/E3uldrg
	kcoVmU+rrKj0FBu+jLYnSP1UnRTKnNnfYpR/TtCq2KuVqw9gS20St2kgvm1I7+mxA0YZopINK+oA7
	wQan29yp053dIxjJARgrC/44yy56d816mmIv9rpbzEmkhPeWe5PPfWJALqnOZ5c+IwfQy8DfNwlEf
	7vkjfqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIlV-0000000FKou-3w2W;
	Wed, 26 Nov 2025 16:53:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIlT-0000000FKoD-0ewy;
	Wed, 26 Nov 2025 16:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCCC440991;
	Wed, 26 Nov 2025 16:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1527C4CEF7;
	Wed, 26 Nov 2025 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764175989;
	bh=mmQKTxXmZkxtfNlrMvRnw3FG4sKObXtL7r6tazNlwdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoJFaLMOjR9wr3+xuMS2vx75RuQ/Q1NPSn6yj4FJI+kL75FFDHiIZXK8+pyJbAdgM
	 3QlknRBsMdS7KCd4bttC8IYAoBz6Q/WetOM59LMpaAPju/qaAaqQ1fnFVYVC9Vx0bZ
	 k8h4KAaST2iyOldpemJLrgSLY+KAXM+/QsBqqnVRK4A1xCJnbtbxByPsnLbwwbS3ge
	 hal9/R7jNFaQJw9xC+30n8oTXjQuW11QwvmAXY3TgKEjsh7ydOgwGvy5hauc9Ccj3X
	 tlDg2+ZCt2uEVo81/XbjRjJ60ZcspbkKljDqUvDIbcL3+mFI4YgN38GWFIWV4QANIk
	 m0FqKs+V/tOlA==
Date: Wed, 26 Nov 2025 17:52:59 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	yong.mao@mediatek.com, qingliang.li@mediatek.com,
	Fred-WY.Chen@mediatek.com, ot_cathy.xu@mediatek.com,
	ot_shunxi.zhang@mediatek.com, ot_yaoy.wang@mediatek.com,
	ot_ye.wang@mediatek.com, linux-acpi@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add acpi support
Message-ID: <aScwaxBG53dnZ4a4@lpieralisi>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-3-lei.xue@mediatek.com>
 <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085311_235294_6BA5FD8C 
X-CRM114-Status: GOOD (  19.74  )
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

[+cc: RobH for his information]

On Wed, Nov 26, 2025 at 10:10:15AM +0100, Linus Walleij wrote:
> On Tue, Nov 25, 2025 at 3:36 AM Lei Xue <lei.xue@mediatek.com> wrote:
> 
> > Add acpi support in the common part of pinctrl driver. Parsing
> > hardware base addresses and irq number to initialize eint
> > accroding to the acpi table data.
> >
> > Signed-off-by: Lei Xue <lei.xue@mediatek.com>
> 
> I'd ideally like Andy and the ARM64 ACPI maintainers look on
> this. (Added to To:) and CC linux-acpi@vger.kernel.org.
> 
> I'm not aware of the best way to deal with ACPI in combined drivers
> but things like this:
> 
> > -               hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
> > -                                       hw->soc->base_names[i]);
> > +               hw->base[i] = is_of_node(fwnode)
> > +                       ? devm_platform_ioremap_resource_byname(pdev, hw->soc->base_names[i])
> > +                       : devm_platform_get_and_ioremap_resource(pdev, i, NULL);
> 
> Just look really quirky, I think there are better ways to go about
> this and sometimes the ACPI maintainers give some good
> pushback about the firmware as well.

How are pdev->resource initialized ? For OF I suppose the names come from
"reg-names" (that don't exist in ACPI, yet), for ACPI I assume they come
from a _CRS (and you can't tag them by name for the reason above) ?

I assume that in ACPI the _CRS resource order is foolproof against the
variaty of SOCs this code has to deal with.

I also assume/hope that we don't want to add a "reg-names" _DSD property either
in ACPI to deal with this seamlessly in DT/ACPI (that was done for
"interrupt-names"):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/enumeration.rst?h=v6.18-rc7#n188

I am sorry I have got more questions than answers here - it would be good
to understand where the line is drawn when it comes to OF/ACPI and fwnode
heuristics compatibility.

Thanks,
Lorenzo

