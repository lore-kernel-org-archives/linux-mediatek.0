Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CB8C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQjzyKbxIwbvAq7i9D8ITwlfd8ipaObnXYwxzfn+nxU=; b=Qr7i47qh3eJBG1GznOVuKaKc44
	tUChPDmHanUg29+6RogRGtpR0/e364vIonMz3H3SToBNhIWDY0moplm9DaVuQIC+wd/cUdOw8DvR6
	caRUKrpmK8o8Po/j43WS6eMNrktzqA1CbwJb79LZno+aal8x8DNWpDxaRbLjo7BeqRHTgFS10xR7p
	XDrohE/vHHQln6lkLxeb3IlOoASUt9sk/7ChcLdj/sfozJLPl5m7yJdXni5ID9BGUWGlz76GqneZB
	T7l5aYeA37PV602na+UNnbYYAhSW+bJmVPlWneyS4kPBJDpNhyKc3z64CNcmgsgiz8f6Z8nbYZbrU
	QwqwRWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMfu-002K2C-3D;
	Thu, 23 Mar 2023 15:16:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMfq-002K1C-1n;
	Thu, 23 Mar 2023 15:16:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2EF862754;
	Thu, 23 Mar 2023 15:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD38CC433D2;
	Thu, 23 Mar 2023 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679584577;
	bh=UAGXMd7qHQxvTeJ3ngAjhXp0j0EEZ5bXpvg6k1yIYuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvRkr1o1RIzXOG5vuSqux6xLPrE3g6IOAmh2G92oDA0OvmhjPf/VTembJirigwo5K
	 rozJO50LKhXPv296i/HSI8VQuHVWMxQ78O0bkdAQkImpySnLpfYgP5YbpJS3zBLB3i
	 9kCY5kqo/a9uTGgOrEy5Kl+AJ/XpAlNzrxq3idlxUKRBgP7DW6TZZavtUP0x5vOUWO
	 iXR4lm3IwiaTLdkeXF/qXz6MM6uIJg0fEViwKBA0a7NaefK772uKgzVz+b5gFRk5se
	 ZY5mnD0XOrOqs/zRATFDt/P0BxBdLhdnBvTl0T3nDKZMAl4xbnKH9D4Pd3AuSxRle+
	 58sFa7tuUB27A==
Date: Thu, 23 Mar 2023 15:16:11 +0000
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
Subject: Re: [PATCH 1/3] Documentation: leds: Add MT6370 doc to the toctree
Message-ID: <20230323151611.GP2673958@google.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
 <20230319074903.13075-2-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230319074903.13075-2-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_081618_634132_1C6831FB 
X-CRM114-Status: GOOD (  12.70  )
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

> Commit 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
> adds documentation for Mediatek MT6370 RGB LED device, but forgets to
> include it to leds toctree index.
>
> Add the missing entry.
>
> Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/
> Fixes: 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/leds/index.rst | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

--
Lee Jones [李琼斯]

