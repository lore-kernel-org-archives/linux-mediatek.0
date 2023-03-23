Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B3C76196
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lw5XP9TPQayQXiO1kQFHfUd13BPx+daWASsup6hTihU=; b=IMTQ7jf1qS8lshyg4WYpoy6kRc
	WJ6kW5XQAlhKFUvdkaR76OXg9i3UOcuZVz2YuzeDvYB9pi9bnEAavxJ42pMG39DmJcN+Rk9QMWN+o
	Au/dMyB/bZEhkO4OhBqU9BApgsTLevRx+FADciYq4459uTsfzA4p15i2h3tPDq1GNUuBJS7q66Bvv
	a5cRvIz3pC9vxJIl72/AXXr4wKUFanPcuKmiGclYgAllF1hQcWuGeXaz33aTjK6T9MN5EqYOoj4p7
	FrH9LFNS9B2e2pYyH+Gf1SwDCQ7Oza5tsKLq1l6//WdAzhc/LPfhcnORaeSB2yJQJglSKkg7jzeaU
	i/f4Nnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMhu-002KPv-1A;
	Thu, 23 Mar 2023 15:18:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMhq-002KOL-0S;
	Thu, 23 Mar 2023 15:18:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B168C6278C;
	Thu, 23 Mar 2023 15:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A1FC433D2;
	Thu, 23 Mar 2023 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679584701;
	bh=Ot5j+e02uJgVNJB1slYlPg2ieWZZtdLFrPg+gk+GtR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0kQfA1TUx4841Dq9a/DC61t5fJPvk/9GatAS59QD4fZN21plBCclCYXZs7XXNp7P
	 G7wpnN+17ZnkJa4TcbQbG08LozmjY3Z25PtYrY1YVz4Eu2Uie1zi43iC0x5i0Ha16j
	 wKQL38EVfy4ZBmzk1QCX9Tj2jnLn5Jx55FmjulveaqC9B1zPz6Xd/1UnR+4Fz0YNx1
	 aaHYqPsNURZhAvMOxkF+9fJqXJ60/QA9/oxOw8cLVLNDuc9HOWXYylCha8mprE9+0Z
	 QnAyXcxd+Gd0dyKQXLSNIQa9j/Zl0tXW/V+o6oza1YEljmUoYmZMvCc8IJSwZ8Yvai
	 6MLuLJBnUwSQg==
Date: Thu, 23 Mar 2023 15:18:15 +0000
From: Lee Jones <lee@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux MediaTek <linux-mediatek@lists.infradead.org>,
	Linux LEDs <linux-leds@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] Documentation: leds: MT6370: Use bullet lists for
 timing variables
Message-ID: <20230323151815.GR2673958@google.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
 <20230319074903.13075-4-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230319074903.13075-4-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_081822_219042_2FA2803A 
X-CRM114-Status: GOOD (  13.70  )
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

On Sun, 19 Mar 2023, Bagas Sanjaya wrote:

> The timing description contains list of timing pattern variables, but it
> uses code block without indentation instead. Switch to bullet list as it
> is better fit for this purpose.
>
> While at it, substitute "load" for "duty" because the variables control
> timing for current load into the device.
>
> Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/
> Fixes: 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/leds/leds-mt6370-rgb.rst | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]

