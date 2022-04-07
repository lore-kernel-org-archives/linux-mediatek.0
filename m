Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB9AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=di6aUZ6NWBg9jwrbD8yWRRCcnzbW0df2ZqZFZYYQUbI=; b=ZkZB92DVcS1dXV
	CLqHaj+bftCcK2td3DDp/pS8MG2rQ3lNB9ZbWxarIBvcJUN5n+pGzSRn+wUBsruj/tv9h2sgkOsrF
	6X7gkdoAcfNUTR0oo4g9xr0H4pFSX61sC1FzBG9enHhWaS0Fm86Q745R5ZoywXomW6gs8xyUIEipV
	hVRNTs8Vr93r/Usdu5bEVRmlFTGCX/j4x1T8GaPkHZbDEcjtKHR8wyloxq3UL0IA0I/kEj3xrqmyz
	8rZ8WCtAr+wOiCxSm+GjERQAg/ftEONqg6nVM1dVZJmzfK5YhdAhmzY3zwbyC4IJYOGuLXYpaBgXY
	9rEl0WCZJXqGaMFC7dLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncZko-00E8WU-Gk; Thu, 07 Apr 2022 21:33:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncZkb-00E8UD-Jp; Thu, 07 Apr 2022 21:33:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 1897E1F40E5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649367188;
 bh=8GlPAfGYieXFDHwj1kt1VOOH/7K8TRIq3Qg/GHUoxL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eXzCjkyebsDGZC5jw5o2VqSrkIcfotEzXyaJCHcVoCGm6aDc0rqbcBeP4iC4zg1/m
 wbUx23L7T2YosToMSLzQgzClQ+mXQg+W+JLPDH7mPSMgN/P4qJCFIthSChXS4wnP4s
 D4+1x90dWcwtI6ORq3fxvMaM9IExI521e5gY4OKJg25pDlPVzS3kkM1J/9VC4bMaiP
 4LulHZB/vFJZgfD3l/Ec6wty6zzmWN+Tr5xPeiIBU2UeRM40DMdGtsZNnIGIczQofL
 IFI4+OKOhF6pRIn53GMM0Lulrx7nsQTJE5vTgdFizl9dubBZKWFPWqbqRN+qznSJA/
 dFD97YB0WAKHg==
Date: Thu, 7 Apr 2022 17:33:01 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [v9 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <20220407213301.wsm5qvtxgtkehj27@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-4-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406100514.11269-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_143309_822884_41BA90F0 
X-CRM114-Status: UNSURE (   8.94  )
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

On Wed, Apr 06, 2022 at 06:05:13PM +0800, Jiaxin Yu wrote:
> MT8192 platform use rt5682 codec, so through the snd_soc_of_get_dai_link_=
codecs()
> to complete the configuration of I2S8/I2S9 dai_link's codecs.

Likewise, suggestion for the commit message:

As part of the refactoring to allow the same machine driver to be used for =
the
rt1015(p) and rt5682(s) codecs on the MT8192 platform, parse the rt5682(s) =
codec
from the headset-codec property in the devicetree and wire it to the I2S8 a=
nd
I2S9 backends.

> =

> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
