Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89C0D59F56
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 18:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7tawP5tFd6bBBJus73Bue8aXadO8vvB9NMfmf+dK8o=; b=mYcpjGH8/EHQwg1TZEgYGabnLm
	MGPsX7uCTXPOhH1RkrG6FbrVd13Euxbd6sf9AuqpKB9JvKkfe+f/0tGKNd6jhs2dyOwOu0TYpMhNA
	JWrDdKzMlXuMmBDxVzgQeLwsrd0r4B7Jd8o+2/d5FtAd+/bBerGt8HSe9pnV/rtJY4KC16RkbLpjO
	dtm2IcUVc8uvAk9NW/Nx07vGVQ0QerJVSdDDT46urWOpxGzFZLbCMH+7wQ3xETpAv5RGfIZps2SIa
	nFRsLzCjxzEu/VAosALeCOSecgolJ4sD+6sJPDyjI1ZtBnSw8zo1pER/d42RW42fs6ssQyOKrcXMD
	YXrbcLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kWg-00000004Idk-3X97;
	Wed, 06 Nov 2024 18:13:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kRk-00000004Hnq-1tQW;
	Wed, 06 Nov 2024 18:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W7tawP5tFd6bBBJus73Bue8aXadO8vvB9NMfmf+dK8o=; b=rB2SFywN4JMuKFYll/FwXj3mIY
	fq2ZXnziO9FwMuczpINddoJjLfqF+XfatPHQM4VAUVHmZhOTXljncGwDzreU/qOH5XDZbqrQM22Nn
	hiW4uQ2Y1B6zmU2CK8vFQz/MsRNL/c2REW+z3KLlcCqSjU4QanMs01FqT8p0FpW1vKE8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t8kRV-00CMis-PJ; Wed, 06 Nov 2024 19:07:45 +0100
Date: Wed, 6 Nov 2024 19:07:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] [net-next] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to
 5000
Message-ID: <eff354db-0ba4-421b-8ecf-a285ea7aab36@lunn.ch>
References: <20241106104005.337968-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106104005.337968-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_100800_511583_5F799D32 
X-CRM114-Status: UNSURE (   6.85  )
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

On Wed, Nov 06, 2024 at 06:40:05PM +0800, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>

FYI: The net-next should be inside the [] with PATCH:
[PATCH net-next]

Use --subject-prefix= with git format-patch.

You should also put the patch version in there:

[PATCH net-next v42]

	Andrew

