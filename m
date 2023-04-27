Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9FAC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/EKIsgM1Et8Edo3e9mPXB9vHCUIW5dTubzPJl1BxfM=; b=qN4286kd7c77dPdBZw5v11sa+4
	j9iziNeUA0Vfi5eo+pqKL8wEE15QyYwrQFFAxNeHr4rYKRx0N14xrDSitDkPR0s1U7uZZufg2FyMi
	43g17CY+KdYJCpsjIslWdUAoNPuIY2lmtoLnHlIe47eUOVxVHkygbbpvooI2TclKuO7fDU+G1FaJO
	qrBdcGQeroYKqTZrDwbsDyfwHVS2w1GB7Y7zoJbgPC9BE+cZGkQwep/xw3LqBBvWtLi5b7qSvgJ0v
	idhvmVXKctivpbP3xPam7n8RnOEtk+3RJvnIQ9kOA5YMAEgGKqwYVsmWdWhzWhfVb/O9CAAPgLHDP
	DNvgj2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps3LJ-006rdu-2G;
	Thu, 27 Apr 2023 15:15:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps3LF-006rbX-1M;
	Thu, 27 Apr 2023 15:15:30 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EDD7B66032B5;
	Thu, 27 Apr 2023 16:15:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682608522;
	bh=wx4QwWQd9NsnskAEPQUncauUhMSHJCUjAMBurj5VCPw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Jm/XTqkVdeGNCtWpZpEhTDlndoLNfCkYlhVE0tRHH+AnSHsVTPcFlQUYWKu5Q7O2Y
	 hpQn5J88h7AS7Aj6hrxV1wJH0yVIBH81FJKTkx/4JEgSD9br9/nP2VIs/Jouzq4+GZ
	 +XhVlV4yCgAdpn+yWv6IoqMBabKshxpvQcen9A/Lv0BicMihifmbxjDiUQqL7CQqPx
	 q5gu7ZjrTVBE+6HLa/d7p4V+n6cQnigJR3HzoyjvPAMCjihPRFukIkbQzciS8/3Rnv
	 OttUxoMFyh7orzPjG2FgdrOVgjsqJHBE88TBNtK25tiRtZZyaTAdt/Dvn8gdxmP4vu
	 92WRXZjLmQjBg==
Message-ID: <17525028-80bb-cd03-fbc9-b8ff65378517@collabora.com>
Date: Thu, 27 Apr 2023 17:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
Content-Language: en-US
In-Reply-To: <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_081529_608476_835F3E2C 
X-CRM114-Status: GOOD (  16.05  )
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

Il 26/04/23 13:43, AngeloGioacchino Del Regno ha scritto:
> Il 12/09/22 03:29, Jason-JH.Lin ha scritto:
>> Since the gamma_set_common() function for previous SoC,
>> such as  mt8173 and mt8183, is designed for 9bit-to-10bit
>> conversion.
>> mt8195 is using 10bit-to-12bit conversion, which is
>> not compatible with the previous function.
>>
>> Thus, need to update the function to fit the need of mt8195.
> 
> Hello,
> can you please respin and fix this series on the latest linux-next?
> 
> Besides, please test it carefully: as far as I can see, GNOME Night Light
> (or others) are not working on MT8195 (color temperature/ccorr).
> As for gamma itself, that's not working either; you can test it with a tool
> that will create a color profile by applying a new VCGT table, please look
> at [1] if you need tools.
> 
> We can confirm that color correction works on at least MT8192 (colord), so
> it's MT8195 at fault.
> 
> [1]: https://github.com/zb3/gnome-gamma-tool
> 

Nevermind. I've actually fixed this code and refactored it a bit as well.

I'll push my own version soon. No action required.

Regards,
Angelo


