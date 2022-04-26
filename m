Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86583C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGR1vnx1C7kkW4kPz3lkYF+zxXT6RzpoD1T5w7vNpZc=; b=MQy4e+SB8orqwD
	9C5hqYmW0uErxz9yYoS+IXnCfL3G4TvZpumLh9jUmRcrGmOBNDb2Pzn9A/YQ9kMti2WKVs6Hijck9
	55/WR/jDMeQcnB+sA3UAar1JwYVK/4bS3hbHa04r30fsU0CwYh4LiVlZ9BELXw1TGv1KlGVipAGhP
	nmTmaBAtqDl+1mG2bi78S966n6Y29zSFR0nDCzkLFUTQuhs6ZNiw2lM2+Kg5iidHNNYnuuiGg46oZ
	e+M9hAN4udLNWVBKW4b1dbqv3e5W0YEczCEKMPkvBCq5agrvOZfmcO8/XLyxUsLEkSLnjSr5YP7mc
	Mxlsp3LOVb0xNsJrS4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8q2-00BpoL-1T; Tue, 26 Apr 2022 00:13:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8p6-00BpEP-4I; Tue, 26 Apr 2022 00:12:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B41746166E;
 Tue, 26 Apr 2022 00:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D5EC385A9;
 Tue, 26 Apr 2022 00:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931975;
 bh=1S0FvoIpEdceZXw7ckYhCxPUbbfBBXYuI1fZcX1qkB8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qXbMQH5Y5Zs7nyPw6+oGJ7K0tNFY0IkjBA4l186hWIxcmDUhr1mfAlBD/9tVb6hif
 E2wxcV49PWkjodXQqUbxhjFgURpoKN/tP/tIbhOGzBEvTqqfqC8li70F+/txOhU9yp
 ZLGTRAp+Ww0HcY7LlhG2DeON5Kmzd4Ofe+74F3f/AZ9mpvvnhTSLsk9KG/O6nOZQvs
 sB1hdKcMc7hAN+3AF5s2BCDQasGksCJ1gGEGtCT7G00B2aiiHW7ksm42F3EIsXG2Ta
 msyfrPKaknrgvr160YhpfHlWOR+IEsKhxipK/kcK5khf0Jtd6h9PsI/2T+1iFkNtpT
 NAdL2Bi1l3gig==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-7-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-7-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 06/15] clk: mediatek: Add MT8186 imp i2c wrapper clock
 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:12:53 -0700
User-Agent: alot/0.10
Message-Id: <20220426001255.16D5EC385A9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171256_228253_E1C21ECD 
X-CRM114-Status: UNSURE (   7.24  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:42)
> Add MT8186 imp i2c wrapper clock controllers which provide clock gate
> control in i2c IP blocks.
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
