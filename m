Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2797C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RImQ3aqf0WauckcpHUFUNKQPyMCArlYNTD2TJ5YW47Q=; b=RTutKJUH3Eiu2ftjtpWyHITPWs
	wSjA722VAU1ZfozPFf5GM9Y4U/k99fGYtyQKBd9UfK5e/RqiaFVzUvLQn5gfRqEIwjGIOwW37oc2S
	IMQ+cHJsR1HRiFPPy0JTrhVOg+ESSaXeCZQVdV8Uv9bUZQok99S8JMZN2tKewfIMp9wYxFEs4C6Uf
	Mz21aAcAgi26Tl7FnMuDu0BdUCyG21YFx9boZ6Dt950O6uwN4L/FdLDYpkA/Wm1kSlNX2PK8MhfaR
	+EKGe0ax3gjK2kxykSiJ+cNKQdSUROEsAy+bQKZyiC0UjJhiQnkCk6sAJ8lRBtS/CUqUDNTK6yr5s
	Dmx7p7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZcz-0000000FxwK-1CVd;
	Thu, 15 Feb 2024 11:10:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZcv-0000000FxuM-44H3;
	Thu, 15 Feb 2024 11:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707995400;
	bh=qLaeWFYuaGvcsGY9wAMhtanjA7Ti2wE73XC80nfLXTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yFHEg2MVgz8mRq96/Z7YcdbZl+S2mPzUzzl2HFWL1f88aXDsi1D19Dl6Unvci9xxK
	 Gv+LOBc0OlTCR37vTOg3AJsN4WH2x1KZ1tYADIHppgSXdzuUt1L4yye4t8K7p9/pPc
	 LgB4Cm01tToEcPs/4XanFPgkDt3WQfNWFzCRe8Szq9tyPaCvV8PCNa3jJtSbvHcdvr
	 cDXpkBZ5m9TrLXBMZVWxcWbxDDPatBjJ5TsbKpM8yH2kCjbrujlgWSMox7SrSGymCa
	 aT/1d9Bv8Uo2YW4Urx+FlZrSkIybvC3AiQvWdcvkjc7Esc1uh0Dgw9sux+jFE9LJ0F
	 c1vvjEZXIb7xQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 680D937820B1;
	Thu, 15 Feb 2024 11:09:59 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/2] extcon-usb-gpio YAML conversion
Date: Thu, 15 Feb 2024 12:09:56 +0100
Message-ID: <170799536802.115820.17735258763796183400.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
References: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_031002_188752_A1120D60 
X-CRM114-Status: UNSURE (   9.23  )
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

On Thu, 15 Feb 2024 10:32:12 +0100, Alexander Stein wrote:
> it seems these two patches got missed from v4[1]. So v5 is a new version only
> containing the patches not applied yet. The rebase also includes a slight
> change to the mediatek patch.
> 
> Changes in v5:
> * rebased to next-20240215
> 
> [...]

Applied to v6.8-next/dts64, thanks!

[2/2] arm64: dts: mediatek: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
      https://git.kernel.org/mediatek/c/5b6df373

Cheers,
Angelo


