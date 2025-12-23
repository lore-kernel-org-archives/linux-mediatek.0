Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC387E6FE51
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 21:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VEOOXbL8jyDokY3bB/kTEvore8ABBTAnKc6h6PdRDA=; b=vcuK+NEZF+43lPGvZzj4I53Yar
	u3uHY5bErIIJojde9WORuGQXaMf7gIc3cOeX1dTz6SIlRwP1+BMVUpRir+z58q/qZpNdLe2xutHzh
	tGC5+WAZum+oDJ52vNHT9uyqyOcwMuHWUlq+fJPjNtJnMJjbjjnDTFI0QgGZahser7pLQ0zMYYLDO
	f1rnmLz5sKCSy92/1XhHGe222hjqtKcj72YiqDexAcCurG/ur9b0OcvTnofFYE6QuqVg0HXA6f9Te
	VArU0bcvobdvXTiOetpcF9qMvLA1c/8aZGOLB5dLZw7iBntjx2v9kl2gs+t67mwjwdnR0wI53IK0q
	q0dulQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYAL3-0000000G7ip-1YZD;
	Tue, 23 Dec 2025 21:54:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYAL0-0000000G7hn-3TZm
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Dec 2025 21:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39EB940420;
	Tue, 23 Dec 2025 21:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEEAC113D0;
	Tue, 23 Dec 2025 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766526877;
	bh=WjBoMucTJzMCotHr+d+oZ2zQOT8QQxP/yyGSLmhTzPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjFbg3TxpD+h++93PzGsiIr29b5ENlY1dwH9QdhOD5X0AOUMdnpmIvAGQMG63xAG5
	 OlSbr6fg8ToRWZZf1EU3ABM1g04Aplc/gVoqJrCSkLFvyr2/VygHU8pZdweBg8jgsw
	 yP4KXezT1hhLdmYRYHkRcKsz2B6PG1Y0BTxn3Dv+qry5wQPHl3MtdEXBzUVrZXQWHp
	 I2/lBdpLFkp3f5OY1VY/iL7kco4P0rEMMw9IEgpniZgFYQJNInLmHjQTHXxZmb2d+M
	 1DQwu2kpg2Hu9afMUREFKSBEbaMGggjCRmcaiP/QEc/DzfJRdcjXq3ByKA4uy+Jk4j
	 vc5dVk6DhJ4zw==
Date: Tue, 23 Dec 2025 14:54:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: Fix strscpy buffer overflow in
 mt76_connac2_load_patch
Message-ID: <20251223215431.GA3327658@ax162>
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
 <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_135438_918104_D37AA2A5 
X-CRM114-Status: GOOD (  23.65  )
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

+ netdev and wireless/networking maintainers

On Fri, Dec 05, 2025 at 09:12:02PM +0500, Mikhail Gavrilov wrote:
> Commit f804a5895eba ("wifi: mt76: Strip whitespace from build ddate") introduced
> a kernel panic/WARN on systems using MediaTek MT7921e (and potentially others
> using mt76_connac_lib) due to an incorrect buffer size calculation.
> 
> The error logged is:
> "strnlen: detected buffer overflow: 17 byte read of buffer size 16"
> 
> This occurs because the field 'hdr->build_date' is a fixed-size array of 16 bytes.
> The patch allocated a 17-byte local buffer 'build_date' but used 'sizeof(build_date)'
> (17) as the read limit for strscpy, causing Fortify Source to correctly detect
> an attempt to read 17 bytes from the 16-byte source field.
> 
> To fix this, replace strscpy with memcpy, which is appropriate for raw data
> copying, and explicitly use the size of the source field (sizeof(hdr->build_date) = 16)
> to limit the read, followed by manual null termination.
> 
> Fixes: f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

I got bit by this regression when installing v6.19-rc2 on my new test
machine, which has an MT7925 (RZ717) chip in it. I don't see this in
either Felix's or the main wireless tree yet but I do understand it is
the end of the year with breaks and such (along with Johannes not
actually being on CC since he is not in the output of get_maintainers.pl
for drivers/net/wireless/mediatek/mt76). If there is not going to be a
wireless pull soon, can this be applied to net directly so that it gets
to Linus soon? It was rather annoying to do a bisect for a regression
that already has a pending fix.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index ea99167765b0..d2c4c65ec464 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -3125,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
>  	}
>  
>  	hdr = (const void *)fw->data;
> -	strscpy(build_date, hdr->build_date, sizeof(build_date));
> -	build_date[16] = '\0';
> +	/* hdr->build_date is 16 bytes. Copy exactly 16 bytes to the 17-byte buffer,
> +	 * and then add the null terminator at index 16.
> +	 */
> +	memcpy(build_date, hdr->build_date, sizeof(hdr->build_date));
> +	build_date[sizeof(hdr->build_date)] = '\0';
>  	strim(build_date);
>  	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
>  		 be32_to_cpu(hdr->hw_sw_ver), build_date);
> -- 
> 2.52.0
> 

