Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D02BC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9CD60EB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A9CD60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hUOBDFZ6g0+hQtVOiL/pFW307Ki678I+0LLftRsysU=; b=wObOI3VwnLMbtK
	xnXDfD4MrbLKtJb+Drx7D77AtAJVtfURq4yuMR9HnCJgFd4So2Pt785UG7V81na/DFtjvAMSsWPR8
	VetaZirGE9gki8pLYFtlYJyuijwbzmXGxAKug8f5s4VtSfFSEokEMAEy/n0YJ3mT75WpEtJEfPGw2
	ErYdB/J6l5Y6I/UY3VdPDaV6ZBJrATbuCAsXwN+O2u27rKs45D11nC67jZ61rXefiygglAG0u33hn
	1RtlxDi5AmT6mmOY/H0kQnyqbdfAU9XBs73EXn1FM+nLgPWc7o1Vc21bHdsv8tyy+WfP8/lcn8Ges
	MFLf6WCHd4R0kFXhTCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RPj-00Fgkn-02; Tue, 27 Jul 2021 18:02:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RJG-00FdX5-NQ; Tue, 27 Jul 2021 17:56:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DBC5600CD;
 Tue, 27 Jul 2021 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408566;
 bh=2J9XXGcoeIBFFjJn8wQGMUVJY63v7Ypo97F5ivVXFJU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=VNChKoR22Negr0KkTjJ+YSsjGbbu5kPvHlthUhdxpbyeSbKGL7HXt3jYqAoP4rsgR
 RjoXnCp/l0u7ZwoijJejyrQ0d55swsVRfEbJd6MzmS4tseXQOM3/PZRA5UfPltJiAe
 Fb05og7wH4iz7hfr1f0PwSM7m4l4+hBAN7jH1091lhU5bGEVckQ1Xu2P9UlYVLiIdF
 nd2XgqoPhRKbIc+wVJ/9r4dKe9Vk7uGbNQsDzUfIvGDLu0s190BPzo4KL+UBrlQE70
 ZDpNGJ2eOV9lXvG24wE/u++AHu12IQ06AqTXV+Z4Qk5ec+yp1c+3bP9J+c4EGAiVG4
 s7jSp4YaeJreA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-13-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-13-chun-jie.chen@mediatek.com>
Subject: Re: [v14 12/21] clk: mediatek: Add MT8192 imgsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:56:04 -0700
Message-ID: <162740856405.2368309.3690105828191004296@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105606_863165_2FF62DD7 
X-CRM114-Status: UNSURE (   5.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chun-Jie Chen (2021-07-26 03:57:10)
> Add MT8192 imgsys and imgsys2 clock providers
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
