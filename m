Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788CFC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+IRAsXkhLYVMGg/XjtqK+wPK4KtL8kR/AFbLrm5D6A=; b=Lek4zR+V+Z8guJvlO5zULBgz29
	aLj3ytwr9aIizsbO5sMw0yDa6NbGq7+3gYQIXJoJ3XgPgbuiEJBsiZQc4Dam299/mn5W4yqVmiICz
	fMraE+tbPdZ9tBjI8AnR0ztVpvUURV2JHVn7BiNfnrZf5oLlRHsayh+IfabXMy+CM6+ArzpQtIN9K
	3ZqOd2r9XibtSYGxmyj2Sk1l7ijNR65vfT2fNuVz/D9ZYqgm8lybGzGR0UpBUkrxr6ouXy/AKNeRz
	RLfUYxDOAO70SWLq8GBSHSsB3HDvVCuvCtCrCBW4Rbfu4FYWThTqbhZM2R5Q51zjC2ACDguii605Q
	kR8hRP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8IS-0000000DKxv-0Dpt;
	Fri, 28 Jun 2024 09:53:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8II-0000000DKtx-0I16;
	Fri, 28 Jun 2024 09:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719568404;
	bh=GGp5avNm3U2GqffjO4bNSxJafft+tmU4w7edWSFEU2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cM5awahq6mIF+K13HJdN9XL1+2kZZsHAbkf18xus3VFXovKqZDYuK1IOYpFGSLkw9
	 SUA7K2F72QMaCTK2/8WBvgi4qEfUlnNcaYT9RonYy3PFCFJW7+d3VsK0wugton9uFa
	 Cgz5Xj+JIlHE2cR4J4TIIH72zvI31uhWE+G2bpjsXOW672PRn9wrKQKf36lF8KWkK7
	 trYTMPONqfUO0oOQ7sdgvtXY/UaYtSTolM/QD7rEISkDDclno68gNGCQLawTqNcGuj
	 fYlEgLBwCLDlfVuVYlIeJXPG1o96ebEHMpX++wbCq5faK+UW/EEL1lnc6kdPa9z/tU
	 Jw3/EsMJE3xwQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15F853781115;
	Fri, 28 Jun 2024 09:53:24 +0000 (UTC)
Message-ID: <b50df7c0-1005-4e90-a518-6abee33e7539@collabora.com>
Date: Fri, 28 Jun 2024 11:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm memory
 if missing
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_025326_256673_4829A328 
X-CRM114-Status: GOOD (  10.47  )
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

Il 27/06/24 23:20, Nícolas F. R. A. Prado ha scritto:
> The current code doesn't check whether platform_get_resource_byname()
> succeeded to get the l1tcm memory, which is optional, before attempting
> to map it. This results in the following error message when it is
> missing:
> 
>    mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
> 
> Add a check so that the remapping is only attempted if the memory region
> exists. This also allows to simplify the logic handling failure to
> remap, since a failure then is always a failure.
> 
> Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



