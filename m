Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A872AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1qGcu82238FwhPMLWNteSz/fLsa4Y1JzH0C0cdinow=; b=PrxTaEDESUyUIX
	0NkmsbHACMpZkAn7ZMf4jsiNMV0oYF0+sIfU7P3kUd7Tzm8RzZRnU+oI6ac7u518QwV4nAEV5C3E4
	UmVeto0eB8SYoGA022RYalZ/uGM0qlRKr3p/HMwa1DJeYn4q2kq3qgNLnvhhC0YylyIYLEx9jmNAd
	SRmQh1QNWDJHLyb9r04lcLbyQZGMZICQrYSR2RhynRqke7JIA0NvJT6kY+ch0kpdCIvtEkQcZF+Xl
	JlRC2gDihVD8SbEet33+WkPvlcJGbSafF1SY4IpQ16rLxTUmZwjaQt7lpVoIbTVmJqpya7PrFRVjI
	NamKwyGUjHsIR6fApBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8si-00BrJM-6W; Tue, 26 Apr 2022 00:16:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8px-00BplR-BW; Tue, 26 Apr 2022 00:13:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFEF061627;
 Tue, 26 Apr 2022 00:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EC5C385A7;
 Tue, 26 Apr 2022 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932028;
 bh=G4bW56lXooVwWYRzpTrcQvBZ2IrSN9hRhrv+b5mmqO4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=FwF0xQgpGfNbRm0oZMjoC7fIOjuKRUVBncAsfnG0jdWvkZUGVmzlpfADS1B1EfNsn
 sigxw8aXG6ZlUOfkrMqT1KnzT8NoF6R6Jg4Sj3gTBKOHTrOJ7CDSX8r5zPw4HgjpUF
 YvfI8TH+uvNpr8EVDuZyWhTInKOp3z9JiEQuS3dXUBfnI02IcY+4QrIvTf0MUcc5Mc
 oOiCztXWyXYIb6xItfc+gNw5fsI/vlCfJa3avfu/LDzQbFCHKex1OT1hGPT45xRjNH
 o4JBwETp06Q9XNX0zl96/QIHvLkUNedwkg7n89XlXlXbIx5Fjeac/vVPD0Mr+7GC19
 4CZep/Jt3XWVw==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-13-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-13-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 12/15] clk: mediatek: Add MT8186 vencsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:46 -0700
User-Agent: alot/0.10
Message-Id: <20220426001348.A2EC5C385A7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171349_529741_CB1999E0 
X-CRM114-Status: UNSURE (   7.55  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:48)
> Add MT8186 vencsys clock controller which provide clock gate
> control for video encoder.
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
