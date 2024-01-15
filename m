Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65414C3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 03:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+F3Qza7mnrNNprDYg3j48g6YC78svGZWDg6nZj/gQ8=; b=neGX3rPXy3Y3oPjLVcOwR+Sby3
	9IG8YNZATiytGQ6hotn2vMXHnru025CZCM3p6cOrPQV8xu9xBtGmM9PDbUj4dhNQYiIEhehayEmRG
	+LshT+6W0kLXt5jlRSrY6OdU5cchrzK4EwomHxVCuYAjJdLSW9PuEVS0Yht7jN7bEb/MflUqLCgVd
	fonFqYGqndzxntqORhAKwdcxqaIfgSaBunOQhPpTIJ60IYevH2AGHTubwoqiF/T4fMHsajktVfCkh
	RO3ehKHk0Mig3km4GPv91OllqfXMwD0KlDT4oSVque6SJoLSq1HqazoJLKWWge1HyRNnYVypCA3kA
	eyRvydpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPE6E-007ivD-0L;
	Mon, 15 Jan 2024 03:57:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPE69-007iuJ-2A;
	Mon, 15 Jan 2024 03:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705291029;
	bh=gE9f3UIrT8NLh3MU9oG58RY7ipRU2KmEb7/90wbvBuM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQQqkaVZ7ckQeiFkbhaMfASgeJu9n1eMACAVZLlzjlLu+I074ad0rVl022oIIWkWW
	 ks+B2pXyuEw833mkdN8LMhKatddZh+OZZ975lwtHYseUcqkR7/U6k8amMAbH6FKiWo
	 UJAWN/gEe/W4imsClXpjRqLFzFyIKZ/2VBLQos34W8nXkXPSnopP9gN/Seh5Rp/pxH
	 X+lC3Cyzr1sugmM/9SC8vV4CgIKmiX+n2hUDEQVQYSB431t1C4+MM+5fjKW+8HUjhT
	 KW0Q/u2PoYFLDRYl9gNf0mWtBJbSfLCRdm10MsUBsT8f2SebpDBxcnSdopCdi4OTZB
	 IVhhRGUSGHQmQ==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 77B0337811D0;
	Mon, 15 Jan 2024 03:57:07 +0000 (UTC)
Message-ID: <94beea2a-c4b9-4241-bbfe-8c57ca50fbf7@collabora.com>
Date: Mon, 15 Jan 2024 05:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max
 ioomus count
To: Rob Herring <robh@kernel.org>
Cc: bin.liu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
 <20240109032731.GA2578937-robh@kernel.org>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240109032731.GA2578937-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_195717_882236_5E2153EE 
X-CRM114-Status: GOOD (  12.05  )
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

On 1/9/24 05:27, Rob Herring wrote:
> On Wed, Dec 27, 2023 at 03:08:11PM +0200, Eugen Hristev wrote:
>> MT8186 has 4 iommus in the list, to cope with this situation, adjust
>> the maxItems to 4 (instead of previous 2).
>> Add also minItems as 1 since iommus are mandatory, to avoid warning
>> on the example.
> 
> maxItems alone means minItems is the same size. If IOMMU is required, 
> then 'required' is where that is defined. Is there a case where 1 IOMMU 
> is valid? If so, what h/w has this case.
> 
> Rob
> 
> 

Hello Rob,

Without setting a minItems , the example in the binding fails, because it has just
2 items, while the maxItems is now 4.
I set minItems as 1 to avoid restricting any kind of hardware to have at least 2
items, but if you claim that previously, maxItems=minItems=2 , I will change this to 2.
Is that fine with you ?

Eugen

