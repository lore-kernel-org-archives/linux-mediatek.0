Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B386C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx9i0bD7SSs9uEyO7fpFzfhtRLDkDTesKuRvIvpOtME=; b=e4Q/2cGdBOZws9syvZCHFjAWYt
	TZczOy9n9b64OMfvM5cNEt6u5a8GeOQ9f4O1ebG9MeOVRcjgKkmzitPo6oMdiL0Pf+tmUgm+Uwntu
	S7V74LAuCP3r4B2DlA76zsaoaH+NFC+cckUmlqDeBfWEZMpkmerYmeAyl3piDxn6nDyH9G69bWuFB
	MSBLuccblLF1fJMptzxRnfOx69i28uRVEL52gOT2cKtuwj+zJOZ084Ic6XUV6ihFYnzUeqFl6NqpY
	pOx2MtcwRH4bTNsSAxVtV/X+k70AlE9T7syIWx9M/cMOkbrnMWtxsIQ3QOFT01veL52GW9dB5snTM
	p3BPznJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmU3-00000009yhN-3i7O;
	Thu, 27 Jun 2024 10:36:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmTY-00000009yVg-14QD;
	Thu, 27 Jun 2024 10:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vx9i0bD7SSs9uEyO7fpFzfhtRLDkDTesKuRvIvpOtME=; b=KgkiOyk9UYT4L1ry5QKXt2rmRP
	7Q8OTxRclrikff7bwgAtAznuvk/Y9BlDCVGzIH8FHgla/fwuMJSwrrNchp71WsZtBleKwNv+IKAll
	JuJsbsBO4gM/8kRKKpsX6+qyhJhpUSwWKmpoOBFaT7a4JpL99zKB7Q7rgaSo2gvMNriiAqc9S/mbS
	esV44F/pi93lR1s6kHf0Gykyeu1KjLzc1u5nE//PQpoN7zJcErGCaHhsbRyqFYbBNtVjJeKtMN8em
	dSOI/BMGtf00GUI2RhFfLROS8oC3ilxZVl7Cx5+izTgK+wAfF3KsVY/AAq1gocRybxsa/A1pGrCcb
	dKwFn/Aw==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMldr-00000008oRU-0kU3;
	Thu, 27 Jun 2024 09:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719481326;
	bh=SHwLopLsuJIvSoRHrncD2LhBaww5jF0LXUvXBdkPh1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3E0lvpcuKE3e8QWwPBbxCTgvq4PKGcEBnxcp5hOp+6ajKdBlRNPdDaoS3hHrqhDQ7
	 nzW/fNe8tpWt/LIzd6UbZ1XNDoA69KO+gO/J9V67FivqK1L36aWuw3VQeRNFRd5dAZ
	 p8NIH49Zi2UUhYPUSIKOTQtlHvxvrFLeFqHry0gBriPY+9tQKcNEjWoYL2q277JNgA
	 vDMTW+dkhAS+McRw/WDHQA5VJme406aOrY74HP6hC+Xoxtr9ZA/1Mb8rpIm9Pjlfbo
	 fTYi4vMa+0Es7GH9cZZsfZkvnn14hBXyPB7ayfQCtoJLLlLNUPedma4V+iNOUp3gs9
	 X3VFPzVcRWnhg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12E3E37821B3;
	Thu, 27 Jun 2024 09:42:06 +0000 (UTC)
Message-ID: <512e50d7-50ae-411c-bccd-656a74d740a3@collabora.com>
Date: Thu, 27 Jun 2024 11:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data
 structure
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 kw@linux.com, robh@kernel.org, bhelgaas@google.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, nbd@nbd.name, dd@embedd.com, upstream@airoha.com
References: <cover.1719475568.git.lorenzo@kernel.org>
 <62c00de24f702260ba0da93008277e95f471a2ab.1719475568.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <62c00de24f702260ba0da93008277e95f471a2ab.1719475568.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104226_705848_CC37D5CC 
X-CRM114-Status: UNSURE (   4.84  )
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

Il 27/06/24 10:12, Lorenzo Bianconi ha scritto:
> Introduce mtk_gen3_pcie_pdata data structure in order to define
> multiple callbacks for each supported SoC. This is a preliminary
> patch to introduce EN7581 PCIe support.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



