Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B420C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huV2odUHr0qwZPTNImw0xJByBIi3qWBfzAgJyC1n/us=; b=zrDlQ9U3mWc1djTYVIDz1LMp4e
	a7TqLUz3wk+n9HozZJdFfzc9dQv4hyo+QKdi3KeceG05J5O8eWdvrm/EDubxyiSYUeR0+rQjrafP0
	aLsVZWf8eJzh/PlO4+5d/a4Z+YvRExGZHo8icgkt6HkxXlv63VbHVTBbI4zS6/ybVDTpSNwLdyLZe
	eG2zU/tAcZEoz0i2/BlzoMpcfT3MGbTq0h1vYSK7KwcKPyvvbd6n43d2IagLChdvXx+0wmudDqN8M
	6u4DxsyDaW0nW0p6SsdGOYNcDj96zW1V8hvTgMcB8Zk2dGLOkR/oOnGKlluujz9+xi/raoy+M2Kpi
	V8GYYPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOij-009FVn-02;
	Sat, 01 Apr 2023 00:03:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiU-009FLX-0y;
	Sat, 01 Apr 2023 00:03:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6F0762CB2;
	Sat,  1 Apr 2023 00:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E94C4339B;
	Sat,  1 Apr 2023 00:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307413;
	bh=huV2odUHr0qwZPTNImw0xJByBIi3qWBfzAgJyC1n/us=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aLju9+qVGle+sa2Ps2auk9rcTG4td0NOjPltY0H/Cs7MimLWw57eLHTYMLu3k8YjJ
	 rdjRRUkUGHxlM5fGWtXRPefpoNHaBJjEZh0k9jlHQ72Gz4RoVZDRuVtKfeHte4VKCF
	 DFTn0ZPHC66cD2pgH69qbYFMMY2K0Y9aPLwH7ICD3hjQO+LVWEorIW9NSTpeFERIdF
	 kNmAjsEYJcqHfrWkXiYbksAwr16rDwOhnY5ceijtEejbi0Wr+r+PhUFJuiwTRWXoWn
	 KnWJQB0Ye6Qy78nCQA4V5Egg6JTO1lMwS69Zu7pm/iq26XZH83sAsWljWXE2awD5ya
	 ai1+174C1Hr4Q==
Message-ID: <7afc58d4537d48c2af33c62f7da5489e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-10-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-10-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 09/19] clk: mediatek: Add MT8188 ipesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:03:31 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170334_395396_D0FF2C10 
X-CRM114-Status: UNSURE (   7.08  )
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

Quoting Garmin.Chang (2023-03-31 05:36:11)
> Add MT8188 ipesys clock controller which provides clock gate
> control for Image Process Engine.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

