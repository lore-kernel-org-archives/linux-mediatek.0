Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB928C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJXA80eYaorGSoeCLmkAf3WuDsiDqZZewk2bPgUTVKE=; b=zY75dwj42cKrX1
	1430cTeBUZwQD8BNqe4spvSecxViweDeg/nVJEM64qPaWlXoj1NToEcUHkI0WhpPXaLRhOr1fnDod
	lnsWUMrIuUdSVP8oqwTyJH8t9lgb+hm9Nl0w7GHdx9wy9f3IvNl4vDN3mgJV+M/iyPVvVnYCu/ta5
	56g9f3xumztEcqdE0faFyvFCSx6vqGUEh7Gz0DQvivCIOhOPkc5FW3+wkn6M/RPAguxf9Vuv5yfhC
	LPA4tLW46ez5r+/9HYJyndjSjZpLGsjBlGFM4hDl57zDWT7UbD7hH24qAKP7dY8JyVZb54uog1bC1
	J0FIzuYGnBHPm0c/oiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7KCM-00GwBU-0v; Tue, 11 Jan 2022 16:40:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7KCI-00GwAN-Rr
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 16:40:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FE2FB81C04;
 Tue, 11 Jan 2022 16:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D44C36AEB;
 Tue, 11 Jan 2022 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641919232;
 bh=W7O8iH2c8ab3ou7L9bn/46+4dUHIBugAPvwVwN4aULY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=sk0vuK1zD++xJr8g7Her+ibH0flCbyPdSEzVWW6zhlxbFuRTdWdqodVSopY9f2PUE
 BEocLCjXt2ukBtnAj/jHp8+Nq+lC/Rq+ji2rxZpwiZHdVOmkZvz/Xr6LnlrfL1Myws
 mKibL7osd5V56RsTqbvIdLWDTNjz6ajAYfenROvdnVizk6vD1jW1yHQkoyurYigSmF
 8dqfuBVFtBVHNzkvmtEu95pj32+wXdHnLEAb22aTLovHMXCclWYCLvvsTbWZs8s8dM
 vw2Dko2Z9qlSGgFVA0lhQbc5nkknWFKw1W7x/xQob0VNBuOqL5jQFBS5/v2YcRwLAE
 yS3PKtk+OmxXg==
From: Kalle Valo <kvalo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 "Evelyn Tsai" <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 "Peter Chiu" <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH v2 3/5] mt76: mt7915: add support for MT7986
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
Date: Tue, 11 Jan 2022 18:40:26 +0200
In-Reply-To: <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
 (Bo Jiao's message of "Tue, 11 Jan 2022 19:59:19 +0800")
Message-ID: <87fspujked.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_084035_196175_30947FF1 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Bo Jiao <bo.jiao@mediatek.com> writes:

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>
> This adds MT7986 SoC integrated multi-band 4x4 WiFi 6/6E.
>
> Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>

[...]

> +static int mt7986_wmac_adie_patch_7975(struct mt7915_dev *dev, u8 adie)
> +{
> +	if (/* disable CAL LDO and fine tune RFDIG LDO */
> +	    mt76_wmac_spi_write(dev, adie, 0x348, 0x00000002) ||
> +	    mt76_wmac_spi_write(dev, adie, 0x378, 0x00000002) ||
> +	    mt76_wmac_spi_write(dev, adie, 0x3a8, 0x00000002) ||
> +	    mt76_wmac_spi_write(dev, adie, 0x3d8, 0x00000002) ||
> +	    /* set CKA driving and filter */
> +	    mt76_wmac_spi_write(dev, adie, 0xa1c, 0x30000aaa) ||
> +	    /* set CKB LDO to 1.4V */
> +	    mt76_wmac_spi_write(dev, adie, 0xa84, 0x8470008a) ||
> +	    /* turn on SX0 LTBUF */
> +	    mt76_wmac_spi_write(dev, adie, 0x074, 0x00000002) ||
> +	    /* CK_BUF_SW_EN = 1 (all buf in manual mode.) */
> +	    mt76_wmac_spi_write(dev, adie, 0xaa4, 0x01001fc0) ||
> +	    /* BT mode/WF normal mode 00000005 */
> +	    mt76_wmac_spi_write(dev, adie, 0x070, 0x00000005) ||
> +	    /* BG thermal sensor offset update */
> +	    mt76_wmac_spi_write(dev, adie, 0x344, 0x00000088) ||
> +	    mt76_wmac_spi_write(dev, adie, 0x374, 0x00000088) ||
> +	    mt76_wmac_spi_write(dev, adie, 0x3a4, 0x00000088) ||
> +	    mt76_wmac_spi_write(dev, adie, 0x3d4, 0x00000088) ||
> +	    /* set WCON VDD IPTAT to "0000" */
> +	    mt76_wmac_spi_write(dev, adie, 0xa80, 0x44d07000) ||
> +	    /* change back LTBUF SX3 drving to default value */
> +	    mt76_wmac_spi_write(dev, adie, 0xa88, 0x3900aaaa) ||
> +	    /* SM input cap off */
> +	    mt76_wmac_spi_write(dev, adie, 0x2c4, 0x00000000) ||
> +	    /* set CKB driving and filter */
> +	    mt76_wmac_spi_write(dev, adie, 0x2c8, 0x00000072))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}

I commmented about this monster in v1, see my comments there.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
