Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA4BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dx96b+PCiQLDVyDNyaIZFYtaUKeJSzZ4TH7iZMwSCRo=; b=Fn0tGJaYeu7bwEpDn4sdAkQ8IT
	Tte+SYBclGMpD5xM1FxRyx3bAKV0FmQDCevAt/L0lKknhP8fIvRn4mJ8YFgYoD4ruIbcabDF9/Bhg
	vNjzsf5erIZJtbHWzHxvDdg3BPKaV00PGJOb+0IB3dzOKqP/NU5IDQXibCREVqS9LJeRnJe8ja1lA
	/p8G3SeKD9u6KXFNa7Vcs6ikIKgAAFC4uUN5fswLbEO+1jLY97Gq/335D1bkV48JAP4OESewaE57s
	yCWFIxqwuvOI7f13r+KpaYGKE8KmbgNof5cz9qqBvR7anlnrOSx9W4eUMgiZixhbfH/OV0FpxrjsD
	HflVuOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mhX-0036lJ-Bc; Fri, 24 Jun 2022 17:02:35 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mhL-0036ij-ID; Fri, 24 Jun 2022 17:02:25 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BFE93E0009;
	Fri, 24 Jun 2022 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656090137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dx96b+PCiQLDVyDNyaIZFYtaUKeJSzZ4TH7iZMwSCRo=;
	b=TGmNmhPaJw4/nulvgGTmcHGzivvt21fLm6mQAAL/Vdao0UMVzEHRml1A6eERd2MxTsdMYc
	4qVrSIg6IqxU0nqSopC6VdvE4yXh/ImbYTwCWYS7u9KexjyJ0JmvvMIz1/tVTebYI5gbud
	TW6tc8pDP9xAu5znNia0nuj06EbicSw/4sJTHIWLRPwaTJUieIbtF35CX5vs6kl6JJRZRI
	r+pDGRRzkRaG8cMNJypjoZCzR0UfjGRHNpggwTEqKmRFJgzxZkFDTHomFWoQPfJyEgPKYs
	o6eB/t8zdTEiSeWQdPrarWSVYiW8cWpEfSeHCXhnA2Rpyv1X5xWtppiBv2pghg==
Date: Fri, 24 Jun 2022 19:02:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzysztof.kozlowski+dt@linaro.org, a.zummo@towertech.it,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	allen-kh.cheng@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/1] dt-bindings: rtc: mediatek: add mt6358 and mt6366
Message-ID: <165609010351.26598.10943773061528441669.b4-ty@bootlin.com>
References: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_100223_776322_A5556E66 
X-CRM114-Status: UNSURE (   5.84  )
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

On Thu, 28 Apr 2022 17:27:25 +0800, Allen-KH Cheng wrote:
> Base on tag: next-20220427, linux-next/master
> 
> changes since v1:
>  - correct wrong compatible order for mt6366
> 
> Allen-KH Cheng (1):
>   dt-bindings: rtc: mediatek: add mt6358 and mt6366 compatible
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: mediatek: add mt6358 and mt6366 compatible
      commit: 31d399dcb74ec6f0e51414b2a251b58f9a1ef87b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

