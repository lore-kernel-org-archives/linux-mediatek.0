Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7C9C982D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRqUyT21EROagSJqRyUwvTzzYL2dWUH+6wFhXqmioP0=; b=YQGy7Ocwa2oMdEyKx+nVL/Ajvv
	PZLnmQ8dWzLAv3OBwoujs+SEVnH6rxtvrTh33Oo1iFN7XzxPDflUOXOW23lf2DLtEIwPIBOGQd6N4
	gPAjnQAoeVZIEko5j4ur+7JSqN80c9J8isM3BDlIYStPL/NlqijMCoG1gckGDDqTeg5ih/W2sG7vE
	T/7N7VZx/XCInzWkEdlqraqhWbuOMCo5lkvgjW83b+NHebv/Vvo1jW+Hsq2eCINe2dXqPBXRF3LmR
	Zfx0I2jvc99Vjnr0rpURhH6iNW7LiphwwtTpD0P1Bm5mqp/5xkJJpDFOcfgWoaGtDjmDMJ9OfsNG7
	T7ikO9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Nsf-0000000DEkR-3aFT;
	Fri, 18 Sep 2026 01:59:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Nsd-0000000DEjg-41x6;
	Fri, 18 Sep 2026 01:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jRqUyT21EROagSJqRyUwvTzzYL2dWUH+6wFhXqmioP0=; b=zCbGHofAIpiptv8bWoX0a9Ci1y
	0Y299WZOgc9peOdcYY9OLuZ4lMPezBMd8eYIIwvb4oG4QlRhfEo4lk870ScOXpZ9N57FNWCVRvnNX
	YmdyteZdRQyBIcwXoT3WLjG6v4pKNL4c0M9UWlJn5CPOxLIs9Oab6/sjNdkDgK78EIXw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x7NsH-005mZV-Sq; Fri, 18 Sep 2026 03:58:49 +0200
Date: Fri, 18 Sep 2026 03:58:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksei Sviridkin <f@lex.la>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com,
	daniel@makrotopia.org, olteanv@gmail.com, gerg@kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: dsa: mt7530: fix NULL dereference on
 unbind of MT7531 and MT7621
Message-ID: <857a7395-4741-4d2c-abb0-b806e8f9bd78@lunn.ch>
References: <20260918015020.2518315-1-f@lex.la>
 <20260918015020.2518315-2-f@lex.la>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918015020.2518315-2-f@lex.la>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_185911_996764_4A479DBD 
X-CRM114-Status: UNSURE (   8.36  )
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

On Fri, Sep 18, 2026 at 04:50:19AM +0300, Aleksei Sviridkin wrote:
> The core and io supplies are only requested for ID_MT7530: both the
> devm_regulator_get() in probe and the regulator_enable() in
> mt7530_setup() are guarded by the switch id, but mt7530_remove()
> disables them unconditionally. On an MT7621 or an MT7531 both pointers
> are still NULL from devm_kzalloc(), so rmmod or a sysfs unbind calls
> regulator_disable() on NULL.

Did you consider using devm_regulator_get_enable()?

	Andrew

