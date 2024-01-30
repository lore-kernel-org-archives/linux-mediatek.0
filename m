Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AABC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pI241snMW4Zt9C5WKJT+xqAduaGrN0wrx9xWKjcdq4=; b=A5YqWwBAAX7C8szPNXFA/jnRzd
	pTjVoWkknUQBLYCT+jZjdhL5KQCcOH3bDSFqp/2HV9hTBlNsrGMCJpuC/LSNK3yFHjP3MvcMWziRn
	r6gCRv3cs1hdC81Ek3ftp8ufNBHdgn4KckyLaFIC/LKzkUKi0CSCp0MzI0FDJu3FCeHzJAqc5w+cX
	tklUIgBFryT3rfN4Z6V9Q79ulzmWKSRBBkT9+Ta31TQSETnilZeUxoQy5UlJ+g1KIgEraATMW8Ucw
	9eFD1AFibxhvkvrzqHCvuaraIi+oMjUn80Sm2D9b1CGSZrr3yfUl3BwGHq2c0RDEEsT3eceQfKCDB
	uEvPSAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmAe-0000000GP9h-23z2;
	Tue, 30 Jan 2024 11:20:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmAb-0000000GP8l-0FbO;
	Tue, 30 Jan 2024 11:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706613647;
	bh=nOtEkQkKnVv5uTMuTYFwuhOtca6YIW7z2/cNVod3Uzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CEOYJzCsf0kVz3Ts+/SIpv0NuvvZzXyl9nTzvVIkDBqfZHtnSShINYyvmUCdhTcEi
	 d8v4EhxpDdgdACJ5kxNwyFvvXhvR/m1ofeNvP8uAUaaptw/F2DlpVoTDs1bMYOk/LP
	 aPOlw7bAwbNb3Hx1si3ZUHrULL9BYiWQb1PcccZjqW6J1MaIr7j0Rd1qItHhZlSnbK
	 +d+73z5rxqX4DqBeYrtl/xLDxzQJPeSjh5KFYVSL8A14wzZpLEY8qrr+UsuloObDg+
	 Huxrt3h2F464/Lbi8FKrjW1xjkGzBP8237yAzFnli1VVfV2qWj9sBpJk84sm8y+ocC
	 i48k7fvvMdVXg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 674023782068;
	Tue, 30 Jan 2024 11:20:47 +0000 (UTC)
Message-ID: <068e98bb-c4c3-4c50-83b3-a6c999abc1ff@collabora.com>
Date: Tue, 30 Jan 2024 12:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: mediatek: mtk-socinfo: Clean up NVMEM cell read
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 William-tw Lin <william-tw.lin@mediatek.com>
References: <20240130095656.3712469-1-wenst@chromium.org>
 <20240130095656.3712469-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240130095656.3712469-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_032049_258697_D717C84A 
X-CRM114-Status: GOOD (  15.08  )
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

Il 30/01/24 10:56, Chen-Yu Tsai ha scritto:
> The mtk-socinfo grabs the NVMEM device devm_nvmem_device_get(), but then
> proceeds to put the device directly with nvmem_device_put() if the read
> is successful. If the device fails to probe and goes through the devres
> release path, the device would be put a second time, triggering a
> use-after-free error from KASAN.
> 
> Fix this by dropping the devres part. Since the NVMEM cell data is read
> only once, there is no need to keep the reference around.
> 
> While at it, clean up the function to directly reference the NVMEM
> device node and use that to find the NVMEM device, instead of finding it
> by name, which is more fragile. The cell node is always a direct child
> of the NVMEM device node, courtesy of the legacy NVMEM cell layout. Thus
> of_get_child_by_name() is a better way of finding the cell. Last,
> correctly put the device node once its use is over.
> 
> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



