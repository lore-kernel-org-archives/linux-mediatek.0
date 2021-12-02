Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A107BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/d/EjbWDMlk5o13Ga/MKaTnoSuKqhEMxsWfRoJcqo8=; b=nq0jaSNDxM47PA
	BgRUXLzKk9XKER1/iLWtUvjzmYeDLTa674Ge9m+wsXB61hjYQ1r2wlgj9AiVOiVugS7wxM4jaVT1J
	eLNk+yKjSzkVDMOn16pCl/5OjX00ZnIg15yvozE4OW1+CO6JY8ymcA65A9aqCSXEKyRCcf8YH/S2/
	9zpLyqYjjC2SKe6/T0HlVLzlxTpVbHWpRHrmk0E+k0xJ/3NZ/VF+adg3wI8t/7mlW45y/zc2FX2FE
	bf6+7NTq41j7kHkLFsXZ4cwVPcpZUIWhUwe1//vu3scmTzh2zn5USzZKkt6N2hPGxmDK5dBy/CiYP
	xhrCzQ59hhmxMIAjcoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msous-00D1Px-PL; Thu, 02 Dec 2021 16:26:38 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoup-00D1Oj-LW
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 16:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+9hlZFOStr99oVMYW977nDGw4O5HtmVFQUr3l8gEHlc=; b=HS0hoXvIxrlI9ZAqdlvSdOOGoN
 wNevb+tFOnlwOQzWgHF8Ls2/9FbE4PgkbJjrZqTMQfcyjwC2/SRDRN23RNZ7moxD8aTwbRCA/XP7u
 wLMa/XWoNi/ByoPUej4e6F5RFXbDfgRTiI7+96i99ucGoLKHSP0XSmDrZnwPx1fbshw8=;
Received: from p54ae943f.dip0.t-ipconnect.de ([84.174.148.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1msouh-0006im-Rs; Thu, 02 Dec 2021 17:26:27 +0100
Message-ID: <4b5332e8-6eef-3a3a-0765-a7563bc745ad@nbd.name>
Date: Thu, 2 Dec 2021 17:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v2] mt76: eeprom: tolerate corrected bit-flips
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, 
 linux-wireless@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
References: <YZ/nv74JH/uQwpBt@makrotopia.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <YZ/nv74JH/uQwpBt@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_082635_965028_554D5D1D 
X-CRM114-Status: GOOD (  15.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 2021-11-25 20:45, Daniel Golle wrote:
> mtd_read() returns -EUCLEAN in case of corrected bit-flips.
> As data was read, don't error out in this case.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: fix wrong variable name
> 
>   drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index 2d58aa31db934..4a5d14473ddc4 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -65,7 +65,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
>   	offset = be32_to_cpup(list);
>   	ret = mtd_read(mtd, offset, len, &retlen, eep);
>   	put_mtd_device(mtd);
> -	if (ret) {
> +	if (ret && !mtd_is_bitflip(ret)) {
unfortunately the patch is still incomplete. I will fold in the
following change to make it work:
---
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -65,7 +65,9 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
  	offset = be32_to_cpup(list);
  	ret = mtd_read(mtd, offset, len, &retlen, eep);
  	put_mtd_device(mtd);
-	if (ret && !mtd_is_bitflip(ret)) {
+	if (mtd_is_bitflip(ret))
+		ret = 0;
+	if (ret) {
  		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
  			part, ret);
  		goto out_put_node;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
