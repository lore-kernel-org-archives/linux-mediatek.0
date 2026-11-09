Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D1606A321
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DvnuF6uT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMq7DEim
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YWyZaiNe5GxohF5WpdTcbObCq/5yd0L96m7mUMGnuk0=; b=DvnuF6uTy6A6Vu
	lhh+gxoFJtUVYz/QygdFrHMaPY7JRT3/QO/lElPkawvr4RlTnj9+otyWFx5W8uAPcYWTDxURUoJmy
	JbH+Loh53LX2YQmcUvuI3PeaeZHU+s4E/1jg/3JRrvHzyn/JI4hrEsdy2HwfLqnKutDSEJvlobnip
	Vpbg7xKiT9oPCWU+011dPR7ykAu3x+zl5RSSirGPmq8UguamCGaCDfv9oif3G+4ZynrX/KXE95IUH
	L4cdtPiXb+wRCFp4OXxYwZYf+S+Rcw4INoqkKOzeQZXo6oxs8Cp6i/mtwYnHY/60ulk85/o1JZFeL
	NBqXOk3tDaPCmZ/S1Jdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTGt-00000001MEt-2vfO;
	Mon, 09 Nov 2026 17:35:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTGr-00000001ME1-3aK7;
	Mon, 09 Nov 2026 17:35:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9390634B4;
	Mon,  9 Nov 2026 17:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E561F0089F;
	Mon,  9 Nov 2026 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245704;
	bh=YWyZaiNe5GxohF5WpdTcbObCq/5yd0L96m7mUMGnuk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mMq7DEimjcUCIphKWzE6JxeOF01ABa/MvIAqjE9icP6aPUTsIz3PQC6apWI+V8P7a
	 dYZqfTJKygv48p6R0/+OAmXAxOY0xfc43X+ttiABghQOi5pkPQ8zaY1BVp2S6zdfM/
	 y3n7ulkWe3bvIEYqowOhCaSDu3rGs16PrHexI++6DrSddtOokoC/ui2b7aLhyAn5l1
	 oHM/VIJvWSU0fkWtV7dD5B0lVPLwCbCBSLFixB4qHqmBj5JgzqgVVZl4/VH+w7Goz8
	 jNU733/imcACns0SgZCL8EFIf++D5RTDpR9bwOdUfjcrdEyP4LYo/9xuZAGnEhsH73
	 ev/f5aXIVoOYg==
Message-ID: <65707815-7510-4f85-ba95-ec71b78fb6b2@kernel.org>
Date: Mon, 9 Nov 2026 18:35:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <179407827117.165429.11777170722243752189.b4-review@b4>
 <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 14:56, Konrad Dybcio wrote:
> On 11/7/26 8:04 PM, Sven Peter wrote:
>>> Add a new file plat.c to register platform NHI driver for MediaTek
>>> mt8901/mt8992 SoCs.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>
>> [...]
>>
>>> +
>>> +static void nhi_plat_shutdown(struct platform_device *pdev)
>>> +{
>>> +	nhi_plat_do_remove(pdev, true);
>>> +}
>>> +
>>> +
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id nhi_plat_of_match[] = {
>>> +	{ .compatible = "thunderbolt-platform" },
>> Do you already have hardware that probes via device tree? You'll have to
>> write bindings and get them reviewed before adding any compatible here.
>> Generic ones like you used here aren't usually allowed.
>>
>> If you don't have a dts based platform I'd probably drop this, not much of
>> this code here is e.g. re-usable for Apple since they like to think very
>> different, see my series in [1] that I can pick up again now that we
>> made progress on how to represent connections between the NHI and the
>> protocol adapters.
>>
>> Not sure about qualcom since I haven't seen a series for the NHI yet but
>> I'm sure Konrad can comment there. I kinda expect that it won't have
>> much shared code either.
> We're in the same boat regarding thinking different. This driver is
fun!

> for implementations where the underlying hardware is abstracted away
> (be it through architecture or intermediate firmware) and the TBT
> layer writes are enough to e.g. power sequence the connected buses,
> just like on Intel.
>
> For the OF compatible, we definitely do need bindings and I too would
> like to know if this is actually exercised - if not, we should cut it
> out and trivially bring it back when/if the need comes around.
Yeah, agreed, and ideally directly with a vendor,XXXX-thunderbolt 
compatible (or similar) only with the generic one (assuming the dt 
maintainers agree) as a fallback.



Sven


