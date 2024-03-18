Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F01BC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wuvqe+EQmkH7thewjCCrrcPqgMjsS1LOhuBSbwZpE48=; b=TTm388OirO0SIzjfAfmo0vbr0X
	8Sbh1hUJxDHe2iTICpizZ+tceA5BXSlZclN0Bq/V1P4kDqG+ppAj5fUK/uFKLoFGSoXKVSEMCJ55R
	xfxhWz3UV4jezUxXY0HQn0YI6uOLNAcsR4LRmaE0hWdC1Q0JetWO/KqxoNugB49akqbRbxr/06/F/
	KL+lQOyUIYf+L93etx/uNs+mKt9Ucm5VZW/UZKD1TJVPI2WJaAavaK9hWYylJ6FSwTBEqH5SA9gn8
	IZ8U5/8v51Vq5k828GZKcI7vesZ2qqzxfA/k/1JlcEQV6YRf0ODJuREAG1HTaIYw1DPJtrXLPQMJ4
	1TCMZL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEb-00000008OJ5-1Iq4;
	Mon, 18 Mar 2024 11:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6Z-000000087So-1hm2;
	Mon, 18 Mar 2024 10:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wuvqe+EQmkH7thewjCCrrcPqgMjsS1LOhuBSbwZpE48=; b=Co/BNXoY6uR1gKNilXQw6TeAHo
	vQo3gx3GnC3dsOmABPDxa4uQHIjzSu1Qu0ypsuOuE+Rki8Wj0cFZMzQNWNjdtuDAnPkFe6NUnKtbH
	KtQSrLECJ3LVLkyqU1n57d67rtn/5vUR/HtzmP6GfPCQtJr/ZinQluy50cUF4okDDVA5PVYyYum48
	aPBB8r+NbMi+rbtypSuzGahY6UPL/UK+TyGcM9P/2KhmIYnbKnbizkHi+bnh5FAm+8l7ivgfYTNbT
	J6j+0uvmiyJROaVzp6y10UVh9lfERuL0S7oJVnbWHRKYmQr3e1lLkvyavPCrupAezbylng9jwdlqc
	QGdbMMxA==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6W-0000000CZwj-14lN;
	Mon, 18 Mar 2024 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757227;
	bh=LR8yRNu1cX8M5FsRIEy0bPZmVjKgO3SpaqgcXr+/d/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKoeEQaEXlBdtmsPSeSHDWqTSMIV3b0Vw3VdhZJE2pyb8YgkYgI9cb4ve7NiEgicJ
	 0D25awGb4Av/R2tGs1OZeA36t8ZD/ek+eAx4VYXkZl56nlzm03OzaK1nONvKuPYu34
	 +VOeP8UVhC9/l3E1IF+QXhSRcZxuqpoqFhzgamD6G2cmrgemNPFtZTI3paxqte9AJu
	 aiCoV2oF1lO35ZCBP2KxJGtpk7R/lixRpV//wZvft9AGTm5VYaXJz7ws1g7agKDuGU
	 +vC9VK4nI5OnhlC0qWFv0uVHvV4Bpw56aSV90OU83h/ppph7K9EXxv0RBEjLCIsX+Y
	 YRYfeeKizvhRQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9CF4A378203E;
	Mon, 18 Mar 2024 10:20:26 +0000 (UTC)
Message-ID: <1b08cf60-8778-46f9-9f8c-b07c1df2ef7e@collabora.com>
Date: Mon, 18 Mar 2024 11:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] mips: dts: ralink: mt7621: reorder cpuintc node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-3-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-3-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102028_668605_11E0AA0B 
X-CRM114-Status: UNSURE (   5.66  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Reorder the CPU Interrupt Controller node's attributes to follow
> what the DTS Coding Style dictates.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



