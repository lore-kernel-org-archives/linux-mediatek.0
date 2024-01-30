Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB429C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD0qax8gM2p4AhzlRcFq+GuHljrxrUaKdHSCswAXonA=; b=sAIN4ySgy+RO/1WoZGwMTEJsiL
	s4YuoXnyVUewqno4F1Nex2XvoYnL5cSou8LjvNIFI9f6HDGwUXIjfsITmbI097CWW1QvVgyKDF8fw
	V71oEBmH4lKdKhmG2gZxvmd8LfbKKYEyHTJv9Na0oZjXZgzT0xWvpgD0ggVySbt3IEP94teCqRoLC
	Z8N92eS/zByQ9nS2rSlqcmeqBo+58fwsj5riF91vAlgfDA0eKlXI9UkdwowetCIex6PiaiVGBnBM5
	7pv7G1nzECT8YToPqd23+OJgC61lE8UF6CNGMMW4ZxtpCRY4mzcoTskFmSdPs2IxgcFf00FuXALiI
	FaiPlhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUq9Z-0000000HCQL-1Xkd;
	Tue, 30 Jan 2024 15:36:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUq9V-0000000HCPA-45yv;
	Tue, 30 Jan 2024 15:35:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D544CE1B32;
	Tue, 30 Jan 2024 15:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D26C433C7;
	Tue, 30 Jan 2024 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706628949;
	bh=i/gOiEzQMpG9nyDnUPfqoV+1c+gEbN2MOXoa3MzHpWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwA0oG1ezBKXcVKP5hB4Ezu/h8VqMQxyqZXxgaXfazRMz084ozgS7FcRHAWauygh5
	 ETucmXpJopkQedX4wZIjVNymzGczPrGPbXTCh3nprA3Q8sAp78T7WzQXFe4rMkJ4ph
	 vTA04sClKN8olT9YSE25odGbHiPcpM17mVmKtuKr8K+LyoWqkTk1ACglmr6vnWJy52
	 XlVhQzqXR4LWkpa+3ACw+vjaVi5birVS9nbZ3cqdhjil+5PB2QyObxLSrloMX6iYl2
	 n9OZle9KhvsCojhXYz5A4AHqUA7rF0dMs+bzkzyRINVuo4e9FTJmnB4HzJxnLrJd1Q
	 Xe3cRjrOpb1jA==
Date: Tue, 30 Jan 2024 09:35:47 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: convert MediaTek
 sysirq to the json-schema
Message-ID: <170662894593.1670058.1923590557072552204.robh@kernel.org>
References: <20240123060804.32254-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123060804.32254-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_073558_196356_F00CFFCF 
X-CRM114-Status: UNSURE (   8.92  )
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


On Tue, 23 Jan 2024 07:08:04 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../mediatek,mt6577-sysirq.yaml               | 85 +++++++++++++++++++
>  .../interrupt-controller/mediatek,sysirq.txt  | 44 ----------
>  2 files changed, 85 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> 

Applied, thanks!


