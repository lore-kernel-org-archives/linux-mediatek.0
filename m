Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED75C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuyEH+c2uI9jZBg+pzrWbt1xE1X9AUVLVqVliqUUJtE=; b=FEAejiFJ4zrkKpBD/Qqga2Xhdv
	PevS/bi8BhLhLOlswuZ4/Ax54dbXQXolTp1KazTpO1HvCxjzHLv9+J1fPrdWIvH+qzquDFsC8g3Ze
	p7iKqvBEFuVJHEyb/8TPVe2+R3mRN4tDWV+6tI2x6zo+Zorcl8Y8BGtZl12HK2CBG4ghGBG0ISAYn
	hTyB+RV3T9tHFQAjZ1N8lDNmyl5kEB4GZF3FI4vFsNJpIrevqQ1YsOsZtd2mcBeYnoqKJGU9c1xZR
	86ozt3GYZtDM67OF7jih4vJUTL5z2uCoRrTcqPNjXr5/L+6AM95opbUKoZaV4ZdLFr4D0Lfi0vogl
	lvThLIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCrSo-001K6e-Ob; Sat, 16 Jul 2022 23:44:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCrSb-001K1v-31; Sat, 16 Jul 2022 23:44:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC5B960693;
	Sat, 16 Jul 2022 23:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DB3C34114;
	Sat, 16 Jul 2022 23:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658015069;
	bh=ukLCCzWM9aySlVzwqmY7ZDlVI0di04E9F59zQrFKTqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=monQSVxJKIdyb7u/QuchITMgVkM+e+i5mTWfqwpS8wzM+O+B4kP8+RBau1d0exlcW
	 3HarlgvtCFSw2DJv4Zq8hE+USqlnMfhcicE3ZY1/eIR96IDD8aASVEbl5ysCuWOkbZ
	 5wM0SMz0qoZcE26Sv9HUKzyBs2Kbzw+VMDNHXPtK0lEBY2LZ2mdn7TsE1jmg6khO3G
	 iHqlbonGoGaMUgv+3Z5G/Mpp1yUVtGT2ZB7/fqZmHjGrzVlUs1GU+Q3K4Odm1DP5bz
	 mQvXONzxgkhsz2X17OKXfvYy/JJpzkTYnCGt48290KUlwb0piwkJvBE38j28+cxX2k
	 6cdQjRvzJ2HcQ==
Date: Sat, 16 Jul 2022 16:44:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?=
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220716164426.2cb64a09@kernel.org>
In-Reply-To: <20220716111551.64rjruz4q4g5uzee@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
	<20220715171719.niqcrklpk4ittfvl@skbuf>
	<YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
	<20220715160359.2e9dabfe@kernel.org>
	<20220716111551.64rjruz4q4g5uzee@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_164433_258445_0AAC898B 
X-CRM114-Status: GOOD (  20.75  )
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

On Sat, 16 Jul 2022 14:15:51 +0300 Vladimir Oltean wrote:
> > I'm afraid you are correct. Dave used to occasionally apply RFC patches
> > which kept reviewers on their toes a little bit (it kept me for sure).
> > These days patchwork automatically marks patches as RFC based on
> > the subject, tossing them out of "Action required" queue. So they are
> > extremely easy to ignore.
> > 
> > Perhaps an alternative way of posting would be to write "RFC only,
> > please don't apply" at the end of the cover letter. Maybe folks will 
> > at least get thru reading the cover letter then :S  
> 
> Again, expressing complaints to me for responding late is misdirected
> frustration. The fact that I chose to leave my comments only when
> Russell gave up on waiting for feedback from Andrew doesn't mean I
> ignored his RFC patches, it just means I didn't want to add noise and
> ask for minor changes when it wasn't clear that this is the overall
> final direction that the series would follow. I still have preferences
> about the way in which this patch set gets accepted, and now seems like
> the proper moment to express them.

Oh, sorry, I wasn't commenting on how things played out for this
series. I was mostly reflecting on the fact that the automatic patch
state updates in patchwork have changed how RFC postings can be used 
on netdev, and it happened without any of us being asked our opinion.

