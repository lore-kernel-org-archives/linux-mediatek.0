Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E0EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvw6SYgXj3lxnNWQPXbFKrEu8UADaBWbRn3JONKW/J0=; b=TtcXhS0eR+Ii0f0e19Tr2/p2vh
	D3UJ5FyFoHuHzGa/7c5s3oVc8QzD+1kDADQ/EIA2LgGVMv0JKPPKOoz8zkRE//CSyZtw0qvIrCNcL
	IWoh5JQJhEucqgcOVXoencN70kCyp+s2OT3azpbtNW3yOQreL+acswwX6SEAow6okiOiegeD/OFdD
	rbUvsng5W2Pye2c1Js+gvQVVBNOWzLmHkB8969TkRXd0KHuQEcuANVuETIiDRzU8p3AxdZpCvub2B
	eKWmBA1CfEJBlZ34/9ZPui7HkblkC5qJFDjFdTZh9qibzjaeUgUQdcFxJILYwiWjCsI3or4n1cikV
	nyz3mWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nqr-004nFT-1R;
	Wed, 07 Jun 2023 07:45:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nqo-004nDh-0N;
	Wed, 07 Jun 2023 07:45:03 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E05F96606EF8;
	Wed,  7 Jun 2023 08:44:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686123900;
	bh=qKBTThrWJPvkW3/ukkDh8Gpa+twvl1LzQgBuxexuNh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ks9wnzTGOGxYZZuvMmfV3iLXEmndXhdvvGRgRbv41lfvHrN7A7PI5E6tcWjACYXpN
	 PdvSnjw8Hl+PT3hWXAOhUznp0ZmroHSof+nJMrqxNwe4xqesZsLzgVXD05bsTI66vW
	 jA0rzc9JkePq2X8450tJF+Yq5AuHzrV6tftB4MlIshVkVwCSxKAh4kWqZzUcBqFTAN
	 MG4oBYGUGNo1i8LYHy0ojxDsVpxu3xHVRi1v10Ht3PxnfYltnmgts9aquekqBpDr+n
	 asSSiTjX/8VJ49oKN0kXjb31fYJPmM4NHhuDDFbLYSFZmM57L5yiXTYK5ht0j1fgQo
	 o8LUBT4+Fi0Kg==
Message-ID: <cbb191c3-abf8-f1b4-b8b5-cd142bf9edf5@collabora.com>
Date: Wed, 7 Jun 2023 09:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v13 06/11] remoteproc: mediatek: Probe multi-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
 <20230607072222.8628-7-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607072222.8628-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_004502_284957_6F5F8184 
X-CRM114-Status: GOOD (  10.20  )
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

Il 07/06/23 09:22, Tinghan Shen ha scritto:
> The difference of single-core SCP and multi-core SCP device tree is
> the presence of child device nodes described SCP cores. The SCP
> driver populates the platform device and checks the child nodes
> to identify whether it's a single-core SCP or a multi-core SCP.
> 
> Add the remoteproc instances of multi-core SCP to the SCP cluster list.
> When the SCP driver is removed, it cleanup resources by walking
> through the cluster list.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



