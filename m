Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B335FC83F1A
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jul 2025 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSJuXP2Tn8QwaAeo4iI9YXDlY+NdjeXSDkoE+IE9RBA=; b=W8R0Rjdl+bbkr5aHji0lJqSa+V
	NNdY0Mm2ykwvNXCu9n4cHXjtj4vPyw4ytNT2YVNxt+mwExpv2a/seE17HiqI884XXXfLMt6j3IrqW
	fHnXUMnsFg6Qoa76/ss0QWZCAXVhqUavAM0yxBUuuuzdmxB8VMRQsb9KmpqHYVQH3G84cWBlwE/Zn
	p4gJTCm09dXiZEAdhzaPqHTDxicZwFG5BAN7ie4OiPFcerlRtM1MEQk54JLBztI0DgfD2hRysBicl
	faEaGyYO3THGfJRUAvNScxqDtOkPb4yUsLfqqI7gn/QwShoDmiTfyDQYdu1mmnSk/3YoXvf6+CoGu
	zb0dqiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaWBT-0000000GSfG-2R8W;
	Sat, 12 Jul 2025 09:06:15 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaWBR-0000000GSeW-1kij
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Jul 2025 09:06:14 +0000
Received: (wp-smtpd smtp.wp.pl 13802 invoked from network); 12 Jul 2025 10:59:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752310767; bh=eSJuXP2Tn8QwaAeo4iI9YXDlY+NdjeXSDkoE+IE9RBA=;
          h=From:To:Cc:Subject;
          b=WKjhJ3Mdixt+XahfZtVpGIKxNl6vwCFnCrUmv1nrBUwefTsoSFzzP4njmWdxKBG/H
           4bffCe3DN9oy8hanhud3aXVyt8L2o9/zJgSVjtZ+Wy2K0vJkYBn1cvX25Q58jiafFR
           8k5pziuwtMYlyodb8k4SJA2EHysbLGfP6EjZtUA8B+hNcosbxLonJDC14OSgwNa8FT
           NEWO9CosPdk7R0ibPT6gBZdd9xRGwUgQUcst0ilt6SBq/+sKBlt79iHxBDNwvu6N0F
           WrVINziE9wyjtoNtxYpqnm5Wv+o9QAqEMkInOBskZnEe+VVYbumVWup7ki+AiFIZBs
           kCltJzhUOGttQ==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 12 Jul 2025 10:59:27 +0200
Date: Sat, 12 Jul 2025 10:59:27 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Message-ID: <20250712085927.GA9845@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-2-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710200820.262295-2-rosenp@gmail.com>
X-WP-MailID: fa94b3e93e05bf3e9316b9cc31b4a93a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [wTOh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_020613_608554_1C916467 
X-CRM114-Status: GOOD (  14.05  )
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

On Thu, Jul 10, 2025 at 01:08:14PM -0700, Rosen Penev wrote:
> While this driver is for a specific arch, there is nothing preventing it
> from being compiled on other platforms.
> 
> Allows the various bots to test compilation and complain if a patch is
> bad.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
> index d1fd66d44a7e..3a32ceead54f 100644
> --- a/drivers/net/wireless/ralink/rt2x00/Kconfig
> +++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
> @@ -202,7 +202,7 @@ endif
>  
>  config RT2800SOC
>  	tristate "Ralink WiSoC support"
> -	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
> +	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
>  	select RT2X00_LIB_SOC
>  	select RT2X00_LIB_MMIO
>  	select RT2X00_LIB_CRYPTO
> -- 
> 2.50.0
> 

