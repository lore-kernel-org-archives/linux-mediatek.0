Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263CEC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07ZM02bKAcdlWUubu83oOFwMSu/G/TNuwicze8QoIzY=; b=i71S+sugUDq1r0+2HpWdnSJuow
	BTmaFF2u6NWS/zGT/3hgYSHaUG5gAQXQEXK+1P129rnXsriB69zoNdcmk9YK6LDe1Qzb+Vh8WKOtM
	keomvrmJ4AfCwhuU+fZii6pRAogTTAwlGmCdhKRkSAtCXxbxLmhA6gcm6r03pTJuKlNw6nbUifUjS
	LY3RL/QG8KZ65gkRmFsNTFo+zfstInKcThPNIoEhxAVV01xoYGFZSuy/uvfRBW8oV8Laz6nglaHdm
	dyI+2oq8sFTxMnNRPwiIKAPCf9yr5HVwaSSIcNRmJ8Ee+mv+1JkZPkJO0oshrA6mW53lfBXJT+cZY
	i7QGO8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzBk-00000009d1p-0mvV;
	Mon, 19 Feb 2024 08:39:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzBg-00000009d0i-42IM;
	Mon, 19 Feb 2024 08:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2934A60C3F;
	Mon, 19 Feb 2024 08:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDDEC43390;
	Mon, 19 Feb 2024 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708331981;
	bh=crEQOFsZ0LiXnQXnd+HTFgulg92PQY/yu8OuVPtUikk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0yqVocFIJEhQ9HbiG4+5G7+3VDenlt6KGMSXspuncofTEEmfjltgGudjYN+SEqtQ
	 g6puL38eAMH1zPUu7rLyS1pkz2ZOd6p42ZSGssL/qlh12uEsHI8nU/35ShBXOt6kxB
	 cJc257pU77VW0cN80wN51XMkWtlKKkceWHGH5quW0fhYtKUwvtR3rcMV05ugMfn7Xt
	 RQiDQ1BDOCQ8AZI/rDYuqA5mT+NhjVepoP9Wo1zhFWqPY/pAJMpBzloYjOVIX0fAH3
	 4G16G7sU4rvW5E/q37FrIn/r2P3ERMWTjk6+EEQhGB4rZ5KzCwADEpJrQpOfhcSqC1
	 qAn9bTpasdQWw==
Date: Mon, 19 Feb 2024 09:39:35 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: ata: convert MediaTek controller to the
 json-schema
Message-ID: <ZdMTx1CJzFR5uAzK@x1-carbon>
References: <20240213074747.26151-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213074747.26151-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_003945_073817_3D972CB4 
X-CRM114-Status: UNSURE (   7.74  )
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

On Tue, Feb 13, 2024 at 08:47:47AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Hello Rob,

For device tree patches for
Documentation/devicetree/bindings/ata/

Usually, if we see your Acked-by, we queue the patch via the libata tree.
(If it is part of a series, usually you take it via your tree.)

We have a R-b from Krzysztof, but no Ack from you.


Kind regards,
Niklas

