Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1939C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 05:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/H8ZH5cCurKQ8BQRm5x3d74U9mlF3EMQATdNzjS3U0=; b=eS8qw+uUVLxzyXrqggAH9Zo9WZ
	l9A7bI860d+hbx/OffcdaOzvvmj4u/elDpUrWYPUykKaXsG6xFeVlbEzZTfSyMhKiMWck7VnLrwN2
	5EC30w9I0nRWPdyk0p55zk8T6oH8KaIBrZ/mMpA7T5tweOGS8V/BTg5JVt+m0VN2axaAdCqAoVXgt
	1H0nM8FQvbvaYOnCzWJRZXrRvOXpcbjF1DOcwDlTIH054lP/YqjVA0f+LAQjDQtCreJl6tWSSHkJ3
	QLCpnrWSeRS30HeffiOiTezE62nhKrYgh3J+QNQZUq1NgA7mZvkcnm8h8BQJw7NaW9iaOwOAD0dAy
	fwYQeTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1EJ-00000003XbB-0QFu;
	Thu, 22 Feb 2024 05:02:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1EF-00000003XaZ-0MGh;
	Thu, 22 Feb 2024 05:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14270CE2129;
	Thu, 22 Feb 2024 05:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F1C433C7;
	Thu, 22 Feb 2024 05:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708578155;
	bh=V/H8ZH5cCurKQ8BQRm5x3d74U9mlF3EMQATdNzjS3U0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EtQRxNMTek721ifTOvr80UuXi/VVvCszQwwcPClFgnqTkUn2ZyvqNzu6xTbhyhoAP
	 ZCjAxhxqTaeNrGH0dKcuQPzhdhV6JLAUbiPUlij0l6lqu38AdIWGqSQ2pn9DscqTa4
	 nPxHrUcfdnelyxZxmmpS5bH1Hl50GaJyFqsgT9FHrMaNHQWmcaigMclnVucGjIHcZh
	 ucYG08V0p4U3n7kbzhmr1+Ygr3QKbYBiSkauVqIweqWMu/GFxKyNNEDXsg/KaGeloR
	 sG9PbyN8wHjl3ADNsUMiTHDRbKcpaNVvIzwinp+8FWVVd86Tm0A9ssjWoRbAlswC85
	 AOvfpmEQB8iPQ==
Message-ID: <d788965caa6347c989c1cc6f9d20d48e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240201182409.39878-3-linux@fw-web.de>
References: <20240201182409.39878-1-linux@fw-web.de> <20240201182409.39878-3-linux@fw-web.de>
Subject: Re: [PATCH v4 2/2] clk: mediatek: add infracfg reset controller for mt7988
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Feb 2024 21:02:32 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_210239_327205_33AEBEED 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Frank Wunderlich (2024-02-01 10:24:09)
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Infracfg can also operate as reset controller, add support for it.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

