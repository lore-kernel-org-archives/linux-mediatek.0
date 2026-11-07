Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB969606A32D
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wtT30GLV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rb1Ycnu/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XSukMlI3p+vpgcaw+I/ycQQdp1KZceQVwp8I5dai4Kc=; b=wtT30GLVkeGtuc
	6drtgS+RJbhACvMVvpDwDwnhv+0LaKcJFgIRgVsgoTjXw9YfQ0mjwdjjNBTPwIcLSocwcywRq6N7D
	ZKKq4SJ5VkueOD+z17EjwU+EDEJRCzQdyzdGHxqtKtEpRopbh8s3TMwZfwehy3FnYIxGsJugU67tg
	JOkQtRmK6HY/wZMr/mjwMGi7Rv15rgZQkxPpN+xjHyTJYSnL4/trdIC8Z8/92rjrUqQ4Py2hzDdyl
	Rgenx4AI36CnOpFYqvL7kwV0nZzNIyqx2F5l356Djk26AQcsZ2q1tAejm7OED9jEJuYXl4tCEw1rM
	v9hi0CkyCjRAKrd5nEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPliz-0000000FCqy-0mx8;
	Sat, 07 Nov 2026 19:05:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlix-0000000FCqH-1bft;
	Sat, 07 Nov 2026 19:05:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8756760D39;
	Sat,  7 Nov 2026 19:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBA81F0089F;
	Sat,  7 Nov 2026 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794078310;
	bh=XSukMlI3p+vpgcaw+I/ycQQdp1KZceQVwp8I5dai4Kc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Rb1Ycnu/TGYaoo9vfEigGMMp3/v0r4/jqvUXs9D/WOCkYS4gBGb/zQLcwZ02PFb07
	 io6Y+R64Ojc3PaSb+rGyorxqy1QZsGCXhk0ODZ1pqkyN3/MahHHcIepbjmA+kD6B5r
	 OhOc/tweGrSbFLDFwCqiQ6liVMpLPHRkeQqDtYzX1CEp3bOu/STAMnDbSAbeHIa8zv
	 bdBvHvho0nXKpse3BeVouFZVwHTYWi0uqfkyQuiR5V1dGH4yVVIahd7hIS1zY2HvKa
	 YNthqQkNhJwBzRn/XNdWcqT1rxE1lCOJ4U5AXnd/HpHclG0+HxIRxYMcmd2ZPSI7GU
	 L1NKitZTt93Yg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
From: Sven Peter <sven@kernel.org>
To: Mika Westerberg <westeri@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Andreas Noever <andreas.noever@gmail.com>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
Date: Sat, 07 Nov 2026 20:04:31 +0100
Message-Id: <179407827117.165429.11777170722243752189.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=sven@kernel.org;
 h=from:subject:message-id; bh=YazX3QsxxVBhi3drvQLn+l2mg8cyp0jw3fckrLgjJMU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9b7MtfydzmJvz5/q9/58EBG0vyNsnOimVVkhO+/YH94/
 I9GgUR3RykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiVQ8Z/iccSb4j81g96/bb
 U8dvFQuphl18f+P7K+a6iXumT7K8EBTJ8N//yE7DPVZF03h5+cSSp26ayyeWtLJn3c9cBTuFOWw
 f7nICAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add a new file plat.c to register platform NHI driver for MediaTek
> mt8901/mt8992 SoCs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>

[...]

> +
> +static void nhi_plat_shutdown(struct platform_device *pdev)
> +{
> +	nhi_plat_do_remove(pdev, true);
> +}
> +
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id nhi_plat_of_match[] = {
> +	{ .compatible = "thunderbolt-platform" },

Do you already have hardware that probes via device tree? You'll have to
write bindings and get them reviewed before adding any compatible here.
Generic ones like you used here aren't usually allowed.

If you don't have a dts based platform I'd probably drop this, not much of
this code here is e.g. re-usable for Apple since they like to think very
different, see my series in [1] that I can pick up again now that we
made progress on how to represent connections between the NHI and the
protocol adapters.

Not sure about qualcom since I haven't seen a series for the NHI yet but
I'm sure Konrad can comment there. I kinda expect that it won't have
much shared code either.

Take a look at e.g. more recent drivers in drivers/usb/dwc3: They
usually add a dwc3-$vendor.c file that takes care of all the
vendor-specific quirks and that ends up being nicer than a single
platform.c file with tons of quirks and separate code paths for each and
every vendor.


Sven


[1] https://lore.kernel.org/asahi/20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org/

-- 
Sven Peter <sven@kernel.org>

