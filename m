Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6445BC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dN7ATaEg7ILmivFezfaFixDc5hkSkFw3c2UWBNJB4ko=; b=Tb+5QN12QGP4W1QytOHECo0pG8
	VZ9gLIRbKO4Bn6/BVHtGOdEn1Mt1dl/GXg8mxLYL4v5H4DW5Pj9jfi9+X6NhTDoaUWes7IaUaCpDP
	OKjD+a6tvwGcF4aUs1vngGYEQ/eR2Wvjq3/uK45gM91ZGMgnDQ6PikU2qerEhzgrc3NhQ0FpvkkiW
	u39SgSj7fLnsKCdjIehfa/eIAQKLj9d+2mme+DN/bsg7ox1XbRSg/J53lzW2nAJh3FYy2/8Ehwvn1
	5ohQ5KwSjIGWTo06WQboVeCXlllaog2ZY2AAHZzjK22gpyydl3vaCFax8GumhDHOUcM4ntHrlHTqf
	ybcLK/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2sh-0000000AQZH-3dBJ;
	Mon, 19 Feb 2024 12:36:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2se-0000000AQVG-2qiW;
	Mon, 19 Feb 2024 12:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708346179;
	bh=Z+VCUj+P51+feGqkafHO97lvAdT97kUE6BEl9CA8Xe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDzM2UQCSH6Ufq0AHo74hyY0MFzQA7epV1lt440ufl8Vip3qViDWLHImekeeW03PN
	 TijyF6ZxLxrzvQWmCZS49OJ8oMCppaH0EdBjGtGmilFOphp5GK72v+5NVDFqhUOgjn
	 9cXgM6sOBcO5EG7ITbKuyc+fdWGyfN1+rzoU/UHa6xs5h+01HdpufXRsLpkQ7JSQcT
	 8R/nPGiTVh6THJJOtxTSA3sAhHITzlkAFpIeqjlEWCw1DsWuLO/ygLY7DgFRZLSLx1
	 iN1NyvBPKD374LG5z5+qUD605z+oFMcRZ6sdERFQFu3D8ycY7uu6ZeReok6F9CIQQ4
	 HYsVddxq+7Tsw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7478937820C1;
	Mon, 19 Feb 2024 12:36:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@google.com>
Subject: Re: [PATCH v3] arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow
Date: Mon, 19 Feb 2024 13:36:14 +0100
Message-ID: <170834614185.140678.1878504560854372421.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org>
References: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_043620_877953_DD1101B9 
X-CRM114-Status: UNSURE (   9.07  )
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

On Wed, 24 Jan 2024 07:51:57 +0000, Hsin-Te Yuan wrote:
> The external output reset signal was originally disabled and sent from
> firmware. However, an unfixed bug in the firmware on tomato prevents
> the signal from being sent, causing the device to fail to boot. To fix
> this, enable external output reset signal to allow the device to reboot
> normally.
> 
> 
> [...]

Applied to v6.8-next/dts64, thanks!

[1/1] arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow
      https://git.kernel.org/mediatek/c/ef569d5d

Cheers,
Angelo


