Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA30ECD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMSoqha2TSas3hoN0TmK3J+gZckYKVexn2As1dMjq/o=; b=zan1MTcp5BC65hS7NPNfGVv3Q5
	CABQNGIW2n8BqepYqmjuM5IMxQxRitD/XuyFNdjpe8NxiH51TCMoLoumZXT1NL9JAvYFGhRj5LnTR
	n7Ir+TBhpwpdcgVmPtQh1WaT0F9YrqdMgoknyOqAXsUWM6Bmp2mfvxiG36aC8kDi0BrWw6Hw9KlyK
	t08vQKOfGK8d+S+BCxtvF2NaB/Usmd96xgvHGIHmiz7V+FCYI1FKqLOFhf9aVBlFqm9TiJIca2guM
	gjtzAK2BDuKTGH9k7HIGOZdX8NUCIwd+e1dyAC6pkQuOiLvFunybWp1ToQA8l5izayqwKJdJsPDN+
	KMyEceMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxu0-0000000FWiX-11mn;
	Wed, 03 Apr 2024 10:31:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxtq-0000000FWcD-3waO;
	Wed, 03 Apr 2024 10:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140280;
	bh=G81Bl2oY80KerS9z0ERkAhQGQ8vpcQZcKpbMP8LjyI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/22ch7okC3mvb511TMrUp7Sbl+iWAGaoF15F49bQdbl3x9+8q6IzjrBOi4cNpKwn
	 XXu3pAuv4Wu01+py073+ZW0aZCDxrNGzumrAUAxaqAj0YwLKUD42AjMbrpcu1R7o29
	 y/0yH4fcD0HMZBwyQm1ZAcIyMBk/qA4DfRkBbHJTI16DjM/cVUIzdCuwwiEvXItVa9
	 YA+cxHE85m2j9SnOyWmh9YKtuGuOgG0DdhkEp32VBCVMye52LY0irc7Pt6F6t65EOP
	 FNjg4185qvgHuMoEL5cpHEgn5Stij508xyCqcwTE31BYohY8mYuiyngPsnSgdP5urG
	 jxz7EJARfjw6A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E7AC137820EF;
	Wed,  3 Apr 2024 10:31:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Pin-yen Lin <treapking@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 0/4] Update Vgpu minimum voltage for MT8183, MT8186, MT8192, MT8195
Date: Wed,  3 Apr 2024 12:30:56 +0200
Message-ID: <171213179799.60933.15666408119514400881.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315111621.2263159-1-treapking@chromium.org>
References: <20240315111621.2263159-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033123_181330_FBB78C62 
X-CRM114-Status: UNSURE (   9.27  )
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

On Fri, 15 Mar 2024 19:16:01 +0800, Pin-yen Lin wrote:
> Use the minimum voltage listed on the Vgpu regulator datasheets instead
> of the minimum value on GPU OPP table. This is because the requested
> voltage could be lower when the MTK Smart Voltage Scaling (SVS) driver
> is enabled.
> 
> Also update the incorrect MT6315 regulator usages on MT8192 and MT8195.
> 
> [...]

Applied to v6.9-fixes/dts64, thanks!

[1/4] arm64: dts: mediatek: mt8192-asurada: Update min voltage constraint for MT6315
      commit: 374a7c6400e314458178255a63c37d6347845092
[2/4] arm64: dts: mediatek: mt8195-cherry: Update min voltage constraint for MT6315
      commit: e9a6b8b5c61350535c7eb5ea9b2dde0d5745bd1b
[3/4] arm64: dts: mediatek: mt8183-kukui: Use default min voltage for MT6358
      commit: 296118a8dc297de47d9b3a364b9743f8446bd612
[4/4] arm64: dts: mediatek: mt8186-corsola: Update min voltage constraint for Vgpu
      commit: 366940c860bc27cc1cc92061e6626a4fa56bab3c

Cheers,
Angelo


