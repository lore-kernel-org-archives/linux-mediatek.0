Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88174C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=; b=nge0rHqaUFj6tsB3nP6Tdmb8S5
	84FA2OlURmaCPHo8CDfZ+ScP1Uqs4KEnpYZ5iT9YeWNdF+ox/vxKSigjeD43o9xqVLfGMEGCCfDk1
	wY5hy985N1e6+kDvFppyKQU3jXsz8ubCN9VA0Z8gnreHrQrWrgeLSaGVbMl/CXB2Gwt1UA0zR+b3Y
	aOhjTsDjunEoPF7vMpzaAF/nmyfEonjnZLuoct6EY2g/e+doTtE834IHW+Y8enWhNwE8E9KrkyhHf
	3qRGFEp0ksc28twpnyp1UchnNZktzz1bEazsCjq3M9PNMsQAHp1GHsz8zMChbyDxuUxiQoIVCRj0z
	gd0cdgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkUc-0000000CmIc-2a2T;
	Mon, 06 Jul 2026 14:40:18 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkUZ-0000000CmHL-00S2
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 14:40:16 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39b3931e259so24793831fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348812; x=1783953612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=;
        b=PC1kVWsjQj+GTGVOJkoWSqbXO2tKaGqMFhT9FBokStahqHGv8HQXNW1UygqdI8QIr7
         SprG/wFqifV5CNWPopvohhOwwVhgO+MT2i9GziIRqsCs5yULKLZdZ4/I4/jDzqT+05Lq
         lSrQ5rb6R0wazAQxhFJichyjgayZYDntCC6yEQq74ux8kWCL4vK2qU58PKXEWfGOQJJY
         q/AF7Pnkk1QEfboR6oJfZKynwVHwgsWC/dtbG0BZHX7iBHG6cbA2Li8pS4wJ11nc/Gy8
         tJ6QQjJOFLcl9FNy49exiY3x/LFoxjmkR2hONbrSMvLJgtCsYAxnLDVhyvBG1ME+waDu
         IpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348812; x=1783953612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=;
        b=JoChQw/iBI8rFUzb37v56J87WozUztdC3vxouNN6mvL7cBw0BRp3qIzsKYf0+d4MGi
         4enNTTXK7LB4OFrUTLpBBjoOlm4lB1HEj4jjJBGsqOAerUcIflcl8DJYrd/5nS8epTKT
         6Z9FFtLP+ENTX7kteNS1Hjmu8gsXITBdx/RddURZNDiUS2is3Fjp1LACecSFckQJOtMB
         RUMG0xw4LBtJV0BT5rpQS9d1b3nEBFesmXvSHM1mNiliE/htMwaEOR0itC4oUOvH+rZT
         VZ/2xIaMT1tdLrFEvboqnAw9md8MwEbHPdEyvYgdDonZBoSR+PALjEkKenCkSuzUbyB+
         KAow==
X-Forwarded-Encrypted: i=1; AHgh+RprpcjYbau4hyfZCGTC9o5XlSIgm6tyGOUfGLk4MX+kA0HwEUfTYsIbyTos6wprT1It9zLLDdQkjqRxEBJcLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmdcgAlx/LnusNkRKTQbfq6pp4AuM71hJK8dXx2cYJ0GWXqQni
	52qaWC/3lEYP1PSuRtFlYzeoYERZq2DIjT9Wz+bhGc3sblwb71ubu2i9
X-Gm-Gg: AfdE7cnOHfA/kIchmf9UyuWJXg+w5wkoYmz8Pt4Ui0aEZC8tn1BOwKmJykOZx24s0RY
	rTU8LJeKTXbP5elKOizyEQoBuHRE/6L1gLjP+gQzBBgN7iRrMlzyKKkB7wq9wKB9lPYd1sgYXrM
	NnElGs4N9azcH0JhhcPAKT+OzbY1TghuiaFWFzXtvBC57x8GjzlnAB7uoYEo5zKfp0lJk1FN55h
	aR3VMCttUWUFMnvMGYMz6ORodgluqKJbFsYKoIVH+VHf8V1HEpDM8LCJiB9ov0huHF4sqleUI3p
	5ErKGYxHc5LOv9JR/rTpc0HFF5re/34kveg2yaWC6CdlnyWlFVHHrnOFUxpcExRfnZlsjsS5Yql
	p3J3pin2COvbd1y1Gi8ZEpygR5KPQmd0aP9TuQHAMeaBQGaKJp8z3ZFwwzuTJFwy1HKLqHitNZu
	wZ2P67e5UVCxJHjVfVu5xBvGpsGt0=
X-Received: by 2002:a05:6512:414d:b0:5ae:9de4:4907 with SMTP id 2adb3069b0e04-5b007bb9136mr132541e87.53.1783348811872;
        Mon, 06 Jul 2026 07:40:11 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm2947841e87.32.2026.07.06.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:40:11 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:40:10 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Tobias Klausmann <klausman@schwarzvogel.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF
 pcie cards
Message-ID: <aku9T5a__-8EqFM_@soda.int.kasm.eu>
References: <20260630210215.400379-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630210215.400379-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_074015_060983_797F69A6 
X-CRM114-Status: GOOD (  17.61  )
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

On 2026-06-30 14:02:15 -0700, Rosen Penev wrote:
> If seems the check for err is wrong as the proper macaddr gets written
> to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> wrong as the proper macaddr has been written by this point.
> 
> Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Tested-by: Klara Modin <klarasmodin@gmail.com>

> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index b99d7452800f..afdb73661866 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (err) {
> +	if (!is_valid_ether_addr(phy->macaddr)) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> -- 
> 2.55.0
> 

