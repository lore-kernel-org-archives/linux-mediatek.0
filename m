Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6824CC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfmTt1YgdvemtHKOt3Et9VDk9GiGKMBFMpKBf9Oc8HE=; b=DFWW9rra4V90jLIz/OK3ZlAPjR
	M64f+qHh2jKFEZc7jm6k3o4HFXugsQ5Hhjp/gsDY+8/8vNqE291k0M1rYZ2+Cf83DercxdBf6cSfE
	cyDcCypI75jm8s9GDiSGvrcRl0BxDZhBc11+9q9fQJ5/eSFyYOAq88Rz2fV5odDar5mzRnbQLbjs8
	G1QsSa3UsdEm7urbaNHMxyjs5yVPkvU1OVeFlfYwsNoLYrsJxykOhCIgRK2fBXfcAneRA2ulq5ejM
	sJtRcB+q8shI57178ggB9uUOLRzviTy2qCfPL6jabpE0MqZcHGhP+M0xf0EqUFbNLtXd5wsyTP3av
	sUd5R1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0o4-0000000A17V-3U8i;
	Mon, 19 Feb 2024 10:23:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0nz-0000000A15R-1h1n;
	Mon, 19 Feb 2024 10:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A8625CE111C;
	Mon, 19 Feb 2024 10:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49292C433A6;
	Mon, 19 Feb 2024 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708338200;
	bh=dKJLsTHvNevwcvhcDeaXvz7IVccXObxg2f+AAqsJdY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOHrTtsZRDJFlYS2TF/KtO3C+utLQAvQG0V8QTeNVMmn5vaBWkl9tORwHW31s9441
	 2A2s/rKkqm6libyRc1Axf0Ota85WGg70bsnC5HliD8c5cYPBvzxJa1G44V3fyskWDt
	 svMOPRGTpIY5Q6mDmfyuWjfeEIKikxHnW57xBQHbhJP+1iuIvYsIy2WR9k0SpplnWQ
	 LP1aETY/g8udTWzf0SvsNt05iQtYCPaddm0fxsXn/rlVHVVQ09IwdXWgFj/P+wcnRr
	 JceaxsrzkrEyrcJczephzSPq1d5eYD7eXQLASOuhrDSnYAbhdlZ3Su2hvD2YrYitOk
	 9vKRVmMRp+Aqw==
Date: Mon, 19 Feb 2024 11:23:13 +0100
From: Niklas Cassel <cassel@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: ata: convert MediaTek controller to the
 json-schema
Message-ID: <ZdMsEW2AnYVAB7Qf@x1-carbon>
References: <20240213074747.26151-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213074747.26151-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_022323_646916_C319E7E6 
X-CRM114-Status: UNSURE (   9.24  )
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
>  .../devicetree/bindings/ata/ahci-mtk.txt      | 51 ----------
>  .../bindings/ata/mediatek,mtk-ahci.yaml       | 98 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ata/ahci-mtk.txt
>  create mode 100644 Documentation/devicetree/bindings/ata/mediatek,mtk-ahci.yaml
> 

Applied:
https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/log/?h=for-6.9

