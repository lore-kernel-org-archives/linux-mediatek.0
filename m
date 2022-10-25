Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E920C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+ancf2wzKVgZhIR1zetpELJHo8pX+zT23hmRzLhVa0=; b=tkshmSn7bCmdOFGvKtckS2Hv0p
	CEf8BULwvrX3bAoZ75lLwxrgnWMWYPp9/Pm8JwITms6zZVT1S0Jw/cOvTKv8hsPeuTjW4UlR72L+5
	psNWuwE3pU0vO95mPNgdME7S0M21ZQ2JKeupI9fh/OAzfwZudql6HJGbLHTx1chShR3efyrgKBFPy
	YSypfbC+I+ukNQBmcM0rRVkomC+sDp9jNG3a5CPH1xMYJX2Yvqd5T9SvOehGWdxvaFEtCSwvzZk7R
	jRaBIfHCt3gf7/GugWvbxVTjrK309iQqG46eK2nBXDgNNrWJMH3z0ycYdBwzfNkRJTOZZ1VX40zLX
	4sBW4H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onICM-0050wV-Un; Tue, 25 Oct 2022 11:34:22 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIBs-0050j1-Nv; Tue, 25 Oct 2022 11:33:54 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 29D1541ACE;
	Tue, 25 Oct 2022 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666697631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+ancf2wzKVgZhIR1zetpELJHo8pX+zT23hmRzLhVa0=;
	b=NsW6nDG1Xn6VMNRS1jgiNdi2iDX84NesJgDr5ju/njAmDLJACoym/JduZ8Qxp9gOK/K4od
	i7ycy9+lTFKgFeEBEQE4Xccm/l13NZmpYTVw275G27TbZEiE4hBxAgyIFdmlladRB9Zni7
	l6g5T4sXGJvk8d2vNG7XklIsJCTBEgw=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPA id 5F4AD10031F;
	Tue, 25 Oct 2022 11:33:50 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 Oct 2022 13:33:50 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam
 Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: mt8183: drop drv-type from mmc-node
In-Reply-To: <3b366319-5257-a536-4dba-919cb5fdf477@collabora.com>
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-5-linux@fw-web.de>
 <3b366319-5257-a536-4dba-919cb5fdf477@collabora.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5ccd67c45c9f384296bfd1f19dd019a1@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 944cef20-d0fc-480a-bfc1-5ee2059ae4d4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_043352_957166_BE689726 
X-CRM114-Status: UNSURE (   5.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2022-10-25 12:52, schrieb AngeloGioacchino Del Regno:
> Il 25/10/22 09:42, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> This property is not defined in binding and driver.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> This commit needs a Fixes tag :-)

i hope it is ok adding it here instead of resend full series...

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")

regards Frank

