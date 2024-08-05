Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E7CC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 23:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKFuEzcWNNedGE5fK1qZ03b+8154ZOBtdhcqC4p390k=; b=ApG2oIOLKF9K2FnRa50sn148nk
	6uh7RwNjs3OtHjW2ZmKcDaDJcjQAwdYgbM/8TYpVLF4ePJlbVmPM4iEIWmMudoA3cpTUKRYSiIuli
	gD5gs5ut4d7Ln/e1xIdDjynnHU0xm3qDr5SSx3DkC8kCOBTyGXKyJdZfVe8xuCveFE+4ISawthKK/
	ioOBsTIA6XtmIZedELgPjKj94u5f2Ic9NX+Uj4rFVnRYCllufzqv8DSbrGfpa8UQLVlctDZeh43X/
	gzMCtff4cqDkN5yZy+k/rCcr6ZvZJ0gn9H5B679nmgYZsFOAWMFyPdP+rJ5xmvRGsFCfHNbWe+IVC
	NhluteEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb7Lu-000000000VF-08nd;
	Mon, 05 Aug 2024 23:42:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb7LN-000000000QN-0Uvy;
	Mon, 05 Aug 2024 23:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A5CBCE0C4D;
	Mon,  5 Aug 2024 23:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957CEC32782;
	Mon,  5 Aug 2024 23:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722901342;
	bh=G/COHNNxGTwTS8EumnD5M8lzCmJxcbhA3j3Mp4sbq0w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I3M83ikPp9B/cv0IcgPvs9xmF7faQfOvVtKdUC2EN+sg4JY9gVVYq69wkg8cR9OQh
	 7laDCbutZJzmcykLr6pE/GQMTTIg1/WgWcbrOM78LAyc6krE0OKL5vceMbCZ+5UeE1
	 S9Jp85UhoJrxMYyUJqJoMng8OCbUY5Bw06nFFHVPT4majZXxA04DzlShhlFQMJ/uPX
	 9HvfVSogcXH/ijv9zR7Asrz4xyry9U6bUQgB4E7Tao6z3NB/hnfHmg14fykYnPx1IO
	 0GfoOoqWgO8Nt77xiphxleccFHR2mcYPNy1YW4um00mKNfo8ShwWWAdawIOgUGy+Da
	 vzhSelSJW1/3g==
Date: Mon, 5 Aug 2024 16:42:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, daniel@makrotopia.org,
 dqfext@gmail.com, sean.wang@mediatek.com, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH v2 net-next 0/2] Add support for EN7581 to mt7530 driver
Message-ID: <20240805164220.3d6bc554@kernel.org>
In-Reply-To: <cover.1722496682.git.lorenzo@kernel.org>
References: <cover.1722496682.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_164225_370474_885CEF33 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu,  1 Aug 2024 09:35:10 +0200 Lorenzo Bianconi wrote:
> Add EN7581 support to MT7530 DSA driver.
> 
> Changes since v1:
> - get rid of mac_port_config callback for EN7581
> - introduce en7581_mac_port_get_caps callback
> - introduce MT753X_FORCE_MODE(id) macro
> - fix compatible property in mt7530.yaml

Looks like this got applied as 3608d6aca5e7 ("Merge branch 'dsa-en7581'
into main"). I think due to some script misbehavior it has the wrong
cover letter on the merge, but the code matches this series.

Thanks!

