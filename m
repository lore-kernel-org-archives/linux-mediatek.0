Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3219DC00140
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvKJchs2LDC9wxmUVHgk8GKO+1QGLq3smXS7v9edlzc=; b=be185VqXlYWe1UDsTfi54RDFTH
	+5rpJp3cWReYTXoHZW5FJ5FDdHcot1O7Pd+5tCE5IFBfoe8CHSTBNroNNFuVDbKTfvHOldQCz1bn3
	9maoRt2LhKuag7aJliRuNRWmE7ojlX5JGSzQl5sMCkkq9IoF3m3p/Z7rFPtgiOdIJmHykRGeyGhSs
	T+rHNp7FXRFH05qM6Ob2i+ml2pPk6Vf6fJbnghVn+OAmL0fx8B38OQEfj98QYyZwLLWKUvGfL/3Ob
	AAdYhKzwrCxS4RJT/riN0eYSvZUzIllvpDFYeOgMeaSupmrARfbcqCME2UjDvjrqQbaL78vLKlKR2
	Zs+D3nnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL3iR-00EN8B-It; Mon, 08 Aug 2022 14:26:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL3iF-00EN0I-18; Mon, 08 Aug 2022 14:26:37 +0000
Received: from notapiano (unknown [146.70.107.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9064B6601C2B;
	Mon,  8 Aug 2022 15:26:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659968790;
	bh=Lmjj/9K8hJ+k57oyBTvp50eiDRhA1CHDdzzZVR6NtzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRPEtsltcdWXIRiiNjCASxDq9fs5Y6Ne/ysFGC4LQbfgq9f7giVHJYbJOdK6tB4x+
	 /AvVFGJ9zfg87z7cNnaD51MqHIrWGVK6ZTaUa5JK4PbeGm9aGd1Fsnv7xZi5D4MAKZ
	 dH023pAzCEP9IN7TAC5Hr1XFEkuoRHL7Vru0PFaacFc5yBwLPJWIddV73lQVTotwti
	 c4/qXZlDBkXwgN+vCzc8cTgtybeF8SEXx2VrczXoaAngd7IQk2HG7QyXBbIzAxDlbd
	 f9gPWVA0JafEaBFG627bOKOcw97ehWDWPyZySA1s2QQNFQL0nXQwEVqz0kd3e9zlED
	 OfrwLpyXxjGaw==
Date: Mon, 8 Aug 2022 10:26:24 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>, hsinyi@chromium.org
Subject: Re: [PATCH v13 1/1] arm64: dts: Add MediaTek MT8186 dts and
 evaluation board and Makefile
Message-ID: <20220808142624.rdwx7gh5ntlr6oy2@notapiano>
References: <20220802085152.31284-1-allen-kh.cheng@mediatek.com>
 <20220802085152.31284-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802085152.31284-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_072635_325542_C593465D 
X-CRM114-Status: UNSURE (   7.58  )
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

On Tue, Aug 02, 2022 at 04:51:52PM +0800, Allen-KH Cheng wrote:
> Add basic chip support for MediaTek MT8186.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

