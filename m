Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D6AC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZFQzENClsrgt0I3GWk9a5GN6rB6OftQEg3nI0pnYao=; b=WmPfamWRi8tTx+jxJY9GXibr2D
	BKNp7EuHlwWj1MsVpiHJ5nu31KYc2tbL9uqHIC5pBj645FbpaxUxJRUSSSASn/b4SqnXL3ao5JP1m
	7zvmTFz0XXe3LY8r5uEwJt0Q3Oy/bI7zgmnPdOtXeq3FH02ZuIp4rvG6Oo/oST4dqYobcWTajuobJ
	stFn7ntTAWQQET0YlKsGNRA7iotyhHKaW2mEezttZazZU0hf69NLkd6rj2TP4rOXJGp/pDKV+bQPB
	30i1ARQ2biRip9evX4jqR82I30kd9c4coBxirS9kUfU0GdCzucZanKgwe/vYo9ZiOA62E9XWIfna1
	yDiYXz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDb-00000008NWu-0ArL;
	Mon, 18 Mar 2024 11:31:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6T-000000087Qj-0Ne4;
	Mon, 18 Mar 2024 10:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tZFQzENClsrgt0I3GWk9a5GN6rB6OftQEg3nI0pnYao=; b=AZh2/FcKkiYmh0QSu6t/roep3i
	8pIoqgmFclzm/V6jMLIaYKh/opG/2F0ScmYLWHhyfoqV/LUylhXYLNk/wnZ6nFbVaturJZnj1kFBH
	NbUnGrMPgMjpHVNxZEjyNDKxjdtXfis9ktUFAxTMn9yH0vC6zIaXqHhTUk8/gEpITyJ1hxeLXTh5R
	e+q1HO8SnyuJ2zTG7ReCNGuEoeDA+q7GeVUAiR1qrMhrqCkmpMXhAaCdPzlooI8F1cJWvkUsojHeB
	LmyWOKjkZ7C2kZUr1D26zcbZISCtbGjUjo263YmtIKVrFdA4PrDjt/+DhFzSvyoZJ8XDtwh4FBmf2
	b3IfnHMA==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6L-0000000CZt3-2wFu;
	Mon, 18 Mar 2024 10:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757216;
	bh=m0pDcBwwC4vZIub9JwwCc5l2BmB8htEdkn9ngNhOfU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=40g/k9f2Ix1MzHzA4WReefE4pxXvdqrUC+xt46InFoq+rVF7jfiShisVoDuz9rAxl
	 qI52feKqPoBw5sfX8Nw254Q+ECXcJVa5NdUrRFDVmqTv0swdnAB+x7IkT2s9cyXRw9
	 oZvNJVyHKhdr65TYrtKroqJLZSuZuZw02Nm5/3Nh61r5DbigmI4wVry0u1GxUJL+eN
	 31CZ3P0sr2SOV+627Uv1kS9qAjXZeRQMBFhiFBAwjNpzQ8NJy7mDq3PRy1HLjRpHDf
	 dK5V0m/EoTUC9czqbjoYvJ9ti+4KzvP+R2WwXq3n9z2aAkA9661yHOHShj/40vLEmY
	 0iNGr6BDTIozw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0EA98378205B;
	Mon, 18 Mar 2024 10:20:16 +0000 (UTC)
Message-ID: <8e231a62-15d1-4b08-9c9b-340d30ab7630@collabora.com>
Date: Mon, 18 Mar 2024 11:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] mips: dts: ralink: mt7621: reorder ethernet node
 attributes and kids
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
 <20240316045442.31469-12-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-12-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102021_163118_567E5A58 
X-CRM114-Status: UNSURE (   6.02  )
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
> Rearrange attributes and descendents declared under the
> ethernet node, recursively, to follow the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



