Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5b1oBXSdDyZhjTHb8uO7reByUPDqNQhigdzkMpB498=; b=rb3lwm0sEGzg+D
	sH0qZYCQU/FzVk8biEunWYQeBIhF9RlIfFiaadh1pn5U0hkb642jwB5KKJmm7TihaJq3ZLTCsoEAR
	/yQ/w0PdBr4Ga9vTPJBL5e0ApFfhIzdxCdVrvguH7JjRXcwLKgL6NX4p1D2jQ8Vl4tS8xk9WsFEOu
	xADcVNkOtyyFeZxYnnRcYTStADFE//L5uYGbfvbfElSQN54IysiqrDF566cBCFkIA4ogJIUpbds8P
	tvkkWhZgmo3z0bqfpC5XUpQDLUU0YrqEp9Ge7zfj1sCZ176YNn74WR7gKsQczyC/CgF8ruIplO4u9
	aIdIcePDWaURLfx0YK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8s4-00Bqwb-US; Tue, 26 Apr 2022 00:16:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8pr-00Bphu-8B; Tue, 26 Apr 2022 00:13:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0E9EB81A2F;
 Tue, 26 Apr 2022 00:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2099C385A4;
 Tue, 26 Apr 2022 00:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932019;
 bh=eRwehzqDzCrayIYVH26k9aBHvRm08jjwSZxL8YRhjSI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=c+BdUZKOb2pllE/jeguFXWXuCu2GEdkLAHy6YGUlbDNLYBHdJA9R0ORPUMuWYEK1f
 bL9MQhwn4/xbv/ehrdk7tWo8M0gCAOugaBt05Rtpr2SgGeox6o3SOZIddjRyc4J1Rw
 yNM0FSa4tLrtP8ZHw1i623ZS2VDQSz0P8lBk32ZUwmQKhADV1lGAwHLVsOJSQfZgjs
 BZxAdknJi6QZwZNdyD+McRB8KtiMg3CN+oBe6gAzpssPzWQBLo2H3fax0hhPuSOHB4
 JV721n8qm9HQ6o/Y8iQWmHb9CM353Zxc1Ha2dFaD+MP+9q2xnpOocFGUI/EfpPAPW3
 F9f4RjFFYglYw==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-12-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-12-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 11/15] clk: mediatek: Add MT8186 vdecsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:37 -0700
User-Agent: alot/0.10
Message-Id: <20220426001339.C2099C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171343_478095_5872F046 
X-CRM114-Status: UNSURE (   7.45  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:47)
> Add MT8186 vdec clock controller which provide clock gate
> control for video decoder.
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
