Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5FFD132B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXBoWsIkPZiiLuAbR+xKeDzIwul8dl5SoR9sBqGvdLQ=; b=0kl2ZQSMj5LaSKRmID6jQTwfVc
	Z0gDklKM9cGirDlfBC0yaO43C7eA7elWgbZtxGEuVv4sh5UVwsFJiqLvZeN4ckXgVzgeoMf6AI4Mu
	t/cP/4OQzW9LXbpBHcXXwFGsoGvfEPv6xkRXIYeHmWWlCB7aYSoDxZhkYSa/sDQQaQSvS8o9k3sLh
	b1l/sQ4Wq0Not28rPpfJb+l2sMP7P5qxwbo2xbx2uh/nOEkaBMGBTD7j+lfsJBg13otIWpKQ3O+jp
	d1FN5eSOXlxkq4weIpaY44AMTvuigF0V3bJlLAkMNXzJJ4+Lsie8CwNsJf2j24LyNHpY182ChK0Kt
	cLgrjSJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vIa-0000000DWvw-1omd;
	Mon, 04 Nov 2024 11:31:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u25-0000000DGm3-1WfE;
	Mon, 04 Nov 2024 10:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730714998;
	bh=lLbyBoAV8LAAMdgY2WJPPlbx5TE3cUhhNB8Q1ZTzIcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZS8rdhD50IHxY+5Rbx8r7cZBPvPyB6xYWC2v/L0hAjlXLYIJaIQnpK/KX7TlVjHbz
	 rHmHYWcyHxEAidWoqcfCp9gywzr/GbIR4VcnC7mr2ltpJ5s2zbtwWupskX1d5hEujo
	 K9Fym5ilmXMygh31eFMLzJ3OCwI8JJj8aIlKX7Yfq/z22gyTWkJUX1Sll7LT4dukRI
	 mTXSp0TUiBspnV5zj0kuQ44tOSav6QtX75717Ogobq1dcwpjcfL9DSlva3pEsy2UVN
	 G/5sGyge0T6kjWHznZwdk1V2RkwSUH+vGWDq4zG68iPQ8VIRqX4FL7U35Eg9VtiE9v
	 21dC8e2AFkipw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1451B17E14EF;
	Mon,  4 Nov 2024 11:09:58 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241029100226.660263-1-wenst@chromium.org>
References: <20241029100226.660263-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Fix IT6505 reset
 line polarity
Message-Id: <173071499802.113773.6669341556020572344.b4-ty@collabora.com>
Date: Mon, 04 Nov 2024 11:09:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_021001_907354_02873169 
X-CRM114-Status: GOOD (  10.22  )
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

On Tue, 29 Oct 2024 18:02:25 +0800, Chen-Yu Tsai wrote:
> The reset line of the IT6505 bridge chip is active low, not active high.
> It was incorrectly inverted in the device tree as the implementation at
> the time incorrectly inverted the polarity in its driver, due to a prior
> device having an inline inverting level shifter.
> 
> Fix the polarity now while the external display pipeline is incomplete,
> thereby avoiding any impact to running systems.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186-corsola: Fix IT6505 reset line polarity
      commit: fbcc95fceb6d179dd150df2dc613dfd9b013052c

Cheers,
Angelo



