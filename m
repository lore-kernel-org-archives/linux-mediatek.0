Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AE2606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RHDWwAUj;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qOWDJIyK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a/73MrPa83q5oAyGtHK9/LKyewHpBJcuxNmYG+P39mI=; b=RHDWwAUja+QtiX
	L0Tfol8qAp1oYIzC0FluHxjSleyG2qZ5YhWPesfG4TXOi29bBFAtnzk0uoR0rV8INhmM8eIHuS5YM
	tWMie+H65IFvpMg4DX6aHFW6p2o8+To3OMvqBixbnJdVRqtKiuDirJ8VKpnZfAYfHVR7uSPCX5X69
	rPoEmGXTvvtXy+JQepvRzEgbaX7aYw6Rk38Jt0paQc7DR8E0lM+N6H64U4lHUE5iQLGXFHeuzeXiB
	X047lMpFKeHDHSv/HuVlHur/b7Qw0CeEf1+bRbZEuS4Qowqoc5QbSmMDe7NJ6FpQFUxfN8F9kDg7H
	grLdnTIcoD+XfGnBz5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHtg-00000005WT7-1Owf;
	Tue, 17 Nov 2026 12:02:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHs0-00000005WND-2aTT;
	Tue, 17 Nov 2026 12:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916862;
	bh=yr19dYIzWevwtOPD6EuLHrVZjpQTApuyfHArd4dpnvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOWDJIyKzkSw3hMEhIDFXEn5vHffFFfPv4ZOjxaEA6nTLU1rjmB/e/k3uFLhjvJ45
	 q32xTUrOt6qktXXc7q9uq2Mx257xUdwjbdfHRrSCd7T54Hcrq4qoTF4tF6Eg900vYL
	 cLfsRy4C9VVNzzpB3DdSd2a6rwxYAJQqUq9yBCA3zXjbAMYjaZWrCQRzxqHaexxONI
	 hJwJPxoqogcWYXCcRWPcEYIiCSXPQbASyrwshcMrkUDvjmbBSefkcNYvzXhMHpPUvI
	 X5vQMxWmFeeT6mWG2apGVXTptt/KClBW9jiQAwPa2KF6m8rPeby/osr30UclnasK8E
	 NolSjC4ZjDD9w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CAA2C17E0406;
	Tue, 17 Nov 2026 13:01:01 +0100 (CET)
Message-ID: <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
Date: Tue, 17 Nov 2026 13:01:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261117113402.728183-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117113402.728183-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_040104_855975_3E969AED 
X-CRM114-Status: GOOD (  10.21  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 12:33, Luca Leonardo Scorcia wrote:
> Some display blocks can be used to define multiple-output pipelines.
> The current code uses mtk_mmsys_update_bits to clear the mask bits and
> set the desired output block bit when initializing or disconnecting a
> pipeline. This breaks multiple output pipelines (only the last one set
> produces output).
> 
> Fix this by using the block bit alone as mask for multiple output route
> components.
> 
> Also address some unfortunate copy and paste errors in routes between
> OVL<->WDMA0, DITHER0<->UFOE and DITHER0<->WDMA0.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

This misses a Fixes tag.

Please add the relevant one and resend.

Thanks,
Angelo

