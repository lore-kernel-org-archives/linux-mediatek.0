Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58351CD1284
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c40n/o6hgcvL0saB8/xE9nKL/S8WVbXm71U8p6V6d2Q=; b=hPt+X5myOq7qq4BGSLYtm98qYI
	IAvpGglOvbpXf8wsMSHKZnnqXv15B6OiOic8FXD8UXlvSDoqinehL3KfrTxqbZn3ZgRdErro/nrBr
	OhfXPQiL9ijIs28+gcnJeYavcHu+kwwt/6ALVVzm1Ma3iaLLBaW5SPfMQb7Gdc05iw9oQfgKQhrRE
	n0ZqTDCTiqjN6oOAMFJJEQjYxlR7qbpNmSbpATXz2PFF2nxuwXYvI2gLgifbevKn2fnt43mKWKDZs
	qSz9O5g1lbWkl2xglmr29Scx67wh2I8E6C3NefpF/FpetkyTtKMmkOyK69l7qwDPFHZMyqfNuUlwY
	NQ+8M8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSaK-00000008wZ2-12ux;
	Wed, 27 Mar 2024 12:40:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSaC-00000008wSW-1iV7;
	Wed, 27 Mar 2024 12:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711543238;
	bh=Go2MGwGVcRF8lUeW+BNK0qGYRxUUf5O+KQEFEsGmpP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LJVQ79+dK0efazRAGk2tpWGFlKyfQydaCTZTnv5YHDxy/JngESoyC3DVlCkdpQXZD
	 JJLYhQdzZV6KPvtPwHrc1ZoPDTK0nNOzteGPCnQMybFmkwVtb8P0cN/OUDipeeuwQ4
	 R7cOJ6wXMfII1T6Ci0eG21Tmme4cCsKJYY+53Xo1r1vkP4ZQvJZiWFUGCKEJc/XZ2G
	 6jkY3c4/nWfVLE4B6SUp235J5vtW9K4fcNTtadp1auYewSVRKH/P772pqCh/OQwSz6
	 4efTPUgFFtgIBP66D8ISaA3BnVskFORrWjuV6miyW258hEtMgF4gJuiOB3cKQcAvXV
	 vkPHoYJbmNSPw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 389D137811CD;
	Wed, 27 Mar 2024 12:40:38 +0000 (UTC)
Message-ID: <6860673c-927e-446b-98f7-feb9dcae2eb3@collabora.com>
Date: Wed, 27 Mar 2024 13:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: mediatek: Make sure IPI buffer fits in
 L2TCM
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
 tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-2-angelogioacchino.delregno@collabora.com>
 <ZfxRY475SKaRYVTj@p14s>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZfxRY475SKaRYVTj@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_054044_961929_BFF95225 
X-CRM114-Status: GOOD (  11.69  )
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

Il 21/03/24 16:25, Mathieu Poirier ha scritto:
> Good day,
> 
> On Thu, Mar 21, 2024 at 09:46:13AM +0100, AngeloGioacchino Del Regno wrote:
>> The IPI buffer location is read from the firmware that we load to the
>> System Companion Processor, and it's not granted that both the SRAM
>> (L2TCM) size that is defined in the devicetree node is large enough
>> for that, and while this is especially true for multi-core SCP, it's
>> still useful to check on single-core variants as well.
>>
>> Failing to perform this check may make this driver perform R/W
>> oeprations out of the L2TCM boundary, resulting (at best) in a
> 
> s/oeprations/operations
> 
> I will fix that when I apply the patch.
> 

Thanks for that.

Cheers,
Angelo



