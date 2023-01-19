Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66EDC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coRBqI8phPZBspKOuNRcQh6UM58DLx0IE7PCLakm2Ms=; b=IxcqyFTDLFnFxGd/0myeecXzJB
	lC0oLpvB0kCPi/Dba7MTSCCy3UlZi4N3QztRl7V+RVt8d6+apdbPJqNVl1ElzZDsM8UVUPRBXn4lg
	ssl57EwbYUa6nyZUor4Ea8nd4cFP5k9N7Iscuuc3EJcTDf/t0Dx7O2XMMcLJGQd2Nn4MXieiVc3bf
	jqGLxnHi+sVxkon9cO/oEZQ07j4soqniEjJ7uB9Q7d/3lVqQNEenCnMGb8tQNbkiq0Dlg2WRLQLOD
	I/TogL8tXqB+X17xoaTdMtfMRV8sKf5F9FqwyeAoKSa7hEaM7R2OY52r0qKSW9b8WOG0NDi66AeOn
	2OMxXbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXiZ-005x36-Pj; Thu, 19 Jan 2023 16:24:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXhP-005wTo-Tn; Thu, 19 Jan 2023 16:23:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7254F61CBA;
	Thu, 19 Jan 2023 16:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF77C433F0;
	Thu, 19 Jan 2023 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145414;
	bh=OyTgylevIYiSuTJ5Rr4Ul9z2XW9kC85chWBOKL8AMQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n48cuzEzh7Unn2es2XU11+A+a+I77PTXNP56BmL32C/CK3On48k8o4n08cNeD6XHV
	 Fcj12SYHxud2CH3gQffBb7qvHRdDgwfFCoiq4rjuoQQkIQYDm/ROda+xG/oIwuV81G
	 F2SiGsXw3WOL0Q6NaUErd/QhuSeAzIzBkc5/xKKqtsG3kc7LxMD2iMOo3J46OymRzl
	 VhtMRyPgH1QDs1977QTN+As4C6HRFLQ5dP/xVr8H/dxwcZIp2ke+hFm+GP90oaL0IX
	 2w5qyB99/oxoGdUZgHZaI+9zAQzPtTfUaMt3UXYVpcDJLnVQDPvEXpKkQ/aVRunxog
	 Pr/IsAzM9quVg==
Date: Thu, 19 Jan 2023 16:23:27 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 09/11] leds: pm8058: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8luf9uEszkvafVV@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-10-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082336_129539_D0273388 
X-CRM114-Status: GOOD (  11.69  )
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

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds-pm8058.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

