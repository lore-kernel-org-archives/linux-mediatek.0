Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB4BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 15:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r1DexMLKZ+2wGUQ8c0MbXw/RDhOwDoKIzrI8j2+IcQ=; b=318VTazO5EOSv9qkCRyarb+1aL
	sw/YEiR5xEq7xJem0OIrd5A/hf6vTAfKG4pzvc5YzwxhW4pJa2TIQNd/nj76YJ8D9MqmXhX1kR6/k
	1eJfRYmrqBl0z5whlMMjQjqiUsBtfphNiPGdl6xG+XO8RRcuFtChnxGZkHWWFfdG/8V672qGJIWyj
	cEp8UsUAD8CJ9danhAxNN6a4inQ+sLIRudNBGvTDnnkdeMCcXzil0s6y0ANtkFd/HGfInFnll5M0o
	bBxtzZSdgYsSNs1O/QXvn5xx7A0tw4X54W1WRe4g1XdHqfUQe/KHd1cqbWj1EDzOl+p1fwnxhABCx
	oSAZirIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0O9-00GVaS-23;
	Wed, 22 Mar 2023 15:28:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0O5-00GVYx-1X;
	Wed, 22 Mar 2023 15:28:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54585B81D1D;
	Wed, 22 Mar 2023 15:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019FCC433D2;
	Wed, 22 Mar 2023 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679498906;
	bh=OW047WPI6zvHu/88euN076kTfIj+YhMA4lo+cPDZRxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEqSOnQ6rG+DM+ETzAI8Ojs5BzsIOxDEdjNuXkbD8spRecYkPhg0eHzAAjL36fDkY
	 KSJUPJI8kmlHpdmXpCKdsf8D8ZSqxWVUqQM4uRngRjKpvH0giOiDO10SEQzgdZUgpx
	 t1MsbNJuQauEhSWgZsULcjv3ds3IlQOsvNO5L1ME72y4VX5l+SxEZvf+pLfvuqXcDf
	 N10tllodkUA7vXf4Q2tytTfZg8zwAgXtiLb+XFUUX+ekAIjOWxl0z94TsqGt0mZyss
	 ObHEXlvxUVauR5k+dVa4TuQF2JJl0jadEhWGfrlVAo39DhKGZuztqajysoVnCaei0b
	 pXNBGkMfbTHVw==
Date: Wed, 22 Mar 2023 15:28:20 +0000
From: Lee Jones <lee@kernel.org>
To: cy_huang@richtek.com
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, chiaen_wu@richtek.com,
	jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] leds: rgb: mt6370: Fix implicit declaration for FIELD_GET
Message-ID: <20230322152820.GG2673958@google.com>
References: <1679067760-19098-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1679067760-19098-1-git-send-email-cy_huang@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_082829_656585_EA87DEC8 
X-CRM114-Status: GOOD (  12.11  )
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

On Fri, 17 Mar 2023, cy_huang@richtek.com wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> 0-DAY CI Kernel Test Service reported the implicit declaration error below:
>
> drivers/leds/rgb/leds-mt6370-rgb.c: In function'mt6370_check_vendor_info':
> >> drivers/leds/rgb/leds-mt6370-rgb.c:889:15: error: implicit  declaration
>    of function 'FIELD_GET' [-Werror=implicit-function-declaration]
>   889 |         vid = FIELD_GET(MT6370_VENDOR_ID_MASK, devinfo);
>       |
>
> Add the missing header 'bitfield.h' to fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303171729.CcgyFx17-lkp@intel.com/
> Fixes: 55a8a5c16eb3 ("leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support")
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  drivers/leds/rgb/leds-mt6370-rgb.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

--
Lee Jones [李琼斯]

