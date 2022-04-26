Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B68C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwoLcGYgbCoI0aKdYr/+AZ/kGNSNVJpKo945dr9cjuI=; b=jpxLviEcN3Ag4Z
	dZpQFNhE95vzGDGujOT7YjCAKdY87ZuGsZZ1ACiujObf+XCREYA0OLqwLRyXlXzpjeyx+M/D/jNrd
	s8HkrEkHipoVmZ0J32/cTiCj9FD7A2Y2j/gLKNcRfVCq2SQEPThonMrDKHWIiMQdaex92CFGM5kMR
	+EQDcMXtXvjcqp1ORNDw+yyObVVUNhonXwV5aTWDfjGdmGxNG+A/rstflY+2lk3y2eIAsGfwPBzSp
	u3uSE5pwFhKEe83Y4rwqGqx27JqO0v/taBFG0Uh5MeepDuj9qCt3Zovc9z/tp6sLI0DLFtLQZY1oZ
	nYzYApj9JD3FMjLcBfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8tc-00BrsI-Kq; Tue, 26 Apr 2022 00:17:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8q6-00Bpqq-43; Tue, 26 Apr 2022 00:13:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A56566169F;
 Tue, 26 Apr 2022 00:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F3EC385AE;
 Tue, 26 Apr 2022 00:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932037;
 bh=0813MMi9dqnVcrqSc15kidcSvBL6PxsMqz11uYHASAg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=FXwEy8MUDkHGEwlDQ8QS6E/90TuSo5Slf68izADJYPrYFDmMVgsI5EjEuRL0zEJFS
 +6zYnlIMfwXae6CRBy+IUtB4pPt5muze44fqnIM3kibcSYehXuWQbUdNIJPc+2fTqr
 xUFmZ64ZDpA+3WUNqIQMLK+RH7qryr5H2SEU1m+t0dFc7K28nPwxf1J1c5pYoyqXPC
 ayTEBx4pHzFPojm3dKCHgyMURjbfFd5wo7RzX3s7vhvFrGhPmL1arC1iaCKp+2gUjt
 ocrhOBzQXQsFgzTunWXr2qaUZZgH+lqTlZhJtxMxwq5IYLH+igwRd0QV7Jdg8OpAqS
 +YiyLWXtaHukQ==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-14-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-14-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 13/15] clk: mediatek: Add MT8186 camsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:55 -0700
User-Agent: alot/0.10
Message-Id: <20220426001357.69F3EC385AE@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171358_236873_6DA59ACF 
X-CRM114-Status: UNSURE (   7.25  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:49)
> Add MT8186 camsys clock controllers which provide clock gate
> control for camera IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
