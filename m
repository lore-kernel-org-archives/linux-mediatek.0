Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B6D2F338
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4v5yccwRnwyIzZU/tOnqVXFj3q694NbnMlwjQYPU+o=; b=VYUthLUWwn07CmcihdsaIcSlZZ
	EOWJdRjUiGBTH2BHmiFgcnmfw9tGg1/JEqjMmnczKUYU2nwZC3VTpGW5394q+dfiZ4qyQMmtdVH8R
	/9isNi43llDEggEqtsC2+Xb85EWljXzC/CxSMqc1D/eiPYxOay+2dRDi1TfNnO28bFXTOPQC6g6Kv
	D/O1OGb/JTueEjnFYhkSf8KTtVEj+riZophwlVBVI6+gRqOyiCY9CBcTdNfOm9McMw3BzimPUqdul
	sf6C3hDWsvo4YnIT2lBI/Qzydr+65aj9dhjiW0UpsT7VEGmxqVbYTc/w/jMoqqBno8R5sT2yOZAdm
	QIu430cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgYB-00000007P0m-0URh;
	Tue, 13 Jan 2026 15:43:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgY7-00000007OzV-32k6
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 15:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=H4v5
	yccwRnwyIzZU/tOnqVXFj3q694NbnMlwjQYPU+o=; b=jpyHEriDOxxkOWuXWpbW
	IrP0PnzWN3ZKbELaYIvtoeAsRsZj3qdM5nPrjqDPKyutPRMHimEsAGH6+iTcUyN/
	VbAYVbXt/7ZJNKE+v3qOUESwivRmRM6+ZDTuYfPHnBEHEr4lfGaJOApwV4aHRMXT
	ub4ClZPYxsGKRTa5VHIP+q7/qnZjerxMrkK5o5JzRPQm08J3tPvn9xoiLnpfob92
	yR2W7GMV3kZIsQSTqtNlIHG9jyw1IG67ULyDOWhVrEFEoeamk03JwRoKe7kdWXuJ
	SbWqjl7LzBThyJw8MWCg6W3uVIQeQNv2MsRcc7L40ochGYfvkCsigu4HmG6udvP9
	mg==
Received: (qmail 1758506 invoked from network); 13 Jan 2026 16:43:12 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:43:12 +0100
X-UD-Smtp-Session: l3s3148p1@24lj2UZIXocujnvx
Date: Tue, 13 Jan 2026 16:43:12 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
Message-ID: <aWZoEIA2shjPDUVz@ninjato>
References: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_074316_039181_221B3B61 
X-CRM114-Status: UNSURE (   8.06  )
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

On Thu, Oct 30, 2025 at 08:56:29AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for MT8189 SoC.
> Its multiple I2C controller instances are compatible with the ones
> found in the MT8188 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


