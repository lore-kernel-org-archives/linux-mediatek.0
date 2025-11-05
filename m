Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF95BCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMPeYJAiqG+/lWkROIRlcP5E6Gh5zcB2nm18U7Rp8rY=; b=UnSTuGN9ZnCtUl2R1bYNGF9ppg
	ccFIe9blQkrVE1pGd4F7yi4051zGfj8Nh1zuzXLpZFmXQ/ne706R4t2FL6ncQ1SqQGccMWt2Yy3xY
	06dkgVlFdRejKRgNqeJtNnZifuFYpor07k8gEX+jNNXoQNRUFL4kbKct2QPabNiVmTsPk2RsEOMP+
	5nm8gI0om1zG7w6MMjFtQsFgu0sNOXLUWuNv7AHFwG6N9c/2uqyKE2K7xCzt+6Md0bvlzeaD4uQ0e
	IWtGsk/n3qxpB6+96mA7ygG0o4uLQlFoFs2lLqDwYyApSVe9tPW7eRdqqs7sPkoKiSg0x/gQpPLJN
	WujXZxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGceo-0000000Db2X-3hE0;
	Wed, 05 Nov 2025 12:30:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcem-0000000Db2B-2NzY
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 12:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762345829;
	bh=IiK2mpEii/vR3bgxpZg9qwQ/e83frIZinAdetivBfco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eq5hV6GaTEBxYByQcV6bfi1YRReUWlvEOraI6xXzP5Bp//C9TQ0NGKVxlX9Y5gRhU
	 P+o61Hv+Jf434sqMiJWTj2dgzIJ1CbxWr+/9karGQz5e9Z/jg32eveIzEcZz9Qxm08
	 AvXXwVdfXY04raDzUIqCInPfTFHlr9Ve5CY1UywxvSQqfK8AmQKLLMKZ9HF2fMusEs
	 /3Xc2VhXzSPJTVxkYuNWgMm0b+qTcXrJOsjJU8zkDLtNBISVAmj0cg+pw6j1ivoNjj
	 ZJMoqan3hQWz8Pm58rXlaD+eXKvy096NxEIOO4lOZTrt2WzU1i+WlHqQrz7mbHw3D+
	 4lqEYKMJiPujQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E319017E009B;
	Wed,  5 Nov 2025 13:30:28 +0100 (CET)
Message-ID: <2162f8a5-e4ca-46e1-baac-e7eaf3e58c11@collabora.com>
Date: Wed, 5 Nov 2025 13:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
To: Frank Wunderlich <linux@fw-web.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: matthias.bgg@kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Qii Wang <qii.wang@mediatek.com>, Wojciech Siudy <wojciech.siudy@nokia.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de> <aQfgEuelvU-8_2rh@shikoro>
 <aQs6O75BqOERMzPJ@ninjato> <9B073F04-0CE1-4870-88B7-9510B3EA5D6F@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <9B073F04-0CE1-4870-88B7-9510B3EA5D6F@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_043032_791115_2B323E51 
X-CRM114-Status: GOOD (  11.98  )
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

Il 05/11/25 13:08, Frank Wunderlich ha scritto:
> Am 5. November 2025 12:51:23 MEZ schrieb Wolfram Sang <wsa+renesas@sang-engineering.com>:
>>
>>>> Maybe this option should be enabled by default or when the i2c-mux is
>>>> selected?
>>>
>>> That's what we were discussing. At least a warning will now get printed
>>> to the logs when booting suggesting the above solution.
>>
>> FYI, all the commits leading to this breakage are reverted now. Sorry
>> for your troubles!
> 
> Why? My issue was solved by adding GPIO_RESET... So it was fault on my side,sorry for bothering.
> 
> @angelo
> yes it is a final board BPI-R4 v1.1.
> 
> Why sometimes it works i guess it is because uboot may previously initialize the device (and without reset working it may be stuck in wrong state).

Heh, this is something that happens frequently.

> I'm not sure if my current flashed version had the i2c and i2cmux support,but i got it working on that board because of the connected eeprom (read mac address via tlv_eeprom as macs do not have fixed macs via efuse afaik).
> 
> Thanks for help so far.
> 

No worries, my pleasure (but I didn't do all that much anyway :P :P :P)

Cheers,
Angelo

> regards Frank



