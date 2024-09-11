Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBFAEE4995
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpULMV82uYSheTPEckZtGjAjSC2UUU7DwciuPYa5uHg=; b=LrHoZSjYEBDISdlcYwiyx0Uxne
	3Upqk//om52lha0aYH1b0Ceoa1fvLCh8Wm6TrMp0SpmJC4Mu4Lnp2YGgqhtm2CZ0hPKPNpUlyC3/8
	9zxLwP2DFCPTqvM9pKoZgDtitnry/HC65MBPdX/XVb9ulXEkefeatCwmIpLvRfpaxRxD+QF1Q+GFQ
	4y6GjPTQldZNEnbcrgUhncAebR46bZ54kDMRE45blR/uZ/eiw0ZHSOa6jzmIxfmC83pCHG7PgkFYP
	rd+Tqb/yS1dsGxSEtZkSCG7Vu3TLROpVo+6LmvIN/ZE5F4oa6r2cGGJC/8trHlgVJd4wNZW8CWf9i
	eIuUdZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLXU-00000009IV1-0bft;
	Wed, 11 Sep 2024 11:29:36 +0000
Received: from a7-31.smtp-out.eu-west-1.amazonses.com ([54.240.7.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLTn-00000009Hgh-1J5e;
	Wed, 11 Sep 2024 11:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726053943;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ClJQQmMllX6exPeX1+6DYsZvUq0xm7fA8sKPr1Vr3Nc=;
	b=ODdPJDx/jLT17tOcmTCDctsItStRbKWp8X3MSQU7oVrdu7YFJ7prdqiVu7WAId1b
	xVtH+o4qIjOb/c67yc2G/aSvF+7nZIQcIE+Koc8n7boutJUqpzyDhNLNsJprKleQuVs
	DVQ9Pxy6/FUv4CpZ+spFIi/H22qlhrsKfCa7XTjRWFYq7dQRugRPYpQFPX0oBA8owYN
	Aaj2Oj5gXArb4fYtjykCFcksA9sZpEb95lCXI/4kMxk3ocRjuzuVq6bX+Fzq5gOzLY0
	fZJxj0j0ITXZ9xKCzMts7d9qMXepO2xhNJkKw5zFk28VxsiCkuVZBRIPFd2+HjUwjQT
	ul/1oabzOg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726053943;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=ClJQQmMllX6exPeX1+6DYsZvUq0xm7fA8sKPr1Vr3Nc=;
	b=k16cWy3X0L74jRDviwtgOVzvQsoPOP/SaGOHvWUu5MalRuJIoWjykKtaRJWPas0z
	4P9KBjl4JPNaNIVbs4tI9zpqB8WUgc2IraFXjIvyramjpddD1zLIFwscREfE3g5gQxE
	LVZat2W0hO5XuksMn6raClR2wZtZtIol3A7V77WI=
Message-ID: <01020191e0d508d9-18f9aef4-fecc-4486-a8c8-f41bd4784e13-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:25:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: mediatek: mt8188: Add socinfo nodes
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240911105131.4094027-1-fshao@chromium.org>
 <20240911105131.4094027-9-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911105131.4094027-9-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042547_523235_308DF255 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
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

Il 11/09/24 12:51, Fei Shao ha scritto:
> Add two socinfo efuse data nodes for the SoC information probing on
> MT8188.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


