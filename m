Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07498C07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gz2H4P54Jh41GE3tsYdwSVJFh57E91o4vRPxZrb/Xs=; b=CqBSK+9AMZI6ovm72T13+1D7JO
	ZLibnnuaYvU/unDkbSmfpNzgfmPXYW8d6HQf+1I+AQ1lPeNXvx8nDOcjU020xkJ/Emk/1eR6bAtre
	2q8mac/bxjVWKrXJ6CePNRqjyD4dRlybZDQ0NM1unqFoc2epad+D8WKhWCoW5E9IYZr36UyvNeK/B
	PBQhUxUexgLdv3EWT0j0N2lkmE4ldA0tv24gREpkqDAVYUeRqPy8gIdvUQbb5F4JvwvRgYz/tKpAz
	GLnC/JG8T9sxocup3AtF5eal3cW3L3AIKJVKhbP6ZmOUggsKYSxxHumev7xwZxNKMgNpDzwOKlJnB
	likZBBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Kcf-008Sg1-0F;
	Wed, 29 Nov 2023 13:29:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcB-008SUD-14;
	Wed, 29 Nov 2023 13:28:32 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1644D6606F5E;
	Wed, 29 Nov 2023 13:28:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264510;
	bh=4usmAEazxjJcK1yS+bx4LByLPrRqrN3n8pR4Vwqt66M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EBFCLegwWw6vrecTHfGfBfMknsuUlBoP8Yo4UA6nCfYv0okD345ZaPnvZj5ZKmQCA
	 4dJXwmvwOInjJ3LStbKL6HK7qrNbRPXrpH4zhuW9OwWNar6mcVC+JzdmjU9NFn8cLZ
	 06jbxh24j+JvANDGgYHHkmClDW/kkDHMBl8OFJ/loxZgTyGRR9XtOcirMDQhDOqwTA
	 WiQd8HgA3McaPBsHpFdhYzAtoAqz8XYktG96luiJuxwhX5UZ3C3Vs+y+pVvpKC8VLs
	 wROgdU94+cfZAfI02Ki5ffpymaG2kJy1nPE032XKPtmPlgIoTMUjaJLtrRc9kDkXG+
	 stJzBA623c6Hw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v4 1/7] arm64: dts: mt8183: kukui: Fix underscores in node names
Date: Wed, 29 Nov 2023 14:27:36 +0100
Message-ID: <170126437823.153055.1015143470789500363.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026191343.3345279-2-hsinyi@chromium.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org> <20231026191343.3345279-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052831_542191_6805084A 
X-CRM114-Status: UNSURE (   7.52  )
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


On Thu, 26 Oct 2023 12:09:10 -0700, Hsin-Yi Wang wrote:
> Replace underscores with hyphens in pinctrl node names both for consistency
> and to adhere to the bindings.
> 
> 

Applied, thanks!

[1/7] arm64: dts: mt8183: kukui: Fix underscores in node names
      (no commit info)

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

