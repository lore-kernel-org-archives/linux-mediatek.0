Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3DE606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jlVduxYW;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hR7WH4UO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i4kIoepEeLRtySE2Wy1kjNABPsmPrG3mk9cqlfxlUpQ=; b=jlVduxYW8vIH15
	mF1YU2cbEU+I+KelMbfKKsybcccrBVNZowJh7KTg2z6OtDu/S6ft+RRGoDylUHvKFbU94zk2h2FYN
	kcZBuRg3VIPDnnGIO0/00JQrUJztqbqqnxfdWJmHkT7nh38LaOnJ/IWB0OOxNTemTy1DNJK088fJM
	M/FGCEJWcjeiD0VYxjX9yFg7rxsu6E9yuRnou3NAIX4YtnZQaL8dBjKTkJc1p3mwQ5aXl17omnSk5
	OdYB/Pi9FfBtGZZlmgWmDm2qaWrjUiWDdrjz/aXn1V4nF69CgX+EfXzv7vyShzpc45E2jRoTKnvTI
	ISFoClf/oW+ac3IdkYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKW0-00000006D2E-0Luh;
	Tue, 17 Nov 2026 14:50:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKVw-00000006D12-3vg7;
	Tue, 17 Nov 2026 14:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794927026;
	bh=J8ZRNMTFNqyR2sjoXv+dmK7HteE5JTl6kweYDLFKZi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hR7WH4UOxBlCLvCpuMGcw9Hykv46PwXBjhpdiTDpfkejhrTsaE0jHDbw3d8PXVGTn
	 OdOyDFrUIO3mQY9hZQawDypS8OJrQALxZM9Miq+hnpDA7UK7xvlcl8dEEeHVQwD1TN
	 6kXNqutgUAyzfLb4L/TbXZQAuIWze9W2PhEj7gesOd/QBqsHat0gVV5fLHeRNLHLts
	 9D+9f002rp0pisAB/0D91XF1ra1a4PK/Qm4LKWH/2H0TYX5qaTwGzxhU81lARAInGh
	 Zv52rolneURu85pn7A7S+7R7geOXDRFmTs8KyTlztVv9ohWjyasOqQWxxipKas8H14
	 CPYuMzgp77Jng==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E03F317E0069;
	Tue, 17 Nov 2026 15:50:25 +0100 (CET)
Message-ID: <3fa52671-642d-49cb-8323-8e9b4066a06d@collabora.com>
Date: Tue, 17 Nov 2026 15:50:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] ARM: dts: mediatek: mt6323: add EFUSE support
To: Roman Vivchar <rva333@protonmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Srinivas Kandagatla <srini@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>
References: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
 <20260921-mt6323-nvmem-v5-3-2f5d308369f0@protonmail.com>
 <hfElNICOLYWph6ayG04s_yQbkHLXmu6qzdWeR5ObRNxVsBtq86bjnERSJx427OwwrZYipLAOrUGBU8zvYtXEV1ixQ3YBzAZYQ3ypouA66T8=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <hfElNICOLYWph6ayG04s_yQbkHLXmu6qzdWeR5ObRNxVsBtq86bjnERSJx427OwwrZYipLAOrUGBU8zvYtXEV1ixQ3YBzAZYQ3ypouA66T8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065029_156283_48EA94AA 
X-CRM114-Status: GOOD (  13.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 15:43, Roman Vivchar wrote:
> Hi Angelo,
> 
> Could you please take a look at this patch when you have some free time?
> All other patches were applied by mfd and nvmem maintainers. This patch
> will be required for enabling thermal on the mt6323 PMIC.
> 
> Thanks,
> Roman


Hey,
thanks for the ping - sometimes I just lose track of patches around - so don't
worry and keep doing that.

For this patch in particular, nice job about adding the efuse support, but now that
you have it... well, adding the compatible to a devicetree alone makes it probe, ok
but then what?

You're not using it for anything, right?
So those 3 lines are "useless" on their own...!

If you also add a user (someone reading an efuse from this controller) I'll be
truly happy to pick your additions ;-)

This fuse array stores thermal calibration as far as I can see, so I guess that the
user will be the thermal node?

Thanks again!

Cheers,
Angelo

