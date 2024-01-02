Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A9EC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPI1VTR2u9iEdOxWjJDomVP3A9dSuq1VsOrwS0zSRpU=; b=vFll4O5K1nDwKyKAra94MuoW4E
	2h56BRY0twaqxrNAYUB9VTVGqIMRBvABNZNDm5gK1KzYSD0iA7Am6AieW+gXeaZpT6Tx8MYcEEmFH
	J1JtHPU6/aPmzyDSz5PLxePrEUfGIuZD4q2beRiY2GIcCxwFlTAzwDc82xCIwqeVRHnwCWa1Suoq0
	gu25GsYB2H8BsbNF+rPkHW2ax9lQEPqG//IPIVpM6rUqGi1eDEElrGsyz5gdHORaIUY7L4AfsXuI8
	YjF7BHdB86+jynJgvNRvaNNyK4yMBIl52PO1QqCc4hwDW6jOWy4BlMMgrzxSkIywtQnAr8l53xnZl
	lU2Wd74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKaqn-007QQf-0j;
	Tue, 02 Jan 2024 09:14:17 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKaqj-007QO5-1g;
	Tue, 02 Jan 2024 09:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704186852;
	bh=qRzFsSKIk+pQYV2JVY2v2RiueDVjYFpJ/1HbxTuhDO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PRlzdS1MUaxKxCe1Y4LfdpRXHeeZih4kmqaYSu6J8e0Ha4PDrUaU0fjssSTLPHCmz
	 uilPt+jn6U5kpZMaEMP+97+Oqg58sle1Rx9ZpQ6XZvhp7V/LN0qOVI2mnvNSCaAgVA
	 gxrYO006iI1V7GZVnQJnpNgXUc07lgrvw/LU6V2c7MYoNM7Raq+in4Zf3oruHodm2P
	 ZKPL6MyqqXalf6Bzhod18UmzSxt7tBToZo7iL1SOi7x4MnzeaYCDTLKG7F+63IJQKJ
	 Gi1nvb9mg4IVtM7WiyUeMTkztcVNAZNB1g7fBihLLlHHUl6viZ3JNXcqxIQCllUgZ/
	 O6Z9AeekhpjYA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 581C637804B2;
	Tue,  2 Jan 2024 09:14:11 +0000 (UTC)
Message-ID: <19a1c7f0-b202-4d7c-ab0a-c64f16929e19@collabora.com>
Date: Tue, 2 Jan 2024 10:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dt-bindings: media: mtk-vcodec-encoder: add
 compatible for mt8186
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
 <20231228113245.174706-5-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231228113245.174706-5-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_011413_699719_FA6EA651 
X-CRM114-Status: UNSURE (   7.43  )
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

Il 28/12/23 12:32, Eugen Hristev ha scritto:
> Add compatible for the mt8186 encoder which currently works in the same
> way as mt8183.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



