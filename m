Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF35C27C76
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZKDHuzqTTMDm+ZaUKoQD2C9STYg5gBiSN93t16ynUA=; b=X7HEBA7BACDAwx7Cv5Vw9pfhXy
	2Zmr+ohqdbzyRd/H006OBZA4z3vTCOa9/ZwJvx1wSlJ0GUNcIrws8jBTwaYGPatdJavkoipvDTWd1
	FhHOyvR/gQQhkzzCAKVkQBwHicdsbttZlsCMeeuhbQ702FpcqGf2fPVtGWka+KaJt9gQ2X8ZinyKu
	Klq02FxiyZtPckBnLJ3001WHV6vn5M2gkSiczSFmwXNLeO9dGaz2V73PcS5d8pMaNOdAOcIzIM9Dm
	eEtcXFRAxKm6/GyFXTDlTpGcwymMY0QkLiBxTf/2k+UDD6QYATPNJSxVsK9tenz7+6FOzzSSHx2eM
	OtvzMUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrdq-009PCY-VZ; Thu, 26 Jan 2023 02:05:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrdg-009PBR-MI; Thu, 26 Jan 2023 02:05:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2160DB81C68;
	Thu, 26 Jan 2023 02:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C67C433EF;
	Thu, 26 Jan 2023 02:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674698717;
	bh=1ZKDHuzqTTMDm+ZaUKoQD2C9STYg5gBiSN93t16ynUA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=A+oKlTIbk0kTs3W5bmBB2K38oQmsJ+0jBj+4w80VAarnUd2SfPKCQNFC0jUJOhm/1
	 S9yO9Uw6ihKbKgpdlDP7+M8FMRvd8p28FeuuNyJ1lVV2QBHI7x3BXrNTD9YWAnTh0s
	 ACS0PoyuirJiOdW4XkQmEttvTfUjmDn0yH+en2qeEvqnsVbYXDt/IPhZnkdeCT/cjP
	 0YlWU7GxA3N7/Dgo6twPSAiO7MjVVko/Wt3JI05R+PZpz2A7otESldBckFb222Gmrj
	 V9QER2yYMAFX1dw5k4XxUGTg+La4PF8Pxb5copYde+8IaniV6lETBwQ8oS1W++5KGH
	 pYTXm7KFg9M9Q==
Message-ID: <124f081819a80482b3bffd8e12d747fc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8ae4469e-ed2c-5019-605b-013a49af77ea@gmail.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com> <20230118031509.29834-2-moudy.ho@mediatek.com> <8ae4469e-ed2c-5019-605b-013a49af77ea@gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195 vppsys0/1 to mtk-mmsys driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Jan 2023 18:05:15 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_180520_891184_7D6335F9 
X-CRM114-Status: GOOD (  12.56  )
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

Quoting Matthias Brugger (2023-01-19 08:08:48)
>=20
>=20
> On 18/01/2023 04:15, Moudy Ho wrote:
> > MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> > populate device by platform_device_register_data then start
> > its own clock driver.
> >=20
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>=20
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>=20
> Stephen, if you want I can take 1/4 and 3/4 through my tree. 3/4 shouldn'=
t be a=20
> problem, not sure about this patch. In any case if you want me to do so, =
I'd=20
> need a Acked-by from you.

Do you need to take them? I'm picking up mediatek patches currently so I
can probably just take 1 and 3 if there isn't any build dependency.

