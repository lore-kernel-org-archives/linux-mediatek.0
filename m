Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0AFFD88CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 23:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JNF8BBoIagk2m3P4aIJmb4aYNaQXD88uTNXjt6qc3RY=; b=dUeaRtTtDtQ7Jq
	sUMXPiY65IkWuRRuNkyf5sjyGK5Gz4NDP/uw+u3H8bmGJ7w0ZeXndcdGNrS3CTOTj9h49yi1SL4Sm
	qsrGTVJ7ZSxUN4UiVM1rk3ONgFOPZG8Oz3OnNJnfUIZ77v8anlT237oRteGC8U+S3WgffTJywyBFC
	EiI+6rHxN/gA9n0EwosWGbc4Q9DS1X5adM13cg5gPCbALGOOVOzsazi+xNVKwAtWFN5pN9yK6x+SN
	5iVy7u/gK2GJhPA6MG0DZx8qlzDmwptNIqSCrOuUzCaThjJT0fCH1EquNWOS5kT3b9cVwlwHn87nM
	B02+t/UGhWzCLF0mE3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06M7-0000000ANWv-02ze;
	Tue, 10 Mar 2026 23:19:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06M4-0000000ANWI-1pIE
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 23:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6CC040AAB;
	Tue, 10 Mar 2026 23:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B14C19423;
	Tue, 10 Mar 2026 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773184750;
	bh=VKt4TguhV3l7TB0c2pw/qx9dm4urWTxkSrePuNg0CTw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZzLhpTHnmI7oYiSCX1jCPAGN4M+auj53QhucBYMgvkcfnm4J1VwHmPduPiSfQUlSU
	 PlOUqvox/vvhiDnEnWFWRantVe5iK77WuzOOTV7mhcOlGyAiYZuJ3Ns7V4O4D9iXD+
	 Ecai+2dyXcXfOiinfvnZj9Vsl3Crckvrg8M9mQUAOOq/nzoH1mD1OKfMCoVT0GLIjx
	 zfMzn7VdGaZ9PIWOJW483WGrsVCYEgEk7uqhpUK+6/1x9FrV54fMr5z1s3tPZLfcfS
	 YS8lVHAvkc3WfOsKyzDEKHW3UWSc9WDKY3BN9MpnIJvSgc2nZYZFXwZDrHsAQnfXt1
	 l/5FoKuN+XQGQ==
Date: Tue, 10 Mar 2026 18:19:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/7] PCI: mediatek-gen3: Clean up
 mtk_pcie_parse_port() with dev_err_probe()
Message-ID: <20260310231909.GA860802@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310091947.2742004-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_161912_496923_51188D2E 
X-CRM114-Status: UNSURE (   9.16  )
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

On Tue, Mar 10, 2026 at 05:19:40PM +0800, Chen-Yu Tsai wrote:
> mtk_pcie_parse_port() in the pcie-mediatek-gen driver has a bunch of
> 
>     if (err) {
>     	dev_err(dev, "error message\n");
> 	return err; # or goto
>     }

Mani, if you apply this, tweak this to be indented with spaces; this
has a tab that makes "git log" output look like this:

        if (err) {
                dev_err(dev, "error message\n");
        return err; # or goto
        }

I had already done this on pci/controller/mediatek-gen3.  ChenYu, if
you repost this for other reasons, you could fix it locally.

