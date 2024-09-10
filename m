Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F189BECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2raA0lV/pUkBYaoJm1OGaXhIA0iskFSmpugVVHAgAXc=; b=YBq0AYBbw1d4p3okaewTZHUgPC
	6J4T8OFhTsnUqjEBWwh6UfblbDxrVkOjRy4vFPgkhkmW9IwkV14HRBGZttkUuB6CzYtx0Z1pqAKRt
	l1+nai7vscZOeEs/9zq+Iq7IC5tsz4umRznPokGXV4IH+q4rXQEJ/y8NJlrTUMD0IZxgxFnyE7QbO
	nnqlmTq9JydVs1o+AuuofzvAoUYsz2x322H8yP1OBIOnxxbHl4POsFpKZxp5CuQ6KZQLrmhC1oZjr
	eheTL655bTIOb9n93UGtTrwrhfdNVyhcXHGnOOQ9GBViygyznOlSQAXo8dCdgWeFQiVtqV2iHGyN8
	PUW/g7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwp5-00000004w2g-2LZN;
	Tue, 10 Sep 2024 09:06:07 +0000
Received: from a7-49.smtp-out.eu-west-1.amazonses.com ([54.240.7.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwof-00000004vvc-1WoV;
	Tue, 10 Sep 2024 09:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959137;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=e4E2QhibonUrb1as7MzSa4GR+pgL2He6HwaENBXi7to=;
	b=fc6+luku6MrEhrDUHytMjT4jSVkMAo5tyKr9F5VdtIWuegF2xO/n2RUrUzEziERJ
	W0I6OM6WAd5wcwKpqzkt8m9BVYxOsfqgrPHetjVgp9nlWN4Glu6DCjtDwB9C61IvGKd
	kO9mdOiBGww6ppt4HQdSquJ/1vzb7ih8GabjhrLDGtRlNB7JmQHvK8z+vBY2EvRImdp
	WxAgAgpFapf7gl9GOQDHVo3bhWy44uoS3teNdDKxTvHzR9zjZQcpNJy1XhGOUWe5L8h
	vVTkH4jIRi5gqq7EW5IJ+7K5nJspazyjsiQI1leh4NQZvr3JhDf4qkyDZshLa8ByDnH
	7tHsJEdHzg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959137;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=e4E2QhibonUrb1as7MzSa4GR+pgL2He6HwaENBXi7to=;
	b=BJYPBWuF8Cw+HNGvI2d33pqsPo7cTFTfIb7Q74Ywmhy4h19IeWWantrd/4LlKuGx
	JYVXmrw4cYsQuQWcXJpxSaeA4ivgLmgoyE0xfMu3nau0I3BC6+as5hP4IfvYVBQ069O
	k+YWbQX9ggfKZxsWkoguYpGAo8iVe1Ul75CtAKQs=
Message-ID: <01020191db2e68dd-f46a7a3b-61d3-4f99-a449-5c9b86d667cb-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:05:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PCI: mediatek-gen3: Support limiting link speed and
 width
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
References: <20240806094816.92137-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240806094816.92137-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_020541_583369_1BCE032B 
X-CRM114-Status: GOOD (  11.92  )
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

Il 06/08/24 11:48, AngeloGioacchino Del Regno ha scritto:
> This series adds support for limiting the PCI-Express link speed
> (or PCIe gen restriction) and link width (number of lanes) in the
> pcie-mediatek-gen3 driver.
> 
> The maximum supported pcie gen is read from the controller itself,
> so defining a max gen through platform data for each SoC is avoided.
> 
> Both are done by adding support for the standard devicetree properties
> `max-link-speed` and `num-lanes`.
> 
> Please note that changing the bindings is not required, as those do
> already allow specifying those properties for this controller.
> 
> AngeloGioacchino Del Regno (2):
>    PCI: mediatek-gen3: Add support for setting max-link-speed limit
>    PCI: mediatek-gen3: Add support for restricting link width
> 
>   drivers/pci/controller/pcie-mediatek-gen3.c | 76 ++++++++++++++++++++-
>   1 file changed, 74 insertions(+), 2 deletions(-)
> 

Gentle ping for this series.

Thanks,
Angelo.

