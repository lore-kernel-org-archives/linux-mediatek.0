Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71B6C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHYGPnAqkIMUJUi3B60rsumbdDgNDlpVc4RDQnILr7Y=; b=RGkC3w3ywYqwzr/SVXri/ugFom
	WifDKsLbeMY5ioMLWzk/jp5WkWoR9o6yVO7W8kVLIR8G6nR81c0idyGTc4+0glxWreANEfj7FIF89
	EvYdDWfW7E4hXnmHnCe1ZmYFiTQIxY8xn6opmN6vlFnujvyHEbAp+HonWTrLw7izSFUmk+R/2mLfk
	kd7WHfJOrCS5hJMMOMW9M8iM5iaapq9y2qwIC0quuDNAlKH1ohdrpgs2KcRCWrYSu+cfyG2iHP3Tn
	RgXelM33L4IqnJLYlItF5GzSMi7LpF1nneoFWXGaG8aqtizJdkuN4UgH4cZF7WYTmVE4K8vMIrZkr
	UgmirPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUH0-009yVk-Ud; Tue, 22 Nov 2022 14:29:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUGx-009yTl-4f
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 14:29:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02F726170C;
	Tue, 22 Nov 2022 14:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1344EC433B5;
	Tue, 22 Nov 2022 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669127352;
	bh=UBcHS3VCg4uRpxjAZY8+t6NA0BKBZWz6tTw6f0PgiKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aePwc+RuP1PDa5b8dSM0cuWR7QxcUAUMLFOxaq5bGQ+dkUoJiidtxzLNk2/iS+VcA
	 ivZtkSuxm6SKRFBC0scNgnRMyYNqQjkso6KPhOls9//r+dWp/DNYsYeZxd2jhcEqwh
	 bcBQqamIq3vy57+EavKkfL3pCNaHkmpOrFOu/ilMY5hxXlbI+1r/dzC7fcky63M4g9
	 zdBupJehOuDbZYmhcg2QfaMJR5Igr+dLuMPnRiSW/WXygAtc3QVpkDa0AxAgEHFkox
	 O926a5BSc+Niq4NeF6BfX1Tw7aj/QN7RizsS+X0Zhoy5GpZU5lo7uFYa5YYY1Brwad
	 f8y7lshywVWGA==
Date: Tue, 22 Nov 2022 16:29:08 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Yanchao Yang <yanchao.yang@mediatek.com>
Cc: Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev ML <netdev@vger.kernel.org>,
	kernel ML <linux-kernel@vger.kernel.org>,
	MTK ML <linux-mediatek@lists.infradead.org>,
	Liang Lu <liang.lu@mediatek.com>,
	Haijun Liu <haijun.liu@mediatek.com>,
	Hua Yang <hua.yang@mediatek.com>,
	Ting Wang <ting.wang@mediatek.com>,
	Felix Chen <felix.chen@mediatek.com>,
	Mingliang Xu <mingliang.xu@mediatek.com>,
	Min Dong <min.dong@mediatek.com>,
	Aiden Wang <aiden.wang@mediatek.com>,
	Guohao Zhang <guohao.zhang@mediatek.com>,
	Chris Feng <chris.feng@mediatek.com>,
	Lambert Wang <lambert.wang@mediatek.com>,
	Mingchuang Qiao <mingchuang.qiao@mediatek.com>,
	Xiayu Zhang <xiayu.zhang@mediatek.com>,
	Haozhe Chang <haozhe.chang@mediatek.com>,
	MediaTek Corporation <linuxwwan@mediatek.com>
Subject: Re: [PATCH net-next v1 13/13] net: wwan: tmi: Add maintainers and
 documentation
Message-ID: <Y3zctKXWaVuGvGhP@unreal>
References: <20221122112710.161020-1-yanchao.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122112710.161020-1-yanchao.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_062915_261312_E5EB2ED6 
X-CRM114-Status: UNSURE (   8.42  )
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

On Tue, Nov 22, 2022 at 07:27:10PM +0800, Yanchao Yang wrote:
> From: MediaTek Corporation <linuxwwan@mediatek.com>
> 
> Adds maintainers and documentation for MediaTek TMI 5G WWAN modem
> device driver.
> 
> Signed-off-by: Felix Chen <felix.chen@mediatek.com>
> Signed-off-by: MediaTek Corporation <linuxwwan@mediatek.com>

Author and SOB should have real names and can't be company.

Thanks

