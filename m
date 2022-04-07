Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FB4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 22:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddI03wnq3sT8T+U/5wLNi1FUsbHIfZn6IfbU2SFf90Q=; b=mc4RftjO6fSHZQ
	pBva+0n/IKZYLO3Y0geFNwxNPHCpv9etUeNZEOWzDYeVQXIsOkhwgZ4jy9qAWSzaC1avbuZazqZSa
	unL8wfMQ5FRB9gQo+Pg+1QorTHp+u7dppJjeskOSQ+BQ8AKnDhs8axdvRdD2bd0OuyFEIIRuHSI2W
	TlNddxnlOqz2q6sAhgSV9f2g7hx20TtQDHp5OmM4vy9z4kiiw6SQPzybbeE0J7mZ1b54FPDzJawTh
	UvGQUbrLiVa8pNFVFbPz9RpBng0sP5+1yC27DQloE1NuOVVI1Bod53tE7XumUhZftIwSBE0QFMm/9
	ZUHsWEmQpggsXIp/+A8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncaEK-00EBk3-Hk; Thu, 07 Apr 2022 22:03:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncaE8-00EBhI-IC; Thu, 07 Apr 2022 22:03:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 965F41F41F77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649369018;
 bh=7REwnRCWL+X+/erOVACD0vx8O/QM9s4GDT9qZ654vt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvM/2hwlOx04mVlDKKzyF4XI6AmYyyNtmpW5+LxeIgJOFPind/vscDXxG1ZUJcckX
 yhppYDiGwrNHaK2i+k+q1+Y7mUOBHPi7+tabnHQtgo3eaaWr2zGISidJfpleXo3XK8
 EUPUvNFoyelpDOLXbHz0nJfjw3we9J3Nx5WAmA5590UEOAHozbz34rWcKtof5A3Vi5
 BjNU1oTfFgv0lHK4CNQq16YAnOmmoTEsZqK/B79nWawlc1V5QR/7OxFkoZ/NlFYoWE
 Bn1R2mZ7u9w4aMGepLglH0twlvSnhdL6+uQKkmFhhYv1jP7BKcV/gt7WJUuCdpprvc
 wE60jue281WFQ==
Date: Thu, 7 Apr 2022 18:03:33 -0400
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
Subject: Re: [v9 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <20220407220333.v4enuv3mqzyrawkb@notapiano>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
 <20220406100514.11269-5-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406100514.11269-5-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_150340_849506_2B94DE24 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, Apr 06, 2022 at 06:05:14PM +0800, Jiaxin Yu wrote:
> To support machine that only choose one of the rt5682s and rt5682 as
> headset codec, adds new compatible string "mt8192_mt6359_rt1015p_rt5682s".
> Meanwhile, using macros to simplifies card name and compatible name.

That first sentence is particularly confusing to me. Suggestion for the com=
mit
message:

Add support for using the rt5682s codec together with rt1015p on mt8192-mt6=
359
machines. All configurations are shared with the rt5682 codec variant, so s=
imply
select the SND_SOC_RT5682S config to ensure the codec is present and set the
correct card name. The codec will be linked to by pointing to it in the
headset-codec property in the devicetree.

While at it, also create macros for the names of the different codec varian=
ts
supported by this driver, as well as rename occurrences of rt1015p_rt5682 to
rt1015p_rt5682x, since they are shared between rt5682 and rt5682s.

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
