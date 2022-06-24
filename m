Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNfIZwMKHs/XoiiOx0slf44POK2mxBjIKD/crO5RjL8=; b=OZI/AxwHz+VeFQZhQatg/S9R/T
	nU7WZLfCHBjJ+HyYcTFuxkvLhD7oLhwGExMGPaVWL7vOy92N7micHLzNtZ5sicvcRo3rSNxCx5Non
	yfohMkA8ys5z2bTp+aYeoCc9RUb4v9COYIB37ngdIGE9LtWdmIut04tACgs8qKZpnFBoN+fPfi1Q9
	cLCatbHtenzY5r5tGPy1V4aaxWXRdMjYmH/HhH3CAaYu/AkpfEPT763iB4UUE5E1NoKNYW9kYn9Cx
	3dtfUXHzJ95FwE9fVOIvruyW+93g8KylxVY/dMgYf4CPhSxths4A/05oLKYceK91uwWe1AsTz0noU
	EQVRxmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lbx-002v6b-EZ; Fri, 24 Jun 2022 15:52:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lbk-002v1U-W8; Fri, 24 Jun 2022 15:52:34 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EECA66017FA;
	Fri, 24 Jun 2022 16:52:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656085949;
	bh=DgfoNJhSsryqfplIgapwVlrJl8IUXtflN7RQAeVipj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRcB9OTSGwTrzCzogGYid2DA7CbLSkQf0DinQj+He0ch53qch29VhNLuAvYoinfW9
	 OTtnD33hlk+VKIZG7Wtk2f0sJttrOgCLYU5kqkATYdDs9pnpp/nwX7+AZ+hX2fUAWD
	 1ssL0Hn2Fe0kVs7GLy8CNzY1I+ootvjrMHWEcGjgYar4i2HiZx4djX7SHdLkPNlTCo
	 3Yk2Iy5CdOJ9B3fS4IldNxuagX2/14WxtdqrDLXv8gwMW/UGkQ1z3G9Il3jItwdWMZ
	 3nYMAjFFh7XSHsXI1fVveaCuyrhuhxZi0Kr1e0nUbKOXLN0afb4gandBH8J9pERLXm
	 hp/wdkGLGXC8w==
Date: Fri, 24 Jun 2022 11:52:24 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: add generic driving setup
 property on mt8192
Message-ID: <20220624155224.lizeca5rnruhihdn@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
 <20220624133700.15487-2-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624133700.15487-2-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_085233_220993_F1BABFA5 
X-CRM114-Status: GOOD (  14.65  )
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

Hi Guodong,

please see comments below.

On Fri, Jun 24, 2022 at 09:36:56PM +0800, Guodong Liu wrote:
> 1. The dt-binding expects that drive-strength arguments be passed
> in mA, but the driver was expecting raw values. And that this
> commit changes the driver so that it is aligned with the binding.
> 2. This commit provides generic driving setup, which support
> 2/4/6/8/10/12/14/16mA driving, original driver just set raw data
> setup setting when use drive-strength property.

This commit message is a bit confusing, I suggest using the following commit
message instead:

The dt-binding expects the drive-strength arguments to be passed in mA, but the
driver was using callbacks that expect raw values instead. Change the callbacks
for the ones that operate on mA values, so that the driver is in accordance to
the dt-binding.

The drive-strength property requiring values in mA is the standard and other
MediaTek SoCs of the same generation already do the same, so this change avoids
mt8192 having a non-standard property.

There are no current upstream users of this driver, so this change doesn't cause
any regression.

> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

