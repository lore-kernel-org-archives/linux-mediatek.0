Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA0C48260
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgHkgyjuCezSj8cGpQq/HdzHJ9rWTpnV6v0o51f1oJo=; b=EwMuLl4w7ksvij
	baDhTrddYevP9X5Svw4/+ttoGVN09M7is5NraWSTGV/6G7FlNuomQPb6HLpEkvG7ira4JvtZd0Dli
	pOWoWhgPvL3ASvIxDZdjOYChQfe/0+jaRlB5A1lTXksvC6iqeUDeixGNzrgZCq+Hslq9iMHhquFcA
	yogb0/LU2V4dSmyYXmfkuXdNiLZUPUZeMejsdkFgI3lo8ei8BAt1Oc4qBdjj1DJJldHUMQ+kOXJ+9
	jlHd+s6o+/abaF3UgEjx4IuoYDH0ayG/vAwdJzC/5ycTM9y921vOerG+JnGJMtLaDzcDtCrscDbsG
	yXkt994rDGWTa1oPmk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzm5-00000009lGD-35ix;
	Mon, 19 Feb 2024 09:17:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzlu-00000009lCl-3nfP;
	Mon, 19 Feb 2024 09:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708334227;
	bh=ChNaRha/WMNDl/yhYHIi8rH1Wcspnu1Kp9xRdQK9PnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PAH4lnRsy3dA4rL5zx3OMxfWsSZz36xjHm3UoX5n4YLT5Rb7S9OT1CO1/lVmZDbWS
	 H9Zys0ZlNoW8AKV69si846A+9hb+flVD60pEYD0DL92rCB7M1oUiAgj2nNl2xPp7yu
	 TgViIjHbMifRXMT6Qy0YMTjnRoG5QYGnjukFLOUUrjtjv+nKf5HtcwDu/ynoLWZAO2
	 epOX8xAZ11H9rddcZpkpa2abnfDinrLpANA1CojDcF/fzUfUh0DosP6ifbrwrYGvr/
	 /GgND1BAh8pnY4EHEw/rz9GJy0o25oOkwRASPzrjTLUH0IOYbBXiRNK5CbF7a/CD+T
	 CciKoshaVPPmQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ACDFE37820C0;
	Mon, 19 Feb 2024 09:17:06 +0000 (UTC)
Message-ID: <2795a056-eac2-491b-bcb5-52bf4a331c07@collabora.com>
Date: Mon, 19 Feb 2024 10:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: {mt7622,mt7986}: add port@5 as CPU port
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230918074938.79796-1-arinc.unal@arinc9.com>
 <5d582382-9a31-4a95-bc81-01d99dde0a6e@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5d582382-9a31-4a95-bc81-01d99dde0a6e@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_011711_268285_CE3B58DE 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: devicetree@vger.kernel.org, mithat.guner@xeront.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/24 11:52, Arınç ÜNAL ha scritto:
> Matthias, please apply this patch.
> 
> Arınç

Please split this by SoC and resend as two patches.

If you can resend fast enough, I can apply the patches for 6.9.

Cheers,
Angelo

