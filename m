Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3339C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEZXzgndfBib0QRZELmnoO/zzw1ProQpwB2Ta/DGik4=; b=siIUPB2yC/lnPKOmyJEHy0dlrY
	v54ooftvxwkmHCFAK7STa6iQ4j5XCICD+Zb+fyiSlc3IlzwfZIGgrP5bYLdGPAk4vhK96YT/M74bz
	fFUUxmG3FvTMbaYSkrRu9/pkU0AsqLUZW1c1OJWyRP3tNm/iTC3v/1Pof2nl8wPAqEC1KSuhWWaJi
	Gg5CsIwHhCZJj0hnpgV6z31/BUQNkRGjYuDXlYd3LrkoFsPycOdyjeUqNerGrZiUc7bqolz2V3pB1
	PTqluDFQn19kXG8NxePmfeicFdk9K9uN6it5IeJkua2WtBkXyHGV8vgX9PP8eCbng5p6JQPCaIq/R
	Rj1deVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj3a-0000000EUXO-0SS6;
	Tue, 30 Jul 2024 09:22:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj2k-0000000EUMB-1lWT;
	Tue, 30 Jul 2024 09:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722331277;
	bh=FA/UiuJmaG/0m1HKe1f4r8URUvynzRUD987l4lNhaGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ap9kGuPraYlNzIGlcqUovaMUjtN8M5j8QrbITHjdVKvG4VsXgVP9xeruhmyuflNkx
	 Tq8dNkCqWWeI/eVCVAAcP7Eue5e6xQiIC5gDb18a6hFiEDSU/c8tAYdZjFQuKLe6Rw
	 M0BtUXGQB2VSI6CI7TIbrhI624bTA3bY4Pat5q/GYq347IYesG9Uqxcer9k2zP7tMk
	 P6bFjGW9uumighprO8neBoVe6BWT9KK4V50TFaGWyVjQf12r+KS1y6n0bOLh9VlTJv
	 yOif8LPZsqxPTs0n2/MdhXLJsQm5DVuGAm9sWpYFViBw8RK8YG8vXZHBsydQKTLr4W
	 Ip+NT1wszSV4A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 573D83782190;
	Tue, 30 Jul 2024 09:21:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20240722-cros-backlight-dt-probe-v2-1-d77cdf7018ec@collabora.com>
References: <20240722-cros-backlight-dt-probe-v2-1-d77cdf7018ec@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
Message-Id: <172233127627.66997.14875341590066505765.b4-ty@collabora.com>
Date: Tue, 30 Jul 2024 11:21:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_022118_608277_39D21253 
X-CRM114-Status: UNSURE (   6.29  )
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

On Mon, 22 Jul 2024 11:34:25 -0400, Nícolas F. R. A. Prado wrote:
> Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
> subdevice") introduced support for detecting keyboard backlight
> fuctionality through communication with the ChromeOS EC. This means that
> the DT node is no longer used. Remove the unneeded node.
> 
> 

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195-cherry: Remove keyboard-backlight node
      commit: 4c03a44e266887190bdaacc7010970ae2b26b852

Cheers,
Angelo



