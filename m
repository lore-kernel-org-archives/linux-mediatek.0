Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6204D37487
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYE2gysXr1blfj4n407WZybSRxm2Uc9PlWzDKaMkeJA=; b=Y7ghwbDLqmyqSt915qP3wcpGxY
	uWGjzEYJt3cwJXlK/vo5yoYQk/JI/f7i34sv+Re9nuX02TGACJ5FpKFwFFsonDB5uXYhdGW3ndvno
	NwnKOJqG0eujP2vDzccaLxsdsieDKDS2TromheL/e6CknZTrsX500kxPRTqKjHBZXQ859u9GzRTcU
	Z3ql7Oc/WpeqbnpNc5cW0nOLHfUKQyYrg85L8+euMDQsM9KNl61Pwij0cRGz5TK1L+N+Za3OsRoWR
	31rlL3Jlw+t2z5OKIhN3yI7yUBlB/YvSqBsNYreBd+f88gzi/1k6sQqhngjVSmnNNhj9Iem0xvVD9
	8Ox0B/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Pxk-0000000Epma-0Wv6;
	Thu, 17 Oct 2024 12:50:44 +0000
Received: from ganesha.gnumonks.org ([2001:780:45:1d:225:90ff:fe52:c662])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Pmq-0000000EnZN-3pXy;
	Thu, 17 Oct 2024 12:39:30 +0000
Received: from [78.30.37.63] (port=43634 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1t1Pmg-00Eunf-4s; Thu, 17 Oct 2024 14:39:20 +0200
Date: Thu, 17 Oct 2024 14:39:17 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
Message-ID: <ZxEFdX1uoBYSFhBF@calendula>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
 <a07cadd3-a8ff-4d1c-9dca-27a5dba907c3@gmail.com>
 <0b0a92f2-2e80-429c-8fcd-d4dc162e6e1f@nbd.name>
 <137aa23a-db21-43c2-8fb0-608cfe221356@gmail.com>
 <a7ab80d5-ff49-4277-ba73-db46547a8a8e@nbd.name>
 <d7d48102-4c52-4161-a21c-4d5b42539fbb@gmail.com>
 <b5739f78-9cd5-4fd0-ae63-d80a5a37aaf0@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5739f78-9cd5-4fd0-ae63-d80a5a37aaf0@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_053928_997584_6F3A8029 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2024 at 11:17:09AM +0200, Felix Fietkau wrote:
[...]
> By the way, based on some reports that I received, I do believe that the
> existing forwarding fastpath also doesn't handle roaming properly.
> I just didn't have the time to properly look into that yet.

I think it should work for the existing forwarding fastpath.

- If computer roams from different port, packets follow classic path,
  then new flow entry is created. The flow old entry expires after 30
  seconds.
- If route is stale, flow entry is also removed.

Maybe I am missing another possible scenario?

Thanks.

