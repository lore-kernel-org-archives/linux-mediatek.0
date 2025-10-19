Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8F5CCD184
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Oct 2025 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAUp/zOPfZjDHenR5pCa5rJWpFDGvgMLJJymplML+FU=; b=luNLEN6UGMtI+3aVGQ7H4LY3OS
	Hhlo73mAThaqb9YCEmbWbEM9B2gPTEvMTb5VzPcYgSHBAkwW92rT3TnwWHSGGEffvHJoSKogvliRw
	oTLLBjAxpPnifF4udRKjO7EB09tHj+JmTWbVxxTo5/Ie58r4Vi+evOgDSdymsBA69wVuDnMYqpRW2
	T/UdAnlKOFzMW7J33Fr1CXfNDxbMu16MeXi3ddLz/M0GmhtiQ8ptRpy90X8KTbANAOsNE3JYVLtxq
	fdbvWftQ+Yzfp1sDJpZQ3yqafbWYgwH/MdUf6xA1XZu+LwP9axoKUWOMR/8tivUvLqnULtKKWt4T/
	SVM5w37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vATXu-0000000B1xm-3NPB;
	Sun, 19 Oct 2025 13:34:02 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vATXr-0000000B1wW-0q5o;
	Sun, 19 Oct 2025 13:34:00 +0000
Received: from localhost (unknown [10.10.165.9])
	by mail.ispras.ru (Postfix) with UTF8SMTPSA id 9B43F4076720;
	Sun, 19 Oct 2025 13:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 9B43F4076720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1760880766;
	bh=rAUp/zOPfZjDHenR5pCa5rJWpFDGvgMLJJymplML+FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYpsxsyudGv77Du/W+Aj376mvpJBH/DqSar/O5dKKUa5FzIf88vBgFfRnWO7WgxSY
	 jTaWC7WFny8AUjK7wSsX/TOco0l0oT+/A+L4DsBw+maYjY5j9fzasLNn9BGwlgVeCm
	 cA2RL4y5mgpuSu8Ww1FhhjQeF5K1eBMSDsRSOnyw=
Date: Sun, 19 Oct 2025 16:32:46 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, lvc-project@linuxtesting.org, 
	Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v3] serial: 8250_mtk: correct max baud rate in
 set_termios() method
Message-ID: <20251019162744-e3ac865925bae161b0193e70-pchelkin@ispras>
References: <b238b17a-c22b-4bd8-87bd-2d924328a062@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b238b17a-c22b-4bd8-87bd-2d924328a062@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_063359_421147_EA3371BD 
X-CRM114-Status: GOOD (  17.98  )
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

On Sat, 18. Oct 23:44, Sergey Shtylyov wrote:
> Commit 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.") claimed
> the maximum supported baud rate to be 4 Mbps; of the Mediatek datasheets
> (I was able to get my hands on), only MT7987A datasheet did support this
> claim and MT7981B/88A datasheets disagreed, claiming just 3 Mbps maximum.
> However, this commit failed to enforce even the claimed maximum, passing
> port->uartclk to uart_get_baud_rate() for the maximum baud rate -- while
> the datasheets mention up to 52 MHz for the baud clock's frequency. This
> means that an integer overflow would happen (when multiplying the baud
> variable by 256) if a baud rate higher than 16777215 bps is passed via
> termios->c_ospeed (division by 0 will also happen when exactly 16777216
> bps is passed). Pass to uart_get_baud_rate() the documented maximum of
> 4 Mbps or port->uartclk (whichever happens to be lesser) -- this way,
> we can avoid both overflows and regression with the maximum baud rate...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Tested-by: Fedor Pchelkin <pchelkin@ispras.ru>

on Banana Pi BPI-R4 with MediaTek MT7988A chipset.

Thanks!

> 
> ---
> This patch is against the tty-linus branch of Greg KH's 'tty.git' repo.
> 
> Changes in version #3:
> - updated the maximum baud rate to 4 Mbps;
> - rewrote the description again, adding more info on the MT798x datasheets
>   studied, on how the bug manifests iself, and on the solution.
> 
> Changes in version #2:
> - changed the approach to the problem (and hence rewrote the description);
> - removed "the" article from the subject for brevity.
> 
>  drivers/tty/serial/8250/8250_mtk.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: tty/drivers/tty/serial/8250/8250_mtk.c
> ===================================================================
> --- tty.orig/drivers/tty/serial/8250/8250_mtk.c
> +++ tty/drivers/tty/serial/8250/8250_mtk.c
> @@ -358,7 +358,7 @@ mtk8250_set_termios(struct uart_port *po
>  	 */
>  	baud = uart_get_baud_rate(port, termios, old,
>  				  port->uartclk / 16 / UART_DIV_MAX,
> -				  port->uartclk);
> +				  min(4000000U, port->uartclk));
>  
>  	if (baud < 115200) {
>  		serial_port_out(port, MTK_UART_HIGHS, 0x0);

