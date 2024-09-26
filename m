Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A59FCCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=759UMZGJArBxKEUAP2K8AdY9wtPFhMDxYQ/blFKYxTE=; b=RsykLZqU/9K2aJxiAJvPTMmYF+
	C0R8AUrlgrV2Nl3mVERXapiaR93lDYPbvkyxt8JNkjWzfuwR61gStQdI5dfo7mWyJX82ict5vUzzb
	a1FB1LLam/Z7fQ4ecKTtBfhi5jbJtQVzIA/w52vHl9yFY4cScWK9RBFxQegvo3W7/GnrtbxESJzgR
	1TWqednSK7un0SmHhwoccdLRbmCNIPTfuHOxCW2lzzvlG8DR1XjTmRJWJRyJ49r+yInLUleiMYNOY
	eDkz+3HwrmNYGc5oL7xwSltZsIs7bg5JsGIA4TnfoAEmUjXtWHFCJXqpTfcUUDL5pszLay/aauQ44
	AdDsUlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmAT-000000089Ey-1OKx;
	Thu, 26 Sep 2024 10:56:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stm4F-0000000882k-13kr;
	Thu, 26 Sep 2024 10:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727347789;
	bh=5z7SiMhJTEAuTswaoEaoXppBt9EGx2gS7cFSH/7/tow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qMhC3dtQcM1PnqulvZCIkjIpriv/j4NY6o6x597yg0HfYV+VJRVOQZ162gpZO+OGA
	 OBfpQsR3mRtzjSQcGeTqIiYFxCjWFOKJOYS2N31M1dPN/bm96phcxq4GgpY51KnoSI
	 eEYbb6I8ZALbhUNpH4yOqaa4ytTLa0Cx1iMZJOVSBlN8mlWUbnL1pyZGScI4zVpcp6
	 fENYo3TyyD3YRxff3cd1o6q8OKgOenw6A/0Sbb++RuCML5MkbfNLmnMLN+aYp2YmBF
	 fjHyq95v2p+BEZnJA+hJltFc4qEpxL7trtLhmjTKBTr9JC5+PgUmxPZuN90P4jLxer
	 +aTpTpuNcQ95A==
Received: from [IPV6:2a01:e0a:d1a:1250:792b:136f:2a18:fd70] (unknown [IPv6:2a01:e0a:d1a:1250:792b:136f:2a18:fd70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E59417E11F6;
	Thu, 26 Sep 2024 12:49:49 +0200 (CEST)
Message-ID: <227a813a-0586-4072-b6de-9dfddfe2d060@collabora.com>
Date: Thu, 26 Sep 2024 13:49:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Provide devm_clk_bulk_get_all_enabled() helper
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jingoo Han
 <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
 <20240924143634.pqpdsewoqxn3liqi@thinkpad>
 <70a24964-990b-4606-bdc8-4dd42c44785a@collabora.com>
 <20240925075654.f2pefosdspqiakvj@thinkpad>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240925075654.f2pefosdspqiakvj@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_034951_478225_316B4F14 
X-CRM114-Status: GOOD (  15.22  )
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

On 9/25/24 10:56 AM, Manivannan Sadhasivam wrote:
> On Wed, Sep 25, 2024 at 09:52:44AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 24/09/24 16:36, Manivannan Sadhasivam ha scritto:
>>> On Sat, Sep 14, 2024 at 09:04:53PM +0300, Cristian Ciocaltea wrote:
>>>> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
>>>> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
>>>> return the number of clocks stored in the clk_bulk_data table referenced
>>>> by the clks argument.
>>>>
>>>> That is required in case there is a need to iterate these clocks later,
>>>> therefore I couldn't see any use case of this parameter and should have
>>>> been simply removed from the function declaration.
>>>>
>>>
>>> Is there an user that currerntly does this?
>>>
>>
>> Yes and the patch wasn't sent upstream yet, but anyway, regardless of that,
>> this series is fixing inconsistency with both naming and usage between the
>> clock (bulk) API functions, with that being the only function acting
>> different from the others, at best confusing people.
>>
> 
> I agree with the 'inconsistency' part of the API, but I wouldn't call it as
> *broken* as this series does. Please fix that and you can have my:
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks Angelo and Mani for reviewing this.

I've submitted v2:

https://lore.kernel.org/lkml/20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com/

Regards,
Cristian

