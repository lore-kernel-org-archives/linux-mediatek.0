Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AA9C25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 05:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN5h1aZzeTsiKDNIiMKG1gDXMbVTvgWYF0v+HiAhVDM=; b=gkryYliEKoJMdFC/kjh7EIxKh2
	rZj0h1UIJmpd1uB+k3E/EwCDdj/EV0DmqdsaXmU+pFHcapNB3dYXf0G61IvM40bfAI3DevBGT8Bvo
	EWE2w60Bqt8tWkuwqYpIPH7rlB61uI47hefzsw9SinuQC84ZNOJ7YT7EG1jB2GaCt5qVNV2EaQNTC
	gvx7wbMp+5XHV4mqeLs3YmQ0TQLgYyNnozXlC4CxTbaSl0v8jwqtmYc7y0K1SO/mW8SA0hNFywNGU
	GEJE9VGmSS14+sSdLas6z76FZJ15E76IG9Dgklfi7EewmV8hMtKt/9j0tcA0Z+dpocvwmavY+1xY7
	hjEUG7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKC8B-002Owp-SO; Tue, 24 Jan 2023 05:46:03 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKC86-002Oq0-Bg; Tue, 24 Jan 2023 05:46:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A4A7E42651;
	Tue, 24 Jan 2023 05:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1674539148; bh=HljMxe7jrBTG1Genyu+Pm2rYswosR8p2EtuxuYI1k5k=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=tGJDNdnjFM7diTyJhByzlPW+Qgjt+NJVZE3JfiWvoqqTN22OFEMWJCJu2Ml1pOsAO
	 r0/W8qLAIOzYaNHY8izHRJlBZMIadNunPGWmPwbEb40y1c6VosRAOpZ3Wcs4aMWegs
	 XbuvONOwx1zSvJYikQceLhiAJggA2UD6cvlPAdRG3c6kHqxdgYFDuUkADi9HPGh5Iv
	 0wfqvQC+iXGieASzeODYfH1Ol3XFtpUDplCyJZqQsIPWXhbLyyI6/TLH14CQRMCzGs
	 /k/FBLs2Gdm6AmXg+b0qJZwx9ZtzOaW60Td3qkL6/m3omSubjkfWbCU4KWlUN6s7C8
	 0z/OcdYARoLFA==
Message-ID: <d7575a8e-035e-b729-bd16-7fd10b2c56c5@marcan.st>
Date: Tue, 24 Jan 2023 14:45:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese
 <sr@denx.de>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Green Wan <green.wan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
 Peng Fan <peng.fan@nxp.com>, Paul Cercueil <paul@crapouillou.net>,
 - <chuanhua.lei@intel.com>, Long Cheng <long.cheng@mediatek.com>,
 Rajesh Gumasta <rgumasta@nvidia.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Palmer Debbelt
 <palmer@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_214559_496403_78172110 
X-CRM114-Status: UNSURE (   7.28  )
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

On 19/01/2023 03.01, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

For the Apple stuff,

Acked-by: Hector Martin <marcan@marcan.st>

- Hector

