Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0349BC54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EXvguhM5jpBPAfdLin7nnrt1knGpK1GgtYWc+LCDvM=; b=nW2UYyUqgHQmKzLLm1rvDqHEy+
	q9Kwl/08FZk2GcLrP+f1aurodIP4CpXjjeCZrd2QmD5DL/vLbLeyOVYci4yyWEPMNUS9CjHensZMr
	TMA5qSklJ1d5bbqc2CNI8LVT7Vi+746tNkHXtQ1Xs0l4rqYzP7dnfwyylt71h05NfP4zI24p5LEMi
	0oBbMJk13RPejsfaSOd7iyrBUjEWM8UeAYt791BIWgeDthag7eTf97aNNkoDt5LKh5O0kssAU6CZ7
	W0Wgtt9LuPxLFaxN/LL3sdwXKSua4BOMWOUvct7bA/4G+Iz8gYFlrGn2fcyQZ5p6KCdmv24OTS0Pr
	oWsIfxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nR-00000000Co3-2BKK;
	Fri, 15 Mar 2024 12:36:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nI-00000000Cim-46Vo;
	Fri, 15 Mar 2024 12:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710506170;
	bh=xrhjmaRRP7VwSVg5iaOTkc4zXHeCzBTS5s7lTKpzJW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=It9Y9O8i8MPGEaoM8mT3j5XEgKhF20RTurkqtQyECM8zjUoD1mYjs/3esg1SPGFUB
	 sPJ5h42z/CjPv/sW0Rbykgmt7fPxDqHq+jAk0lfaWWdMT3CpiOBREdLqF8Ou+tgquX
	 Ro9YK9+RTddXGqWW9kU+D3oy2k/pBz5ITBEY6nu5g4zzO3whDc08y0SIIVXWqb8pKU
	 iWQT++Irv3vKoDsFkjVu3WXGwKNA4NzKf3SVD3xRTVBL/IJmGKPmq2jsAJrR5+W+Ry
	 o+Xi1IDqH93uy7FLnYvPt4TRIX/l++yQnf9iokC9LqSTokhwDQaNtbN326ijMp/oor
	 C5dQ9In1fn+/A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5FEA037820CD;
	Fri, 15 Mar 2024 12:36:09 +0000 (UTC)
Message-ID: <8d18052f-ad0a-4396-bc66-10500dd6e41b@collabora.com>
Date: Fri, 15 Mar 2024 13:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8186-corsola: Update min
 voltage constraint for Vgpu
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20240315111621.2263159-1-treapking@chromium.org>
 <20240315111621.2263159-5-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240315111621.2263159-5-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_053617_181538_6A693A18 
X-CRM114-Status: UNSURE (   7.80  )
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

Il 15/03/24 12:16, Pin-yen Lin ha scritto:
> The requested voltage could be lower than the minimum voltage on the
> GPU OPP table when the MTK Smart Voltage Scaling (SVS) driver is
> enabled, so update the minimum voltage constraint from 600000 uV to
> 500000 uV as listed on the mt6366 datasheet.
> 
> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



