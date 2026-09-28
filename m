Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25822C9833F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVJUBNJ7tEq88bmoIqpiryVEDT47R4FakLv8qiWtK/Y=; b=Z1RYEcd3SxGDYT9nOrBvFm7GhS
	tAc5Sl3mUff0y5Px8JJdYwxNHuAIHhCmdjv/4Avp2nMR+KyitkZ0v6yParVzyLNgd2HT119TUyaRy
	mo4cD61wD/s/UynJnInnrhChEyEDi8TLfr3yboMffSTm6CQxq/d9+j+CjNiupmU8EQAPDCGqYpuSl
	S8jCLXzk8k5vJonIHgDMIjodeiLVQANmIfs9h+E3s3okVIFgwUDnbFo95bftu/ki09dB4zg+SgbbN
	0QiNAPq96C9qzwi26MNA/BlnZsH7JZrzVWS5FvYz6vukcdERFsOaZbwy7RZXRvF9bUqp9y4lWqkyU
	rfDpi2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAN6-00000000Xbc-31NB;
	Mon, 28 Sep 2026 12:22:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAN4-00000000Xan-0KmQ;
	Mon, 28 Sep 2026 12:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790598130;
	bh=SLg1FxE9ics1/cs2ysnZ8Au0HCU8e3CEW8rQfydklFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N56iEFcyK3O5kuum5nmqg4Cd/C5G7EW4puEpnAR+quXdLDBZXhnBN5/5oA/fPKLk9
	 B9YhrUZ1gOL51X1saKAQIU8z8GboH0PEZ6yOrASK+FcE1TEI7PQu6811ltUwwPiTRs
	 rr45UUjsIKFmnj1pbkpfXKjzTmyA8UPkx+luhKjHcbnLWkDyWo/JtEPLuHsCIWqJIH
	 eTma1HXVFtNHWdD7nXGCZyFcFrX4MQbFsAI7VQpuTGCu05M3ZDgOY4p8vIRnag8tdf
	 1Vtwbs25pKKXvCxPeKbkfNZKMNIJt2IT4f+AsCZkZpIgHWiLPgG1XFIZ95Fxrel1yN
	 4SxCTfO6rgObw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94BC017E007D;
	Mon, 28 Sep 2026 14:22:09 +0200 (CEST)
Message-ID: <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
Date: Mon, 28 Sep 2026 14:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Jerome Brunet <jbrunet@baylibre.com>, Ryan Brue <ryanbrue.dev@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_052214_292233_0AE566C8 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/25/26 15:13, Jerome Brunet wrote:
> On lun. 14 sept. 2026 at 10:16, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 9/12/26 08:40, Ryan Brue wrote:
>>> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
>>> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
>>> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
>>> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
>>> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
>>>
>>> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
>>> FHCTL on for mainpll, mpll and msdcpll, with SSC.
>>>
>>> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
>>> this one is untested.
>>>
>>> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
>>> Assisted-by: LLM
>>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hey Angelo,
> 
> Will you collect the MTK changes yourself and send us a PR or should
> we collect the changes you've reviewed for this cycle ?
> 

Please collect the changes that I've reviewed for this cycle... I'll start
sending PRs from the next one.

Thanks!

Cheers,
Angelo

