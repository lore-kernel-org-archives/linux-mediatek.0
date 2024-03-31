Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3832CD1284
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Mar 2024 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1WdIYmDPtY1FTrhgpULK7tOKrGrAvCVnwsv9uNfoms=; b=bqkQpHeY/lwkh0hcJwcbav7ccS
	gK66rqg9AR1p+uI132d3mbeZ9GR+DYeOEutQXFt2cv/T2Vcui+bMaJMV0y6GblLt+f13mFjlkTpDx
	1TOwSemD2n/n4KCTpt1lTlPGsuim6e1sYtbJqB2ifZPMpBDJ/08XSqhgeTq9CK5ghekPQ9PI9F49r
	V5APitJFtH4wXjEJsizpKQH/0iOyvps5v2+bRdZfiXezRScdLOuKTc4ahTIEmOju2dslFcpWdjiu9
	dyqZH1NK9ir8UIAzdwcY31qcr1Yo5y89Z5DgW9bDoXImMV7vDMzd2msQtDY+0gxivX7q0Rl81an47
	XHW1u3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr1nb-00000006Fn6-1yag;
	Sun, 31 Mar 2024 20:29:03 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr1nW-00000006Fk5-1edM;
	Sun, 31 Mar 2024 20:29:00 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DA8DD1FA4F;
	Sun, 31 Mar 2024 22:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1711916935;
	bh=W1WdIYmDPtY1FTrhgpULK7tOKrGrAvCVnwsv9uNfoms=; h=From:To:Subject;
	b=yYKADDy6gHK1jSpdNY4CXDG/jkfpvK3H5NM7GgLm5YW5ENNjcdedzPI1b64Guxn5d
	 DJ1ZAFAxyF0FGp8ObYSu/DlIQ5H4W3vDWrmjl/v1CLw5xpHesE/yo93ict+NGnZE8Q
	 R69h7iOswshVZb3kQVx1cwikpZSgUNqZUCtB8oMGKQxgNHEMUurVwqIGfk5YGd73nJ
	 w2HMtUPvPTAUwSdk47L6tnFvtJEOsBL/w2KmNnsEs4R79fO7+twxy6ZDRxrIzsuVsW
	 M05beiAyPViRJq8sNPDUY7a+Ti60TX8A7C3N9k+hVXyQw6l15Gw5iDmdm2AyAMj6/M
	 44lI24y91X01w==
Date: Sun, 31 Mar 2024 22:28:53 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Brian Norris <briannorris@chromium.org>,
	=?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH 6/7] wifi: marvell: mwifiex: drop driver owner
 initialization
Message-ID: <20240331202853.GB4116@francesco-nb>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
 <20240329-module-owner-sdio-v1-6-e4010b11ccaa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-module-owner-sdio-v1-6-e4010b11ccaa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_132858_674840_CC0A2AAD 
X-CRM114-Status: UNSURE (   6.02  )
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

On Fri, Mar 29, 2024 at 06:24:36PM +0100, Krzysztof Kozlowski wrote:
> Core in sdio_register_driver() already sets the .owner, so driver does
> not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


