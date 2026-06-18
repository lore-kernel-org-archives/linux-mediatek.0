Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC7CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGlMDnViUMkCsSlZJzDY1S0meEDS8qDd3hMSbZlQ96o=; b=vmU0fQ0vjdhnaD6Vw+km2jU/h0
	3AnZcXEybSQQKc2F84xrGLrG3hXGDNmXBdzR467mQLBwpTwG87q0x+bKOoPjRrAau+5nzdyrlMIrv
	epiBbyRGlzLrSqgt9iQoSuALOlb7F6qMID+8Bd55DiOYcxi4K6BQXkrLOF9iHpvt1eysZBAcfwBJU
	AcXfPtMEjF5M7LRP65+51doV8UMTDtfZ6XulSkAr7cPZhXXwrqCWszomWyixfliQmcLSArimU4+1j
	L9Xhbryif1eWA1pfr2lFMSU8cJpeDUZ3OE3rQ/YQHHiNFjFauRILI6Xn1OFjFDvFybNU9d6+75ZcA
	78kkqwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKa5-00000001oT9-1xMv;
	Thu, 18 Jun 2026 21:47:25 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKa2-00000001oRg-1z3c
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 21:47:24 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6957ba52d2eso2157126a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781819240; x=1782424040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGlMDnViUMkCsSlZJzDY1S0meEDS8qDd3hMSbZlQ96o=;
        b=tNohuA46DkNPjEC95+SuovwFn70XUefceQwVvI9ijlMsXRLEJc2GaIrHv5IZnfULQI
         hM5AFKKv+UxOb0WnUqHWXrtfJK5TB9zmWmdkQlOxbHXNjy72ckWOZP4ii1cvVi/RPNc6
         cY+pzMRtbjKnQcDL/ZPfGlaS9bEEKzD+J6aasWL10QSl7AHvt9lk3ioNkgMAkDu+RC6E
         FSO3Gxn4Tgot5Iy4VWlPiPgYha4EytnsxhPIaRo9i0jn+P7rkLakA4kxqxi9Hi3mSdeh
         ihhcLiJ5tlz2klNLU2S+uqfj872FwmTinLMmPGYn16HT8+1zGNXCjDExBl9RbKxpIo2j
         mkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819240; x=1782424040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGlMDnViUMkCsSlZJzDY1S0meEDS8qDd3hMSbZlQ96o=;
        b=S/gSQoHQrs/IDd1Cl8UD8R8TDyHtacCCOQbSFp5lgUIFwGd3btsi+cN6Ae0BbaEhc/
         uuiEq1ZZrhp7BbniBYCZjeYCTeE3MFA3xdwA+/zR2kbaLxxX3/9BTTq0ZQ2B99My76eb
         TIrYp6r8TRwmGR4nZ8XySjnWMaQII8MFowpvn1+g5jIaSE4WeVjUYhpr3dsLnJ4afS8n
         mL6mhG4WKkejhgj+ThtWFN2MpxuW2b1EPDarCIhNdJCaQQAZmkmy/ZFh2hJyeCf47I1e
         yzwZbbabdmUCq9YSrGsheOmV9sLQOK3CXr5eIeJ7rnq8mduVaGjEdZF/BxmN+UC1go2K
         qutg==
X-Forwarded-Encrypted: i=1; AFNElJ/06l3MumvVt7/JzrEpBr6Ygb9MSgE0/ZO3nC+/6L1SWoSXvd1XjGo7NB6THqprqfSxS5y+8zgxxMSqH2z9Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVJUQ9W6b23OW2dQOaV4Eh3wIk+cC0PODOblcAUipVgZhZRN0a
	P9owO8xr6JmdZb7fgWCx4f6aZmEmAUBNaWICGVdE2JTAPyUoafNqbVfU
X-Gm-Gg: AfdE7clJM51MMnXFEDpUFd3oJgTkCNUsI0oSrhjWAo81LV83f5YLwAGqKrqCmzGuoqg
	W7n5XkcuZpqa8YhTDE13vKiq4OnkC8b6YQ4r29+Tp/yaTbWN34ubcL65s+iQq1RJX9JQIthrOD/
	xugiZA3Y8b79rDaas2pV5vSF7CsBiamvxuG072/Dx85DYvVKlRPfQR7w2u1scw/RiDaJRD/YQnO
	wG39wJhdAogyZXYSPODN4PeuD7YcxJCaVuxcXmrF780GcC6+evDd/9t7jongttJ06sM5KuFuW6O
	5g1Wxs85gfrcq82vyptlXU5rFxpCeKbY0UKogcFwUaB4uffJgACFAyiAM8syT/yjpsLXeuYGzSk
	1QmX3VrIBIvrwbqxbeRIUXR3F6cigjhIodfS+NaPzpBUC9xHVstEqnirinRpfL0G3KIcQ/oSNSX
	gbRPKI3/Q9hMx29m8tIHk+Sc8+MLw=
X-Received: by 2002:a17:906:9fca:b0:c08:49a4:c737 with SMTP id a640c23a62f3a-c097ae2ddd2mr58097066b.2.1781819239771;
        Thu, 18 Jun 2026 14:47:19 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm6914166b.51.2026.06.18.14.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:47:19 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:47:18 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error
 handling
Message-ID: <ajRmlyx_AEGybykL@soda.int.kasm.eu>
References: <20260427051746.954704-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427051746.954704-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_144722_528537_65B42D4A 
X-CRM114-Status: GOOD (  22.41  )
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

Hi,

On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> Check return value instead of is_valid_ether_addr. The latter is handled
> by the former.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index 93d91264687f..0f6ccf6ed53d 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (!is_valid_ether_addr(phy->macaddr)) {
> +	if (err) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> -- 
> 2.54.0
> 

Recently I have started to see randomized MAC-addresses on my x86 laptop
with a MT7922 and the above message printed in the kernel log. I have
CONFIG_OF turned on, but since this is an ACPI system the device is not
described by any device tree and the earlier of_get_mac_address() likely
fails with -ENODEV. Looking at the !CONFIG_OF stub for
of_get_mac_address it always returns -ENODEV, meaning this will always
randomize the mac in that case too.

Reverting this patch fixes the issue and the correct MAC address is
used. I'm not sure if there is any case where of_get_mac_addres() could
fail in a way that results in a valid MAC address but it seems unlikely
to me.

Regards,
Klara Modin

