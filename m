Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A49C35274
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4K8442QxOmFogpNlxqkaIbX9yD3X0i5cwQZ1OMszqQ=; b=378idNHO5bC19xvz8xKXHjNwKZ
	hbhnZl8RFi20o/IzpiZx3ezuofqmGoX2WQme+EnsZi4d9IhZVVkxiPvpq7eTJmnV0GmewfGFEMMrL
	1qCFbbuhojIZjkJKweKjIrrhDPEX+2MOb5Fk8iazcoWkE/M9fp7M2DTKGyIo230NZRlIbLv1DwPaw
	/PJlLB4raKef1TpvXHogBhYE/ynUxTmTeucG6Bo0npB/nU8h2HnLsRNPptIrNf1hJqIqtHWpyPjbh
	+Dm9LLJTdP2BpaMZ1NeCRfFkL2YWOI+47s5Jg+6amuwpzfbobn+UQn35O3OXhir/xcA/pMO9rurAH
	QsgoQSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Ty-003GSg-0R;
	Fri, 15 Dec 2023 12:39:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Tu-003GRb-1M;
	Fri, 15 Dec 2023 12:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98339625D5;
	Fri, 15 Dec 2023 12:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36F3C433C8;
	Fri, 15 Dec 2023 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702643993;
	bh=WCwkUfGneDdEsgyaN5oZ8zIYVst2kezCHOcj9c+nyWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igWRNlssctqmH8PVEui0+PkNrsBgWdT/exRLQ46Y2ZU2ZjyFLs5y9uwS1ypy4VWrg
	 NJxbo9lxe6K1OVORMMLuyAHXS4YEzYGm88ZkVHtlgtCBi4qZJlyHwDxQkB190GnRbM
	 auv0ZUSODWdB3arfVDUg3sEgkUoaq2MBIyP4MAuA=
Date: Fri, 15 Dec 2023 13:39:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v2 2/3] usb: xhci-mtk: fix a short packet issue of gen1
 isoc-in transfer
Message-ID: <2023121539-dowry-ambiance-51e3@gregkh>
References: <20231215073431.8512-1-chunfeng.yun@mediatek.com>
 <20231215073431.8512-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215073431.8512-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_043954_502780_29EF9D6F 
X-CRM114-Status: GOOD (  19.38  )
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

On Fri, Dec 15, 2023 at 03:34:30PM +0800, Chunfeng Yun wrote:
> For Gen1 isoc-in transfer, host still send out unexpected ACK after device
> finish the burst with a short packet, this will cause an exception on the
> connected device, such as, a usb 4k camera.
> It can be fixed by setting rxfifo depth less than 3, prefer to use 2 here,
> the side-effect is that may cause performance drop about 10%, including
> bulk transfer.
> 
> Fixes: 926d60ae64a6 ("usb: xhci-mtk: modify the SOF/ITP interval for mt8195")
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2:
> use 'rx-fifo-depth' property;
> add header file 'linux/bitfield.h' to avoid building error on some ARCH;
> ---


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

