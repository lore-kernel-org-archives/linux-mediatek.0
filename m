Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2713BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kD2O/0TJ6MNpLluiWVl9sq76xMGmLRw02lOE7VH4VsA=; b=h11bPxRgZwpNJscmr8ZTl0Tmbl
	/vXy7qLbQpKux6YArrIE2+/s64pHjqXCx80lbACSXNCi2HY0MkMX+r+R4I4T/BpFAXSygCzmwcTQl
	ft6gWN//2ZOU6Z3glaMMAZFhxKx+VIG8uC2RN0cXs28Fi0/FQmK4dDVsn9WHh2jk5i1YSbkdhU25i
	+Dzhy2MiX8HyYI5ruXWebIDVL4Rd60o/Uz/kOA15U/IxbHg7ZBcB+0eWnO4q2vp66tsyArC26jKyZ
	OVI5XnhNwMxcljvCRtlP9DndMHL44zLyI+EYl6tj0EP5B/Pzm/QKSdoPyBLryGn4QnwQhMKwMS1Xq
	VPPIHh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1efN-00HSEq-DQ; Thu, 16 Jun 2022 01:51:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eem-00HRsQ-DN; Thu, 16 Jun 2022 01:50:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A409B8216B;
	Thu, 16 Jun 2022 01:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B70C3411A;
	Thu, 16 Jun 2022 01:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344245;
	bh=kD2O/0TJ6MNpLluiWVl9sq76xMGmLRw02lOE7VH4VsA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ss2rrLqW7RFI8cZuMx4Ri3CeZru6V6cmVJTKZCZ4R+bzZ/gQOw9YzjbVL1LfcTYPe
	 +GxOBBZ04D0kE/cVdOBybgIWwewStCnHNOJk7v7/hl/Po7VF1qafXa6xD4OuVXqKIH
	 PJAblCkJzlgc+DBxMB93dsMaAjj7F9nDXzmHDdgbXIAb16XfvD6lh4wsYdozJYYsv6
	 MOJLSuRCUdZl1T0LPd88VUOcoVcKeoDYT7ImA6FjOk5ovsbR4mKPnLx/nJc9fJJhFI
	 OrD+GvrCepNgKPtwr2NKRvHnIDHntj60kKAz9kMzWPu8B0FwFE1U17CUnG+w4eXtDE
	 dsR3UHYy4DpWw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-4-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-4-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 03/19] clk: mediatek: reset: Refine and reorder functions in reset.c
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:50:42 -0700
User-Agent: alot/0.10
Message-Id: <20220616015045.A5B70C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185048_640097_15ADB92C 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Rex-BC Chen (2022-05-23 02:33:30)
> To make drivers more readable, we modify the indentation of the drivers
> and reorder the location of functions.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

