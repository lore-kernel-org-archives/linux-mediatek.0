Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078B2C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H/zL52hhCnUGzovduapx4EW0o79DEppCWI2HS6yhhY=; b=rR+eUsM/xAJ6wfbjH1/ECsx9nl
	aLPKRk/5uy7G3TK8gMWfld6jzBwqxIfySA6PslUTSpbK8vPl4cu7zi5BqcK7+h9yVGUqMObHOmjhE
	0X1fts3rHMMOUUQXf3ICpMZXc2vJI+SkIAyCH9tZWkyjdeN56WdqxtpTg0E7Af8UkMW9BuhuQOGPP
	XIepwTRWJEHOVlK60n6DHYfW5hLsMSi2QBHDT+mJqBNl4JNM6HRuxZNrWL/ja6lg6+lJ+lwvfhMss
	2mCZdMFewdKlfIqyDREgqeihC4l+vWMxXE7b3ZeoRZjxyrDUy41ysk1cLfxDfcyHL0MXv1rJWApN1
	msllZGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAMb-0000000DWOA-31MF;
	Thu, 22 Aug 2024 16:08:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAKi-0000000DVrF-1R8R;
	Thu, 22 Aug 2024 16:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724342797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OhKSG5vD8zTqFxCWiUl939PMcq1y48WA22QvvGEuDbpgijj5N2ppSwWR4N4F2Rr+30HtzvJSK2cUgdlddAXK3+aGm7Y1N9znVNNbl/aZydonZeTHopWdaBhLN9ncVlHV2ljQAuKOHgAPTWvXJEPUn90+uj3IgACEFeyO62ULfww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724342797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=87tmlEsafAzofaY1NSGv3qtcgJLjPPfLzmQEl9/8F0A=; 
	b=jhF31cqoR7O8s++GB+a2HDMnjCnOQH9ETIcdtn3PcjmlesTGzGbdCtPyYhdDtQ9H8gt1YqniUSjEiZtmpLgnLfdWJp3YdG9eM36wEt8yojHSxDg9FKIWRd6YtQ5nUtFWtutv/kf5XLj042qo/8NWTUDZBs1MHkAAAOp/SCq8TU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724342797;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=87tmlEsafAzofaY1NSGv3qtcgJLjPPfLzmQEl9/8F0A=;
	b=IiOdQCtl4ydhm6JZ17+vy+2AW34dFmBecENcFxD+RkyMDd0bUHMCglExIoeTChTu
	lphYP9EC7nOoXwTf/9xC3ND/TOyvdx9JE+mmrdxrHLPPWG4+UENuRMezwCIvR7XHw2I
	85qNfHVQ6eb2WS8Bt+WuLi37hlCMKbWAVEOKa7Aw=
Received: by mx.zohomail.com with SMTPS id 1724342794590410.25595519500223;
	Thu, 22 Aug 2024 09:06:34 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:06:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8186: Add svs node
Message-ID: <545e9e80-5b38-40f5-9a23-ff5112b13917@notapiano>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
 <20240822064650.1473930-4-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822064650.1473930-4-rohiagar@chromium.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_090644_453387_2197EA5D 
X-CRM114-Status: GOOD (  13.51  )
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

On Thu, Aug 22, 2024 at 06:46:50AM +0000, Rohit Agarwal wrote:
> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index e27c69ec8bdd..a51f3d8ce745 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		svs: svs@1100b000 {

There's already another node at address 1100b000:

		lvts: thermal-sensor@1100b000

You should set the starting address of the SVS to 1100bc00 and decrease the
iospace for lvts to avoid intersection. See this commit for a similar change on
mt8195:
https://lore.kernel.org/all/20231121125044.78642-21-angelogioacchino.delregno@collabora.com/

Thanks,
Nícolas

