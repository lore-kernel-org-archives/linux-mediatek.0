Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2z8nNPtbe0F7vJecFUs0A2gUShs8Vbeo6gEbB/IOFE=; b=oqhE0QGaKIx//w
	UfUpd/n+/kCGtkNTVnsKNkL/DPEP1ZDqWoyEvNhXfjJwH6DBnCquyPSa4Nw55YCXKOWqhIG5mvHDK
	1sb6V1MxZ9UzoH6+hYgEdPyR/Vnsr7HGZ7NeVZmWYQSbMluMbOUNtUFMez44cCmeCwPNQEJp1IReG
	61cz8f+JoLskaZ57haBZ7wjTa63xZdvMRqo8g/29Gj9Rq7KuLV61IY4NpHiOlihLKrF+lq1G0sRQN
	69oAHZl+6ZuOfk6yQdVxRJeyQoJG+9yKleFuwSUHtQ1J7OvS9osByfPsQCKjot7hPCVE8NLT9MMeo
	xSSLkENwlvzX1XPSt78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8te-00BruE-5k; Tue, 26 Apr 2022 00:17:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8qF-00Bpvc-OO; Tue, 26 Apr 2022 00:14:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67133B81BB2;
 Tue, 26 Apr 2022 00:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C89C385C1;
 Tue, 26 Apr 2022 00:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932046;
 bh=2FOsJiddo45DA7RHNnCi2Bn9DQXpbl3AJ3EcT/AOxBw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U6pWz8LyVzcsf/92YG4ugjprMZ4FZGYfug42tfRoqMlqLNFnZ/Fa1t2X6fH4YYEaO
 cWYBF6/Msounp9BkA7WPFUTlxCpfeXKe9lD5uWM8ysQ39ZRV2hS3MszUZ97ifkVb21
 pNg2tUjyxl1ITyKZ8fEgE/2JDRfWXGSnJ+k0qICCnyvV27gJHpXpFVnm+CQ5O1FxhX
 iWYy1cB/3hznCGW1FlS7gIV4sIiOCyXemTaHg1yBMAzac60P/Vud7qyIPmG2BtB2iy
 5buwVW1NpLxw/KXRA80xwcPRH7ikVP6CvpCPPIYXIA3U1TsBTXCvUTWMTL9elnxf40
 gbYLFRyeT/p2w==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-15-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-15-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 14/15] clk: mediatek: Add MT8186 mdpsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:14:04 -0700
User-Agent: alot/0.10
Message-Id: <20220426001406.08C89C385C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171407_983255_7538CFFA 
X-CRM114-Status: UNSURE (   7.51  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:50)
> Add MT8186 mdpsys clock controller which provides clock gate
> control in Multimedia Data Path.
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
