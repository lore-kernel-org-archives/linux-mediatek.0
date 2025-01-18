Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF0C02185
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jan 2025 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FotUu8ucj2C1AtRvipTp3MNsAUCiDIuxVEyufphtOKc=; b=I2+lVPYVhEFTr6AfTqti3dgF9S
	nkIrsXCAlCjh8lXMEL1SY4uQoP2ZOjMJ3H0o6lusFvkQOEMBab4W8xSsw7Kh5wdQfgX+w+z8cZLqo
	87+JKv7d00xxf00KiXF/vYTpB37cnrRh4r/lBDICH3tYPn4vvH1kt5yJ1z9t4fgO56BkyC/LJRVRv
	BWS1LwyMwMTQItXH0zs25ZE3DDNDcoRNvLdC0Vop76msPvHEDL7scr/RrRyJVsJVMXty5Vf8t7HW+
	kSWGqju24XSmS/FS2Ewb/bLtso7eVa/38C9CFC8DdB4cK0APCd3ggoDdXYpBdMw5GdopbGAsVbsmJ
	Effpu2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZAzV-00000002dIU-3ssL;
	Sat, 18 Jan 2025 15:44:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZAyE-00000002dD1-2hif;
	Sat, 18 Jan 2025 15:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94CAE5C58CE;
	Sat, 18 Jan 2025 15:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A57C4CED1;
	Sat, 18 Jan 2025 15:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737214964;
	bh=gQVJZM6kehJm+VICTaAYznQuRVifIM5s+wBP887ZbKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3NM8f1XGDT2FxfWntr/PL//AZvBv4b7qLjaT5whTyM+2/wpqoBCoASUU9afom2Fh
	 EyVmcVsefuXRkqZuHaUJW1zk5e6jkqIj2FY/II3T/AHmLes+dEl9uT1tNts4DLOE+E
	 YepENe4Rxt4TkPJNqx3QlaDFiG2rBfsxrkQsVelPakLZ63bIRGo70XDOwk71u7awj7
	 mOvt6exNfwa1bpjJQbVMHBJn8RN92Sb6KvttYRzJ0ZWIdcjyINYlz9iFMQEBe3XiV4
	 fr6Q7oujM5pLq97JZkIL1F0M9dOYSlCX4a0saXwP6ALfg8i1bUofpdprH0w9J3tbWG
	 YYaud5Wsr59xg==
Date: Sat, 18 Jan 2025 16:42:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, herbert1_wu@pegatron.corp-partner.google.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add MT8186 Skitty
 Chromebooks
Message-ID: <20250118-ruddy-excellent-beluga-1aba0c@krzk-bin>
References: <20250115-skitty_kernel-v1-0-6ef2086858ba@pegatron.corp-partner.google.com>
 <20250115-skitty_kernel-v1-1-6ef2086858ba@pegatron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-skitty_kernel-v1-1-6ef2086858ba@pegatron.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_074246_730822_E4919708 
X-CRM114-Status: GOOD (  12.11  )
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

On Wed, Jan 15, 2025 at 03:43:43PM +0800, Geoffrey Chien wrote:
> Skitty is MT8186 based Chromebook based on the Krabby design.
> 
> Skitty also known as the HP Chromebook G1m 11 inch. The device is
> a clamshell laptop with an optional touchscreen and keyboard.
> 
> The SKU IDs of the Skitty devices map to different touchscreen and
> keyboard.
> 
> Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

That's a v3? v4? Version properly your patches and provide changelog
under ---. Maybe you even got here tags?

Best regards,
Krzysztof


