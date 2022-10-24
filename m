Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7267ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqL1vdMQcramC5Snb1TiptzdC7YH28TB3kj4k6jTmoc=; b=cyLZLft5bwj/TkBICBtepS3qkS
	z4sO1HBUuA+UZtZXvUGHiKhRc0mTGPif/i8zDqdweSM8X9hI7/PicH3AgUF8TQNEXoiPqLqhdX0Qc
	8eclhCJwNlT9hssHz3l4QYIkSYWfpPmz8z/Hk7hbjsHw21z4WJQHs5DmpqueNjUwzxWI9py9U/5NM
	uLTsD/n/O3+rPs3f0hZ4uQszUVKbhsSxgu7oDjcyS9WfJrpFTnOfsQkOlRikYD093jSIiBTeBu3PC
	TtRY3s2zIOgKv4VQz8HVMUiptG1W+f8e7Z4gz5ph8LH+0nsNFB7k/eRDRKOj9XeHK+oUFxCtOH/fo
	cbHnalvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwuq-001XKe-PU; Mon, 24 Oct 2022 12:50:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwua-001XDC-53; Mon, 24 Oct 2022 12:50:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC0CCB81889;
	Mon, 24 Oct 2022 12:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBE4C433D6;
	Mon, 24 Oct 2022 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666615833;
	bh=muZZQCY2YzmlU83yu+6go4k9bEyOW1zq3CdA5eo6BEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3gaU+rlu3tHAPHeK/twHPUpXCK2BibDRPeLcmuyZnr5/ogwB5gL5452WF7WxeFkr
	 LiFv0N0G/mv8Pz/fjbe5um3/fgiUvVDCdV/ggczrVZG8pshGu3uuecHahC+OB/4Idp
	 GMSj7ylh26GrcbGg2jjUlJDzOO+YDgG/c6iymYVD1w8z//TQVcv+CtlBq3jzx52mFp
	 agXgmdbsbLT+8huJHUVloo8T8wQQ3K9m939uhLyHhLRTTOlOwbVu5m/6yoJbnW3Ovt
	 xlljEMYYI1GXC1a36p99/SKm6tzw1hE+rI0WulrjFaAwt0wDlk0+CofHaFoHZAdfRl
	 2Uv3UPdyz4LHg==
Date: Mon, 24 Oct 2022 13:50:26 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 5/5] Input: mtk-pmic-keys: add MT6357 support
Message-ID: <Y1aKEgitetNgNDNa@google.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-5-f17ba2d2d0a9@baylibre.com>
 <Y0ReqmnLfKo20HO5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0ReqmnLfKo20HO5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_055036_364146_EA9377BF 
X-CRM114-Status: GOOD (  13.16  )
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

On Mon, 10 Oct 2022, Dmitry Torokhov wrote:

> On Wed, Oct 05, 2022 at 04:57:25PM +0200, Alexandre Mergnat wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add PMIC Keys support on MT6357 SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Please merge through MFD tree with the rest of the patches.

The MFD part is only a small doc change.  The Input and Regulator
changes should be merged through their own subsystems IMHO.

-- 
Lee Jones [李琼斯]

