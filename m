Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAz8wDdfUhNEe1VEqZdJzQDwcVRc+gSkcfXestawRpc=; b=j8biTeAOf28w0C
	MmeV1RJwP9SNV3jwGYflofvGleRp1H4blelxmKWjgMLYYTVfxXMYDaAFHHxDQ0PproHuc/pq4wfyo
	olc1j6NNabACR8dw9WgECxnU7cLIufN2pi0v1+uZWKpSm1N1OhObFP07IgOfQOCFg6RDVs4FCzL+t
	Vq9l4wzCsHkwsXgkytipwzsUehW2DgGiozJPrRChLvCNCcohvpMJQ9l5bDfSJw6StPTSfWfDC6IMO
	/KBHKHqxTkuCw+JPKwFpBAX7b4KnQ7fbhwQlwEkXm+FzNUccNEhTIqgC51UCjWJBmjRGAW9z/+p0o
	1WGCH5PJlPBfWpUx5a5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noXN6-0046oQ-8e; Tue, 10 May 2022 21:26:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noXMv-0046ld-Qc; Tue, 10 May 2022 21:26:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D29B61736;
 Tue, 10 May 2022 21:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAAFC385CD;
 Tue, 10 May 2022 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652217968;
 bh=kR2kpr/WthoIHNv/CMjDoYh09YdTh0O5cNq+3yPSmP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GBX1NGtj8+fZSAQU+zwr0peTmOEVQ78ODOb3Wddpp7aNGpjggHfepUfk6+Nzrm2a/
 4Mb5YfAjDAXSJbQ+s95159HCT5EMsN01iONNmvHtL5QZdw2woEEamTn2S322glxmub
 UusdklfhDjjriBLJ/xbJFUsdrCie6t5oZCoHdwOR/SiZp4ajxO9QMWAaVZkWg+7vnG
 n4EPDUpFbnKaC1a+hyyujBMtwYISNrdhodogQOKP5B5315uwxIm4lxaMe+UySXQkPU
 heKBoimsFsohAPxifQJnp0o0EAJZMZ+75l5x01H0s4cmf3MgK9rolX7PpiS6YvqGcY
 JPJ0gu3Ji1TjQ==
Date: Tue, 10 May 2022 14:26:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Message-ID: <20220510142606.34d83121@kernel.org>
In-Reply-To: <20220510094014.68440-1-nbd@nbd.name>
References: <20220510094014.68440-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_142609_925433_5828F5E2 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue, 10 May 2022 11:40:13 +0200 Felix Fietkau wrote:
> Padding for transmitted packets needs to account for the special tag.
> With not enough padding, garbage bytes are inserted by the switch at the
> end of small packets.
> 
> Fixes: 5cd8985a1909 ("net-next: dsa: add Mediatek tag RX/TX handler")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

You should answer all questions and address or dispute all feedback.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
