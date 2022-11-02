Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D9C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8kiC2Fnz610Izbk5JEjEAUzp28eW34GIPDHHy9yqng=; b=Fa5MSbkeqRrWmBzAPs3CB9UUm8
	2vd0KwmjJBeQSMr0vAM5UI+/T4qQnyZRORsCuyF3bvNwi8pSpTUgeds40cdxJMabePFdkVf4O5BI0
	w1jyCO3mCxMVxcp2tNtg9Vtp/r0EQNdGD4HnmHWlscL0/IsQD9ihhgU05wPoZBSlVC2NX84QCEO8e
	FQPKt5qD29xxk4BAbjVRz1ZY+BfP4o1QMlfWVLaAVLfDcUHKk/Ma3FgIF3hEo+foW3YQiSQVrJcAf
	m2P11DagZhwfSILgJyyM+pHc2W1k2XRm3vxQUePhh/zlbrnt6Tgx1HU0omv9IjStTwo2OUbiVlDV7
	MUwd1pEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9XM-009GYK-RR; Wed, 02 Nov 2022 08:55:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9XB-009GNx-GY; Wed, 02 Nov 2022 08:55:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E74D36602929;
	Wed,  2 Nov 2022 08:55:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667379336;
	bh=96/vIlCR0pm8B4E0/1/a7fElFLkubeJEBzd4uuxKC64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ojzgURK3lzEbgIcNB+4xc2oHgrl8FATrqeLB3BqnJR0WjLJmk/i9C2wanD5wNgTfS
	 P03Zcuqmog9HdYZhQupYHuIsKKcwbJo4BHH1tzXhuA/p8Bj1iknx82U15P/1jbqxC+
	 G4QypHYxK6hmmp2Gdy145aa398eT35o9a9sdyXgVBPlKEefkoIdMsdqWRDVMx6nlNn
	 AV6trM/NNvAxOCEYHwl6HNw6yexR01ZA+aqY2gR0KFhZoqnmLXvtfiTWNFXKXdk0FY
	 4dnmoavItEYUkw6InryI7EmkA04bSdzkS0WZd4m1Y6PQ3qtF2ykmIsHTYrTUmLT8PW
	 VFc34eP0xLuwA==
Message-ID: <32627314-4971-7eea-8007-1797707e7969@collabora.com>
Date: Wed, 2 Nov 2022 09:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] kbuild: Add DTB_FILES variable for dtbs_check
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Masahiro Yamada <masahiroy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221101220304.65715-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221101220304.65715-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_015541_841584_768737DC 
X-CRM114-Status: GOOD (  11.80  )
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

Il 01/11/22 23:03, Nícolas F. R. A. Prado ha scritto:
> Currently running dtbs_check compiles and runs the DT checker on all
> enabled devicetrees against all dt-bindings. This can take a long time,
> and is an unnecessary burden when just validating a new devicetree or
> changes in an existing one, with the dt-bindings unchanged.
> 
> Similarly to DT_SCHEMA_FILES for dt_binding_check, add a DTB_FILES
> variable that can be passed to the dtbs_check make command to restrict
> which devicetrees are validated.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



