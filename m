Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BBCF11E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59imeC1EBRINkn3R3jmqKGx/LboGQMiK8Ls4O9+QO10=; b=MfH6nImFP2a3wLBsKGjdoWBoCS
	loJA9+gAKUs3klcERf3UaMLgXCidqUwc/0FJoQPAFQgvJIK49bY1pPfYz3w6TzMP41bBH4WfAw+c2
	r6GmWO0K6eRJ+87qLameTR5gRoygc+ZbJjLTU3uz36WGpIhf2hnnXxsMbGRRUWoj4m6Df1waeATtc
	eiKKNTa0rYg4TXScvFD5/ZDXLJdUIKpcFjhf1Cumv8qJ0g0eSvaaV1sEhzPntNXxq80Pf36tNCN+r
	HMLDO3YlpovJJtNjQ1Sq8lOmY2knNHAtPKNODiH/GDBmbD0ppZ09Qz5qvIBuI+YgHVrBRPG5VSjkD
	rZhrU76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysUk-0000000CklL-2M6v;
	Thu, 10 Oct 2024 12:42:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sys8A-0000000Cgrp-2dak;
	Thu, 10 Oct 2024 12:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=59imeC1EBRINkn3R3jmqKGx/LboGQMiK8Ls4O9+QO10=; b=FDN7Rd19bhh9+B3juIJwJL2TWh
	7GuKWDTbvBkhWS/EuVZ1n27+Y6Hutp6sZ437ZFlLPiNjpXSdU6LZFDkySxvGJIH8nE662nvS7EiJi
	7mdlJHQ+z9qvVW6d/xNDAbWCzBkUfQRLQNpQMzFLOHW3aj9/r9SiLEv4Jc4MwYOEHeCLNXgjIGgzV
	xUwIhGumY2/xIwToXqKloTfjnxi1DDIgGzEACGLqwcO9Y4iZVnOWUMpfFYT66udNTWA91Z28HxxHg
	R1FiH7UNoUeniJAXXfkaCMEmt/ig6CpAtJxKxyv2rdYYeMQo+h8OBBcXHuHd6GrSiZR3m6OO07XCW
	HJ0wdVdQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sys87-00000005NDN-2gIh;
	Thu, 10 Oct 2024 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728562730;
	bh=0SgFBZq1DXQEdllYhnVxjf6h8WU7ai6jQWuuA5GI3no=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fCLZcSCb8qYWPh6Fy/5RHA/kRCTXQlgsDLGRXw+oKuwhfc9OI5zJVIAUu52Q9NsN/
	 UI4iDHNOWHyk0+wocC+N1fYx+6Hk0Gkhx2GAyvJtRrXsavPwTwtH6cUJifgNvmkz1k
	 4dT/vdW1RDvyJ+KSSlxCtCgmeMjtYEb+oV7j6t3DZ/ohzB2ikylh8eiiVbCMfGOL16
	 HX+HkCFiCOGhkmFECL3XrVBc2zh0CmLWDhXoWkPrTcCtZ+ODxXa1+7EXvDIJWfONQ8
	 Le82+W/Hhz5GcQRBZOmJKWIcU9HRhxtoQYwa6cTTBU4riIpucTRiHqO1DTpEads1i8
	 iaLvBwRZg4IlA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6863A17E35D3;
	Thu, 10 Oct 2024 14:18:50 +0200 (CEST)
Message-ID: <5ac376ca-f57e-4913-86f0-4fd2187a6952@collabora.com>
Date: Thu, 10 Oct 2024 14:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: mmc: mtk-sd: Add support for MT8196
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20241009120203.14913-1-andy-ld.lu@mediatek.com>
 <20241009120203.14913-4-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009120203.14913-4-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_131855_835582_7901D69F 
X-CRM114-Status: UNSURE (   6.62  )
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

Il 09/10/24 14:01, Andy-ld Lu ha scritto:
> Extend the devicetree bindings to include the MT8196 mmc controller,
> new tx/rx would be supported from MT8196, and the register settings
> of STOP_DLY_SEL and POP_EN_CNT would also be variant.
> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



