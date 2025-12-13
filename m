Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A77D59F60
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Dec 2025 02:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdnJyQpaOsguVHk/WVkkkDhJemCzrZuJAJ6YW4qMGqI=; b=doJ8wWFUF/jEB8cWthlxyLMidg
	R+133zhi15DFXGaj0Oung53GA+8V2T9OLyUTJw/GEMFa79rhPFVvEnPAbnhrJEbaZ3dmP2NcP3Vks
	8Rb3mEMyzSThzxQqNC9nJOVl6x3kD5AsgqQopPiDi6Ii69iDgCxekPOdJaq3LhPhUPAEd0LiTFBlK
	M1icpHmGCv4c/cpNzvy7ocCfIo+BPHpDtfBxgo442bZc4TQIQ0m/e3YVfJhgv+wgKWC7k0LoRRIGj
	NpqQYvbvgdTrlcP8tMezKQQsat8z0CEqKTdel3DaD8fU8B2yxwwyBVW0eBnOUl3EevOJj9Bl26Spw
	zGI4JHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFU5-00000001JSL-2P53;
	Sat, 13 Dec 2025 02:35:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFU4-00000001JSB-0NfH
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Dec 2025 02:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6F7E600AA;
	Sat, 13 Dec 2025 02:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99793C4CEF1;
	Sat, 13 Dec 2025 02:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765593345;
	bh=hR43q9+HkHjR+LZRB0QtBbOiMrh52IpHxBRNvie6MiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuoChyv5ovIuvuFd9n6ukkQbS7RE0sPBst+U2nDFzXoydZhTieSP2kiPs153KYdmp
	 NCh/YJTSz9ikyn7AkXisXZ4Q9pAwETFum/3agIiHl2c8frW2987jeYnwrR/suroCwe
	 hOueackFgCc26Alz8KsMv8WrBb2SHex5QAvlE/IwH0uSNGv6RzeDxGdPnCe+DLcXRW
	 agrwtptNt9BQf+gwcICNmUJ5PIjRy5Kmrbzfo+o13A5Pf0CtpT0tX8RLGlu15ZZRWw
	 9E0lqQrtEP2kOMA/pDUdX63KFebZbAwqZL+Q6eGH/FF9rmiWVrVLmRWha/Qzh/OKxU
	 hvsGiaEChn0ww==
Date: Fri, 12 Dec 2025 18:35:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: Fix strscpy buffer overflow in
 mt76_connac2_load_patch
Message-ID: <20251213023539.GC71695@sol>
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
 <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
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

Tested-by: Eric Biggers <ebiggers@kernel.org>

Can this be sent upstream soon?

- Eric

