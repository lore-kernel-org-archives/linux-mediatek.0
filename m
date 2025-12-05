Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1ABD339AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Dec 2025 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsOWL84uqG9PRKFxPkiKDJVANC+WtIGQDW5FcgzsVV8=; b=mPTwXq4MtWWM0SDw6vFrE9++dO
	N7pmFDWq45khZ8ZY2KCZzJ7zQBap7pt7eDBzbR53LL3gXXB+v+WfLrLcDdSPwjy1NFLtMobnXlSAQ
	4gcak1SaNveMSesVrX8KCezmGqQQyd2OLrdD7PVBl+2DswyVhQDOuWEE/Q8SaAYc9/4UXfuK9Ubzo
	xA4CAyPRLka2q2Wh4uNuv7Ja1dYHFyU1Tqu+QHm2Zp+DTW/jAih3xRh4q4oc6Pl00o9SZzKYmx+6m
	68zVcCuHBB6abZFgqrcZX95W8ObryNr494rZKLypO3BaSOT2gwp70QSiqwCn3Uj9mgvaGNRbJZGyq
	CreAchbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaJs-00000009mwZ-1AdD;
	Fri, 05 Dec 2025 18:14:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaJr-00000009mwT-0kNT
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Dec 2025 18:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9881A60010;
	Fri,  5 Dec 2025 18:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30EBC4CEF1;
	Fri,  5 Dec 2025 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764958454;
	bh=IC1OejnZkEXWNzAlMQT0aeyZvGu2/TpM7WMNFr1ZJok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e2F3PJ5oMseZBHaaWI6083F2LvTe2UUiJKSk6FKo0bT8Hf9FK2evfCTzdXra6Y4kQ
	 q8l4HxSd+EbJoOI5wAuGgd3xP82dM5fmv7JNHeh6Csrvc9NfImQOaI86OCbrvNpjUr
	 EFwsD1cwOIvNcR6j5YKnOy2be/iD2qwm0V4QOj2qIKncdyKXyh1sUjFVFhoJKlSmnt
	 8H8L0OlMvGExJFjDg7zyEvWt94MR+Ol9OID8GP1vC0k7UUtaP6dvdFQuto3kuqr9Yz
	 lwJwM+7DdckMVUDHgie6GEeYzYxYxIuE9uTYJ2nD5QFmiuaMWpgTHP4EsviKo8FxqN
	 //a7/38xyCfQA==
Message-ID: <9547b5e9-e6e8-4b24-82ac-e38327a54c45@kernel.org>
Date: Fri, 5 Dec 2025 12:14:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mt76: Fix strscpy buffer overflow in
 mt76_connac2_load_patch
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
 <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/5/25 10:12 AM, Mikhail Gavrilov wrote:
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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index ea99167765b0..d2c4c65ec464 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -3125,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
>   	}
>   
>   	hdr = (const void *)fw->data;
> -	strscpy(build_date, hdr->build_date, sizeof(build_date));
> -	build_date[16] = '\0';
> +	/* hdr->build_date is 16 bytes. Copy exactly 16 bytes to the 17-byte buffer,
> +	 * and then add the null terminator at index 16.
> +	 */
> +	memcpy(build_date, hdr->build_date, sizeof(hdr->build_date));
> +	build_date[sizeof(hdr->build_date)] = '\0';
>   	strim(build_date);
>   	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
>   		 be32_to_cpu(hdr->hw_sw_ver), build_date);


