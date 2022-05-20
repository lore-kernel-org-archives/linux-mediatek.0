Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BBEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QissCHLI1zzHOpH7SEP5pDR4dM58lMjUF+w9de1XaG0=; b=nBb3vy9DLWTAho
	XCpcRFXWyWZWuu1vOcqCvgka/CdbfFCAjmZAg4QPNHqUwoUaMudn5iSn9tZmsb9RsxNHripD72ALl
	mxocudaTIVLJHTH3ZjkRCcINR6dw993XKA5QNPoTLxcSrcj5KFGZIKZtBZJe581jMtLyQf90EBJTm
	tUDPNi478Ukj/iISlpD8KsCqx83VYSiOZZjAgYferN0aNGYxb7or5kUlf1h482KEueDDPw0LX1R+C
	j+2bJ85mjmtBIVMHb4e0yAXmWiMT798wQRqjJmXDs0cInwiLrpJ0KqlW/hqH29yb/GhRnMPweDwUY
	S5Mwsf3V2bo6qsn9liFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4PH-00D88X-UU; Fri, 20 May 2022 15:19:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4P7-00D863-I8; Fri, 20 May 2022 15:19:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 5B1971F46586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653059940;
 bh=YQ31OR4ZEDVzd2CcVyEsIJ0oD9usN7dRjGllBd1TqMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9k2T7C3tWF2Q3ecHJRuck5leEQwLkSwMo5DGMerg1mS8Fr1EogfPo6jonnSsp4g7
 Xw/fpwTKwWh1esgVSCvVPbiZTYPUKvdEDFGGTZ6wvbSRWULRyV9d6KMSqc5vhK7GUZ
 URBfBdk9fvBJiiMUTml9XZzIW+It09ZGGGev+NcCA6uVo5/B10pF6kU3JA8nIoZPNQ
 R5aQ98ClKg4IaWUZHu8WvxcXjOWN3SPxm942NPVV1Gh6ynm+Xc1T+iytkEIiMtyT6G
 ml7WR6OSxIvUhUcjkWkYci1HAMrMp6UHqOJRwIcj3BWXnEbBfC9UCMo1DIwqkQhF17
 HkK472iVQYwtQ==
Date: Fri, 20 May 2022 11:18:54 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 07/19] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
Message-ID: <20220520151854.kkr2tezmrfniks4j@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-8-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_081901_772242_E8510A44 
X-CRM114-Status: GOOD (  14.31  )
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

Hi Rex,

On Thu, May 19, 2022 at 08:55:15PM +0800, Rex-BC Chen wrote:
> The bank offsets are not serial for all reset registers.
> For example, there are five infra reset banks for MT8192: 0x120, 0x130,
> 0x140, 0x150 and 0x730.
> =

> To support this,
> - Change reg_ofs to rst_bank_ofs which is a pointer to base offsets of
>   the reset register.
> - Add a new define RST_NR_PER_BANK to define reset number for each
>   reset bank.
> =

> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

<snip>

> diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek=
/clk-mt2701-g3d.c
> index 9cfd589939e5..5cbc5c42204d 100644
> --- a/drivers/clk/mediatek/clk-mt2701-g3d.c
> +++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
> @@ -35,10 +35,12 @@ static const struct mtk_gate g3d_clks[] =3D {
>  	GATE_G3D(CLK_G3DSYS_CORE, "g3d_core", "mfg_sel", 0),
>  };
>  =

> +static u16 rst_ofs[] =3D { 0xC, };

Very nitpicky, but you could have left the hex lowercase '0xc'.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
