Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2761B606A332
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pzrgg5Qx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nflnBQL8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UE3cxh4Yaz2lcwnzg8DWo7tmNqwhg5hgieOdXzNGseQ=; b=Pzrgg5QxXee9XF
	bsqj5a/DRT0E5kPjJONEAiCmPduJQRb4oGCvGPL0H7vBGk/7ZFdyWT3sy/U+CbfefoYkEX//gOQsw
	4bpSXZLz0Ic6YHSBf12r17oqdWwSHaNxkejDIil5RBuFc3XvreXg31SKWuhJoum39z9mDqJlmDQmV
	qNs25We29fICToebP0pqGhAUsMNpyfDSO80KIukFLVJ/wSMN0SRlo+K4j8LnTj8VXHBeEOupB9NPd
	po7/X1bT4PadKhOaDwzOx1U/Wj2hinv/iZNpRTQtvRiNf2P8F1AlGRpzmqtxlXq/psMx0zwYab+Wm
	58wugfDyu5mWNKp5YRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNz-0000000FY2l-2LOy;
	Fri, 20 Nov 2026 16:22:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURNq-0000000FXzT-0Sm9;
	Fri, 20 Nov 2026 16:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58AA760628;
	Fri, 20 Nov 2026 16:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288541F000C4;
	Fri, 20 Nov 2026 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191761;
	bh=UE3cxh4Yaz2lcwnzg8DWo7tmNqwhg5hgieOdXzNGseQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nflnBQL81CdjNgAQ/lYDvapKo5OcUiVI4zN9sTkwdiIFXd8pW8MXDOa9wvWqdaa41
	 sHBV7NtHqfhfVlJH9JLag/DchbMUcKhjoa3iuWEdBjYy0juR5TmfdmYoqFR7ms6P5o
	 GaXOcm7lJRjo2FhAKVTxvhxAuS674IKTgf6BoHZSyaYjj7JGdYis43gk9MZCLSdSwU
	 tRZM+J5OPDnGq0ycWPdgwZyW8enoCqC9SExG7mc7LUdHrHLFEwOZ06hrY5nJNFLj8s
	 BmbtyP9Jzcu8wmuoiCQnlXClLCcttWsei4U4XorcCNnisPO0WhlTGY6aF+tUktypZ2
	 eL40/Fqy3PChw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: mediatek: mt6797: Fix runtime PM handling in
 probe
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, kaichieh.chuang@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075917.50241-1-zhujun2@cmss.chinamobile.com>
References: <20261119075917.50241-1-zhujun2@cmss.chinamobile.com>
Date: Fri, 20 Nov 2026 16:22:36 +0000
Message-Id: <179519175666.6016.11644366244582649083.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8U4fievZtT0npUDmkK6cNO/Z30hCYZ+2JMkBYDIrwIM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZis+Gmv6WaOzLW7eycOnnooypgcvdwiRPyLodWDpd9
 4HSzKuCHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIqT+MDLtCako7rhWJpCn/
 zP+vtIuRYfvNpfXaLyuLXUrENWvUGxkZPvGe/PA2aJnbGR5Ftj3BCkbsmXyP32rmmO9XnbO27aE
 nFwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The MT6797 AFE probe registers its components even when the runtime
> resume fails to enable the clocks. If component registration fails
> after a successful resume, the probe disables runtime PM while still
> holding its usage reference. The runtime PM disabled path also
> returns the previous successful result without registering components.

> @@ -846,11 +851,13 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
>  				     afe->num_dai_drivers);
>  	if (ret) {
>  		dev_warn(dev, "err_dai_component\n");
> -		goto err_pm_disable;
> +		goto err_pm_put;
>  	}
>  
>  	return 0;
>  
> +err_pm_put:
> +	pm_runtime_put_sync_suspend(dev);

There's a race with userspace fiddling with runtime PM here, it can
force runtime PM on.  Instead drop the reference with
pm_runtime_put_noidle(), disable runtime PM and then directly call the
suspend function to ensure the hardware is i the right state.

-- 
Mark Brown <broonie@kernel.org>

