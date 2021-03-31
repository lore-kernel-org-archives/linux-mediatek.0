Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C4EC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 13:01:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9786761989
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 13:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9786761989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4L7Eo6HNHM56FgPzgE8JUajlIXSV3S4c4eHJC1Pnxfo=; b=Ytx5QN/3oWfLbVCfbnu+CpfeP
	/BljfaewITrEgt9JwZByHUdFhHAkKmGOJ2oWHyC2AANoG5bSU5dCCOYxvVa++DmTF3cnwXEDvvFUj
	mtX25SVolYTvC5v4bTymli1IJ1U/Bu6PRMnz2I9i0fwj6Wpph/KF/IVG+QF6h1p/yYSWy316joW8g
	h87hHh3pzJ1njpI5Z3DG1UreCT41jJmJGoJUydBjJ3ygwt2wg/hPXuMYotbO/wA2aEsSBPACXaXEI
	Im5gZZEU/NgwVheRBRkdkSkH8tZQSsoYTjb9H+ODDEFAwkD+bHdYJfS9nFFdByX/sB3GVDEUp30Sb
	z//lB/eXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRaTH-006bKI-UW; Wed, 31 Mar 2021 13:01:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRaT4-006bJ8-79; Wed, 31 Mar 2021 13:01:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5C756196C;
 Wed, 31 Mar 2021 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617195664;
 bh=fpjbRjzuhhKjDVMy/Iwk4X2pjxw44PsDGZYpY5/o2yM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HfnOKjp8c8lRwPgGVAS8BSFnrABlFY4SHtoLLZTex7WdcxvhjIMbHMnMxpJH0MPpK
 i0c8KFB7AXvwfitOwDE4RJSZLRgzaTBq0Xjqso7ZPaWJ8AxLEFdFlyd7FSm509xrMj
 cUcRFTlZZorzERIBb0RhURjQi2NXFQGpbW3URTKv9lrxR7Kh/ZYr+a3S9iTPtXPl/L
 T/o5T/r+H5a9/qxg+vB5rIzofyP+qMuJMHcfP8WHgGqG39yFKEn5yMN7s1vEGD+mQC
 cbSb/ZnhxW+0Tpms5iDoIOLVfn7nqXM5E5Jo5IPcpekdIoTp72Cv7yJpx8ED4LKk5P
 d5FG88bLfpGSQ==
Date: Wed, 31 Mar 2021 18:31:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v2 7/8] dt-bindings: phy: fix dt_binding_check warning in
 mediatek,ufs-phy.yaml
Message-ID: <YGRyjE+CjkJojqBM@vkoul-mobl.Dlink>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-9-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319023427.16711-9-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_140107_668878_C2527242 
X-CRM114-Status: UNSURE (   7.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 19-03-21, 10:34, Seiya Wang wrote:
> This commit fixes the warning messages of make dt_binding_check from
> newly added mediatek,mt8195-ufsphy in mediatek,ufs-phy.yaml

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
