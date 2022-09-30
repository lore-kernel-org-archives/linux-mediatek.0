Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 00:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzUmjvtGvdgB13RIL9G8wmRo13z8Nq4O99NTs39jYbg=; b=Ni+0usIYs8SQLZR/zTCN2lSsny
	9P+9Emn3yEoS/ETdPRdeHsIe5GtBCnZpadiLrC4EJ5+PMetcWJFFlwIV6QpGHNc6F9HMqWD/ragz+
	rb7yNxCbIyrbcdD2LifWy3Dc6K7N/HcxPD1VO97Kz9aD6v5RTWjGmL95q8y3kn+yX2UxOwct6LKFW
	uxEQatutShmUEcShMxX3rBG4/9W3DZ0HdPnM29sklyQ75QCUBeAA3fGdAiNclvX+tnNcGwPpQANSr
	sCXJp0k2o36h8ctLUgyGINWMTLU32acL9GfRUGXI5veol/SfZqf5uwGEolG8bEH1Ux98NjwktpWOS
	3nX+xr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4Ge-006Ske-7u; Fri, 30 Sep 2022 00:52:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4Gb-006SjI-AG
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 00:52:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13CE661729;
	Fri, 30 Sep 2022 00:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE49C433D6;
	Fri, 30 Sep 2022 00:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664499155;
	bh=G8ooWq9+eASigF6tCJNn6I5oAkUvcn+WF/utl7AK8AA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Z89BpygbqzFbORtprd6A7PPFg6AWlMIkEoU/pGYDml+vxdCjVfK5lVV7LsWl+AcQ8
	 KFmiUEeoQq904QSyEQQi3WzpjwOePeSZxVBP7gxaDhzOqVG4nPMlNqku7MGZ8MNcq4
	 8wmukZpY39LRHPyC8N7sSMs2qSiA2cxSZZbfKKIjz2bZYM0DJunDx6SOmL4OOzqok6
	 RtHzm8ovNfh+FN+2HqKu7xluaVofasCiM+9B1rKLwCehBEZho2UlCGzN42bXFMtL+z
	 wir8/CoJTXiBVaySrPkx1LZkS5ySbjiQ8uh0jTr4NgOeBDBzRTEJXplBT5xsQhDyL0
	 FhDh1sVRp3iiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YzVNZzp6+S7ePIRr@google.com>
References: <YzVNZzp6+S7ePIRr@google.com>
Subject: Re: [GIT PULL] MediaTek Clock Changes for 6.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Miles Chen <miles.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 29 Sep 2022 17:52:33 -0700
User-Agent: alot/0.10
Message-Id: <20220930005235.6FE49C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_175237_420582_A71B1B9A 
X-CRM114-Status: UNSURE (   7.56  )
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

Quoting Chen-Yu Tsai (2022-09-29 00:46:47)
> The following changes since commit 3cc53c57d0d54b7fc307879443d555c95b4665=
10:
>=20
>   clk: mediatek: mt8195: Add reset idx for USB/PCIe T-PHY (2022-08-31 18:=
16:45 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git tags/mtk=
-clk-for-6.1
>=20
> for you to fetch changes up to 99f3a5e851e9a1d82d73c4f396c6dbf123413c16:
>=20
>   clk: mediatek: mt8192: deduplicate parent clock lists (2022-09-29 12:27=
:33 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

