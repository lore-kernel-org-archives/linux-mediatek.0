Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB368C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M76rvMqblcgEHHkS4DXNeEY1L3/eD3vIDqAcQTdl39E=; b=RAP/h5v+nTFkaUy5VL8Cpv6UVd
	RdPkqdroVqsCNWAIVRekWzUTS5NNa9QoQP/tiWx9ZPybuEm6+FcrqVKCeX/CW9YWxVUD8By8cxVFO
	OSKmDr0mzEcEqB/bEhYNNrCZs/Io8b0WXtoRZVNd1+toYOqqTaN67GmHDG9TIpiZarjqmSdZpmKAZ
	/0Im6JVfdP0+Yq1F+Av6ipWaV9NcqoP0acqdGYH7vpOLkltHzTP5/wPppV+FW4aZ8T+sANaAJYbON
	7ViGlP9j5KC/91lYRxSSa0DdMmmikCkpyVFKNc9l0yCPzguDHbIERLQA4POemzOml6vzQ6V5xyENg
	yZarIusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEwB-00EGtS-7x; Mon, 06 Mar 2023 17:47:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEvN-00EGRM-9C; Mon, 06 Mar 2023 17:47:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E5F861059;
	Mon,  6 Mar 2023 17:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C157EC4339B;
	Mon,  6 Mar 2023 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678124819;
	bh=2xAqNTwrDq2LIIw4+r+fHmkupi82Qi06RmkBf/KDGw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F3d+6PemnsnEXRzXxdpfM+0fl9NG55ehEN2AGgFJLXKRu8jywGX8MMdFvu2vU+csi
	 v5MB2ixaNbkmC/gyVabzDzB7Gn7gZsZn6s+W+lLf9qDZCeloQD0mHzEQUPcCHDeHyJ
	 6L2WvvUOi5arbnSwbhnt6JR/bnIriSaxc9oXkthN3I28asRtICWqL/myJZEApY9B66
	 iTyz4HMwqYiCE3EguNkMDPmhbrTkXq83n86pvHRRCxXhXyCtEXWVLNFeF921imGBmg
	 8nsuRxFGIvRCKSgfu3wbLgrVCUFUXZF360Eapzo0Ywi1LKkie53BAET6uqBhodxiI3
	 jlYAw8ZGWHnWQ==
Date: Mon, 6 Mar 2023 09:46:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 11/11] net: dsa: hellcreek: Get rid of custom
 led_init_default_state_get()
Message-ID: <20230306094657.6f1190d2@kernel.org>
In-Reply-To: <ZAYMvVR+6eQ9qjAk@smile.fi.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
	<20230103131256.33894-12-andriy.shevchenko@linux.intel.com>
	<ZAYMvVR+6eQ9qjAk@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_094701_436309_35C1593E 
X-CRM114-Status: GOOD (  11.95  )
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

On Mon, 6 Mar 2023 17:54:37 +0200 Andy Shevchenko wrote:
> On Tue, Jan 03, 2023 at 03:12:56PM +0200, Andy Shevchenko wrote:
> > LED core provides a helper to parse default state from firmware node.
> > Use it instead of custom implementation.  
> 
> Jakub, if you are okay with thi, it may be applied now
> (Lee hadn't taken it in via LEDS subsystem for v6.3-rc1).

Just patch 11 into net-next? SG, but could you repost?
I'd have to manually pick it out of the series.

