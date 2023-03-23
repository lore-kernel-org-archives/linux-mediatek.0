Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42198C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhqzgPxYnLP4U15rSyG3gLanqc8AOUFefVgyaoscN3U=; b=IlFQOUuuuHSifoawS0qmNjRU7Z
	klGKFw3MtII2GPhxKTsXJyul6ZB0JA7KgtktXnXA42GzZwK4/I2bEjcWhw9QT4n9IaZJfd8ne0JoM
	orOOz/t2ro56mSdp2h4AA8Tks7a2AJ+GH8nIL5tIoqMBqgRUIlfXao9wYXUPKkerrnGYYdw7pumNP
	xtFWx6oHNH4vGgGC+neo0M/VCUfbcd5utDyC65u5HRo/Fu0lNt8T081X7jMP4MR+isGjUlrFDlhn8
	F0mspzpAWY5Uyd2qfv4CCYOlUoD5bmod7+Uhn7VTqn7U2lhnHpyabi8pVAlFKlJc/jYq3VnnKdpak
	bYtEiC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMhM-002KGt-0O;
	Thu, 23 Mar 2023 15:17:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMhH-002KEc-1g;
	Thu, 23 Mar 2023 15:17:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BB671CE2252;
	Thu, 23 Mar 2023 15:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C316C433EF;
	Thu, 23 Mar 2023 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679584659;
	bh=UvxNcK4/+uJUVQAwHV59ob1sSYqIJJVRO17OF1ZimtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6ERglOB8KBv4mZsYyVPVZZIK8IuLu32K/YLscxjiyUgX6ySUlxEYPJDfhvzpy1LE
	 dDtleXezIO+szV6VMu7eIHLmwXiUY0J1OCS+EdU1kDJhxDr+fqpI8zjdf9kE8NkSCN
	 SGfgK7EhPomAMtyRT3XV7D4Nt30MOikrz3JvCi4kUgx/uDdNKb3eId/nZ7pDf2p1f5
	 RnwsBY7vuMYEyvjo0+615Snqje+Macb2gmnnF0Vb5UFASMRiWNGh9rfoay2YGuXeP6
	 EacdATPvV/sb5zOIucXImKRBuiF921mWbJI26+j6AstJr6jBZ/HZn7P6i2GH/+qsI7
	 Tgz0tDspaeFAw==
Date: Thu, 23 Mar 2023 15:17:33 +0000
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
Subject: Re: [PATCH 2/3] Documentation: leds: MT6370: Properly wrap
 hw_pattern chart
Message-ID: <20230323151733.GQ2673958@google.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
 <20230319074903.13075-3-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230319074903.13075-3-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_081747_779457_97F03B68 
X-CRM114-Status: GOOD (  13.43  )
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

> The pattern diagram (chart) of /sys/class/leds/<led>/hw_pattern is
> wrapped in literal code block. However, the block indentation is
> interrupted by Icurr axis label, hence below warnings:
>
> Documentation/leds/leds-mt6370-rgb.rst:39: WARNING: Literal block ends without a blank line; unexpected unindent.
> Documentation/leds/leds-mt6370-rgb.rst:41: WARNING: Line block ends without a blank line.
> Documentation/leds/leds-mt6370-rgb.rst:46: WARNING: Unexpected indentation.
> Documentation/leds/leds-mt6370-rgb.rst:44: WARNING: Inline substitution_reference start-string without end-string.
>
> Fix the chart indentation by adding 4 more spaces so that the axis label
> is in the code block.
>
> Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/
> Fixes: 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/leds/leds-mt6370-rgb.rst | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]

