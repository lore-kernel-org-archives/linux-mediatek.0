Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B75AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTUhLgK9jlweIOP0PNxm9sVScOpt+FKoA68t76ZDdqk=; b=q10QnrpgNo/D3Pi99MhoaFmZvl
	5xtALhUnIGAyp0d2iUutFZsPmqIpzl0k34Yq/crjkMCUNgEI94j/ljyXz6cu3sK4/yThf/B/em3an
	u631YXgSSQxMwueU2QMaWNZ2G8jiDLbzDv3Gda9+O5boPy12zYYYqr2sBYtthiFmD2DP8htzNV6db
	24y7zLC8RMpDlpGBKHR59SZtaguYHEB7eYGW4RL4S3ajNYL2YoWzGRxR9WZSFO+xRm32dL6vIc6QB
	KxvG30vUO1/Bk8RjLy19XQnuyZexl2qhOrdU6kPlLaD0QLMlrFV1Slv51e8W2eS8Rb2AO2ZpaYWJ0
	/U0cqIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKCz-00ECbA-7s; Wed, 02 Nov 2022 20:19:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKCh-00ECPI-1l; Wed, 02 Nov 2022 20:19:18 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4828E66028C5;
	Wed,  2 Nov 2022 20:19:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420353;
	bh=IxBxYLkllFHY1VeHaU1jFaJjbbRQUrXzekE6Kx8p+Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J++q28SWLyuojaBLnULuhR4mDTRp7d8R7KUH94ZcE7ItBoEhHaBYvA6DnCL5kGQuB
	 23fdoZhYd6T+aqI0YqxJunwV8/I/hwIDQ/tqafdeUy/uwS2m+73y+iollBOTaZdeZp
	 tY6dzEx8XAB+xOe40N+FTjgoYvTK75nupKPRlIStnWf6wRn+nFhN3U102hBzkIP8O6
	 rBocZo+F1wVRvEqXl9bx85D5oNMR0blt9nLtRWSA4qGb/geCPYR+/rmntBtyKKbfrZ
	 u7S2yyFORUH19nbRkPIg8RASjT8m6/TFh9uxZ+aKmI2yvVTtzpD9XIYeP6mwL7rIjW
	 GuCRBu9mHKZiQ==
Date: Wed, 2 Nov 2022 16:19:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/7] arm64: dts: mediatek: mt7986: Fix watchdog
 compatible
Message-ID: <20221102201909.zs66mpoyjjbsp63j@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_131915_261770_D644462E 
X-CRM114-Status: UNSURE (   9.40  )
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

On Tue, Nov 01, 2022 at 05:01:12PM +0800, Allen-KH Cheng wrote:
> MT7986's watchdog embeds a reset controller and needs only the
> mediatek,mt7986-wdt compatible string as the MT6589 one is there
> for watchdogs that don't have any reset controller capability.
> 
> Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

