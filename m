Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48586C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFJDv3ocDvu7BnOgVAbrKHUtBTyNzMiUUIRc5iVfwAs=; b=e0XiuaUh6myLf/
	fwcxVILt1BciKNtHPSLfML5fapVfcq8Roz1XulwQs4YKU2TOgIza5pz4QaTj1JE0yLdSmZRH8TCyr
	MjrvsXwdX4PZAZ+pzWruuRMTVmrFzM/ep676k3BFT6BPureLaiZEqWNYp+IFcwd5HHmXskH/JgIXw
	Eh6T5sUX3fa8bPtcJT4l5UZkh2+7zfIU6WAFsafDSko0I6+RfLofZ7MwwshbWySp9qfM6lyyFx6C5
	O1K1eGshB8l4xAyza/zXKSD1+7P7gmrr9fXY4xy2Bz/oGJpVj8yNtxhK10n66k0OOiYQgyjSrY8zw
	NC8jzvtjzpguJaQY7EYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncaKj-00ED69-8m; Thu, 07 Apr 2022 22:10:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncaKX-00ED1g-Nq; Thu, 07 Apr 2022 22:10:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 78BBF1F46A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649369414;
 bh=gBmyi6WpjYRqp8rOwRWdLr6uxk3Fb3AIfix85A+GbHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8qXB9Z/vpMHT8OX9TLKlXvyZenUwkBuXRjgc2ThZiWsJCS/hWCF+l3F7qBXM8cAY
 EshP6vwOeD2lPBnaLXIEWGoW56r/ruIBM1VWI4X5loYETqG0r+sUx+1QGp9XFutv2y
 4DqjcC1cQaLLS6lc0lTTP5zuQ9z/lNCWxqdZik9vGxf3l4ajIk4NR1WKDzT+ZR3JyM
 5jrtsVwQ8s3OxSgYrRmJ7ZlibO0z8gNnxrXCIbsApIH8Oz4H8v2I7FE2ElZG2Dxi7O
 YJH1tAwfrRxEBO+vOnkhURB3zL7JlKRfN84PxReBH6Dn5MpzRhYxNYkAWPKgWOHnNi
 fndHj0tpEinTQ==
Date: Thu, 7 Apr 2022 18:10:08 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh@kernel.org>
Subject: Re: [v9 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <20220407221008.5rhd5s2m5n3o3xmf@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406100514.11269-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_151017_945460_798DF148 
X-CRM114-Status: UNSURE (   6.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jiaxin,

On Wed, Apr 06, 2022 at 06:05:11PM +0800, Jiaxin Yu wrote:
> 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
> with rt1015p and rt5682s.
> 2. Adds new property "headset-codec" for getting headset codec.
> 3. Adds new property "speaker-codecs" for getting speaker codecs.
> =

> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
