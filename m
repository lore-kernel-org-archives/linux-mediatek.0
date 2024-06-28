Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4F8C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bybusox9W0LltHHlykyXILuwqy8NnG1qURv+x9ckKNU=; b=GU5LqRCuGpbBqAe/5UbRL44R65
	Cus0zu8oYaRZRylX8QKESWbsg5eOWKuIvDOcVCmqpyoNS9A4P+g13Oo2Eu1p37IKQvWRXJAwOrO+v
	S7PUdpCeqX+XF34xj4pdechRgSCLkRbF49yxOcC6z7oc/UJzho0KHYgXAhncTsuMgiyww/+i22e6r
	ZtX815NGfccPW5XkEVif5AJkBNp2XE2Z3hEmzxFNBvrlNiupdXtkBYice1esM8zLwK0oSuZ0we0qr
	In2d8jlHIp77qFRePt3sz8oWHXlM2g0L3fE6MnCe/XsI0aTfDZiMpn/W1y9nph4KS45T+315Ok0el
	Ai8GoUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6fx-0000000D1E8-1Yjv;
	Fri, 28 Jun 2024 08:09:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6fn-0000000D1A6-1cdZ;
	Fri, 28 Jun 2024 08:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8AC02CE3B67;
	Fri, 28 Jun 2024 08:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D4BC116B1;
	Fri, 28 Jun 2024 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719562169;
	bh=5vS/mMQZC3JkKaiRFF3Tn7JqbobZpJj4qZogBGJ1g0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUzWbMw8WXSUjoMwXoAmfSYVcTPs4dvXkGY0zIfB3h/UumICz5p/1ZQogGrDyKVCB
	 ItQ4KLZhoO3B2gNiW4Q6MAbYDxrk8RuWUDb9/2ohjfVTYmZhTRDwaqRXDrgWQY0prW
	 TFV4JUwOiKEfC7xAJMvHZ16AobS0OL+BjMExnqRTqkrBGMwGwEVm+sBa3Gtx7NKSgs
	 NaSQXtA10RVWoop5i3sRU8O8wRBmbgnommiR/NIlL2dpVUHE1eKLc1+U2mYIrg6+Ja
	 exYrNdG9EjP15T15D/EqepqVyGMfBRUxCd50UT749YJoJwVBMxqpZ3D0U1qkI+SYDY
	 dEbqIopsgkvoA==
Date: Fri, 28 Jun 2024 09:09:21 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>,
	"Zhu, Yi Xin" <Yixin.zhu@intel.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 0/7] dt-bindings: mfd: syscon: Document more
 compatibles and require simpe-mfd description
Message-ID: <20240628080921.GK2532839@google.com>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
 <20240627081853.GF2532839@google.com>
 <58d1e88c-b2cd-49c7-b250-84104e82ed67@linaro.org>
 <8a30fc06-4152-4489-b991-184c8e816254@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a30fc06-4152-4489-b991-184c8e816254@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_010935_674432_7A1A6765 
X-CRM114-Status: GOOD (  13.20  )
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

On Thu, 27 Jun 2024, Krzysztof Kozlowski wrote:

> On 27/06/2024 12:24, Krzysztof Kozlowski wrote:
> >>>  .../devicetree/bindings/mfd/syscon-common.yaml     |  71 +++++
> >>>  Documentation/devicetree/bindings/mfd/syscon.yaml  | 306 ++++++++++++---------
> >>>  .../bindings/soc/intel/intel,lgm-syscon.yaml       |  57 ++++
> >>>  .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 ++++
> >>>  .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 ++++
> >>>  .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 +++
> >>>  6 files changed, 457 insertions(+), 123 deletions(-)
> >>> ---
> >>> base-commit: 8dc7c29f608649f3d9eca826e9d4fe4b8a32c472
> >>> change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d
> >>
> >> Okay, I tried to apply these whilst fixing up all the conflicts, but
> >> lost the will to live.  Please rebase and [RESEND].
> > 
> > This was based on your for-next 8dc7c29f608649f3d9ec "mfd: lm3533: Move
> > to new GPIO descriptor-based APIs". I'll rebase.
> 
> Ah, I see now in your tree Bryan's "dt-bindings: mfd: syscon: Add TI's
> opp table compatible" which will conflict in tricky way.

Thanks for rebasing, I'll get to it at some point today.

-- 
Lee Jones [李琼斯]

